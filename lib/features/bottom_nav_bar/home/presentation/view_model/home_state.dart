
import 'package:flutter/cupertino.dart';

@immutable
abstract class HomeState {}

class HomeInitState extends HomeState{}
class AudioLoading extends HomeState{}
class LoadingSuccess extends HomeState{}
class PlayingAudio extends HomeState{}
class PlayingAudioOffline extends HomeState{}
class PausingAudio extends HomeState{}
class LoadingFailed extends HomeState{}