import 'package:flutter/material.dart';
import 'package:nstudio/src/home/home_screen.dart';
import 'package:responsive_framework/responsive_framework.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        restorationScopeId: 'app',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: false,
          primaryColor: Colors.white,
        ),
        darkTheme: ThemeData.dark(
          useMaterial3: false,
        ),
        themeMode: ThemeMode.system,
        builder: (context, child) => ResponsiveBreakpoints.builder(
              child: child!,
              breakpoints: const [
                Breakpoint(start: 0, end: 450, name: MOBILE),
                Breakpoint(start: 451, end: 800, name: TABLET),
                Breakpoint(start: 801, end: double.infinity, name: DESKTOP),
              ],
            ),
        initialRoute: "/",
        onGenerateRoute: (RouteSettings routeSettings) {
          return MaterialPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) {
              return MaxWidthBox(
                maxWidth: 1600,
                backgroundColor: const Color(0xFFF5F5F5),
                child: ResponsiveScaledBox(
                  width: ResponsiveValue<double>(
                    context,
                    defaultValue: 0,
                    conditionalValues: [
                      Condition.equals(name: MOBILE, value: 450),
                      Condition.equals(name: TABLET, value: 800),
                      Condition.equals(name: DESKTOP, value: 1600),
                    ],
                  ).value,
                  child: BouncingScrollWrapper.builder(
                    context,
                    _buildPage(routeSettings.name ?? ''),
                    dragWithMouse: true,
                  ),
                ),
              );
            },
          );
        });
  }

  Widget _buildPage(String name) {
    return HomeScreenV2();
  }
}
