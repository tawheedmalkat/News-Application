import 'package:flutter/material.dart';
import 'package:newsapp1/views/home.dart';

class Start extends StatefulWidget {
  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  @override
  void initState() {
    super.initState();
    // انتظر 5 ثواني ثم انتقل إلى الصفحة الثانية
    Future.delayed(Duration(seconds: 5), () {
      // استخدم Navigator للانتقال إلى الصفحة الثانية
      Navigator.pushReplacementNamed(context, '/x');
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Center(
        child: Container(
          child: RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: 'news',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 90.0,
                      fontFamily: 'Abril_Fatface')),
              TextSpan(
                  text: '.',
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 70.0,
                      fontFamily: 'Abril_Fatface')),
            ]),
          ),
        ),
      ),
    ));
  }
}
