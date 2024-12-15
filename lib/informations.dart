import 'package:appflutter/google.dart';
import 'package:appflutter/mypage/mybouton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class informations extends StatefulWidget {
  final String nmbr2;
   informations({required this.nmbr2});

  @override
  State<informations> createState() => _informationsState();
}

class _informationsState extends State<informations> {
  CollectionReference categories = FirebaseFirestore.instance.collection('categories');
   CollectionReference categories_two = FirebaseFirestore.instance.collection('categories_two');
  
  Future<void> addUser() {
      // Call the user's CollectionReference to add a new user
      return categories
          .add({
            'name': controller.text, // John Doe
            'nom de famille': controller2.text, // Stokes and Sons
            'NNI': controller3.text // 42
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }
    Future<void> addUser2() {
      // Call the user's CollectionReference to add a new user
      return categories_two
          .add({
            'name': controller.text, // John Doe
             
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }
  int current = 0;
  GlobalKey<FormState> key = GlobalKey();
  GlobalKey<FormState> key2 = GlobalKey();
  GlobalKey<FormState> key3 = GlobalKey();
  TextEditingController controller = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 11),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 274),
                child: IconButton(onPressed: (){
       Navigator.of(context).pushNamedAndRemoveUntil('login', (_)=> false) ;                 
                }, icon: Icon(Icons.arrow_back)),
              ),
                SizedBox(height: 13,),
              Padding(
                padding: const EdgeInsets.only(left: 27),
                child: Text("Veuillez saisir les informations suivantes ", style: TextStyle(
                  color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold
                ),),
              ),
        SizedBox(height: 20,),
              Stepper(steps: [
                Step(
                  isActive: current==0,
                  stepStyle: StepStyle(
                    color: Colors.orangeAccent
                  ),
                  title: Text("nom personnel", style: TextStyle(
                    color: Colors.black, fontSize: 19, fontWeight: FontWeight.bold
                  ),), content: Form(
                    key: key,
                    child: TextFormField(
                      controller: controller,
                      validator: (val){
                         if(val!.isEmpty){
                              return "champ vide!";
                         }
                         if(val.length> 13){
                          return "nom long";
                         }
                      },
                    keyboardType: TextInputType.name,
                    showCursor: false,
                    style: TextStyle(
                      fontSize: 15
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orangeAccent, width: 3)
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)
                      )
                    ),
                  ))
                  ),
                   Step(
                     isActive: current==1,
                     stepStyle: StepStyle(
                    color: Colors.orangeAccent
                  ),
                  title: Text("nom de famille", style: TextStyle(
                    color: Colors.black, fontSize: 19, fontWeight: FontWeight.bold
                  ),), content:Form(
                    key: key2,
                    child: TextFormField(
                      controller: controller2,
                       validator: (val){
                         if(val!.isEmpty){
                              return "champ vide!";
                         }
                         if(val.length> 13){
                          return "nom long";
                         }
                      },
                    keyboardType: TextInputType.name,
                     showCursor: false,
                    style: TextStyle(
                      fontSize: 14
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orangeAccent, width: 3)
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)
                      )
                    ),
                  ))
                  ),

                    Step(
                       isActive: current==2,
                       stepStyle: StepStyle(
                    color: Colors.orangeAccent
                  ),
                  title: Text("NNI", style: TextStyle(
                    color: Colors.black, fontSize: 19, fontWeight: FontWeight.bold
                  ),), content: Form(
                    key: key3,
                    child: TextFormField(
                      controller: controller3,
                       validator: (val){
                         if(val!.isEmpty){
                              return "champ vide!";
                         }
                       
                      },
                      maxLength: 10,
                       showCursor: false,
                       style: TextStyle(
                      fontSize: 14
                    ),
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orangeAccent, width: 3)
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)
                      )
                    ),
                  ))
                  )
              ],
              onStepTapped: (int i){
                  setState(() {
                    current = i;
                  });
              },
              currentStep: current,
              onStepContinue: (){
                 if(key.currentState!.validate()){
                            if(current!=2){
                   setState(() {
                    current++;
                  });
                   
                }
                  }
                    if(key2.currentState!.validate()){
                            if(current!=2){
                   setState(() {
                    current++;
                  });
                   
                }
                  }
                    if(key3.currentState!.validate()){
                            if(current!=2){
                   setState(() {
                    current++;
                  });
                   
                }
                  }
               
              },
              onStepCancel: (){
                if(current!= 0){
                       setState(() {
                    current--;
                  });
                }
              },
              ),
              SizedBox(height: 172,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 34),/////////////////////////////////////////////////////////////////////////////////////////////////////////
                child: mybouton(color: Colors.orangeAccent, txtname:'Suivant', onTap: (){
                  if(key.currentState!.validate() && key2.currentState!.validate() && key3.currentState!.validate()){
              addUser();      
              addUser2();
         Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> google(widget.nmbr2, controller.text, controller2.text) ));                  
                  }
                },),
              )
            
            ],
          ),
        ),
      ),
    );
  }
}