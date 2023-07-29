

import 'package:flutter/material.dart';
import 'package:screen_brightness/screen_brightness.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BrightnessControlScreen(),


    );
  }
}

class BrightnessControlScreen extends StatefulWidget {
  const BrightnessControlScreen({Key? key}) : super(key: key);

  @override
  State<BrightnessControlScreen> createState() => _BrightnessControlScreenState();
}

class _BrightnessControlScreenState extends State<BrightnessControlScreen> {
  double _brightnessValue = 1.0; //maximum brightness


  void _setBrightness (double brightness)async{
    if (brightness>=0.0 && brightness <=1.0){
      await ScreenBrightness().setScreenBrightness(brightness);
      setState(() {
        _brightnessValue = brightness;
      });

    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Brightness control app"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Brightness:",style:
            TextStyle(fontSize: 20),),
            Slider(
                value: _brightnessValue,
                onChanged: _setBrightness)
          ],
        ),
      ),
    );
  }
}




