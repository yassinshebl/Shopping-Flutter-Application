import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  final VoidCallback onToggleLang;
  const WelcomeScreen({super.key, required this.onToggleLang});

  @override
  Widget build(BuildContext context) {
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    return Scaffold(
      appBar: AppBar(title: Text(isArabic ? 'مرحبا' : 'Welcome')),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/local_1.png',
                    width: 110,
                    height: 110,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 16),
                  Image.network(
                    'https://picsum.photos/200',
                    width: 110,
                    height: 110,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Text(
                isArabic ? 'تسوق بسهولة' : 'Shop with Ease',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FilledButton(
                    onPressed: () => Navigator.pushNamed(context, '/signup'),
                    child: Text(isArabic ? 'إنشاء حساب' : 'Sign Up'),
                  ),
                  const SizedBox(width: 12),
                  OutlinedButton(
                    onPressed: () => Navigator.pushNamed(context, '/signin'),
                    child: Text(isArabic ? 'تسجيل الدخول' : 'Sign In'),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              TextButton(
                onPressed: onToggleLang,
                child: Text(isArabic ? 'English' : 'العربية'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
