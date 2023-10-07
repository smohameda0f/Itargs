import 'package:shared_preferences/shared_preferences.dart';

class HomePreference {
  static const FLIKE_STATUS = "FLIKESTATUS";
  static const SLIKE_STATUS = "SLIKESTATUS";
  static const TLIKE_STATUS = "TLIKESTATUS";
  static const PLAY_STATUS = "PLAYSTATUS";

  setFLiked(bool value) async {
    SharedPreferences likePrefs = await SharedPreferences.getInstance();
      likePrefs.setBool(FLIKE_STATUS,value);
  }
  setSLiked(bool value) async {
    SharedPreferences likePrefs = await SharedPreferences.getInstance();
      likePrefs.setBool(SLIKE_STATUS,value);
  }
  setTLiked(bool value) async {
    SharedPreferences likePrefs = await SharedPreferences.getInstance();
      likePrefs.setBool(TLIKE_STATUS,value);
  }

  Future<bool> getFLiked() async {
    SharedPreferences likePrefs = await SharedPreferences.getInstance();
    return likePrefs.getBool(FLIKE_STATUS,) ?? false;
  }

  Future<bool> getSLiked() async {
    SharedPreferences likePrefs = await SharedPreferences.getInstance();
    return likePrefs.getBool(SLIKE_STATUS,) ?? false;
  }

  Future<bool> getTLiked() async {
    SharedPreferences likePrefs = await SharedPreferences.getInstance();
    return likePrefs.getBool(TLIKE_STATUS,) ?? false;
  }

  setPlayed(bool value) async {
    SharedPreferences likePrefs = await SharedPreferences.getInstance();
    likePrefs.setBool(PLAY_STATUS,value);
  }

  Future<bool> getPlayed() async {
    SharedPreferences likePrefs = await SharedPreferences.getInstance();
    return likePrefs.getBool(PLAY_STATUS,) ?? false;
  }
}