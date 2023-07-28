import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

import '../../../surah_text_details/data/models/audioAyatModel.dart';

part 'surah_state.dart';

class SurahCubit extends Cubit<SurahState> {
  SurahCubit() : super(SurahInitial());
  List<AudioInfo>surahInfo=[];
  void fetchDataFromLocalJson()async
  {
    emit(SurahLoading());
         try {
           String response=await rootBundle.loadString('assets/quran_data/audioAyat.json');
                 final result=jsonDecode(response);
                AudioModel data=AudioModel.fromJson(result);
               for(var x in data.data)
                 {
                   surahInfo.add(x);
                 }
               emit(SurahSuccess(surahInfo));
         } catch (e) {
          print(e.toString());
          emit(SurahFailure(e.toString()));
         }
    print(surahInfo.length);
  }
  String replaceNumbersToArabic(String input)
  {
    const English=['0','1','2','3','4','5','6','7','8','9'];
    const Arabic=['٠'	,'١','٢', '٣','٤','٥','٦','٧','٨', '٩', '١٠'];
    for(int i=0;i<English.length;i++)
      {
        input=input.replaceAll(English[i], Arabic[i]);
      }
    return input;
  }
}
