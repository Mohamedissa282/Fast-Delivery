import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:googleapis/servicecontrol/v1.dart' as servicecontrol;
class notificqtion extends StatefulWidget {
  const notificqtion({super.key});

  @override
  State<notificqtion> createState() => _notificqtionState();
}

class _notificqtionState extends State<notificqtion> {
  Future<String> getAccessToken() async{
    final serviceAccountJson = {
      
  "type": "service_account",
  "project_id": "appflutter-5db73",
  "private_key_id": "c3f6e3ffdced24b8b059a43c92ef7295449ea700",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQDaeD2WCqqlpfNj\nuQ8N7rKK9mleLXxsAiR+n9GPkEGMFrI9nNu/xVYrp0PdM+Xen1c9oFzOvwsYyeRd\nI2Irr29HVaNpoIpIys1gwhwBWk6IQwHgRDWccCPJOifcO9/68to8W8slfVYETMya\nzMX9GXhlclo9T4fxPA62YpMyXzZ4saihzjsIW23vYMnz50KSfIOvNhwux5Cn07dn\nlnu9PweY8xfbfOHWCRtz+m1EM2Apk5NvAxhvjelU4bHpG484O0MWgqPmk7ZWwcAL\nr8xhO6JwnDilA55AvKkU6FwWG5kVueSg2CBi2hjmaxVg1k8sgQIkJoL3FrfGsCAu\nsOEKTZlTAgMBAAECggEADQSl72dE4lYuILx57mOs8zwsbMIEZ8ry5DIogpEDqlH+\negWNdKnjTGgxrdc2NL9Xhtmjy9Si6kkoYflGJjj5D1cO+q/6YhXmd81XAE1ZYDZD\nHEjx8k6MEjeGuBqI/Ln0o+OvilUjtRiaK7uMLQEmLmTKYaWcgcv3AeXxse7uFaka\nk/+IeytiJ/JAabPS562Mlu8ra0UP7RxcpDcKKmTRtZSyH/QTGj9TfarSQ8OBm7VS\nYRkAyvS9as1OGi8m/tbMV9cAW9S5tMRCZDaX6uqCsuYCk+i4bkEgdQ2edNOT2yT2\nPMBmnsdiScSQqXCnZth5ZDV6r3zwQexr8T7wte8nrQKBgQDuIrc1UwRKy/ifQnJ2\nIJGsKXB2hjY+aKTXoGMjuNlMBHW+30rfBbZWat0FZaZUHEqChdy4Ar4yFs14RYWY\nAhrg8L7QwnrJj15WVLOUKpySJV3l9sXPa2maLDMGRaLsjZYq1us3Mg5tvUlmcPQ0\n3gTLrzZJsCTtYeX71XUqk7EcTQKBgQDq29mcCEsDD6Oln3JCJpEWIb1FRCVSwoh/\nRhmbnwGL3lBLVLUazwC8xrxTXUHbO7wM4Tr3tMlvh27GUmswjqHlQ5LmSfVSg3fK\nKN8FYXqu8GafAkCAX0q0fV+sz9sTizMhEXQvHDiNlNrR8AH2dB74jZOBYiCBM/pi\nTxbr4i3cHwKBgGUMBBOze1HFxWTGzE0FuuqD1v3kK2ZF/xSkMQ06ZbJU/iWVGG8U\nPG/k/o5IuNBeBNvns2W9fDlC5cMQNQTwd7lVTpLEw1d953jYji7j+fYltvdaxEsk\nd/X8pVYW/HBGEB9zfPG54td8B4ZZjbZVM1G+slmITdMQxIcc54++hdvNAoGAR10q\nkHkMog98gHUkuOkTKRBzfLqqRK2L4HCik2ELjT6uU1WX+l9wL+yLiSFLQ5yxFZDS\n5DXxB4y1olmk7IpKs2mHF6bdfocoPSuSKQZnywSNij+a7ecGwjVefxphzVx82s18\n6lu+63aRzz0Iu6SpTIloiuYQTnJG4Nx7cI23ta0CgYAh5gCcJHCydfyH06L8427w\nCQBsWfbBzMiIkWkRNGCvCQZo2uxLhEGEjvNHarkpD7nz/7G/rxZ1LbdztsU1Sf84\nh96JKyWQ9gDB+KVZA8lSzTuF99li+4D8KJ1yp6H/J9+NBEBz3sClJgKwHp6i5IDx\nmDiYrBX5sEBy9r5vKA7+5A==\n-----END PRIVATE KEY-----\n",
  "client_email": "firebase-adminsdk-84bqk@appflutter-5db73.iam.gserviceaccount.com",
  "client_id": "102870874923528835750",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-84bqk%40appflutter-5db73.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"

    };
    List<String> scopes = [
      "https://www.googleapis.com/auth/userinfo.email",
      "https://www.googleapis.com/auth/firebase.database",
      "https://www.googleapis.com/auth/firebase.messaging"
    ];
    http.Client client = await auth.clientViaServiceAccount(
               auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
               scopes
    );
    auth.AccessCredentials credentials = await auth.obtainAccessCredentialsViaServiceAccount(
         auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
         scopes,
         client
    );
    client.close();
    return credentials.accessToken.data;
    
  }
     sendNotificatio() async{
     final String serverAccesseToken = await  getAccessToken();
     print("####################################################");
     print(serverAccesseToken);
    
     String CloudMessaging = 'https://fcm.googleapis.com/v1/projects/appflutter-5db73/messages:send';
     final Map<String, dynamic> message = {
      'message': {
        "token": "fvS4OAWTTH2f07CfkEnPvD:APA91bEmlNp3YxLzelS90kWRmMZ7SGhpZ8_8pYppQvkgCUbsRw6p1EGuRblUVd9Vo1EQkFF55h4BYNiBQRArLwvGrHKKCjNUjQEIfsi2zmoczyZmGzVr_JvphplX-akTXTdIx7lXwuEd",
        'notification' : {
          'title': "Hello",
          'body' :  "Mohamed Essa"
        },
        
      }
     };

     http.Response respone = await http.post(
        Uri.parse(CloudMessaging),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $serverAccesseToken'
        },
        body: jsonEncode(message),
     );
      if (respone.statusCode == 200) {
  print('Message sent successfully');
} else if (respone.statusCode == 403) {
  print('Access forbidden: ${respone.body}');
} else {
  print('Failed to send message: ${respone.body}');
}
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final accessToken = await getAccessToken();
            print("#################################");
            print(accessToken);
        //await    sendMessage('Hello', "Mohamed Issa");
          
          },
          child: Text('Send Notification'),
        ),
      ),
    );
  }
}
sendMessage(title, message) async{
  var headersList = {
 'Accept': '*/*',
 //'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
 'Content-Type': 'application/json',
 'Authorization': 'Bearer ya29.c.c0ASRK0GaNfKH0iPL-iYGlXp-_2b714BG2koEZbeLVFhOk0OX926rFkFarrsyW8dzqnAkQ2O0WDXgavlCnuKJDhT6YN2MrTcEG2BzLFH9V-ynRuurw9KrTEDsivUj5FWnJAwIyGqSBrjUENEi0TZ9UlMobUDUiEHyJJPeCHyFXEFcCJIg82W1FEnHPBqb0WP4W_l4oYIuusL6YYu2kTavszjDWtn5qvwwJmNKcEeUPM2TfYVWhlTsU8p5iAONFBA6yJDTadSSSw4Mvp-1wGV8rfxzWlX7lGktkz_KREC7VfsfAmimrDQGu8V-rWAo8vBfzQaP6hQIWLpLnW0qGy-DpWW3wTsfVKv2iEQw9svWhAilHogxVMpLjYiNsJkgG388DdFdMwfJ75v4fVYjZ60vh3XhwVnUyd_osmZYxBJkn1Mwqz3Mdwhj96IqzQFkk692iuUilOqZh_iIoYwU0W9WQpeoRYBJVi6bzcjYXF60hW2F2d1ueh-uqpIiOpw8-0qxFYaySph4i-hq09ZMI6SrnR3grphzVvlJ_OBgIl6tec4W8ykfwg1gac7takeeWl-tSWMkJnUJo-kIw1Io_JtX7Yr_giop0Or23B0vJyJruJFw8MskIWa_eFk4MmZy759V3YXXvhj6q-Ucb6VqBaSXxa_hb0jBzWygwRfpWt8fbBhk586Qwetsoyc0YyBBc7f6xFq7kIMy0hzRzbeR1h3Q2JcWjl3Ysox6ws1m0Wp-fpX7Zitf2nYwerdcw8ZWR3gugjyxQyuO9QiSRcFkRJSB_Xz49_S8u3gIM2SqylW-ScI0vOdfY-V4F8xs4cmjbwqVmgrO8onv8_vBl0pof4qdIYulxtonB7Fc70yd0UUwWlBO6W2e-ddXa2Q3tjVqvI7nFF7tgdMa7uJIBvBwQOez6qMmvUBnM-2y7V586aSQq996BOFp8R3whwbMbpu1gbbkwq-krssxoXR1O_ynbfOpo5omq_BoIj1itXfSWsozobIFOeen59SgkMX' 
};
var url = Uri.parse('https://fcm.googleapis.com/v1/projects/appflutter-5db73/messages:send');

var body = {
   "message":{
      "token":"cZAdb9TcR2KpxLOItDBBO-:APA91bG8p1t1LymshmUzYUvLM-VMH9A02FizajFZEfgmgJGmIxVd-DlEBNnr_6LZLyq689sSE_bO64sxd6ybkT3VzelwjUq37C-FUklRjCnkL2VkgypHIWNcGxOHRNhdA0T7Gph-Iizi",
      "notification":{
        "body":message,
        "title":title
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


  

  
 

  