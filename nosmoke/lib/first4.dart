import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nosmoke/timer.dart';

import 'main.dart';

class first4Page extends StatefulWidget {
  DateTime selectedDate = DateTime.now();
  late int adet;
  late int tutar;

  first4Page({required this.selectedDate,required this.adet,required this.tutar});

  @override
  _first4PageState createState() => _first4PageState();
}

class _first4PageState extends State<first4Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              Container(
                width: MediaQuery.of(context).size.width*0.8,
                  child: Text(
                      "Bütün adımları tamamladın. Artık sağlıklı bir hayata geçiş yapmaya hazırsın." ,
                      style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,

                  )
              ),
            ],
          ),

          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.white,),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(sonDate: widget.selectedDate,sonAdet: widget.adet,sonTutar: widget.tutar,quitDate: DateTime.now(),)),);
                },
                child: Text("Hazırım!" ,style: TextStyle(color: Colors.black)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
