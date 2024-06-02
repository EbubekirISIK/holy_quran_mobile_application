import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:test_app/model/kuran_model.dart';

class SurahApi {
  static const String _url = 'https://api.alquran.cloud/v1/surah';

  static Future<List<KuranModel>> getSurahData() async {
    List<KuranModel> _list = [];
    try {


      var result = await Dio().get(_url);
      var surahList = result.data['data'];

      if (surahList is List) {
        _list = surahList.map((e) => KuranModel.fromJson(e)).toList();
      } else {
        return [];
      }

      debugPrint(_list.first.toString());
      return _list;
    } catch (e) {
      debugPrint('Error: $e');
      return [];
    }
  }
}