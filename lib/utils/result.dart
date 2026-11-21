import 'package:provai/utils/app_exception.dart';

/// Repository'lerin dönüş tipi. Repository'ler exception fırlatmaz, Result döner;
/// çağıran taraf `switch` ile iki durumu da ele almak zorundadır.
sealed class Result<T> {
  const Result();
}

final class Success<T> extends Result<T> {
  const Success(this.data);
  final T data;
}

final class Failure<T> extends Result<T> {
  const Failure(this.error);
  final AppException error;
}
