import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import 'first3.dart';
import 'main.dart';

class first2Page extends StatefulWidget {
  const first2Page({Key? key}) : super(key: key);

  @override
  _first2PageState createState() => _first2PageState();
}

class _first2PageState extends State<first2Page> {
  DateTime selectedDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {

    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
              onPressed: () => _selectDate(context),
        child: Text(
          'Sigaraya ne zaman başladın?',
          style: TextStyle(color: Colors.white,fontSize: 24),
        )
    ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.white,),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => first3Page(selectedDate:selectedDate)),);
                },
                child: Text("İleri",style: TextStyle(color: Colors.black),))],

          ),
        ],
      ),

    );
  }
}
