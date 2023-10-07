import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:itrags_task/features/bottom_nav_bar/home/data/network/response/audio_data.dart';
import 'package:http/http.dart' as http;

class AudioApiService{

  String baseurl = 'https://api.quran.com/api/v4/chapter_recitations/1/1';
  AudioPlayer audioPlayer = AudioPlayer();
  Future<AudioData> fetchAudio()async{
    Uri uri = Uri.parse('$baseurl');
    final response = await http.get(uri);
    if(response.statusCode == 200){
      final json = jsonDecode(response.body);
      final audioData = AudioData.fromJson(json['audio_file']);
      return audioData;
    }else{
      throw Exception('Failed to load Audio');
    }
  }
}