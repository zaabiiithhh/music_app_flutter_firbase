import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:music_app/login.dart';
import 'package:music_app/services/authservices.dart';

class Registerscreen extends StatefulWidget {
  const Registerscreen({super.key});

  @override
  State<Registerscreen> createState() => _RegisterscreenState();
}

class _RegisterscreenState extends State<Registerscreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController cpassword = TextEditingController();
  Future<bool> Register({
    required String username,
    required String email,
    required String password,
    required String conformpassword,
    required BuildContext context,
  }) async {
    if (!_formKey.currentState!.validate()) return false;
    setState(() {
      isloading = true;
    });
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

  bool isloading = false;
  bool obsurepassword = true;
  bool obsurepasswordd = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 40),
                const Text(
                  "Sign up",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: TextFormField(
                    validator:
                        (value) =>
                            value == null || value.isEmpty
                                ? "username is required"
                                : null,
                    controller: name,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person, color: Colors.white),
                      hintText: "Username",
                      hintStyle: TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.black,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: TextFormField(
                    validator:
                        (value) =>
                            value == null || value.isEmpty
                                ? "email is required"
                                : null,
                    controller: email,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email, color: Colors.white),
                      hintText: "Enter your email",
                      hintStyle: TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.black,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty)
                        return "Password is requried";
                      if (value.length > 6)
                        return "password was be atleat 6 charactors";
                    },
                    controller: password,
                    style: TextStyle(color: Colors.white),
                    obscureText: obsurepassword,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock, color: Colors.white),
                      suffixIcon: IconButton(
                        onPressed:
                            () => setState(() {
                              obsurepassword = !obsurepassword;
                            }),
                        icon: Icon(
                          obsurepassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.white,
                        ),
                      ),
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.black,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty)
                        return "Password is requried";
                      if (value.length > 6)
                        return "password was be atleat 6 charactors";
                    },
                    controller: cpassword,
                    style: TextStyle(color: Colors.white),
                    obscureText: obsurepasswordd,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock, color: Colors.white),
                      suffixIcon: IconButton(
                        onPressed:
                            () => setState(() {
                              obsurepasswordd = !obsurepasswordd;
                            }),
                        icon: Icon(
                          obsurepasswordd
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.white,
                        ),
                      ),
                      hintText: "Conform password",
                      hintStyle: TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.black,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: SizedBox(
                    height: 40,
                    width: 120,
                    child: ElevatedButton(
                      onPressed: () async {
                        bool success = await Register(
                          username: name.text,
                          email: email.text,
                          password: password.text,
                          conformpassword: cpassword.text,
                          context: context,
                        );
                        if (success) {
                          name.clear();
                          email.clear();
                          password.clear();
                          cpassword.clear();
                        }
                      },
                      child: const Text(
                        "Sign up",
                        style: TextStyle(fontSize: 16),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Loginscreen()),
                    );
                  },
                  child: const Text(
                    "Have an account? Log in",
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
