import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../utils/constants.dart';
import '../../../widgets/app_button.dart';

/// Registration Info Page
@RoutePage()
class RegistrationInfoPage extends StatefulWidget {
  /// Registration Info Page constructor
  const RegistrationInfoPage({super.key});

  @override
  State<RegistrationInfoPage> createState() => _RegistrationInfoPageState();
}

class _RegistrationInfoPageState extends State<RegistrationInfoPage> {
  String _selectedGender = 'male';
  DateTime _selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Constants.primaryColor,
      ),
      backgroundColor: Constants.primaryColor,
      body: Padding(
        /// дата рождения
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Выберите дату рождения:',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30.sp,
              ),
            ),
            SizedBox(height: 20.h),
            SizedBox(
              width: 300.w,
              height: 60.h,
              child: AppButton(
                onPressed: () {
                  _selectDate(context);
                },
                text:
                    'Выбрано: ${DateFormat('dd.MM.yyyy').format(_selectedDate)}',
                type: ButtonType.plain,
              ),
            ),
            SizedBox(height: 30.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Выберите пол:',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30.sp,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RadioListTile(
                  activeColor: Colors.white,
                  title: Text(
                    'Мужской',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.sp,
                    ),
                  ),
                  value: 'male',
                  groupValue: _selectedGender,
                  onChanged: (value) {
                    setState(
                      () {
                        _selectedGender = value!;
                      },
                    );
                  },
                ),
                RadioListTile(
                  activeColor: Colors.white,
                  title: Text(
                    'Женский',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.sp,
                    ),
                  ),
                  value: 'female',
                  groupValue: _selectedGender,
                  onChanged: (value) {
                    setState(
                      () {
                        _selectedGender = value!;
                      },
                    );
                  },
                ),
              ],
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
                labelText: 'Адрес проживания',
                helperText: 'Введите адрес где вы живете',
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 3.h,
                  ),
                ),
              ),
            ),
            SizedBox(height: 50.h),
            AppButton(
              text: "Далее",
              type: ButtonType.plain,
              onPressed: () {
                // authController.login(
                //   _loginController.text,
                //   _passwordController.text,
                // );
              },
            ),
          ],
        ),
      ),
    );
  }
}
