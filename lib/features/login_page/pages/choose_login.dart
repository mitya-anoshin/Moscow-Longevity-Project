import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/constants.dart';
import '../../../utils/helper.dart';
import '../../../widgets/app_button.dart';

class ChooseLoginPage extends StatelessWidget {
  _launchURL() async {
    final url = Uri.parse('https://www.mos.ru');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.primaryColor,
      body: SafeArea(
        bottom: false,
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 15.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 30.sp,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      "Выберите как вы хотите войти",
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 40.sp,
                          ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 100.h,
              ),
              Flexible(
                child: Container(
                  width: double.infinity,
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height - 180.0,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppButton(
                        text: "По номеру телефона",
                        type: ButtonType.PRIMARY,
                        onPressed: () {
                          nextScreen(context, "/login/phone");
                        },
                      ),
                      SizedBox(height: 50.h),
                      AppButton(
                        text: "По email",
                        type: ButtonType.PRIMARY,
                        onPressed: () {
                          nextScreen(context, "/login/email");
                        },
                      ),
                      SizedBox(height: 50.h),
                      AppButton(
                        text: "По Mos.ru",
                        type: ButtonType.PRIMARY,
                        onPressed: _launchURL,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
