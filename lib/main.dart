import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/app_router.dart';
import 'package:quran_app/features/home/presentation/view_models/surah_cubit.dart';
import 'package:quran_app/features/surah_text_details/data/local_data/shared_pref.dart';
import 'package:quran_app/features/surah_text_details/presentation/manager/theme_cubit.dart';
import 'features/surah_audio_details/presentation/manager/bloc_observer.dart';

void main()async {
 WidgetsFlutterBinding.ensureInitialized();
 await CacheHelper.init();
  Bloc.observer=MyObserver();
  bool ?theme=CacheHelper.getData('theme');
  print(theme );
  runApp( QuranApp(dark: theme  ,));

}
class QuranApp extends StatelessWidget {
  const QuranApp({Key? key, this.dark, }) : super(key: key);
 final bool  ?dark;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>SurahCubit()),
        BlocProvider(create: (context)=>ThemeCubit()..changeTheme(fromShared: dark))
      ],
      child: BlocBuilder<ThemeCubit,ThemeState>(
        builder: (context,state)=>MaterialApp. router(
          theme: ThemeData(  iconTheme:const  IconThemeData(color: Colors.green,),
              tabBarTheme: const TabBarTheme(labelColor: Colors.black,),
              primarySwatch:Colors.green,brightness: Brightness.light,
              indicatorColor: Colors.green,sliderTheme: const SliderThemeData(activeTickMarkColor: Colors.green),
              appBarTheme: const AppBarTheme(color: Colors.green) ),
          darkTheme: ThemeData(
            iconTheme:const  IconThemeData(color: Colors.green,),

            brightness: Brightness.dark,primarySwatch:Colors.green, indicatorColor: Colors.green,
    appBarTheme: const AppBarTheme(color: Colors.green),tabBarTheme: const TabBarTheme(labelColor: Colors.white),),
          routerConfig: AppRouter.router,
themeMode:BlocProvider.of<ThemeCubit>(context).isDark? ThemeMode.dark :ThemeMode.light,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
