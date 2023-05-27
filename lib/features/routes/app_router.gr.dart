// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    ChooseLoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ChooseLoginPage(),
      );
    },
    CodeConfirmationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CodeConfirmationPage(),
      );
    },
    EmailLoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EmailLoginPage(),
      );
    },
    PhoneLoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PhoneLoginPage(),
      );
    },
    WelcomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WelcomePage(),
      );
    },
    RegistrationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RegistrationPage(),
      );
    },
    RegistrationInfoRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RegistrationInfoPage(),
      );
    },
  };
}

/// generated route for
/// [ChooseLoginPage]
class ChooseLoginRoute extends PageRouteInfo<void> {
  const ChooseLoginRoute({List<PageRouteInfo>? children})
      : super(
          ChooseLoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChooseLoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CodeConfirmationPage]
class CodeConfirmationRoute extends PageRouteInfo<void> {
  const CodeConfirmationRoute({List<PageRouteInfo>? children})
      : super(
          CodeConfirmationRoute.name,
          initialChildren: children,
        );

  static const String name = 'CodeConfirmationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EmailLoginPage]
class EmailLoginRoute extends PageRouteInfo<void> {
  const EmailLoginRoute({List<PageRouteInfo>? children})
      : super(
          EmailLoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'EmailLoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PhoneLoginPage]
class PhoneLoginRoute extends PageRouteInfo<void> {
  const PhoneLoginRoute({List<PageRouteInfo>? children})
      : super(
          PhoneLoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'PhoneLoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [WelcomePage]
class WelcomeRoute extends PageRouteInfo<void> {
  const WelcomeRoute({List<PageRouteInfo>? children})
      : super(
          WelcomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'WelcomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RegistrationPage]
class RegistrationRoute extends PageRouteInfo<void> {
  const RegistrationRoute({List<PageRouteInfo>? children})
      : super(
          RegistrationRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegistrationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RegistrationInfoPage]
class RegistrationInfoRoute extends PageRouteInfo<void> {
  const RegistrationInfoRoute({List<PageRouteInfo>? children})
      : super(
          RegistrationInfoRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegistrationInfoRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
