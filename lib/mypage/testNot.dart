import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:googleapis/servicecontrol/v1.dart' as servicecontrol;

class AestNot extends StatefulWidget {
  const AestNot({super.key});

  @override
  State<AestNot> createState() => _AestNotState();
}

class _AestNotState extends State<AestNot> {
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
   sendNotificatio(String deviceToken, BuildContext context, String tripID) async{
     final String serverKey = await  getAccessToken();
     print("####################################################");
     print(serverKey);
     String CloudMessaging = 'https://fcm.googleapis.com/v1/projects/appflutter-5db73/messages:send';
  }
  void initState(){
    //getToken();
    
      getAccessToken();
      
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}