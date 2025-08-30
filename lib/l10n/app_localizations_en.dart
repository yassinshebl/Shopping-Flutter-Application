// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get ourProducts => 'Our Products';

  @override
  String get hotOffers => 'Hot Offers';

  @override
  String get signUp => 'Sign Up';

  @override
  String get signIn => 'Sign In';

  @override
  String get welcome => 'Welcome';

  @override
  String get accountCreated => 'Account created successfully';

  @override
  String get accountSignedIn => 'Account sign-in successfully';

  @override
  String get close => 'Close';

  @override
  String get requiredField => 'Required';

  @override
  String get firstLetterUppercase => 'First letter must be uppercase';

  @override
  String get emailValidation => 'Must include @';

  @override
  String get passwordValidation => 'At least 6 characters';

  @override
  String get passwordsMustMatch => 'Passwords must match';

  @override
  String get accountAlreadyExists => 'Account already exists, please sign in.';

  @override
  String get noAccountFound => 'No account found, please Sign Up first';
}
