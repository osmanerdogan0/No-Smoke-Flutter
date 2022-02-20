import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'first4.dart';
import 'main.dart';

class first3Page extends StatefulWidget {

  DateTime selectedDate;
  first3Page({required this.selectedDate});

  @override
  _first3PageState createState() => _first3PageState();
}



class _first3PageState extends State<first3Page> {
  TextEditingController adetController=new TextEditingController();
  TextEditingController tutarController=new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height:MediaQuery.of(context).size.height ,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text("Günde kaç adet sigara içiyordun?", style: TextStyle(color: Colors.white, fontSize: 24),),
            ],
            ),
            SizedBox(height: 10,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Container(
                  width: MediaQuery.of(context).size.width*0.7,
                  child: TextFormField(
                    controller: adetController,
                    style: new TextStyle(fontSize: 22.0, color:Colors.white),
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,

                      hintText: '0',
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Lütfen doldurun!';
                      }
                      return null;
                    },
                  ),
                ),
              ],

            ),

            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text("Sigara paketinin tutarı nedir?", style: TextStyle(color: Colors.white, fontSize: 24),),


              ],
    ),

            SizedBox(height: 10,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Container(
                  width: MediaQuery.of(context).size.width*0.7,
                  child: TextFormField(
                    controller: tutarController,
                    style: new TextStyle(fontSize: 22.0, color:Colors.white),
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,

                      hintText: '0',
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Lütfen doldurun!';
                      }
                      return null;
                    },
                  ),
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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => first4Page(selectedDate: widget.selectedDate,adet: int.parse(adetController.text),tutar: int.parse(tutarController.text),)),);
                    },
                    child: Text("İleri" ,style: TextStyle(color: Colors.black)),
                ),
              ],

            ),
          ],
            ),
      ),


    );
  }
}
