import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rock_scanner/screens/login_screen.dart';
import '../theme/const.dart';
import '../theme/light_dark_theme.dart';
import '../widgets/pass_field.dart';
import '../widgets/text_field.dart';
import '../viewmodels/register_viewmodel.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  String _enteredEmail = '';
  String _enteredPassword = '';

  @override
  Widget build(BuildContext context) {
    final registerVM = Provider.of<RegisterViewModel>(context);

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
              'Create an account',
              style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 7),
            const Text(
              'Create a new rock scan account',
              style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 13.5,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(height: 30),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFieldWidget(
                    onSaved: (value) => _enteredEmail = value!,
                    hintText: 'Enter your email',
                    icon: CupertinoIcons.person,
                    labelText: 'Email',
                  ),
                  const SizedBox(height: 13),
                  PassFieldWidget(
                    onSaved: (value) => _enteredPassword = value!,
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
                      onPressed: registerVM.isLoading
                          ? null
                          : () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                registerVM.registerUser(
                                    _enteredEmail, _enteredPassword, context);
                              }
                            },
                      child: registerVM.isLoading
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
                        "Already have an account ?",
                        style: fontFam,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        },
                        child: const Text(
                          'Login here',
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
