// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get ourProducts => 'منتجاتنا';

  @override
  String get hotOffers => 'العروض الساخنة';

  @override
  String get signUp => 'إنشاء حساب';

  @override
  String get signIn => 'تسجيل الدخول';

  @override
  String get welcome => 'مرحبا';

  @override
  String get accountCreated => 'تم إنشاء الحساب بنجاح';

  @override
  String get accountSignedIn => 'تم تسجيل الدخول بنجاح';

  @override
  String get close => 'إغلاق';

  @override
  String get requiredField => 'مطلوب';

  @override
  String get firstLetterUppercase => 'يجب أن يكون الحرف الأول كبيرًا';

  @override
  String get emailValidation => 'يجب أن يحتوي على @';

  @override
  String get passwordValidation => 'على الأقل 6 أحرف';

  @override
  String get passwordsMustMatch => 'يجب أن تتطابق كلمتا المرور';

  @override
  String get accountAlreadyExists => 'الحساب موجود بالفعل، يرجى تسجيل الدخول.';

  @override
  String get noAccountFound => 'لم يتم العثور على حساب، يرجى التسجيل أولاً';
}
