import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

class token extends StatefulWidget {
  const token({super.key});

  @override
  State<token> createState() => _tokenState();
}

class _tokenState extends State<token> {
  Future<String?> getAccessToken() async {
  try {
    final GoogleSignIn googleSignIn = GoogleSignIn(
      scopes: ['https://www.googleapis.com/auth/firebase.messaging'],
    );
    final GoogleSignInAccount? account = await googleSignIn.signIn();
    final GoogleSignInAuthentication auth = await account!.authentication;
    return auth.accessToken;
  } catch (e) {
    print('Error getting access token: $e');
    return null;
  }
}

Future<void> sendMessage(String accessToken) async {
 try {
    final response = await http.post(
      Uri.parse('https://fcm.googleapis.com/v1/projects/appflutter-5db73/messages:send'),
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      },
      body: '{"message": {"token": "dlet326cRlaQfoL3X_Z2zj:APA91bHkpx7qOqrB3HJEmK3QLBE46LkwLT3B5CTO7gtuUCr1WoZ7H1hNMdk_YO9hMV_B5HQQgz4gEFkPM-1jrMWyJF5g-5wambEi2elTnTKh1PT9sIAqMA8zGhjCx7VtL1XOVAuG1sgA", "notification": {"title": "Hello", "body": "World"}}}',
    );

    if (response.statusCode == 200) {
  print('Message sent successfully');
} else if (response.statusCode == 403) {
  print('Access forbidden: ${response.body}');
} else {
  print('Failed to send message: ${response.body}');
}

  } catch (e) {
    print('Error sending message: $e');
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('FCM Notification'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final accessToken = await getAccessToken();
            print("#################################");
            print(accessToken);
            if (accessToken != null) {
              await sendMessage(accessToken);
            } else {
              print('Failed to get access token');
            }
          },
          child: Text('Send Notification'),
        ),
      ),
    );
  }
}