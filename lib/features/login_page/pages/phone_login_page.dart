import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constants.dart';
import '../../../utils/helper.dart';
import '../../../widgets/app_button.dart';

/// PhoneLoginPage widget
@RoutePage()
class PhoneLoginPage extends StatelessWidget {
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
                prefixIcon: Icon(Icons.phone),
                labelText: 'Введите номер телефона',
                helperText: 'Номер телефона нужен для входа в систему',
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
              type: ButtonType.plain,
              onPressed: () {
                nextScreen(context, "/login/phone/confirm_code");
              },
              text: 'Получить код',
            )
          ],
        ),
      ),
    );
  }
}
