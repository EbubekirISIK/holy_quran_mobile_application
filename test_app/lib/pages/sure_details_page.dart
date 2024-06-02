import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/constants/ui_helper.dart';
import 'package:test_app/model/kuran_model.dart';
import 'package:test_app/sevices/sure_api.dart';

import '../model/sure_model.dart';

class SurahDetailPage extends StatefulWidget {
  final int surahNumber;

  const SurahDetailPage({Key? key, required this.surahNumber}) : super(key: key);

  @override
  _SurahDetailPageState createState() => _SurahDetailPageState();
}

class _SurahDetailPageState extends State<SurahDetailPage> {
  late Future<SurahDetailModel> _surahDetailFuture;

  @override
  void initState() {
    super.initState();
    _surahDetailFuture = AyetApi().fetchSurahDetail(widget.surahNumber);
  }


  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: FutureBuilder<SurahDetailModel>(
        future: _surahDetailFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            SurahDetailModel surahDetail = snapshot.data!;
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: 200.0,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text(
                      surahDetail.englishName,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                    background: Container(
                      color: UiHelper.getCardColor(surahDetail.number),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            surahDetail.name,
                            style: TextStyle(color: Colors.white, fontSize: 24.h, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${surahDetail.numberOfAyahs} Ayahs',
                            style: TextStyle(color: Colors.white, fontSize: 18.h),
                          ),
                        ],
                      ),
                    ),
                  ),
                  leading: IconButton(
                    padding: EdgeInsets.all(8.0),
                    iconSize: 24.h,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.arrow_back_ios),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 4.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              surahDetail.ayahs[index].text,
                              style: TextStyle(fontSize: 18.h, color: Colors.black87),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ),
                      );
                    },
                    childCount: surahDetail.ayahs.length,
                  ),
                ),
              ],
            );
          } else {
            return const Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}
