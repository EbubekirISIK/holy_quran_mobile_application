import 'package:flutter/material.dart';
import 'package:test_app/model/kuran_model.dart';
import 'package:test_app/widgets/app_title.dart';
import 'package:test_app/widgets/kuran_ayet_list.dart';

import '../sevices/kuran_api.dart';

class KuranHomePage extends StatelessWidget {
  const KuranHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppTitle(),
          Expanded(child: const KuranAyetList()
          )
        ],
      )
    );
  }
}
