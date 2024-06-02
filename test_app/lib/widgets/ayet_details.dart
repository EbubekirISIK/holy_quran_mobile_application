import 'package:flutter/material.dart';
import 'package:test_app/constants/ui_helper.dart';
import 'package:test_app/model/kuran_model.dart';

class AyetDetails extends StatelessWidget {
  final KuranModel ayet;
  const AyetDetails({Key? key, required this.ayet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(ayet.englishName ?? "", style: UiHelper.getAyetNameStyle(),),
          ],
        )
      ],
    );
  }
}
