import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constants.dart';

@RoutePage()
class InfoEventPage extends StatefulWidget {
  const InfoEventPage({super.key});

  @override
  State<InfoEventPage> createState() => _InfoEventPageState();
}

class _InfoEventPageState extends State<InfoEventPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.primaryColor,
        title: Text(
          'Английский язык',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Физическая активность',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.sp,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              'Настойльный тенис',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25.sp,
              ),
            ),
            SizedBox(height: 10.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 81, 255, 203),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(5.w),
                    child: Text(
                      'Очный формат',
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 15.sp,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 81, 255, 203),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(5.w),
                    child: Text(
                      'Группа занимается',
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 15.sp,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 81, 255, 203),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(5.w),
                    child: Text(
                      'Запись продолжается',
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 15.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Text(
              'Округ: Северное Измайлово',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              'Точный адрес: ул. Пупкина д23',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              'Группа: PF123456789',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              'Расписание в открытых периодах: Вт 11:12 - 13:12',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              'Расписание в закрытых преиодах: Вт 10:30 - 11:30',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
              ),
            ),
            Spacer(),
            SizedBox(
              height: 60.h,
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Color.fromARGB(255, 6, 209, 13),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'Записаться',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17.sp,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}
