import 'package:flutter/material.dart';

class HyperboliqApp extends StatefulWidget{
  const HyperboliqApp._({
    Key? key
}) : super(key: key);

  static Future<void> appInit() async{
    await setUpLocators();
  }
}