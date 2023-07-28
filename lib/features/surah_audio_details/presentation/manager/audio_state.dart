part of 'audio_cubit.dart';

@immutable
abstract class AudioState {}

class AudioInitial extends AudioState {}

class AudioLoading extends AudioState {}

class AudioSuccess extends AudioState {}

class AudioFailure extends AudioState {
  final String errorMessage;
  AudioFailure(this.errorMessage);
}

