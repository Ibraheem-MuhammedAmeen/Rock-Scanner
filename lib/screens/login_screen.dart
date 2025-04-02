import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rock_scanner/screens/RegisterScreen.dart';
import 'package:rock_scanner/theme/const.dart';
import 'package:rock_scanner/widgets/text_field.dart';
import '../theme/light_dark_theme.dart';
import '../viewmodels/login_viewmodel.dart';
import '../widgets/pass_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  var _enteredEmail = '';
  var _enteredPassword = '';

  @override
  Widget build(BuildContext context) {
    final loginVM = Provider.of<LoginViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: const Text(
          'Rock-Scan',
          style: fontFam,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Log in to Rock-Scan',
              style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 7),
            const Text(
              'Log into your Rock-Scan account',
              style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 13.5,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(height: 30),
            Form(
              key: _formKey, // Moved key here
              child: Column(
                children: [
                  TextFieldWidget(
                    onSaved: (value) {
                      _enteredEmail = value ?? "";
                    },
                    hintText: 'Enter your email',
                    icon: CupertinoIcons.person,
                    labelText: 'Email',
                  ),
                  const SizedBox(height: 13),
                  PassFieldWidget(
                    onSaved: (value) {
                      _enteredPassword = value ?? "";
                    },
                    hintText: 'Enter your password',
                    labelText: 'Password',
                  ),
                  const SizedBox(height: 18),
                  SizedBox(
                    height: 47,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 9),
                        backgroundColor: AppColors.IconBackground,
                      ),
                      onPressed: loginVM.isLoading
                          ? null
                          : () {
                              if (_formKey.currentState?.validate() ?? false) {
                                _formKey.currentState!.save();
                                loginVM.loginUser(
                                    _enteredEmail, _enteredPassword, context);
                              }
                            },
                      child: loginVM.isLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text(
                              'Continue',
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Montserrat',
                              ),
                            ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account?",
                        style: fontFam,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterScreen()));
                        },
                        child: const Text(
                          'Create account',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: AppColors.IconBackground,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
