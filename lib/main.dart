import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'features/dashboard_page/dashboard.dart';
import 'features/login_page/pages/choose_login.dart';
import 'features/login_page/pages/code_confirmation_page.dart';
import 'features/login_page/pages/email_login_page.dart';
import 'features/login_page/pages/phone_login_page.dart';
import 'features/single_order_page/single_order.dart';
import 'features/welcome_page/welcome_page.dart';
import 'utils/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Flutter Laundry UI",
        theme: ThemeData(
          scaffoldBackgroundColor: Constants.scaffoldBackgroundColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: GoogleFonts.poppinsTextTheme(),
        ),
        initialRoute: "/",
        onGenerateRoute: _onGenerateRoute,
      ),
    );
  }
}

Route<dynamic> _onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case "/":
      return MaterialPageRoute(builder: (context) {
        return WelcomePage();
      });
    case "/login":
      return MaterialPageRoute(builder: (context) {
        return ChooseLoginPage();
      });
    case "/login/phone":
      return MaterialPageRoute(builder: (context) {
        return PhoneLoginPage();
      });
    case "/login/phone/confirm_code":
      return MaterialPageRoute(builder: (context) {
        return CodeConfirmationPage();
      });
    case "/login/email":
      return MaterialPageRoute(builder: (context) {
        return EmailLoginPage();
      });
    case "/login/mosru":
      return MaterialPageRoute(builder: (context) {
        return ChooseLoginPage();
      });
    case "/dashboard":
      return MaterialPageRoute(builder: (context) {
        return Dashboard();
      });
    case "/single-order":
      return MaterialPageRoute(builder: (context) {
        return SingleOrder();
      });
    default:
      return MaterialPageRoute(builder: (context) {
        return WelcomePage();
      });
  }
}
