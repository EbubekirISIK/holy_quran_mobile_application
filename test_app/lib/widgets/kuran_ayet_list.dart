import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/model/kuran_model.dart';
import 'package:test_app/widgets/ayetler_item.dart';

import '../sevices/kuran_api.dart';


class KuranAyetList extends StatefulWidget {
  const KuranAyetList({super.key});

  @override
  State<KuranAyetList> createState() => _KuranAyetListState();
}

class _KuranAyetListState extends State<KuranAyetList> {
  late Future<List<KuranModel>> _surahListFuture;

  @override
  void initState() {
    super.initState();
    _surahListFuture = SurahApi.getSurahData();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<KuranModel>>(
      future: _surahListFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<KuranModel> _listem = snapshot.data!;

         return GridView.builder(
           itemCount: _listem.length,
             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
             crossAxisCount: ScreenUtil().orientation == Orientation.portrait ? 2 : 3),
             itemBuilder: (context, index) => AyetlerListItem(ayet: _listem[index])
         );
        } else if (snapshot.hasError) {
          return Center(
            child: Text("Hata çıktı: ${snapshot.error}"),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}



