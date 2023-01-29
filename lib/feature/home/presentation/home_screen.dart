import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:localizations/core/bloc/cubit/app_config_cubit.dart';
import 'package:localizations/core/utils/utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("App Localization"),
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 1,
            position: PopupMenuPosition.under,
            itemBuilder: (_) {
              return AppLocalizations.supportedLocales.map(
                (locale) {
                  return PopupMenuItem<String>(
                    value: locale.languageCode,
                    child: Text(Utils.localeToCountryName(locale)),
                  );
                },
              ).toList();
            },
            onSelected: (value) {
              context.read<AppConfigCubit>().changeLanguage(Locale(value));
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context).helloWorld,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              AppLocalizations.of(context).sayMyName("Dandi", "Indonesia"),
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}
