import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_config_state.dart';

class AppConfigCubit extends Cubit<AppConfigState> {
  AppConfigCubit() : super(const AppConfigState()) {
    init();
  }

  void init() {
    /// await saved language localsotrage / cloud
    /// changeLanguage(locale);
  }

  void changeLanguage(Locale locale) {
    emit(state.copyWith(currentLocale: locale));
  }
}
