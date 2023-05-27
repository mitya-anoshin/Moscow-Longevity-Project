import 'package:auto_route/auto_route.dart';

import '../login_page/pages/choose_login.dart';
import '../login_page/pages/code_confirmation_page.dart';
import '../login_page/pages/email_login_page.dart';
import '../login_page/pages/phone_login_page.dart';
import '../registration/pages/registration_info_page.dart';
import '../registration/pages/registration_page.dart';
import '../welcome_page/welcome_page.dart';

part 'app_router.gr.dart';

/// App Router
@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: WelcomeRoute.page, initial: true),
        AutoRoute(page: ChooseLoginRoute.page, path: '/login'),
        AutoRoute(page: PhoneLoginRoute.page, path: '/login/phone'),
        AutoRoute(
            page: CodeConfirmationRoute.page,
            path: '/login/phone/confirm_code'),
        AutoRoute(page: EmailLoginRoute.page, path: '/login/email'),
        AutoRoute(page: RegistrationRoute.page, path: '/registration'),
        AutoRoute(page: RegistrationInfoRoute.page, path: '/registration/info'),
        RedirectRoute(path: '*', redirectTo: '/'),
      ];
}
