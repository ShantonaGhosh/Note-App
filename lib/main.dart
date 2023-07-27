import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:hive_flutter/adapters.dart';

import 'package:note_app/views/splash_screen.dart';

import 'model/note_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
   Hive.registerAdapter<NoteModel>(NoteModelAdapter());
  await Hive.openBox<NoteModel>('notes');
 
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      
      title: 'Note app',
      home: SplashScreen(),
    );
  }
}
