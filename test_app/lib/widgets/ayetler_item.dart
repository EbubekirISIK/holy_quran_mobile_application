import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/constants/ui_helper.dart';
import 'package:test_app/model/kuran_model.dart';
import 'package:test_app/model/sure_model.dart';

import '../pages/sure_details_page.dart';

class AyetlerListItem extends StatelessWidget {
  final KuranModel ayet;

  const AyetlerListItem({Key? key, required this.ayet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => SurahDetailPage(surahNumber: ayet.number!),));
      },
      child:    Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.w),
          ),
          elevation: 3,
          shadowColor: Colors.black,
          color: UiHelper.getCardColor(ayet.number!),
          child: Padding(
            padding: UiHelper.getDefaultPadding(),
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(ayet.englishName ?? "N/A",
                  style: UiHelper.getEnglishNameStyle(),
                ),
                Chip(label: Text(ayet.name!,
                  style: UiHelper.getAyetNameStyle(),
                )
                ),
                Expanded(
                    child:  Container(
                      width: 50.w,  // Çemberin genişliği
                      height: 50.h, // Çemberin yüksekliği
                      decoration: BoxDecoration(
                        color: Colors.blue.shade200, // Çemberin rengi
                        shape: BoxShape.circle, // Çember şekli
                      ),
                      alignment: Alignment.center, // Yazıyı ortalama
                      child: Text(
                        ayet.numberOfAyahs.toString()!, // Yazı
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // Yazı rengi
                          fontSize: 20.0, // Yazı boyutu
                        ),
                        textAlign: TextAlign.center, // Yazıyı ortalama
                      ),
                    )
                )
              ],
            ),
          )

      ),
    );


  }
}
