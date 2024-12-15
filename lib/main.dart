import 'dart:async';
import 'dart:io';

import 'package:appflutter/informations.dart';
import 'package:appflutter/login/LanguageProvider.dart';
import 'package:provider/provider.dart';
import 'package:appflutter/generated/l10n.dart';
import 'package:appflutter/mypage/local.dart';
import 'package:appflutter/mypage/page2.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:appflutter/google.dart';
import 'package:appflutter/google2.dart';
import 'package:appflutter/login/login.dart';
import 'package:appflutter/login/notification.dart';
import 'package:appflutter/login/token.dart';
import 'package:appflutter/login/verification.dart';
import 'package:appflutter/mypage/detail.dart';
import 'package:appflutter/mypage/mybouton.dart';
import 'package:appflutter/mypage/textfield.dart';
import 'package:appflutter/page.dart';
import 'package:appflutter/verifier.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("##################OnBackground ###############");
print(message.notification!.title);
print(message.notification!.body);
}



void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid ?
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyD7lAGryKyg-CI9ErGbk5hawpNkxoHL94I', appId: '1:753481431963:android:2f01a2acc11b93a389bf3e', 
      messagingSenderId: '753481431963', projectId: 'appflutter-5db73'),
  )
  
  :
  await Firebase.initializeApp();
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
   await LocalNotification.init();
  runApp(
    ChangeNotifierProvider(create: (context)=> LanguageProvider(),
    child:  MyApp(),
    )
   );
}

class MyApp extends StatefulWidget {
  
   MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void initState(){
   
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      
      if(message.notification!= null){
       LocalNotification.showBasicNotification(message.notification!.title, message.notification!.body);

      }
  
  
});
      
      
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: Provider.of<LanguageProvider>(context).local,
      localizationsDelegates: [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      home: page(),
      routes: {
        'page': (context)=> page(),
        'login': (context)=> login(),
        'detail': (context)=> detail(),
        'google': (context)=> google('','',''),
        
        

      },
    );
  }
}

