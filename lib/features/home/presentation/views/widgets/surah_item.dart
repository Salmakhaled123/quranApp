import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quran_app/core/app_router.dart';
import 'package:quran_app/features/home/presentation/view_models/surah_cubit.dart';
import 'package:quran_app/features/surah_text_details/data/models/audioAyatModel.dart';

import '../../../../../core/utils/assets.dart';

class SurahItem extends StatelessWidget {
  const SurahItem({Key? key, required this.info}) : super(key: key);
final AudioInfo info;
  @override
  Widget build(BuildContext context) {
    var cubit=BlocProvider.of<SurahCubit>(context);
    return ListTile(

      title:  Text(
        info.asma.ar.short,
        textDirection: TextDirection.rtl,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
      ),
      leading:Image.asset(
        AssetData.MuslimLogo,
      ) ,
      subtitle:Row(textDirection: TextDirection.rtl,
          children:
          [
            Text(info.type.en=='Meccan'?'مكيه':'مدنيه',style: const TextStyle(fontSize: 18)),
            const SizedBox(width: 2,),
            Text(cubit.replaceNumbersToArabic(info.ayahCount.toString()),style: const TextStyle(fontSize: 18) ),
            const SizedBox(width: 2,),
           const  Text(' آيات',style:  TextStyle(fontSize: 18))
        
      ]),
      trailing: IconButton(color: Colors.green,
          onPressed: () {
            GoRouter.of(context).push(AppRouter.SurahTextView,extra: cubit.surahInfo[info.number-1]);
          },
          icon: const Directionality(textDirection: TextDirection.ltr,
              child:  Icon(Icons.arrow_back_ios_outlined))),
    );
  }
}
