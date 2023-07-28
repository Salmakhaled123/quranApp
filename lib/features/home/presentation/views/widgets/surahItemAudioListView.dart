import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quran_app/features/home/presentation/view_models/surah_cubit.dart';
import 'package:quran_app/features/home/presentation/views/widgets/surah_item.dart';

import '../../../../../core/app_router.dart';

class SurahItemAudioListView extends StatelessWidget {
  const SurahItemAudioListView({Key? key,   }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SurahCubit, SurahState>(
      builder: (context, state) {
        var cubit=BlocProvider.of<SurahCubit>(context);
        return  ListView.builder(
              itemCount: cubit.surahInfo.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) =>
                  GestureDetector(onTap: ()
                  {
                    GoRouter.of(context).push(AppRouter.SuraAudioView,
                        extra: cubit.surahInfo[index]
                    );

                  },
                      child: SurahItem(info: cubit.surahInfo[index],)));







      },
    );
  }
}
