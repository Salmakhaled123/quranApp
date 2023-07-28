import 'package:flutter/material.dart';
import 'package:quran_app/features/home/presentation/views/widgets/surahItemAudioListView.dart';
import 'package:quran_app/features/home/presentation/views/widgets/surahItemTextListView.dart';
import 'package:quran_app/features/home/presentation/views/widgets/tab_item.dart';
import 'package:quran_app/features/surah_text_details/data/models/audioAyatModel.dart';
import 'muslim_home_item.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({Key? key, }) : super(key: key);
  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl
      ,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const HomeItemImage(),
          TabBar(
      indicatorWeight: 3,

      indicatorSize: TabBarIndicatorSize.tab,
      unselectedLabelColor: Colors.grey,
      controller: tabController,

      tabs: const [
        TabItem(text: 'قراءه'),
          TabItem(text: 'الاستماع'),

      ]),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children:   const [
                SurahItemTextListView(),
              SurahItemAudioListView(),


              ],
            ),
          )
        ],
      ),
    );
  }
}
