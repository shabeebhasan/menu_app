import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:menu_app/reducers/store.dart';
import 'package:menu_app/whatsapp_home.dart';
import 'package:flutter_redux/flutter_redux.dart';

List<CameraDescription> cameras;

Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  await Redux.init();
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Menu Gen",
      theme: new ThemeData(
        primaryColor: new Color(0xffA0522D),
        accentColor: new Color(0xffA0522D),
      ),
      debugShowCheckedModeBanner: false,
      home: StoreProvider<AppState>(
        store: Redux.store,
        child: new WhatsAppHome(cameras: cameras),
      ),
    );
  }
}
