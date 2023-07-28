part of 'theme_cubit.dart';

@immutable
abstract class ThemeState {}

class ThemeInitial extends ThemeState {}
class ThemeFailure extends ThemeState {}
class ThemeStoredSuccess extends ThemeState {}
