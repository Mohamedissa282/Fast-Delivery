import 'package:appflutter/generated/l10n.dart';
import 'package:appflutter/google.dart';
import 'package:appflutter/login/login.dart';
import 'package:appflutter/mypage/mybouton.dart';
import 'package:appflutter/mypage/mybuton3.dart';
import 'package:flutter/material.dart';


class page2 extends StatelessWidget {
  String nmbr;
page2(this.nmbr);

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formstate = GlobalKey();
TextEditingController number = TextEditingController();
TextEditingController number2 = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      
      body: ListView(
        children: [
          Form(
                  key: formstate,
                  child: Column(
                    
                    children: [
                        SizedBox(height: 30,),
                         Padding(
                        padding:  EdgeInsets.only(right: isArabic() ? 0 : 276,
                        left: isArabic() ? 276 : 0
                        ),
                        child: IconButton(onPressed: (){
              Navigator.of(context).pushNamedAndRemoveUntil('login', (route)=> false);
                        }, icon: Icon(Icons.arrow_back)),
                      ),
                     
                    
                      SizedBox(height: 20,),
                      Image.asset('images/icone-livraison-rapide-camion-icone-service-livraison_186930-1270 (1).avif'),
                      Row(
                        
                        children: [
                          
                          Padding(
                            padding:  EdgeInsets.only(left: isArabic() ? 0 : 10,
                            right: isArabic() ? 33 : 0,
                            ),
                            child: Text(S.of(context).title22, style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16
                                              ),),
                          ),
                        SizedBox(width: 4,),
                        Row(children: [
                          Text(S.of(context).title23, style: TextStyle(
                          color: const Color.fromARGB(240, 231, 144, 13), fontWeight: FontWeight.bold, fontSize: 18
                        ),),
                         SizedBox(width: 3,),
                          Text(S.of(context).title24, style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w900, fontSize: 18
                        ),)
                        ],)
                        ],
                      ),
                       SizedBox(height: 18,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Text(S.of(context).title21, style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 14
                        ),),
                      ),
                      SizedBox(height: 50,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:17),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.orangeAccent,
                                borderRadius: BorderRadius.circular(9)
                              ), child: Align(alignment: Alignment.center,
                                child: Text('1', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)),
                            ),
                            SizedBox(width: 12,),
                            Text(S.of(context).title18,style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),),
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                       Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                         child: TextFormField(
                          validator: (val){
                            if(val!.isEmpty){
                               return S.of(context).title20;
                            }
                          },
                          controller: number,
                          keyboardType:TextInputType.text,
                          
                          showCursor: false,
                          decoration: InputDecoration(
                           
                            contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 6),
                            
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black38, width: 2)
                            )
                          
                          ),
                         
                         
                                       ),
                       ),
                      SizedBox(height: 15,),
                       Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 17),
                         child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(9),
                                border: Border.all(color: Colors.orangeAccent, width: 2),
                              ), child: Align(alignment: Alignment.center,
                                child: Text('2', style: TextStyle(color: Colors.orangeAccent, fontWeight: FontWeight.bold),)),
                            ),
                            SizedBox(width: 12,),
                            Text(S.of(context).title19,style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),),
                          ],
                                       ),
                       ),
                      SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50, vertical:5 ),
                        child: TextFormField(
                          validator: (val){
                             if(val!.isEmpty){
                                 return S.of(context).title20;
                             }
                          },
                          keyboardType:TextInputType.text,
                          controller: number2,
                          showCursor: false,
                          decoration: InputDecoration(
                            
                            contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 22),
                            
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black38, width: 2)
                            )
                          
                          ),
                         
                         
                        ),
                      ),
                     SizedBox(height: 30,),
                    /* InkWell(
                      onTap: (){
                       if(formstate.currentState!.validate()){
                              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> google(nmbr, number.text, number2.text) ));
                       }
                      },
                       child: Container(
                        height: 70, width: 70,
                        decoration: BoxDecoration(
                          color: Colors.orangeAccent,
                           borderRadius: BorderRadius.circular(50),
                           boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 212, 156, 72),
                              offset: Offset(5, 3),
                              blurRadius: 4.0,
                              blurStyle: BlurStyle.normal
                            )
                           ]
                        ), child: Icon(Icons.arrow_right_alt_outlined,size: 35, color: const Color.fromRGBO(255, 255, 255, 1),),
                       ),
                     )*/
                  myboton3(color: Colors.orangeAccent, txtname: S.of(context).title, onTap: (){
                     if(formstate.currentState!.validate()){
                              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> google(nmbr, number.text, number2.text) ));
                       }
                  },)
                    ],
                  ),
                ),
        ],
      ),
          
        
      
    );
  }
}