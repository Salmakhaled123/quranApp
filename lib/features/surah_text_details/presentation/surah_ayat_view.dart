import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/features/surah_text_details/data/local_data/shared_pref.dart';
import 'package:quran_app/features/surah_text_details/data/models/audioAyatModel.dart';
import 'package:quran_app/features/surah_text_details/presentation/manager/theme_cubit.dart';
import 'package:quran_app/features/surah_text_details/presentation/views/widgets/surah_view_body.dart';

class SurahView extends StatelessWidget {
  const SurahView({
    Key? key,
    required this.info,
  }) : super(key: key);
  final AudioInfo info;

  @override
  Widget build(BuildContext context)
  {
    bool  dark=false;
    return Scaffold(
      appBar: AppBar(
          actions: [
            BlocBuilder<ThemeCubit, ThemeState>(
              builder: (context, state)
              {
                var cubit=BlocProvider.of<ThemeCubit>(context);
                return IconButton(
                    onPressed: () {
                      BlocProvider.of<ThemeCubit>(context).changeTheme();
                    },
                    icon:  Icon(cubit.isDark ?Icons.dark_mode_outlined:Icons.sunny));
              },
            )
          ],
          title: Text(
            ' سورة ${info.asma.ar.short}',
          ),
          centerTitle: true),
      body: SafeArea(
        child: SurahViewBody(info: info),
      ),
    );
  }
}
