import 'dart:convert';

class AudioData{
  String? format, audio_url;
  int? id, chapter_id;
  double? file_size;

  AudioData({required this.id, required this.chapter_id, required this.file_size, required this.format, required this.audio_url});
  factory AudioData.fromJson(Map<String, dynamic> json){
    return AudioData(id: json["id"], chapter_id: json["chapter_id"], file_size: json["file_size"], format: json["format"], audio_url: json["audio_url"]);
  }
}