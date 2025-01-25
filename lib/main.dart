import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:herlytics/home_page.dart';

void main() async{
    WidgetsFlutterBinding.ensureInitialized();
    if (kIsWeb) {
    await Firebase.initializeApp(
      options:const FirebaseOptions(
          apiKey: 'AIzaSyDoNp_hN_4NAiCvXlM3beSH-_NRLMJ33n4',
          appId: "1:1078810035647:web:73f401251727fd17adcd0a",
          messagingSenderId: "1078810035647",
          projectId: "herlytics",
          storageBucket: "herlytics.appspot.com",
          ),
          
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // scaffoldBackgroundColor: const Color.fromARGB(103,58,183,1),
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
     
      home: HomePageModern(),
      // home: VideoPlayer(),
      
    
      
      
    );
  }
}


