import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterchallenges/modules/facebook_redesign/blocs/theme_bloc.dart';
import 'package:flutterchallenges/navigation/router.dart';
import 'package:go_router/go_router.dart';

import 'assets.dart';

void main() => runApp(
      const MyApp(),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: _MyAppView(),
    );
  }
}

class _MyAppView extends StatelessWidget {
  _MyAppView() : _router = GGrouter();
  final GoRouter _router;

  @override
  Widget build(BuildContext context) {
    final a = Images.avatar;
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
