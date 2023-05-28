import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/constants.dart';
import '../main_page/main_page.dart';

@RoutePage()
class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.primaryColor,
        title: Text('Поиск'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          children: [
            SizedBox(height: 30.h),
            TextField(),
            SizedBox(height: 15.h),
            Text(
              'Сортировать по:',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10.w),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 11, 221, 133),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Center(
                    child: Text(
                      'Знаятия очно',
                      style: TextStyle(
                        fontSize: 15.sp,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20.w),
                Container(
                  padding: EdgeInsets.all(10.w),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 216, 221, 216),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Center(
                    child: Text(
                      'Занятия онлайн',
                      style: TextStyle(
                        fontSize: 15.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10.w),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 216, 221, 216),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Center(
                    child: Text(
                      'По дате',
                      style: TextStyle(
                        fontSize: 15.sp,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20.w),
                Container(
                  padding: EdgeInsets.all(10.w),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 216, 221, 216),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Center(
                      child: Text(
                    'Только новые',
                    style: TextStyle(
                      fontSize: 15.sp,
                    ),
                  )),
                ),
                SizedBox(width: 20.w),
                Container(
                  padding: EdgeInsets.all(10.w),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 216, 221, 216),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Center(
                      child: Text(
                    'Рядом',
                    style: TextStyle(
                      fontSize: 15.sp,
                    ),
                  )),
                ),
              ],
            ),
            SizedBox(height: 30.h),
            Expanded(
              child: FutureBuilder(
                future: Dio().get('http://178.170.197.206:8000/events'),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemBuilder: (context, index) => Event(
                        title: snapshot.data!.data[index]['направление 1']
                            .toString(),
                        subtitle: snapshot.data!.data[index]['направление 3']
                            .toString(),
                        location: snapshot.data!.data[index]['район площадки']
                            .toString(),
                        unicNumber: snapshot
                            .data!.data[index]['уникальный номер']
                            .toString(),
                      ),
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
