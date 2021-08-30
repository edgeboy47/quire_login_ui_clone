import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      //TODO: Error handling
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  Future<UserCredential?> signInWithGoogle() async {
    // Trigger the authentication flow
    final googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    if (googleUser != null) {
      final googleAuth = await googleUser.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      final userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      await addUserToDatabase(
        userID: userCredential.user!.uid,
        email: userCredential.user!.email!,
        displayName: userCredential.user!.displayName!,
        photoURL: userCredential.user!.photoURL,
      );

      return userCredential;
    }

    return null;
  }

  Future<void> signOut() async {
    final googleSignIn = GoogleSignIn();
    if (await googleSignIn.isSignedIn()) {
      await googleSignIn.signOut();
    } else if (FirebaseAuth.instance.currentUser != null) {
      await FirebaseAuth.instance.signOut();
    }
  }

  Future<void> addUserToDatabase({
    required String userID,
    required String email,
    required String displayName,
    String? photoURL,
  }) async {
    await FirebaseFirestore.instance.collection('users').doc(userID).set({
      'userID': userID,
      'email': email,
      'name': displayName,
      'photoURL': photoURL,
    });
  }

  Future<void> signUpWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await addUserToDatabase(
        displayName: name,
        email: email,
        userID: FirebaseAuth.instance.currentUser!.uid,
      );
    } on FirebaseAuthException catch (e) {
      //TODO: Error handling
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      //TODO: Implement password reset
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } catch (e) {
      //TODO: Error handling
      print(e);
    }
  }

  Future<void> confirmPasswordReset(String code, String newPassword) async {
    try {
      await FirebaseAuth.instance.confirmPasswordReset(
        code: code,
        newPassword: newPassword,
      );
    } catch (e) {
      //TODO: Error handling
      print(e);
    }
  }
}
