import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constants.dart';
import '../../../widgets/app_button.dart';

class CodeConfirmationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Constants.primaryColor,
      ),
      backgroundColor: Constants.primaryColor,
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 21.sp,
                ),
                helperStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 13.sp,
                ),
                prefixIcon: Icon(Icons.lock),
                labelText: 'Введите код с SMS',
                helperText: 'Код отправлен на ваш номер телефона',
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 3.h,
                  ),
                ),
              ),
            ),
            SizedBox(height: 40.h),
            AppButton(
              type: ButtonType.PLAIN,
              onPressed: () {},
              text: 'Подтвердить',
            ),
            SizedBox(height: 20.h),
            TextButton(
              onPressed: () {
                // Действие для повторной отправки кода
              },
              child: Text(
                'Отправить код повторно',
                style: TextStyle(
                  color: Constants.primaryColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
