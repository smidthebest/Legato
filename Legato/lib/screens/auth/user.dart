import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class User extends StatefulWidget {
  _User createState() => _User();
}

class _User extends State<User> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final Firestore firestore = Firestore.instance;
  initState() {
    super.initState();
  }

  Widget build(BuildContext context) {}

  Future<List<String>> signInWithGoogle() async {
    List<String> fields = [];
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final AuthResult authResult = await _auth.signInWithCredential(credential);
    final FirebaseUser user = authResult.user;

    fields.add(user.displayName.toString());
    fields
        .add(user.providerData[user.providerData.length - 1].email.toString());
    fields.add(user.photoUrl.toString());
    fields.add(user.uid.toString());

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);

    return fields;
  }

  void signOut() async {
    try {
      await googleSignIn.signOut();
    } catch (e) {
      print("Google: " + e.toString());
    }
    try {
      await _auth.signOut();
    } catch (e) {
      print(e);
    }

    print("User Sign Out");
  }

  signInWithEmail(BuildContext context, String email, String password) {
    FirebaseUser fbUser;
    try {
      _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        fbUser = value.user;
        var doc =
            await firestore.collection("users").document(fbUser.uid).get();
        UserModel user = Provider.of<UserModel>(context, listen: false);
        user.uid = fbUser.uid;
        print("x: " + fbUser.uid + "  " + doc.documentID);
        user.email = doc.data["email"];
        user.profilePicture = doc.data["pfpUrl"];
        user.username = doc.data["username"];
        user.printFields();
      }).catchError((onError) {
        // dialog(context, onError.message, false);
      });
    } catch (e) {
      print("hello " + e.toString());
    }
  }

  signUpWithEmailAndPassword(
      String email, String password, String user, BuildContext context) {
    try {
      _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        UserModel userModel = Provider.of<UserModel>(context, listen: false);
        userModel.username = user;
        userModel.uid = value.user.uid;
        userModel.email = email;
        userModel.profilePicture = "src";
      }).catchError((error) {
        // dialog(context, error.message, true);
      });
    } catch (e) {
      print("hello" + e.toString());
    }
  }
}
