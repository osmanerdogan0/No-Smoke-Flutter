import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nosmoke/main.dart';

import 'first2.dart';

class first1Page extends StatefulWidget {
  const first1Page({Key? key}) : super(key: key);

  @override

  _first1PageState createState() => _first1PageState();
}

class _first1PageState extends State<first1Page> {

  @override
  Widget build(BuildContext context) {

    return  Scaffold(

      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [

            Container(
              padding: const EdgeInsets.all(16.0),
              width: MediaQuery.of(context).size.width*0.8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      "No Smoke",
                          style: TextStyle(color: Colors.white, fontSize: 48, fontWeight: FontWeight.w300),

                  ),
                ],
              ),
            ),

          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(5.0),
              width: MediaQuery.of(context).size.width*0.8,
              child: Text(
                  "Sigarayı bıraktıktan 20 dakika sonra; kan basıncı ve nabız normale döner, el ve ayak dolaşımı düzelir. 8 saat sonra, kan oksijen düzeyi normale döner, kalp krizi geçirme riski azalır. 24 saat sonra, vücutta karbon monoksit azalır, oksijen artar. 72 saat sonra, hava yollarının gevşemesi sonucu nefes alıp verme rahatlar, hava yolları kendi kendini temizlemeye çalışır. 2-12 hafta sonra, tüm vücuttaki dolaşım düzelir, kişinin solunum yolu enfeksiyonlarına yakalanma riski azalır. 3-9 ay sonra, öksürük ve solunum yolu problemleri düzelir. 12 ay sonra, koroner kalp hastalığı riski yarı yarıya azalır. 12-36 ay sonra, kanser riski yüzde 50 azalır."
                ,
                style: TextStyle(color: Colors.white, fontSize: 14),
                textAlign: TextAlign.center,
              ),
            ),
          ]
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            ElevatedButton(
    style: ElevatedButton.styleFrom(primary: Colors.white,),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => first2Page()),);
              },
            child: Text("İleri",
              style: TextStyle(color: Colors.black, fontSize: 14),))],

    ),
        ],
      ),
    );
  }
}
