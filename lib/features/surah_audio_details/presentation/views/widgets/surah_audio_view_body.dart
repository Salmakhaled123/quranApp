import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:quran_app/features/surah_audio_details/presentation/views/widgets/quran_logo_item.dart';
import 'package:quran_app/features/surah_text_details/data/models/audioAyatModel.dart';

class SurahAudioViewBody extends StatefulWidget {
  const SurahAudioViewBody({Key? key, required this.info}) : super(key: key);
  final AudioInfo info;

  @override
  State<SurahAudioViewBody> createState() => _SurahAudioViewBodyState();
}

class _SurahAudioViewBodyState extends State<SurahAudioViewBody> {
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState()
  {
    initChange();
    super.initState();
  }
  void initChange()
  {
    {
      audioPlayer.onPlayerStateChanged.listen((event) {
        setState(() {
          isPlaying = event == PlayerState.playing;
        });
      });
      audioPlayer.onDurationChanged.listen((newDuration) {
        setState(() {
          duration = newDuration;
        });
      });
      audioPlayer.onPositionChanged.listen((newPosition) {
        setState(() {
          position = newPosition;
        });
      });
    }
  }

  String formattedDuration(Duration duration)
  {
    String hours=duration.inHours.toString().padLeft(2,'0');
    String minutes=duration.inMinutes.remainder(60).toString().padLeft(2,'0');
    String seconds=duration.inSeconds.remainder(60).toString().padLeft(2,'0');
    return '$hours:$minutes:$seconds';

  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
        const   QuranLogoItem(),
           SizedBox(
            height: MediaQuery.of(context).size.height* 0.04,
          ),
          Text(' ${'سوره '}${widget.info.asma.ar.short}',
              style:
                  const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
         SizedBox(
            height: MediaQuery.of(context).size.height* 0.04,
          ),
          Slider(
            value: position.inSeconds.toDouble(),
            onChanged: (value) async {
              final position = Duration(seconds: value.toInt());
              await audioPlayer.seek(position);
            },
            min: 0,
            max: duration.inSeconds.toDouble(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Text(formattedDuration(position)),
                const Spacer(),
                Text(formattedDuration((duration - position)))
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height* 0.04,
          ),
          CircleAvatar(backgroundColor:  Colors.green ,
            radius: 35,
            child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: () async {
                  if (isPlaying == true) {
                    await audioPlayer.pause();
                  } else {
                    audioPlayer.play(UrlSource(widget.info.recitation.full));
                  }
                },
                icon: Icon(color:Colors.white ,
                  isPlaying == true ? Icons.pause : Icons.play_arrow,
                  size: 50,
                )),
          ),
        ],
      ),
    );
  }



}

