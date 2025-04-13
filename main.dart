// 4K Prime Flutter App (WebView + Google Sign-In + Google Play Billing)

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() {
  runApp(PrimeApp());
}

class PrimeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '4K Prime',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: SignInScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;

  void _login() async {
    try {
      final user = await _googleSignIn.signIn();
      if (user != null) {
        setState(() => _user = user);
        // TODO: Check for Google Play Billing subscription here
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => WebViewScreen()),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: _login,
          child: Text('Sign in with Google'),
        ),
      ),
    );
  }
}

class WebViewScreen extends StatelessWidget {
  final String websiteUrl = 'https://sites.google.com/view/4kprime/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("4K Prime")),
      body: WebView(
        initialUrl: websiteUrl,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}

// TODO:
// 1. Integrate Google Play Billing plugin for subscription check
// 2. Block access to WebView unless subscription is active
// 3. Setup Firebase project and add Google Services JSON
// 4. Configure Play Console with ₹50/month auto-renew plan
