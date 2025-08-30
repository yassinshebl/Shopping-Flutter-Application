import 'package:flutter/material.dart';
import 'package:shopping_app/data/user_store.dart';
import '../l10n/app_localizations.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _pwd = TextEditingController();
  final _confirm = TextEditingController();

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _pwd.dispose();
    _confirm.dispose();
    super.dispose();
  }

  String? _capFirst(String? v) {
    if (v == null || v.trim().isEmpty) {
      return AppLocalizations.of(context)!.requiredField;
    }
    final first = v.trim()[0];
    if (first != first.toUpperCase()) {
      return AppLocalizations.of(context)!.firstLetterUppercase;
    }
    return null;
  }

  String? _emailVal(String? v) => (v != null && v.contains('@'))
      ? null
      : AppLocalizations.of(context)!.emailValidation;
  String? _pwdVal(String? v) => (v != null && v.length >= 6)
      ? null
      : AppLocalizations.of(context)!.passwordValidation;
  String? _matchVal(String? v) => (v == _pwd.text)
      ? null
      : AppLocalizations.of(context)!.passwordsMustMatch;

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      // If user already exists, show error
      if (UserStore.isSignedUp(_email.text, _pwd.text)) {
        await showDialog(
          context: context,
          builder: (_) => AlertDialog(
            content: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 360),
              child: Text(
                AppLocalizations.of(context)!.accountAlreadyExists,
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
        return;
      }
      // Register the user
      UserStore.name = _name.text;
      UserStore.email = _email.text;
      UserStore.password = _pwd.text;
      await showDialog(
        context: context,
        builder: (_) => AlertDialog(
          content: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 360),
            child: Text(
              AppLocalizations.of(context)!.accountCreated,
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
      // Defer navigation to next event loop to avoid context issues
      Future.delayed(Duration.zero, () {
        if (!mounted) return;
        Navigator.of(
          context,
        ).pushNamedAndRemoveUntil('/home', (route) => false);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _name,
                decoration: const InputDecoration(labelText: 'Full Name'),
                validator: _capFirst,
              ),
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
              TextFormField(
                controller: _confirm,
                decoration: const InputDecoration(
                  labelText: 'Confirm Password',
                ),
                obscureText: true,
                validator: _matchVal,
              ),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: _submit,
                child: const Text('Create Account'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
