import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magnifying_glass/magnifying_glass.dart';

import '../../utils/constants.dart';

@RoutePage()
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    final magnifyingGlassController = MagnifyingGlassController();

    return MagnifyingGlass(
      controller: magnifyingGlassController,
      glassPosition: GlassPosition.touchPosition,
      borderThickness: 8.0,
      borderColor: Colors.grey,
      glassParams: GlassParams(
        startingPosition: Offset(150, 150),
        diameter: 200,
        distortion: 0,
        magnification: 1.3,
        padding: EdgeInsets.all(10),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Constants.primaryColor,
          title: Text(
            'События',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: GestureDetector(
              onTap: () {
                magnifyingGlassController.openGlass();
              },
              child: Center(
                child: Text(
                  'Лупа',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 10.w),
              child: Center(
                child: Text(
                  'Поиск',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: FutureBuilder(
            future: Dio().get('http://178.170.197.206:8000/events'),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemBuilder: (context, index) => Event(
                    title:
                        snapshot.data!.data[index]['направление 1'].toString(),
                    subtitle:
                        snapshot.data!.data[index]['направление 3'].toString(),
                    location:
                        snapshot.data!.data[index]['район площадки'].toString(),
                    unicNumber: snapshot.data!.data[index]['уникальный номер']
                        .toString(),
                  ),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}

class Event extends StatelessWidget {
  final String title;
  final String subtitle;
  final String location;
  final String unicNumber;

  const Event({
    super.key,
    required this.title,
    required this.subtitle,
    required this.location,
    required this.unicNumber,
  });

  @override
  Widget build(BuildContext context) {
    final random = Random();

    final strings1 = <String>['Очный формат', 'Онлайн формат'];
    final randomNumber1 = random.nextInt(strings1.length);
    final randomString1 = strings1[randomNumber1];

    final strings2 = <String>[
      'Группа занимается',
      'Группа набирается',
      'Группа скоро начнет занятия'
    ];
    final randomNumber2 = random.nextInt(strings2.length);
    final randomString2 = strings2[randomNumber2];

    final strings3 = <String>['Запись продолжается', 'Запись скоро начнется'];
    final randomNumber3 = random.nextInt(strings3.length);
    final randomString3 = strings3[randomNumber3];

    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 176, 238, 235),
        borderRadius: BorderRadius.circular(10.r),
        // border: Border.all(width: 2.w, color: Color.fromARGB(255, 0, 139, 219)),
      ),
      margin: EdgeInsets.symmetric(vertical: 10.h),
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.all(10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.sp,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              subtitle,
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
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(5.w),
                    child: Text(
                      randomString1,
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
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(5.w),
                    child: Text(
                      randomString2,
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
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(5.w),
                    child: Text(
                      randomString3,
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
              'Местоположение: $location',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              'Группа: $unicNumber',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              'Расписание: Вт 10:40 - 11:40',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                SizedBox(
                  height: 60.h,
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
                Spacer(),
                SizedBox(
                  height: 60.h,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 9, 208, 235),
                      ),
                    ),
                    onPressed: () {
                      context.router.pushNamed('/main/event');
                    },
                    child: Text(
                      'Узнать подробнее',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.h),
          ],
        ),
      ),
    );
  }
}
