import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/constants.dart';
import '../../widgets/app_button.dart';

@RoutePage()
class SurveyPage extends StatelessWidget {
  const SurveyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.primaryColor,
        title: Text('Анкета'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          children: [
            Text(
              'Какая физическая активность была бы безопасной и комфортной с учетом ваших ограничений?',
              style: TextStyle(
                fontSize: 22.sp,
              ),
            ),
            SizedBox(height: 40.h),
            AppButton(
                type: ButtonType.primary,
                onPressed: () {},
                text: 'Легкие упражнения и растяжка'),
            SizedBox(height: 40.h),
            AppButton(
                type: ButtonType.primary,
                onPressed: () {},
                text: 'Водные виды спорта'),
            SizedBox(height: 40.h),
            AppButton(
                type: ButtonType.primary,
                onPressed: () {},
                text: 'Медитация и дыхательные практики'),
            SizedBox(height: 40.h),
            AppButton(
                type: ButtonType.primary,
                onPressed: () {},
                text: 'Физическая активность с оборудованием'),
          ],
        ),
      ),
    );
  }
}
