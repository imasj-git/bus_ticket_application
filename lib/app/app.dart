// import 'package:bus_ticket_app/core/common/sensor/proximity_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:provider/provider.dart';

// import '../core/theme/app_theme.dart';
// import '../features/splash/presentation/view/splash_view.dart';
// import '../features/splash/presentation/view_model/splash_cubit.dart';
// import 'di/di.dart';


// class App extends StatelessWidget {
//   const App({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (context) => ProximityProvider()), // ✅ Make ProximityProvider Global
//       ],
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'Bus Ticket Application',
//         theme: AppTheme.getApplicationTheme(isDarkMode: false),
//         home: BlocProvider.value(
//           value: getIt<SplashCubit>(),
//           child: SplashView(),
//         ),
//       ),
//     );
//   }
// }
import 'package:bus_ticket_app/core/common/sensor/proximity_provider.dart';
import 'package:bus_ticket_app/core/theme/theme_provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../core/theme/app_theme.dart';
import '../features/splash/presentation/view/splash_view.dart';
import '../features/splash/presentation/view_model/splash_cubit.dart';
import 'di/di.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProximityProvider()), // ✅ Proximity Sensor
        ChangeNotifierProvider(create: (context) => ThemeProvider()), // ✅ Theme State
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Bus Ticket Application',
            theme: AppTheme.getApplicationTheme(isDarkMode: themeProvider.isDarkMode),
            home: BlocProvider.value(
              value: getIt<SplashCubit>(),
              child: SplashView(),
            ),
          );
        },
      ),
    );  
  }
}

