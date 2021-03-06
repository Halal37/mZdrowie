// TODO: Should be deleted when any other screen will be added!
import 'package:admin_app/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../widgets/user_data_sign_text_field.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _logger = Logger();
  final GlobalKey<FormState> _formKey = GlobalKey();

  late TextEditingController _emailTextEditingController;
  late TextEditingController _passwordTextEditingController;

  bool _isLoading = false;
  bool _errorOnLogin = false;

  @override
  void initState() {
    _emailTextEditingController = TextEditingController();
    _passwordTextEditingController = TextEditingController();

    super.initState();
  }

  void _login() {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('You now should log in to system')));
    _formKey.currentState!.validate();

  }
  
  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Container(
            color: Colors.deepPurple[50],
            child: CircularProgressIndicator(
              color: Colors.deepPurple[300],
            ),
            alignment: AlignmentDirectional.center,
          )
        : Scaffold(
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 46.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        'Log in.',
                        style: TextStyle(
                          fontSize: 35.0,
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    UserSignDataTextField(
                      hintText: 'name@email.com',
                      onSaved: (value) {},
                      validatorFunction: (value) {
                        if (value != null) {
                          if (value.isEmpty || !value.contains('@')) {
                            return 'invalid email';
                          }
                        }
                        return null;
                      },
                      controller: _emailTextEditingController,
                    ),
                    UserSignDataTextField(
                      hintText: 'at least 8 characters',
                      validatorFunction: (value) {},
                      onSaved: (value) {},
                      obscureText: true,
                      controller: _passwordTextEditingController,
                    ),
                    _errorOnLogin
                        ? Container(
                            margin: EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              'Invalid e-mail or password. Try again.',
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.red,
                              ),
                            ),
                          )
                        : SizedBox.shrink(),
                    ButtonWidget(
                      text: 'LOG IN',
                      colorText: Color(0xFFFEFEFE),
                      colorButton: Color(0xFF4DAF8C),
                      onPressed: () =>
                          Navigator.of(context).pushNamed('/home-screen'),
                    ),
                    ButtonWidget(
                      text: 'REJESTRACJA',
                      colorText: Color(0xFF263139),
                      colorButton: Color(0xFFFEFEFE),
                      onPressed: () => Navigator.pushNamedAndRemoveUntil(
                        context,
                        '/sign-up',
                        ModalRoute.withName('/login'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
