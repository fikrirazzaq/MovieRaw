import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:movies_starter_app/data/auth/auth_api_client.dart';
import 'package:movies_starter_app/data/auth/model/guest_response.dart';
import 'package:movies_starter_app/ui/login/login_body.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const String routeName = '/login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthApiClient _authApiClient = AuthApiClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: Text('Login Guest'),
              onPressed: () async {
                EasyLoading.show(status: 'loading...');

                GuestResponse? response = await _authApiClient.loginAsGuest();
                if (response != null) {
                  if (response.success!) {
                    print('Login Success');
                  }
                } else {
                  print('Login failed');
                }
                EasyLoading.dismiss();
              },
            ),
            ElevatedButton(
              child: Text('Logout'),
              onPressed: () async {
                final FlutterSecureStorage storage = FlutterSecureStorage();
                storage.delete(key: KEY_GUEST_SESSION_ID);
              },
            ),
          ],
        ),
      ),
    );
  }
}
