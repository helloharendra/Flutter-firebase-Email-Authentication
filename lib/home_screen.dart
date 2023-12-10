import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_demo/auth/auth_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
          home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("HomeScreen"),
        ),
        drawer: Drawer(
          backgroundColor: Colors.grey,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const CircleAvatar(
                backgroundColor: Colors.white,
                radius: 70,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AuthScreen()));
                  },
                  child: const Text('Sign out'))
            ],
          ),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AuthScreen()));
            },
            child: const Text('Sign out'),
          ),
        ),
      )),
    );
  }
}
