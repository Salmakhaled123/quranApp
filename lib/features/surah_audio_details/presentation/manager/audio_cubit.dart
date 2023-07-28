import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:quran_app/features/surah_audio_details/data/repos/audioRepo.dart';
import 'package:quran_app/features/surah_text_details/data/models/audioAyatModel.dart';

part 'audio_state.dart';

class AudioCubit extends Cubit<AudioState> {
  AudioCubit(this.audioRepo) : super(AudioInitial());
  AudioRepo audioRepo;

  fetchAudioFromLocalJson(AudioInfo info)async
  {
    emit(AudioLoading());
    try {
   AudioModel response= audioRepo.fetchAudio(info);

debugPrint(response.data[info.number-1].recitation.full);
      emit(AudioSuccess());
    }  catch (e)
    {
emit(AudioFailure(e.toString()));
    }

  }

}
