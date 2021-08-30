import 'package:auto_route/auto_route.dart';
import 'package:quire_clone/auth/ui/login_page.dart';
import 'package:quire_clone/auth/ui/password_recovery_page.dart';
import 'package:quire_clone/auth/ui/sign_up_page.dart';
import 'package:quire_clone/auth/ui/submit_page.dart';
import 'package:quire_clone/onboarding/ui/onboarding.dart';
import 'package:quire_clone/test_page.dart';

@MaterialAutoRouter(
  routes: [
    MaterialRoute(page: Onboarding),
    MaterialRoute(page: TestHomePage),
    MaterialRoute(page: SignUpPage),
    MaterialRoute(page: LoginPage),
    MaterialRoute(page: PasswordRecoveryPage),
    MaterialRoute(page: SubmitPage),
  ],
)
class $AppRouter {}
