
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseFunction{

  static Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );


    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
  static Future<void> signOut() async{
    await FirebaseAuth.instance.signOut();
  }

  static Future<void> login(
      String emailAccount,
      String password,
  {
    required Function onSuccess,
    required Function onError
  }
      ) async{
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailAccount,
          password: password
      );
      if(credential.user!.emailVerified) {
        onSuccess();
      }else{
        onError('Email not verified');
      }

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        onError('No user found for that email.');

      } else if (e.code == 'wrong-password') {
        onError('Wrong password provided for that user.');

      }else{
        onError(e.code);
      }

    } catch (e) {
      onError(e.toString());
    }
  }


 static Future<void> createUser(
     String email,
     String password,
     String name,
     {
       required Function onSuccess,
       required Function onError
     }
     ) async{
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      onSuccess();
      credential.user!.sendEmailVerification();
    } on FirebaseAuthException catch (e) {

      if (e.code == 'weak-password') {
        onError('The password provided is too weak.');

      } else if (e.code == 'email-already-in-use') {
        onError('The account already exists for that email.');

      }else{
        onError(e.code);
      }
    } catch (e) {
      onError(e.toString());
    }
  }
}