import 'package:flutter/material.dart';
import 'package:quran_app/features/surah_audio_details/presentation/views/widgets/surah_audio_view_body.dart';
import 'package:quran_app/features/surah_text_details/data/models/audioAyatModel.dart';
class SurahAudioView extends StatelessWidget {
  const SurahAudioView({Key? key, required this.info}) : super(key: key);
final AudioInfo info;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(body: SafeArea(
        child: SurahAudioViewBody(info: info,)),);
  }
}
