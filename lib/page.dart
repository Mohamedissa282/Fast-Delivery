import 'package:appflutter/generated/l10n.dart';
import 'package:appflutter/login/LanguageProvider.dart';
import 'package:appflutter/login/login.dart';
import 'package:appflutter/login/notification.dart';
import 'package:appflutter/mypage/local.dart';
import 'package:appflutter/mypage/mybouton.dart';
import 'package:appflutter/mypage/mybuton3.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class page extends StatefulWidget {
  const page({super.key});

  @override
  State<page> createState() => _pageState();
  
}

class _pageState extends State<page> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
       appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding:  EdgeInsets.only(right: isArabic() ? 0 : 15, left: isArabic() ? 15 : 0),
            child: PopupMenuButton( 
                   
                    icon: Icon(Icons.language, color: Colors.black, size: 32,),
                    itemBuilder: (context)=> [
                    PopupMenuItem(
            onTap: () {
                  Provider.of<LanguageProvider>(context,listen: false).changeLanguage('fr');
            },
            child: Text(S.of(context).title1,style: TextStyle(color: Colors.black , fontWeight: FontWeight.bold),)),
                    PopupMenuItem(
            onTap: () {
              Provider.of<LanguageProvider>(context, listen: false).changeLanguage('ar');
            },
            child: Text(S.of(context).title2,style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),)),
                    
                  ]),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: ListView(
             
            children: [
             SizedBox(height: 75,),
             Image.asset('images/icone-livraison-rapide-camion-icone-service-livraison_186930-1270 (1).avif'),
                  SizedBox(height: 48,),
               Text(S.of(context).hello, style: TextStyle(
                color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold
               ),),
               SizedBox(height: 11,),
               Container(
                margin: EdgeInsets.symmetric(horizontal: 11),
                 child: Text( S.of(context).name, style: TextStyle(
                 fontWeight: FontWeight.bold, fontSize: 17, color: Colors.grey[700]
                 ),),
               ),
          
               SizedBox(height: 155,),
              myboton3(color: Colors.orange, txtname:S.of(context).title, onTap: (){
             Navigator.of(context).pushNamed('login');
            // LocalNotification.showBasicNotification('Hello!', 'Mohamed Essa');
               },)
            ],
          ),
        ),
      ),
    );
  }

  
}
