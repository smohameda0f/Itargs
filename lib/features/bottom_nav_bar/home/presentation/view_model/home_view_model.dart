import 'package:audioplayers/audioplayers.dart';
import 'package:file/src/interface/file.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:itrags_task/features/bottom_nav_bar/More/presentation/view/more_state.dart';
import 'package:itrags_task/features/bottom_nav_bar/home/data/network/audio_api_service.dart';
import 'package:itrags_task/features/bottom_nav_bar/home/presentation/view_model/home_state.dart';
import 'package:itrags_task/features/utils/home_preference.dart';


class HomeViewModel extends Cubit<HomeState> with ChangeNotifier {
  HomeViewModel():super(HomeInitState());

  HomePreference homePreference = HomePreference();
  AudioApiService audioApiService = AudioApiService();
  AudioCache audioCache = AudioCache();
  AudioPlayer audioPlayer = AudioPlayer();
  String AUDIO_FILE = "AUDIOFILE";

  bool _isFLiked = false;
  bool _isSLiked = false;
  bool _isTLiked = false;
  bool _isPlayed = false;
  bool _disposed = false;

  bool get isFLiked => _isFLiked;
  bool get isSLiked => _isSLiked;
  bool get isTLiked => _isTLiked;
  bool get isPlayed => _isPlayed;

  set isFLiked(bool value){
    _isFLiked = value;
    homePreference.setFLiked(value);
    notifyListeners();
  }
  set isSLiked(bool value){
    _isSLiked = value;
    homePreference.setSLiked(value);
    notifyListeners();
  }
  set isTLiked(bool value){
    _isTLiked = value;
    homePreference.setTLiked(value);
    notifyListeners();
  }
  set isPlayed(bool value){
    _isPlayed = value;
    homePreference.setPlayed(value);
    notifyListeners();
  }
  var file;
  Future<void> playAudio() async{
    bool connectionStatus = await InternetConnectionChecker().hasConnection;

    if (connectionStatus == true) {
      try{
        emit(AudioLoading());
        String url =(await audioApiService.fetchAudio()).audio_url!;
        await audioPlayer.play(UrlSource(url,));
        file = await DefaultCacheManager().getSingleFile(url, key: AUDIO_FILE);
        emit(LoadingSuccess());
      }catch(e){
        // playAudioOffline();
        emit(LoadingFailed());
      }
    } else{
      if ( (await DefaultCacheManager().getFileFromCache(AUDIO_FILE)) == null) {
        emit(LoadingFailed());
      }else{
        // audioPlayer.setSourceAsset("${(await DefaultCacheManager().getFileFromCache(AUDIO_FILE))?.file.path}",);
        audioPlayer.play(DeviceFileSource("${(await DefaultCacheManager().getFileFromCache(AUDIO_FILE))?.file.path}"));
        emit(PlayingAudioOffline());
      }
    }

  }

  Future<void> pauseAudio() async {
      await audioPlayer.pause();
      // audioPlayerState = PlayState.PAUSED;
      emit(PausingAudio());
  }

  @override
  void dispose() {
    _disposed = true;
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  void notifyListeners() {
    if (!_disposed) {
      super.notifyListeners();
    }
  }
}