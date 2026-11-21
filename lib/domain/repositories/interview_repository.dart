import 'package:provai/domain/models/interview.dart';
import 'package:provai/domain/models/user_profile.dart';
import 'package:provai/utils/cancel_handle.dart';
import 'package:provai/utils/result.dart';

/// Ücretsiz katmanın sınırları. Paywall ve Home bu değerlere göre davranır.
abstract final class FreeTier {
  static const sessions = 1;
  static const questionsPerSession = 3;
}

/// Prova oturumlarının üretilmesi, değerlendirilmesi ve geçmişi.
abstract interface class InterviewRepository {
  /// AI ile sorular üretip yeni oturum oluşturur ve kaydeder.
  Future<Result<InterviewSession>> createSession({
    required UserProfile profile,
    required String jobPosting,
    required int questionCount,
    required InterviewLanguage language,
    CancelHandle? cancel,
  });

  /// Cevabı değerlendirir, oturuma ekler ve güncel oturumu döner.
  Future<Result<InterviewSession>> submitAnswer({
    required InterviewSession session,
    required InterviewQuestion question,
    required String transcript,
    required AnswerInputMode inputMode,
    required UserProfile profile,
    int? durationSeconds,
    int? fillerWordCount,
    CancelHandle? cancel,
  });

  /// En yeni oturum başta.
  List<InterviewSession> getSessions();

  /// Bir oturum oluşturulduğunda veya cevap eklendiğinde tetiklenir; ekranlar
  /// hangi yoldan dönülürse dönülsün listeyi tazeleyebilsin diye.
  Stream<void> watchChanges();
  InterviewSession? getSession(String id);

  /// Ücretsiz kullanımda başlatılmış oturum sayısı (silinse bile azalmaz).
  int get startedSessionCount;
}
