import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googlesignin/pages/homepage.dart';
import 'package:googlesignin/pages/loginpage.dart';

class AuthService {
  // 1.handleAuthState
  handleAuthState() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          return const HomePage();
        } else {
          return const LoginPage();
        }
      },
    );
  }

  // 2.signInWithGoogle
  signInWithGoogle() async {
    //---trigger the authentication flow
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn(scopes: <String>['email']).signIn();

    // Obtain the auth details from th request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    // create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    // Once signed in , return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  // 3.Sign-out
  signOut() {
    FirebaseAuth.instance.signOut();
  }
}
