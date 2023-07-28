import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quran_app/features/home/presentation/views/home_view.dart';
import 'package:quran_app/features/splash/presentatiom/views/splash_view.dart';
import 'package:quran_app/features/surah_text_details/data/models/audioAyatModel.dart';
import 'package:quran_app/features/surah_text_details/presentation/surah_ayat_view.dart';
import '../features/surah_audio_details/presentation/views/surah_audio_view.dart';


abstract class AppRouter {
  static const String KhomeView = '/homeView';
  static const String SurahTextView = '/surahTextView';
  static const String SuraAudioView = '/surahAudioView';

  static GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (context, state) {
          return const SplashView();
        },
      ),
      GoRoute(
        path: KhomeView,
        builder: (context, state) {
          return const HomeView();
        },
      ),
      GoRoute(
        path: SurahTextView,
        builder: (context, state) {
          return SurahView(
              info: state.extra as AudioInfo);
        },
      ),
      GoRoute(
        path: SuraAudioView,
        builder: (context, state) {
          return SurahAudioView(info: state.extra as AudioInfo,);
        },
      ),
    ],
  );
}
