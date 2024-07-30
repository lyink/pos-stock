import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore
import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Auth
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _retypePasswordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String? _photoBase64;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'images/signup.jpg', // Ensure this path is correct
              fit: BoxFit.cover,
            ),
          ),
          // Content
          SafeArea(
            child: Container(
              margin: EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _header(context),
                  _inputFields(context),
                  _loginInfo(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _header(BuildContext context) {
    return Column(
      children: [
        Text(
          "Create Account",
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.white, // Ensure text is visible on background
          ),
        ),
        Text(
          "Enter details to get started",
          style: TextStyle(
            color: Colors.white70, // Ensure text is visible on background
          ),
        ),
      ],
    );
  }

  Widget _inputFields(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (_photoBase64 != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Image.memory(
              base64Decode(_photoBase64!),
              height: 150,
              width: 150,
            ),
          ),
        TextField(
          controller: _emailController,
          decoration: InputDecoration(
            hintText: "Email",
            fillColor: Colors.white.withOpacity(
                0.8), // Slightly transparent for better readability
            filled: true,
            prefixIcon: Icon(Icons.email_outlined),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        const SizedBox(height: 20), // Increased spacing
        TextField(
          controller: _passwordController,
          decoration: InputDecoration(
            hintText: "Password",
            fillColor: Colors.white.withOpacity(
                0.8), // Slightly transparent for better readability
            filled: true,
            prefixIcon: Icon(Icons.password_outlined),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
          ),
          obscureText: true,
        ),
        const SizedBox(height: 20), // Increased spacing
        TextField(
          controller: _retypePasswordController,
          decoration: InputDecoration(
            hintText: "Retype Password",
            fillColor: Colors.white.withOpacity(
                0.8), // Slightly transparent for better readability
            filled: true,
            prefixIcon: Icon(Icons.password_outlined),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
          ),
          obscureText: true,
        ),
        const SizedBox(height: 20), // Increased spacing
        ElevatedButton(
          onPressed: () async {
            await _signUp();
          },
          child: Text(
            "Sign Up",
            style: TextStyle(fontSize: 20),
          ),
          style: ElevatedButton.styleFrom(
            shape: StadiumBorder(),
            padding: EdgeInsets.symmetric(vertical: 16),
          ),
        ),
      ],
    );
  }

  Future<void> _signUp() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final retypePassword = _retypePasswordController.text.trim();

    if (password != retypePassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Passwords do not match")),
      );
      return;
    }

    try {
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Store user information in Firestore
      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'email': email,
        'created_at': Timestamp.now(),
        'photoBase64': _photoBase64 ?? '',
        // Add other user information as needed
      });

      // Handle user sign-up success
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("User signed up successfully")),
      );
      // Clear text fields
      _emailController.clear();
      _passwordController.clear();
      _retypePasswordController.clear();
      // Optionally navigate to another page or perform other actions
    } catch (e) {
      // Handle sign-up error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    }
  }

  Widget _loginInfo(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Already have an account?", style: TextStyle(color: Colors.white)),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/login'); // Navigate to login page
          },
          child: Text("Login", style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
