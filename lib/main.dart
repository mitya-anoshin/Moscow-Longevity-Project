import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path_provider/path_provider.dart';

import 'features/login_page/pages/choose_login.dart';
import 'features/login_page/pages/code_confirmation_page.dart';
import 'features/login_page/pages/email_login_page.dart';
import 'features/login_page/pages/phone_login_page.dart';
import 'features/welcome_page/welcome_page.dart';
import 'utils/constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final documentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(documentDirectory.path);

  runApp(ProviderScope(child: MyApp()));
}

/// MyApp Widget
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
      return MaterialPageRoute(
        builder: (context) {
          return WelcomePage();
        },
      );
    case "/login":
      return MaterialPageRoute(
        builder: (context) {
          return ChooseLoginPage();
        },
      );
    case "/login/phone":
      return MaterialPageRoute(
        builder: (context) {
          return PhoneLoginPage();
        },
      );
    case "/login/phone/confirm_code":
      return MaterialPageRoute(
        builder: (context) {
          return CodeConfirmationPage();
        },
      );
    case "/login/email":
      return MaterialPageRoute(
        builder: (context) {
          return EmailLoginPage();
        },
      );
    case "/login/mosru":
      return MaterialPageRoute(
        builder: (context) {
          return ChooseLoginPage();
        },
      );
    default:
      return MaterialPageRoute(
        builder: (context) {
          return WelcomePage();
        },
      );
  }
}
