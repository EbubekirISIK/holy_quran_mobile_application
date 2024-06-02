import 'package:dio/dio.dart';

import '../model/sure_model.dart';

class AyetApi{
Future<SurahDetailModel> fetchSurahDetail(int surahNumber) async {
  final response = await Dio().get('https://api.alquran.cloud/v1/surah/$surahNumber');

  if (response.statusCode == 200) {
    return SurahDetailModel.fromJson(response.data['data']);
  } else {
    throw Exception('Failed to load surah detail');
  }
}
}