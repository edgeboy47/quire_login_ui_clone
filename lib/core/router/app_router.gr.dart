// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../../auth/ui/login_page.dart' as _i6;
import '../../auth/ui/password_recovery_page.dart' as _i7;
import '../../auth/ui/sign_up_page.dart' as _i5;
import '../../auth/ui/submit_page.dart' as _i8;
import '../../onboarding/ui/onboarding.dart' as _i3;
import '../../test_page.dart' as _i4;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    OnboardingRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i3.Onboarding();
        }),
    TestHomePageRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i4.TestHomePage();
        }),
    SignUpPageRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i5.SignUpPage();
        }),
    LoginPageRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i6.LoginPage();
        }),
    PasswordRecoveryPageRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i7.PasswordRecoveryPage();
        }),
    SubmitPageRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<SubmitPageRouteArgs>();
          return _i8.SubmitPage(key: args.key, email: args.email);
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(OnboardingRoute.name, path: '/Onboarding'),
        _i1.RouteConfig(TestHomePageRoute.name, path: '/test-home-page'),
        _i1.RouteConfig(SignUpPageRoute.name, path: '/sign-up-page'),
        _i1.RouteConfig(LoginPageRoute.name, path: '/login-page'),
        _i1.RouteConfig(PasswordRecoveryPageRoute.name,
            path: '/password-recovery-page'),
        _i1.RouteConfig(SubmitPageRoute.name, path: '/submit-page')
      ];
}

class OnboardingRoute extends _i1.PageRouteInfo {
  const OnboardingRoute() : super(name, path: '/Onboarding');

  static const String name = 'OnboardingRoute';
}

class TestHomePageRoute extends _i1.PageRouteInfo {
  const TestHomePageRoute() : super(name, path: '/test-home-page');

  static const String name = 'TestHomePageRoute';
}

class SignUpPageRoute extends _i1.PageRouteInfo {
  const SignUpPageRoute() : super(name, path: '/sign-up-page');

  static const String name = 'SignUpPageRoute';
}

class LoginPageRoute extends _i1.PageRouteInfo {
  const LoginPageRoute() : super(name, path: '/login-page');

  static const String name = 'LoginPageRoute';
}

class PasswordRecoveryPageRoute extends _i1.PageRouteInfo {
  const PasswordRecoveryPageRoute()
      : super(name, path: '/password-recovery-page');

  static const String name = 'PasswordRecoveryPageRoute';
}

class SubmitPageRoute extends _i1.PageRouteInfo<SubmitPageRouteArgs> {
  SubmitPageRoute({_i2.Key? key, required String email})
      : super(name,
            path: '/submit-page',
            args: SubmitPageRouteArgs(key: key, email: email));

  static const String name = 'SubmitPageRoute';
}

class SubmitPageRouteArgs {
  const SubmitPageRouteArgs({this.key, required this.email});

  final _i2.Key? key;

  final String email;
}
