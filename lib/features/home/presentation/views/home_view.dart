import 'package:flutter/material.dart';
import 'package:quran_app/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:quran_app/features/surah_text_details/data/models/audioAyatModel.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key,  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: SafeArea(child: HomeViewBody()),
    );
  }
}
