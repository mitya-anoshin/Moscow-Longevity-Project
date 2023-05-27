import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constants.dart';
import '../../../utils/helper.dart';
import '../../../widgets/app_button.dart';

/// Registration Page
@RoutePage()
class RegistrationPage extends StatefulWidget {
  /// Widget constructor
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Constants.primaryColor,
      ),
      backgroundColor: Constants.primaryColor,
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              // controller: _loginController,
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
            SizedBox(height: 30.h),
            TextFormField(
              // controller: _passwordController,
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
                labelText: 'Введите пароль',
                helperText: 'Придумайте пароль, и обязательно запомните его!',
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 3.h,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30.h),
            TextFormField(
              // controller: _passwordController,
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
                labelText: 'Еще раз пароль',
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
                nextScreen(context, "/registration/info");
              },
            ),
          ],
        ),
      ),
    );
  }
}
