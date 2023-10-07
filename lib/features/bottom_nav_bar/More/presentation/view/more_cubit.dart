import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itrags_task/features/bottom_nav_bar/More/presentation/view/more_state.dart';

class MoreCubit extends Cubit<MoreState>{
  MoreCubit():super(InitialState());
  String arabicLang = 'en';

  void changeLang(bool value, BuildContext context){
    if (value) {
      EasyLocalization.of(context)?.setLocale(Locale('ar'));
      arabicLang = 'ar';
      emit(ChangeLanguageState());
    }   else{
      EasyLocalization.of(context)?.setLocale(Locale('en'));
      arabicLang = 'en';
      emit(ChangeLanguageState());
    }
  }
}