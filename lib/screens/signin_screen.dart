import 'package:flutter/material.dart';
import 'package:shopping_app/data/user_store.dart';
import '../l10n/app_localizations.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _pwd = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    _pwd.dispose();
    super.dispose();
  }

  String? _emailVal(String? v) => (v != null && v.contains('@'))
      ? null
      : AppLocalizations.of(context)!.emailValidation;
  String? _pwdVal(String? v) => (v != null && v.length >= 6)
      ? null
      : AppLocalizations.of(context)!.passwordValidation;

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      if (UserStore.isSignedUp(_email.text, _pwd.text)) {
        await showDialog(
          context: context,
          builder: (_) => AlertDialog(
            content: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 360),
              child: Text(
                AppLocalizations.of(context)!.accountSignedIn,
                textAlign: TextAlign.center,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(AppLocalizations.of(context)!.close),
              ),
            ],
          ),
        );
        if (!mounted) return;
        Navigator.of(
          context,
        ).pushNamedAndRemoveUntil('/home', (route) => false);
      } else {
        await showDialog(
          context: context,
          builder: (_) => AlertDialog(
            content: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 360),
              child: Text(
                AppLocalizations.of(context)!.noAccountFound,
                textAlign: TextAlign.center,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(AppLocalizations.of(context)!.close),
              ),
            ],
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign In')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _email,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: _emailVal,
              ),
              TextFormField(
                controller: _pwd,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: _pwdVal,
              ),
              const SizedBox(height: 16),
              FilledButton(onPressed: _submit, child: const Text('Sign In')),
            ],
          ),
        ),
      ),
    );
  }
}
