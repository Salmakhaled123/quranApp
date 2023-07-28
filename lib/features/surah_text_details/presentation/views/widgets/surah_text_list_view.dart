import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/quran.dart' as quran;
import 'package:quran_app/features/surah_text_details/data/local_data/shared_pref.dart';
import 'package:quran_app/features/surah_text_details/data/models/audioAyatModel.dart';
import 'package:quran_app/features/surah_text_details/presentation/manager/theme_cubit.dart';
class SurahTextViewListView extends StatelessWidget {
  const SurahTextViewListView({Key? key, required this.info}) : super(key: key);
final AudioInfo info;
  @override
  Widget build(BuildContext context)
  {
    int index=info.number;
    int count=info.ayahCount;
    bool ? theme=CacheHelper.getData('theme');
    return ListView(children: [
      const SizedBox(
        height: 5,
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              for (var i = 1; i <= count; i++) ...{
                TextSpan(
                  text:
                  quran.getVerse(index, i, verseEndSymbol: true) ,
                  style:  TextStyle(
                      fontFamily: 'Kitab',
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    color: BlocProvider.of<ThemeCubit>(context).isDark==true ? Colors.white:Colors.black
                  ),
                ),

              }
            ],
          ),
        ),
      ),
    ]);
  }
}
