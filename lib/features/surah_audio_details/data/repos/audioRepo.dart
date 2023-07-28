import 'package:quran_app/features/surah_text_details/data/models/audioAyatModel.dart';

abstract class AudioRepo{
  fetchAudio(AudioInfo info);
}