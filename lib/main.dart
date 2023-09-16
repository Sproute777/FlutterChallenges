import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterchallenges/modules/facebook_redesign/blocs/theme_bloc.dart';
import 'package:flutterchallenges/navigation/router.dart';
import 'package:go_router/go_router.dart';

void main() => runApp(
      BlocProvider(
        create: (context) => ThemeBloc(),
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  MyApp({super.key}) : _router = GGrouter();
  final GoRouter _router;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return MaterialApp.router(
          routerConfig: _router,
          title: 'Flutter Demo',
          theme: state.theme,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
