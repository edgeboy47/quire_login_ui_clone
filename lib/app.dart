import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quire_clone/auth/application/cubit/auth_cubit.dart';
import 'package:quire_clone/auth/data/auth_service.dart';
import 'package:quire_clone/core/router/app_router.gr.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        //TODO: Add top level blocs here
        BlocProvider(
          create: (_) => AuthCubit(AuthService())..updateAuthState(),
        ),
      ],
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          state.maybeMap(
            unauthenticated: (state) {
              _appRouter.pushAndPopUntil(
                const OnboardingRoute(),
                predicate: (_) => false,
              );
            },
            authenticated: (state) {
              _appRouter.pushAndPopUntil(
                const TestHomePageRoute(),
                predicate: (_) => false,
              );
            },
            orElse: () {},
          );
        },
        child: MaterialApp.router(
          routerDelegate: _appRouter.delegate(),
          routeInformationParser: _appRouter.defaultRouteParser(),
        ),
      ),
    );
  }
}
