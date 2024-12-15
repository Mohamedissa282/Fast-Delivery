import 'dart:async';
import 'dart:convert';
import 'package:appflutter/generated/l10n.dart';
import 'package:appflutter/login/login.dart';
import 'package:appflutter/mypage/listTile.dart';
import 'package:appflutter/mypage/mybouton.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class google extends StatefulWidget {
  final String number2;
  final String number;
  final String number1;

 
google(this. number2, this.number, this.number1);

  @override
  State<google> createState() => _googleState();
}

class _googleState extends State<google> {
  GoogleMapController? controller;
 CameraPosition cameraPosition = CameraPosition(target: LatLng(17.242465, -15.663790), zoom: 18);
 
 
  StreamSubscription<Position>? positionStream ;
  Position? currentPosition;
 
  List <Marker> markers= [
    
  ];
  /*Future<void> getAdresse(Position position) async{
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark place = placemarks[0];
      setState(() {
        country = place.country ?? 'Unknown';
        street = place.locality ?? 'Unknown';
      });
    }catch (e){
      print("Erreur :$e");
    }
  }*/
  getCurrentPosition() async{
    bool serviceEnabled;
     LocationPermission permission;
     
     
     serviceEnabled = await Geolocator.isLocationServiceEnabled();
     if(! serviceEnabled){
        print("Not enable");
        return ;
     }
     permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
          permission = await Geolocator.requestPermission();
          if (permission == LocationPermission.denied) {
             return Future.error('Erreur!');
    }
  
  }
    if(permission == LocationPermission.whileInUse){
      
   positionStream = Geolocator.getPositionStream().listen(
    (Position? position) async{
      
      markers.add(Marker(markerId: MarkerId(widget.number2), position: LatLng(position!.latitude, position.longitude)));
      controller!.animateCamera(CameraUpdate.newLatLng(LatLng(position.latitude, position.longitude)));
       
        setState(() {
          currentPosition = position;
          print("############################################");
          print(currentPosition!.latitude);
           print(currentPosition!.longitude);
        });
    });
    
    }
  }
  
  Map<PolylineId, Polyline> polylines = {

  };
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();
  String googleAPiKey = "AIzaSyAkz1DacsVmmBnfQwMPk7BGubYxJm5hLM8";
  /*getToken() async{
    String? myToken = await FirebaseMessaging.instance.getToken();
    print("##########################################");
    print(myToken);
  }*/
  
  @override
  void initState(){
    
   /* getToken();*/
    
      getCurrentPosition();
      
    super.initState();
    
  }
  @override
  void dispose() {
    positionStream!.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: Padding(
        padding:  EdgeInsets.only(left: isArabic() ? 35 : 0),
        child: Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(S.of(context).title23, style: TextStyle(
              color: Colors.white , fontWeight: FontWeight.bold, fontSize: 25
              ),),
                SizedBox(width: isArabic() ? 2 : 6,),
             Text(S.of(context).title24, style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold
              ),),
              
          ],
        ),
      ),
       backgroundColor: Colors.orange[300], centerTitle: true,),
       drawer: Drawer(
        
      backgroundColor: Colors.orangeAccent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                child: Column(
                children: [
                      
                      Image.asset('images/6522516.png', color: Colors.white, width: 100, height: 100,),
                      
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(widget.number, style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17
                        ),),
                        SizedBox(width: 4,),
                        Text(widget.number1, style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17
                        ),),
                        SizedBox(width: 4,),
                        Text('✋',style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17
                        ),)
                      ],
                    )
                  
                ],
              )),
              SizedBox(height: 20,),
              
              Column(
                children: [
                  listTile(icon: Icons.home, txt: S.of(context).title15, onTap: (){
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> google('${widget.number2}','${widget.number}','${widget.number1}')));
                  },),
                  listTile(icon: Icons.info, txt: S.of(context).title16, onTap: (){
                 Navigator.of(context).pushNamed('detail');
             },)
              
                ],
              ),
              
            ],
          ),
          listTile(icon: Icons.logout, txt:S.of(context).title17, margin: EdgeInsets.only(bottom: 40), onTap: () async{
            await FirebaseAuth.instance.signOut();
Navigator.pushNamedAndRemoveUntil(context, 'login', (route)=> false);
    
          },)
        ],
      ),
     ),
      body:  Stack(
        children: [
          Container(
             
            child: Column(
              children: [
                Expanded(
                  child: GoogleMap(
                  onTap: (LatLng latLng) async{
                        List<Placemark> placemarks = await placemarkFromCoordinates(latLng.latitude, latLng.longitude);
                       // print("##############################");
                        //print(placemarks[0].country);
                         //print(placemarks[0].street);
                         // print(placemarks[0].locality);
                          // print(placemarks[0].postalCode);
                          AwesomeDialog(
                        descTextStyle: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17
                        ),
                        btnOkColor: Colors.blue[400],
                        titleTextStyle: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17
                        ),
                     context: context,
                     dialogType: DialogType.infoReverse,
                     animType: AnimType.bottomSlide,
                      title: '${placemarks[0].country}',
                      desc: '${placemarks[0].street}'  '|'           '${placemarks[0].locality}',
                      
                     
                    btnOkOnPress: () {},
                     ).show();
                          
                  },
                  markers: markers.toSet(),
                  initialCameraPosition:cameraPosition, mapType: MapType.normal,
                onMapCreated: (mycontroller){
                 controller=mycontroller;
                },
               
                )),
              
              ],
              
            ),
            
            
            ),
             Positioned(
              bottom: 26,
              left: 41,
              child: mybouton(color: const Color.fromARGB(255, 236, 175, 84), txtname: S.of(context).title25,onTap: () async{
                AwesomeDialog(
                        descTextStyle: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 14
                        ),
                        titleTextStyle: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17
                        ) ,
                        
                        btnOkText:  S.of(context).title6,
                        btnCancelText:  S.of(context).title7,
                        btnOkColor: Colors.orangeAccent,
                        btnCancelColor: Colors.grey,
                     context: context,
                     dialogType: DialogType.noHeader,
                     animType: AnimType.rightSlide,
                      title:  S.of(context).title26,
                      desc:  S.of(context).title27,
                
                     
                    btnOkOnPress: () async{
                        await sendMessageTopic('${S.of(context).T10} : ${widget.number} ${widget.number1}', '${S.of(context).T11}: ${widget.number2}', 'mohamed', '${currentPosition!.latitude}','${currentPosition!.longitude}' );
                           AwesomeDialog(
            context: context,
            dialogType: DialogType.success,
            animType: AnimType.rightSlide,
            title:  S.of(context).title28,
            desc: '${ S.of(context).title29} ${widget.number2} .',
                
            btnOkText: S.of(context).title8,
            btnOkOnPress: () async{
               // await    sendMessage('Hello', '${widget.number2}', 'Mohamed Essa');
               
          Navigator.of(context).pop();
            },
            ).show();
                    },
                    btnCancelOnPress: (){}
                     ).show();
               
              
              },)),
             
              
        ],
      ),
    );
  }
  
  

}

sendMessage(title, message, data) async{
  var headersList = {
 'Accept': '*/*',
 'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
 'Content-Type': 'application/json',
 'Authorization': 'Bearer  ya29.c.c0ASRK0GYletQ7ttclSWsHgjNLVj-m9GWftGY2icmy4ndjZNnXbNz9-LEBgG5IUh5ydcoNcrbN0I_5HPYLjRUVpXGSnA823ytbe_TUEmzMZiR0CZly7t3jx09NQxmawkmb1GQ4EKe1-IYn-5rmZqEAwDKZLltuOmBBsZXbCVBd0Zfi-caNHuOVM0wMTKdbnrRpluGLvil3v68rL6Oe8mqT1M1MBBXUfPfjk0UnUt-QXCnWBUmI51ycO0bwOxIuT54dffGB3cLxcwP1jUKEsuRhU53vLtUff2u8ARsASU6-Y83Ofkobz71tcQV06deMikXJRbGmBQT2nezziOd4N7fKvzj2LzzSJ5rg0rY-g3-X4UxUo3NrLRKWKB5OW3ME388A6oViq611keUIu1kf48yJw9JzMankho5mnci-Ie2dYd-id2jo_wB7eySYZIQxaoSOQ9fx8mr9dvb5ekMnX3B9Ye2hr8v13WnOm5s3uyOzz3OaOrMjag2is_funs4sxZw467tbnh3XWYx-zasgobpUn4hkv-RsnqbQ-8nVRgzBojjs5Bp_ney4wI4IUsgipxJs6M4MJMfWcXV59cZd3B81Ukodu91remjJ3lJSbp4V_0FZ-8_saVc-c4rnrgtZgRxda6leYlst2ryWv_2FwsS65ZavMuOqbyQZddug2Jg0XuRpRfy-m3J1S0QQVivod-jFo2syhYyrYt0JhRr5-e1de7ovnhbhm0es_QQhkoxijOOtrYZ3uxgaew4B8_oRWgh8a76FW4Iik9ch21gmqxi7qU0JendRxiJVFvtUy0bpzYrmpZ2BRQwIVut0UMIMoqjMejbMRlUes0q8mr1vh_S_r5FbBSxsZl-s6I-IjzFk0mIOQx44Fxv1-74VjFMWk_VQ1lm_iuXYXkbe47d6dJeky2kjro8kzgfgccJfwbmBh7_pk-wOp5gp2QWVFoeeFbsQ2Rx_WrZS6IfJfQ7O5eda81Bx1uJnReyQqnF7amrF3Uc-JfQwz4t58d' 
};
var url = Uri.parse('https://fcm.googleapis.com/v1/projects/flutterapp-7962d/messages:send');

var body = {
   "message":{
      "token":"fq9A15yaTTONDrZQ4jsjSR:APA91bEgut1SqgWIueQVGX-rHA7zx7hPLSuykpylXnxAySSTSCTbEUgaU_4B1dhmvyIu7Mr9yE7QLU_8u1kiBzD03sppPKwRRez_MHFyvScJrAwlhFzQsARAoTuhRvjtwD8ZCZ6b0nT9",
      "notification":{
        "body":message,
        "title":title,
        
      },
      "data": {
      "id": data
    }
   }

};

var req = http.Request('POST', url);
req.headers.addAll(headersList);
req.body = json.encode(body);


var res = await req.send();
final resBody = await res.stream.bytesToString();

if (res.statusCode >= 200 && res.statusCode < 300) {
  print(resBody);
}
else {
  print(res.reasonPhrase);
}

}


sendMessageTopic(title, message, tobic, data, data2) async{
  var headersList = {
 'Accept': '*/*',
 'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
 'Content-Type': 'application/json',
 'Authorization': 'Bearer    ya29.c.c0ASRK0GZz6U6b39JVo1xF8jiWhjkHqNYclMmTEKmTk-p-XJgW9pkegaD5Uy4k5Z6IQK3UwfJuJRIrVCmE6kpWKNstlLD0-cjO8seEwDHCnn9YhNebe7nSG_sE5-7WzuBoUDPinsZRfXE_E8kSyKq0bXkCJECdzJgx0NpjdsKEENObUnj6Kbv_XTX9Hj_hNN9qdwZJngiyhv0jckwtJTi88yTSE7yk20pUEhFu8cFH0zBFp4JOoBZMLIqyaQOJzuI9cgZwaN8qRM59h8R6PHeAtQUnswA60erJKmrzQu2FDKUW1eo2habswIYn4PyRmzRrqGd_PzrK2E2eTKvR5TviAwyIrXNBan3zbfUL1bdOKZ18TRAGfL16Q-YFvXMT388De4_s42alYBO4V20k13fbgrFhVffd3bJls9VXcUWgOlp8ybXk1I8xdnqt2_ic-IbubYRd0SJ46316g7gk0vVmmfcyFqgQcVWz9kp73qZh-7mlYeuc26ZgkYw80bVappUx_I-Y_j8QcuM_5M2-4Ulv8vvYr1-pahn1qMkgbS1Mq7aJMh5eY251i3o1S30hW1upMMlFiBv-1nQugQvn38dQQs5Fk25-FVdk2h9dIQtMb1Yu0b8xB8Yk97rnRj46bR3bm1IhemWnWY_jmoSOX6I66QkBRlS8Uv5xbFrpcRq2IBBznzzzw-ukJid35Rrejnv4B5Sa3l17jkmZgvsa1xuR0VfR18nYffaSr2el8r66jfblX2f5noOfMFROs7u0X6eM-3amjui9902YrSymcmX1_YwltmI4XrMd2qU8rYYx0SvBJ9qdnzmwR9sOOSZB9R0Zu_RVkwnlS_-SeXhb7Ye3y5v42-ZmB1wdSd-J_0novOdSn3OnoyyO4IpXsOnJVMUXBn6aajpQS6e72dIOwpR2lk7vaVeiYcWSm-I51z4Vy1II-al2nhQ48wI5WdVlvWpqo375X-SReO3uajWcQ-VfMQwIzMIfJ5vckzBVefB0JUoed3_7u0c8z8' 
};
var url = Uri.parse('https://fcm.googleapis.com/v1/projects/flutterapp-7962d/messages:send');

var body = {
   "message":{
      "topic": tobic,
      "notification":{
        "body":message,
        "title":title
      },
      "data": {
      "id": data,
      "id2": data2
    }
   }
};

var req = http.Request('POST', url);
req.headers.addAll(headersList);
req.body = json.encode(body);


var res = await req.send();
final resBody = await res.stream.bytesToString();

if (res.statusCode >= 200 && res.statusCode < 300) {
  print(resBody);
}
else {
  print(res.reasonPhrase);
}

}