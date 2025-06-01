import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:music_app/login.dart';
import 'package:music_app/musichome.dart';

Future<bool> Register({
  required String username,
  required String email,
  required String password,
  required String conformpassword,
  required BuildContext context,
}) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    User? user = userCredential.user;
    await FirebaseFirestore.instance.collection("user").doc(user?.uid).set({
      "username": username,
      "email": email,
    });
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("User Created Successfully")));
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Loginscreen()),
    );
    return true;
  } catch (e) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(e.toString())));
    return false;
  }
}

Future<bool> Login({
  required String email,
  required String password,
  required BuildContext context,
}) async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Login Successfully")));
    Navigator.pushNamed(context, '/musichome');
    return true;
  } catch (e) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(e.toString())));
    return false;
  }
}

Future<bool> forgot({
  required String email,
  required BuildContext context,
}) async {
  try {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Resent email")));
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Loginscreen()),
    );
    return true;
  } catch (e) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(e.toString())));
    return false;
  }
}
