// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'مساعد تنسيق الأطباق بالذكاء الاصطناعي';

  @override
  String get loginTitle => 'مرحبًا بعودتك';

  @override
  String get signupTitle => 'إنشاء حساب';

  @override
  String get emailLabel => 'البريد الإلكتروني';

  @override
  String get passwordLabel => 'كلمة المرور';

  @override
  String get nameLabel => 'الاسم الكامل';

  @override
  String get loginButton => 'تسجيل الدخول';

  @override
  String get signupButton => 'إنشاء حساب';

  @override
  String get noAccountYet => 'ليس لديك حساب؟ أنشئ واحدًا';

  @override
  String get haveAccountAlready => 'لديك حساب بالفعل؟ سجّل الدخول';

  @override
  String get logout => 'تسجيل الخروج';

  @override
  String get navCapture => 'تحليل';

  @override
  String get navHistory => 'السجل';

  @override
  String get navLeaderboard => 'لوحة الصدارة';

  @override
  String get navCoach => 'المدرّب الذكي';

  @override
  String get captureTitle => 'تحليل طبق';

  @override
  String get takePhoto => 'التقاط صورة';

  @override
  String get uploadPhoto => 'رفع من المعرض';

  @override
  String get analyzeButton => 'تحليل التنسيق';

  @override
  String get analyzing => 'جارٍ تحليل تنسيق طبقك…';

  @override
  String get retake => 'إعادة الالتقاط';

  @override
  String get resultTitle => 'درجة التنسيق';

  @override
  String get outOf100 => '/ 100';

  @override
  String get subscoreComposition => 'التكوين';

  @override
  String get subscoreColors => 'الألوان';

  @override
  String get subscoreGarnish => 'الزينة';

  @override
  String get subscoreCleanliness => 'النظافة';

  @override
  String get subscoreBalance => 'التوازن';

  @override
  String get strengths => 'نقاط القوة';

  @override
  String get suggestions => 'اقتراحات';

  @override
  String get saveToHistory => 'الحفظ في السجل';

  @override
  String get savedToHistory => 'تم الحفظ في سجلك';

  @override
  String get shareResult => 'مشاركة';

  @override
  String get historyTitle => 'سجلّك';

  @override
  String get noHistoryYet => 'لا توجد تحليلات بعد. حلّل طبقك الأول!';

  @override
  String get historyDeleteConfirm => 'هل تريد حذف هذا التحليل؟';

  @override
  String get delete => 'حذف';

  @override
  String get cancel => 'إلغاء';

  @override
  String get leaderboardTitle => 'لوحة صدارة المطبخ';

  @override
  String get leaderboardEmpty => 'لا توجد نتائج بعد. كن أول من يقدّم طبقًا!';

  @override
  String get leaderboardSubtitle => 'الترتيب حسب متوسط آخر 10 أطباق';

  @override
  String get coachTitle => 'مدرّب التنسيق الذكي';

  @override
  String get coachHint => 'اسأل عن الزينة، الألوان، أساليب التقديم…';

  @override
  String get coachSend => 'إرسال';

  @override
  String get coachWelcome =>
      'مرحبًا، أنا مدرّبك في تنسيق الأطباق. اسألني أي شيء عن تقديم الطعام!';

  @override
  String get settingsTitle => 'الإعدادات';

  @override
  String get language => 'اللغة';

  @override
  String get english => 'الإنجليزية';

  @override
  String get french => 'الفرنسية';

  @override
  String get arabic => 'العربية';

  @override
  String get errorGeneric => 'حدث خطأ ما. يرجى المحاولة مرة أخرى.';

  @override
  String get errorNoImage => 'يرجى التقاط أو رفع صورة أولاً.';

  @override
  String get errorNetwork => 'خطأ في الشبكة. تحقق من اتصالك.';

  @override
  String get retry => 'إعادة المحاولة';

  @override
  String get verdictExcellent => 'تنسيق ممتاز';

  @override
  String get verdictGood => 'تنسيق جيد';

  @override
  String get verdictAverage => 'تنسيق متوسط';

  @override
  String get verdictNeedsWork => 'يحتاج إلى تحسين';
}
