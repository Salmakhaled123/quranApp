import 'package:audioplayers/audioplayers.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:quran_app/core/utils/errors/failures.dart';
import 'package:quran_app/features/surah_audio_details/data/repos/audioRepo.dart';
import 'package:quran_app/features/surah_text_details/data/models/audioAyatModel.dart';

class AudioRepoImp implements AudioRepo{

  @override
 fetchAudio(AudioInfo info)async  {
    AudioPlayer player=AudioPlayer();
   try {
await player.play(UrlSource(info.recitation.full));
debugPrint("=============success===============");

   }  catch (e) {
     if(e is DioException)

       {
         return ServerFailure.fromJson(e);
       }

   }


  }

}