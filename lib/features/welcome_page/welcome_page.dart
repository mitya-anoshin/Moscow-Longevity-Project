import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/constants.dart';
import '../../utils/helper.dart';
import '../../widgets/app_button.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.primaryColor,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                child: Image.asset(
                  "assets/images/old-person.png",
                  scale: 2,
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                  vertical: 20.h,
                ),
                decoration: BoxDecoration(
                  color: Constants.scaffoldBackgroundColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    topLeft: Radius.circular(30.0),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Приветствуем вас в Московском долголетии!",
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(19, 22, 33, 1),
                            fontSize: 27.sp,
                          ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      "Это ваш первый раз у нас?",
                      style: TextStyle(
                        color: Color.fromRGBO(74, 77, 84, 1),
                        fontSize: 24.sp,
                      ),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    AppButton(
                      text: "Да",
                      type: ButtonType.PLAIN,
                      onPressed: () {
                        nextScreen(context, "/login");
                      },
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    AppButton(
                      text: "Нет",
                      type: ButtonType.PRIMARY,
                      onPressed: () {
                        nextScreen(context, "/login");
                      },
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
