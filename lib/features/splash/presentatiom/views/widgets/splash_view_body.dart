import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quran_app/core/utils/assets.dart';
import 'package:quran_app/features/home/presentation/view_models/surah_cubit.dart';

import '../../../../../core/app_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    navigateToHome();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  const Center(
        child: Image(
      image: AssetImage(AssetData.SplashLogo),
    ));
  }
  Future <void> navigateToHome()
  {
    return Future.delayed(const Duration(seconds: 3),()
    {
      GoRouter.of(context).push(AppRouter.KhomeView);
      BlocProvider.of<SurahCubit>(context).fetchDataFromLocalJson();
    },);
  }
}
