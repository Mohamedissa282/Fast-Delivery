import 'package:appflutter/generated/l10n.dart';
import 'package:appflutter/login/verification.dart';
import 'package:intl/intl.dart';
import 'package:appflutter/mypage/mybouton.dart';
import 'package:appflutter/mypage/mybuton3.dart';
import 'package:appflutter/mypage/textfield.dart';
import 'package:appflutter/page.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class login extends StatelessWidget {
   String? erreur;
   login({super.key});
   
GlobalKey<FormState> formstate = GlobalKey();
TextEditingController number = TextEditingController();

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
     backgroundColor: Colors.white,
   
     body:  Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: formstate,
            child: ListView(
              children: [
                Column(
                   
                  children: [
                   
                  Padding(
                    padding:  EdgeInsets.only(right: isArabic() ? 0 : 276,
                    left: isArabic() ? 276 : 0
                    ),
                    child: IconButton(onPressed: (){
    Navigator.of(context).pushNamedAndRemoveUntil('page', (route)=> false);
                    }, icon: Icon(Icons.arrow_back)),
                  ),
                 
                   
                   SizedBox(height: 110,),
                    Image.asset('images/icone-livraison-rapide-camion-icone-service-livraison_186930-1270 (1).avif'),
   
                    SizedBox(height: 35,),
                    textfield(mycontroller: number,),
                     SizedBox(height: 29,),
                      
                    myboton3(color: Colors.orange, txtname:S.of(context).title, onTap: (){
                     /*if(formstate.currentState!.validate()) {
                      
                         Navigator.of(context).push(MaterialPageRoute(builder: (context)=> verification(number.text)));
                     }*/
                    if(number.text.isNotEmpty && number.text.length ==8){
                       AwesomeDialog(
                        descTextStyle: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18
                        ),
                        titleTextStyle: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18
                        ) ,
                        
                        btnOkText: S.of(context).title6,
                        btnCancelText: 'Non',
                        btnOkColor: Colors.orange,
                        
                     context: context,
                     dialogType: DialogType.noHeader,
                     animType: AnimType.rightSlide,
                      title: S.of(context).title5,
                      desc: isArabic() ? " ${number.text} 222+" : "+222 ${number.text}",
                
                     
                    btnOkOnPress: () async{
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> verification(number.text)));
                        
                    },
                   
                     ).show();
                      
                    }
                    else if(number.text.isEmpty){
                      AwesomeDialog(
                        descTextStyle: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17
                        ),
                        btnOkColor: Colors.orange,
                        btnOkText: S.of(context).title8,
                     context: context,
                     dialogType: DialogType.error,
                     animType: AnimType.rightSlide,
                      title: '',
                      desc: S.of(context).title4,
                
                     
                    btnOkOnPress: () {},
                     ).show();
                    }
                
                    },),
                     SizedBox(height: 32,),
                    Text(S.of(context).title3, style: TextStyle(
                      color: Colors.black, fontSize: 14.5
                    ),),
                   
                   
                  ],
                ),
              ],
            ),
          ),
        ),
      
    );
  }
}

    bool isArabic(){
      return Intl.getCurrentLocale()=='ar';
    }   