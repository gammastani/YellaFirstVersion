import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
class AuthService {
  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);

    // Check if a user is already signed in
    final GoogleSignInAccount? currentGoogleUser = googleSignIn.currentUser;

    // If a user is signed in, sign them out to allow account selection
    if (currentGoogleUser != null) {
      await googleSignIn.signOut();
    }

    // Trigger the authentication flow with account selection
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    if (googleUser == null) {
      // User canceled the sign-in process
      return Future.error('Sign-in process was canceled.');
    }

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );


    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}