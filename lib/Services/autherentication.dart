import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  //for storing data in cloud firestore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //for authentication
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> signUpUser(
      {required String username,
      required String email,
      required String password,
      required String confirmPassword}) async {
    String res = "Some error Occurred";
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // for adding user to the cloud firestore
      await _firestore.collection("user").doc(credential.user!.uid).set({
        'name': username,
        "email": email,
        'uid': credential.user!.uid,
        //
      });
      res = "Success";
    } catch (e) {
      print(e.toString());
    }
    return res;
  }
}
