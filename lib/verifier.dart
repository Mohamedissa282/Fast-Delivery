import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pinput/pinput.dart';

class verifier extends StatefulWidget {
  const verifier({super.key});

  @override
  State<verifier> createState() => _verifierState();
}

class _verifierState extends State<verifier> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final TextEditingController phoneControler= TextEditingController();
  final TextEditingController codeControler= TextEditingController();
  String? verifivationId2;
  void verifyNumber() async{
 await auth.verifyPhoneNumber(
  phoneNumber: '+222${phoneControler.text}',
  verificationCompleted:(PhoneAuthCredential credential) async{
  await auth.signInWithCredential(credential);
  }, 
  verificationFailed: (FirebaseAuthException e){
       print("Verification fieled :${e.message}");
  }, 
  codeSent: (String verificationId, int? resendToken){
    setState(() {
      verificationId= verifivationId2!;
    });
  }, codeAutoRetrievalTimeout:(String verificationId){
    setState(() {
      verificationId= verifivationId2!;
    });
    
  }
  
 );
 
 
  }
  void validation() async {
   final code= codeControler.text.trim();
   if(verifivationId2 != null){
         final credential = PhoneAuthProvider.credential(
        
       verificationId: verifivationId2!,
       smsCode: code,
         );
         await auth.signInWithCredential(credential);
   }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(title: Text("Phone auth"),),
         body: Padding(
           padding: const EdgeInsets.all(18.0),
           child: Column(
            children: [
              IntlPhoneField(
                initialCountryCode: 'MR',
                controller: phoneControler,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  label: Text('phone number'),
                  
                ),
           
              ),
              SizedBox(height: 16.0,),
              
              ElevatedButton(onPressed: (){
               verifyNumber();
              }, child: Text("Verify Number")),
              SizedBox(height: 16.0,),
              Pinput(
                controller: codeControler,
                length: 4,
                onCompleted: (pin){
                  validation();
                },
              )
            ],
           ),
         ),
    );
  }
}