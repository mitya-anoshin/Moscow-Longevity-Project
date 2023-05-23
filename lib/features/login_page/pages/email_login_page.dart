import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constants.dart';
import '../../../widgets/app_button.dart';

class EmailLoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Constants.primaryColor,
      ),
      backgroundColor: Constants.primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
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
              type: ButtonType.PLAIN,
              onPressed: () {
                // nextScreen(context, "/login");
              },
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
