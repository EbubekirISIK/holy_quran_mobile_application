import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/constants/constants.dart';
import 'package:test_app/constants/ui_helper.dart';

class AppTitle extends StatefulWidget {
  const AppTitle({super.key});

  @override
  State<AppTitle> createState() => _AppTitleState();
}

class _AppTitleState extends State<AppTitle> {
  String AyetImageUrl = "images/ayetler.jpg";
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.amber,
      height: UiHelper.getAppTitleWidgetHeight(),
      child:  Stack(
        children: [
          Align(alignment: Alignment.centerLeft,
            child: Text(Constants.title, style: Constants.getTitleTextStyle()),
          ),
          Align(alignment: Alignment.centerRight,
            child:  Image.asset(
                AyetImageUrl,
                //width: ScreenUtil().orientation == Orientation.portrait ? 0.2.sh: 0.2.sw,
                width: 100.w,
                height: 100.h,
                fit: BoxFit.fitWidth
            ),
          ),
        ],
      ),
    );

  }
}
