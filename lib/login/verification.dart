
import 'package:appflutter/generated/l10n.dart';
import 'package:appflutter/google.dart';
import 'package:appflutter/informations.dart';
import 'package:appflutter/login/login.dart';
import 'package:appflutter/mypage/mybouton.dart';
import 'package:appflutter/mypage/page2.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class verification extends StatefulWidget {
  final String phone;
  verification(this.phone);
  

  @override
  State<verification> createState() => _verificationState();
}

class _verificationState extends State<verification> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController pinController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
 String? verificationCode;
  verifyPhone() async{
        await _auth.verifyPhoneNumber(
          phoneNumber: '+222${widget.phone}',
      verificationCompleted: (PhoneAuthCredential credential) async {
     await _auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        print('Verification Failed : ${e.message}');
      },
      codeSent: (String verificationId, int? resendToken) {
        setState(() {
        verificationCode= verificationId;
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        setState(() {
          verificationCode= verificationId;
        });
      },
      timeout: Duration(seconds: 60),
    );
  }
  void verifyCode() async {
   final code= otpController.text.trim();
   if(verificationCode != null){
         final credential = PhoneAuthProvider.credential(
        
       verificationId: verificationCode!,
       smsCode: code,
         );
         await _auth.signInWithCredential(credential);
   }
  }
  
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
  width: 56,
  height: 56,
  textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
  decoration: BoxDecoration(
    border: Border.all(color: Color.fromRGBO(9, 57, 97, 1)),
    borderRadius: BorderRadius.circular(20),
  ),
);
final focusedPinTheme = defaultPinTheme.copyDecorationWith(
  border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
  borderRadius: BorderRadius.circular(8),
);
final submittedPinTheme = defaultPinTheme.copyWith(
  decoration: defaultPinTheme.decoration!.copyWith(
    color: Colors.grey[200],
  ),
);
    return Scaffold(
     /* appBar: AppBar(
        
        title: Text("Verifier your  number", style: TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold
        ),),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),*/
      backgroundColor: Colors.white,
      body: ListView(
        children: [
           SizedBox(height: 32,),
          Row(
          
            children: [
            
              IconButton(onPressed: (){
 Navigator.of(context).pushReplacementNamed('login');
              }, icon: Icon(Icons.arrow_back, color: Colors.black,)),
              SizedBox(width: 44,),
              Padding(
                padding: EdgeInsets.only(
                  left: isArabic() ? 37 : 0
                ),
                child: Text(S.of(context).title14, style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22
                        ),),
              ),
            ],
          ),
        SizedBox(height: 10,),
          Column(
            children: [
               Image.asset('images/images.png',width: 170,),
              SizedBox(height: 50,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                 
                  Text("${S.of(context).title13} +222", style: TextStyle(
                    color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold
                  ),),
                  SizedBox(width: 7,),
                  Text(widget.phone, style:  TextStyle(
                    color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold
                  ),)
                ],),
                
         
              ),
              Text(S.of(context).title11, style: TextStyle(
                fontSize: 13.5, fontWeight: FontWeight.bold
              ),),
                SizedBox(height: 40,),
              Pinput(
                controller: otpController,
                  defaultPinTheme: defaultPinTheme,
                  focusedPinTheme: focusedPinTheme,
                  submittedPinTheme: submittedPinTheme,
                  
                        pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                       showCursor: true,
                       validator: (phone) {
                          if(phone == '2222'){
                              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> informations(nmbr2: widget.phone,) ));
           /*Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> google(widget.phone) ));*/
                          }
                          else{
                            return S.of(context).title12;
                          }
                             },
                    onCompleted: (pin)=>
                       verifyCode(),
                    
                    
                         ),
              SizedBox(height: 100,),
              mybouton(color: Colors.orange, txtname: S.of(context).title, onTap: (){
             
                AwesomeDialog(
                        descTextStyle: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15
                        ),
                        btnOkColor: Colors.orange,
                        btnOkText: S.of(context).title8,
                     context: context,
                     dialogType: DialogType.error,
                     animType: AnimType.rightSlide,
                      title: '',
                      desc:S.of(context).title11,
                
                     
                    btnOkOnPress: () {},
                     ).show();
           //  verifyPhone();
             
              },),
              SizedBox(height: 40,),
              
            ],
          ),
        ],
      ),
    );
    

   
  }
  
}