import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localizations/core/bloc/cubit/app_config_cubit.dart';
import 'package:localizations/core/route/app_route.dart';
import 'package:localizations/core/route/app_route_name.dart';
import 'package:localizations/core/theme/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// Follow me on
/// Youtube : Dannndi
/// IG : dannndi.ig
/// Tiktok : dannndi.tt
///
/// Like & Subscribe

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AppConfigCubit()),
      ],
      child: Builder(builder: (context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Flutter Localization",
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: ThemeMode.light,
          initialRoute: AppRouteName.home,
          onGenerateRoute: AppRoute.generate,
          navigatorObservers: [routeObserver],
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: context.watch<AppConfigCubit>().state.currentLocale,
        );
      }),
    );
  }
}
