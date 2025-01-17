import 'package:bus_ticket_application/app/di/di.dart';
import 'package:bus_ticket_application/core/theme/app_theme.dart';
import 'package:bus_ticket_application/features/splash/presentation/view/splash_view.dart';
import 'package:bus_ticket_application/features/splash/presentation/view_model/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bus Ticket Application',
      theme: AppTheme.getApplicationTheme(isDarkMode: false),
      home: BlocProvider.value(
        value: getIt<SplashCubit>(),
        child: SplashView(),
      ),
    );
  }
}
