import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../utils/constants.dart';
import '../../../widgets/app_button.dart';
import '../manager.dart';

class EmailLoginPage extends ConsumerStatefulWidget {
  @override
  ConsumerState<EmailLoginPage> createState() => _EmailLoginPageState();
}

class _EmailLoginPageState extends ConsumerState<EmailLoginPage> {
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  Widget getWidgetByAuthState(
    AuthController authController,
    AuthState authState,
  ) {
    if (authState is AuthStateLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else if (authState is AuthStateInitial) {
      return LoginFields(
        loginController: _loginController,
        passwordController: _passwordController,
        authController: authController,
      );
    }

    return Text('Error...');
  }

  @override
  Widget build(BuildContext context) {
    final authController = ref.watch(authControllerProvider.notifier);
    final authState = ref.watch(authControllerProvider);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Constants.primaryColor,
      ),
      backgroundColor: Constants.primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: getWidgetByAuthState(authController, authState),
      ),
    );
  }
}

class LoginFields extends StatelessWidget {
  const LoginFields({
    super.key,
    required TextEditingController loginController,
    required TextEditingController passwordController,
    required this.authController,
  })  : _loginController = loginController,
        _passwordController = passwordController;

  final TextEditingController _loginController;
  final TextEditingController _passwordController;
  final AuthController authController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextFormField(
          controller: _loginController,
          decoration: InputDecoration(
            labelStyle: TextStyle(
              color: Colors.black,
              fontSize: 30.sp,
            ),
            helperStyle: TextStyle(
              color: Colors.black,
              fontSize: 13.sp,
            ),
            labelText: 'Введите свою почту',
            helperText: 'Она нужна, чтобы мы могли связаться с вами',
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
                width: 3.h,
              ),
            ),
          ),
        ),
        SizedBox(height: 70.h),
        TextFormField(
          controller: _passwordController,
          obscureText: true,
          decoration: InputDecoration(
            labelStyle: TextStyle(
              color: Colors.black,
              fontSize: 30.sp,
            ),
            helperStyle: TextStyle(
              color: Colors.black,
              fontSize: 13.sp,
            ),
            labelText: 'Введите свой пароль',
            helperText: 'Придумайте пароль, и обязательно запомните его!',
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
                width: 3.h,
              ),
            ),
          ),
        ),
        SizedBox(height: 100.h),
        AppButton(
          text: "Далее",
          type: ButtonType.plain,
          onPressed: () {
            authController.login(
              _loginController.text,
              _passwordController.text,
            );
          },
        ),
        SizedBox(height: 30.h),
      ],
    );
  }
}
