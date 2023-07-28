import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:quran_app/features/surah_text_details/data/local_data/shared_pref.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());
  bool isDark=false;
  changeTheme({ bool ?fromShared})async
  {
    if(fromShared!=null)
      {
      isDark=fromShared;
        emit(ThemeStoredSuccess());

      }
else
  {
    isDark=!isDark;
    await CacheHelper.setData('theme', isDark);
    emit(ThemeStoredSuccess());

  }



  }
}
