import 'package:alice_dio/alice_dio_adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:provai/config/env.dart';
import 'package:provai/data/services/auth_service.dart';
import 'package:provai/data/services/http_inspector.dart';
import 'package:provai/utils/app_exception.dart';
import 'package:provai/utils/cancel_handle.dart';
import 'package:provai/utils/logger.dart';
import 'package:provai/utils/result.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api_client.g.dart';

/// Edge Function çağrıları. Sunucu zarfı `{data}` / `{error: {code, message}}`;
/// HTTP ve sunucu hatalarının AppException'a eşlenmesi yalnızca burada yapılır.
class ApiClient {
  const ApiClient(this._dio, this._auth);

  final Dio _dio;
  final AuthService _auth;

  Future<Result<T>> post<T>(
    String function,
    Map<String, Object?> body, {
    required T Function(Map<String, dynamic> data) parse,
    CancelHandle? cancel,
  }) async {
    if (!Env.isConfigured) {
      return const Failure(ServerException('Supabase env is not configured'));
    }
    final cancelToken = CancelToken();
    cancel?.onCancel(cancelToken.cancel);
    try {
      final token = await _auth.accessToken();
      final response = await _dio.post<Map<String, dynamic>>(
        '/$function',
        data: body,
        cancelToken: cancelToken,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      final data = response.data?['data'];
      if (data is! Map<String, dynamic>) {
        return const Failure(ParseException('Missing data envelope'));
      }
      return Success(parse(data));
    } on DioException catch (e) {
      return Failure(_mapDioError(e));
    } on FormatException catch (e) {
      return Failure(ParseException(e.message));
    } on Object catch (e, stack) {
      // DTO'nun fromJson'u beklenmeyen tipte alanla karşılaşırsa TypeError gelir.
      if (e is TypeError) return Failure(ParseException(e.toString()));
      appLogger.e('Unexpected API error', error: e, stackTrace: stack);
      return Failure(UnknownException(e.toString()));
    }
  }

  AppException _mapDioError(DioException e) {
    if (e.type == DioExceptionType.cancel) return const CancelledException();
    final code = switch (e.response?.data) {
      {'error': {'code': final String code}} => code,
      _ => null,
    };
    appLogger.w('API ${e.requestOptions.path} failed: ${e.type} $code');
    return switch ((e.type, code)) {
      (DioExceptionType.connectionError, _) ||
      (DioExceptionType.connectionTimeout, _) ||
      (DioExceptionType.sendTimeout, _) => NetworkException(e.message),
      (DioExceptionType.receiveTimeout, _) => const ServerException('Timeout'),
      (_, 'quota_exceeded') => const QuotaExceededException(),
      (_, 'ai_rate_limited') => const RateLimitException(),
      (_, 'invalid_input') => const ValidationException(),
      _ => ServerException(code, e.response?.statusCode),
    };
  }
}

@Riverpod(keepAlive: true)
Dio dio(Ref ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: Env.functionsBaseUrl,
      connectTimeout: const Duration(seconds: 15),
      // AI cevabı yedek modele düşerse uzun sürebilir.
      receiveTimeout: const Duration(seconds: 90),
      contentType: Headers.jsonContentType,
      headers: {'apikey': Env.supabasePublishableKey},
    ),
  );
  // Debug'da istek/cevaplar uygulama içi inspector'a da kaydedilir.
  final inspector = ref.watch(httpInspectorProvider);
  if (inspector != null) {
    final adapter = AliceDioAdapter();
    inspector.addAdapter(adapter);
    dio.interceptors.add(adapter);
  }
  if (kDebugMode) {
    dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        requestHeader: false,
        logPrint: appLogger.t,
      ),
    );
  }
  return dio;
}

@Riverpod(keepAlive: true)
ApiClient apiClient(Ref ref) =>
    ApiClient(ref.watch(dioProvider), ref.watch(authServiceProvider));
