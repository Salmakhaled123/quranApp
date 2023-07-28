import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/features/home/presentation/view_models/surah_cubit.dart';
import 'package:quran_app/features/surah_text_details/data/models/audioAyatModel.dart';
import 'package:quran_app/features/surah_text_details/presentation/views/widgets/surah_text_list_view.dart';

class SurahViewBody extends StatelessWidget {
  const SurahViewBody({
    Key? key,
    required this.info,
  }) : super(key: key);
  final AudioInfo info;

  @override
  Widget build(BuildContext context)
  {

    return BlocBuilder<SurahCubit, SurahState>(
      builder: (context, state) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            body: SafeArea(
              child:SurahTextViewListView(info: info,) ,
            ),
          ),
        );
      }




    );
  }
}
