import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

// 상태 변하지 않으므로 StatelessWidget 으로 생성
// stless 입력하고 엔터치면 됨!!
class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Instagram Clon',
              style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.all(50.0),
            ),
            SignInButton(
              Buttons.Google, onPressed: () {
              },
            )
          ],
        ),
      ),
    );
  }
}
