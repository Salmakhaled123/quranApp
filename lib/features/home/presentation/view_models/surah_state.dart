part of 'surah_cubit.dart';

@immutable
abstract class SurahState {}
class SurahInitial extends SurahState {}
class SurahLoading extends SurahState {}
class SurahSuccess extends SurahState {
  final List<AudioInfo> audioInfo;
  SurahSuccess(this.audioInfo);
}
class SurahFailure extends SurahState {
  final String errorMessage;
  SurahFailure(this.errorMessage);
}
class SliderChangedSuccess extends SurahState{
  final double value;
  SliderChangedSuccess({required this.value});
}

