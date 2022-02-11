import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:shop/components/button.dart';
import 'package:shop/components/input.dart';
import 'package:shop/components/wrapper.dart';
import 'package:shop/helper.dart';
import 'package:shop/variables.dart';

class LoginScreen extends StatefulWidget {

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final MaskTextInputFormatter _phoneMask = MaskTextInputFormatter(
    mask: '+# (###) ###-##-##',
    filter: { "#": RegExp(r'[0-9]') },
  );
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    dio.interceptors.add(InterceptorsWrapper(
        onError: (DioError e, handler) {
          if (e.response!.statusCode == 401) {
            showSnackBar(context, 'Номер телефона или пароль не верны');
          }
        }
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      showBottomBar: false,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              const Text(
                'Вход в профиль',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              const SizedBox(height: 14,),
              const Text(
                'Введите данные вашего аккаунта, предоставленные торговым представителем',
                style: TextStyle(fontSize: 17, color: Color(0xffBDBDBD)),
              ),
              const SizedBox(height: 32,),
              Input('Номер телефона', keyboardType: TextInputType.phone, inputFormatters: [_phoneMask],),
              const SizedBox(height: 24,),
              Input('Пароль', controller: _passwordController, obscureText: true,),
              const SizedBox(height: 32,),
              Button('Войти', onPressed: _submitForm),
              const SizedBox(height: 24,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Номер телефона офиса  •  ',
                    style: TextStyle(color: Colors.grey[400]),
                  ),
                  GestureDetector(
                    onTap: () => launchURL('tel:+77778242842'),
                    child: Text(
                      '+7 777 824 28-42',
                      style: TextStyle(color: Colors.blue[900]),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      var response = await dio.post('/login', data: {
        'phone': _phoneMask.getUnmaskedText(),
        'password': _passwordController.text,
      });

      await prefs.setString('token', response.data['token']);
      await prefs.setInt('id', response.data['id']);

      Phoenix.rebirth(context);
    }
  }
}