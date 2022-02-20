import 'dart:async';

import 'package:flutter/material.dart';
import 'package:custom_timer/custom_timer.dart';
import 'package:nosmoke/timer.dart';

import 'first1.dart';

void main() {



  runApp(

      new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new first1Page(),
    routes: <String, WidgetBuilder> {
      '/app': (BuildContext context) => new first1Page()
    },
  )
  );
}


class MainPage extends StatefulWidget{
  HomePage createState()=> HomePage();
}



class ButtonWidget extends StatelessWidget {
  final String text;
  final Color color;
  final Color backgroundColor;
  final VoidCallback onClicked;

  const ButtonWidget({Key? key, required this.text, required this.onClicked,
    this.color = Colors.white, this.backgroundColor = Colors.black}) : super(key: key);
  @override
  Widget build(BuildContext context) => ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: backgroundColor,
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16)
      ),
      onPressed: onClicked,
      child: Text(text,style: TextStyle(fontSize: 20,color: color),)
  );

}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'No Smoke',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFEFEFEF),



      ),
      home: const first1Page(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  late DateTime sonDate=DateTime.now();
 late int sonTutar;
 late int sonAdet;
 late DateTime quitDate;


  MyHomePage({required this.sonDate,required this.sonAdet,required this.sonTutar,required this.quitDate});



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {




  @override
  void dispose() {

  }
var toplamZaman=null;
  var quitZaman=null;
  Duration calculateQuitTime() {
    DateTime now = DateTime.now();
    quitZaman= now.difference(this.widget.quitDate);
    return now.difference(this.widget.quitDate);
  }
  Duration calculatePassedTime() {
    DateTime now = DateTime.now();
    toplamZaman= now.difference(this.widget.sonDate);
    return now.difference(this.widget.sonDate);
  }
double cigarettePerSecond=0.0;
  double moneyPerSecond=0.0;
  double cigaretteSaveSecond=0.0;
  double calculateSavedMoney(){
    cigarettePerSecond = this.widget.sonAdet / (24 * 60 * 60.0);
    moneyPerSecond = moneyPerSecond+(cigarettePerSecond * this.widget.sonTutar);
    return moneyPerSecond;
  }

  double calculateSavedCigarette(){
    cigarettePerSecond = this.widget.sonAdet / (24 * 60 * 60.0);
    cigaretteSaveSecond = cigaretteSaveSecond+cigarettePerSecond;
    print(cigaretteSaveSecond);
    return cigaretteSaveSecond;
  }
  @override
void initState(){
    MyHomePage myHomePage;
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        calculatePassedTime();
        calculateSavedMoney();
        calculateSavedCigarette();
      });
    });
    super.initState();
}

  Widget buildTimeCard({required String time, required String header}) =>
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20)
            ),
            child: Text(
              time, style: TextStyle(fontWeight: FontWeight.bold,
                color: Colors.black,fontSize: 50),),
          ),
          SizedBox(height: 10,),
          Text(header,style: TextStyle(color: Colors.white)),
        ],
      );
  Widget buildTime(){
    String twoDigits(var n) => n.toString().padLeft(2,'0');
    int calculateYears= int.parse(calculateQuitTime().inDays.toString());
    int calculateMonths= int.parse(calculateQuitTime().inDays.toString());
    int calculateDays= int.parse(calculateQuitTime().inDays.toString());
    final years = twoDigits(calculateYears~/365);
    final months =twoDigits((calculateMonths~/30).toString());
    final days =twoDigits((calculateDays).toString());
    final hours = twoDigits((calculateQuitTime().inHours)).toString();
    final minutes =twoDigits((calculateQuitTime().inMinutes)).toString();
    final seconds =twoDigits((calculateQuitTime().inSeconds+1)).toString();
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              buildTimeCard(time: years, header:'Yıl'),
              SizedBox(width: 8,),
              buildTimeCard(time: months, header:'Ay'),
              SizedBox(width: 8,),
              buildTimeCard(time: days, header:'Gün'),
              SizedBox(width: 8,),
            ],

          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
            buildTimeCard(time: hours, header:'Saat'),
            SizedBox(width: 8,),
            buildTimeCard(time: minutes, header:'Dakika'),
            SizedBox(width: 8,),
            buildTimeCard(time: seconds, header:'Saniye'),
            ],
          ),

        ]
    );
  }

    Widget build(BuildContext context) {
      // TODO: implement build
      return Scaffold(

        backgroundColor: Colors.black26,

        appBar: AppBar(
          backgroundColor: Colors.black26,
            actions: <Widget>[
        IconButton(
        icon: const Icon(Icons.settings),
        tooltip: 'Show Snackbar',
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Ayarlar')));
        },
      ),
      ],
        ),

        body:Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                'No Smoke', style: TextStyle(fontSize: 48, color: Colors.white, fontWeight: FontWeight.w300, fontFamily: "Roboto"),
              ),
            ),
            buildTime(),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Text(
                        "İçilmeyen Sigara: 0", style: TextStyle(fontWeight: FontWeight.w300,
                          color: Colors.black,fontSize: 24),),
                    ),

                  ],
                ),
              ],

            ),

                    SizedBox(height: 15,),

                    Column(
                    children: [
                    Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10)
                    ),
                    child: Text(
                    "Kazanılan para: "+moneyPerSecond.toInt().toString()+"₺", style: TextStyle(fontWeight: FontWeight.w300,
                    color: Colors.black,fontSize: 24),),
                    ),

                    ],
                    ),
              ],
            ),

            Column(
              children: [
                Text(
                  ""
                ),
              ],

            ),

            //buildButtons()
          ],


        ),

      );
  }
}
