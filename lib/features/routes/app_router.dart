import 'package:auto_route/auto_route.dart';

import '../login_page/pages/choose_login.dart';
import '../login_page/pages/code_confirmation_page.dart';
import '../login_page/pages/email_login_page.dart';
import '../login_page/pages/phone_login_page.dart';
import '../welcome_page/welcome_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: WelcomePage, initial: true),
    AutoRoute(page: ChooseLoginPage, path: '/login'),
    AutoRoute(page: PhoneLoginPage, path: '/login/phone'),
    AutoRoute(page: CodeConfirmationPage, path: '/login/phone/confirm_code'),
    AutoRoute(page: EmailLoginPage, path: '/login/email'),
    RedirectRoute(path: '*', redirectTo: '/'),
  ],
)
class $AppRouter {}
