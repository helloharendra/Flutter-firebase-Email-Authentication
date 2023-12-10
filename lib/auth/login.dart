import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_demo/home_screen.dart';
import 'package:flutter/material.dart';

class LoginSecreen extends StatefulWidget {
  const LoginSecreen({super.key});

  @override
  State<LoginSecreen> createState() => _LoginSecreenState();
}

class _LoginSecreenState extends State<LoginSecreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  loginUser() async {
    User? currentUser;
    await firebaseAuth
        .signInWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    )
        .then((auth) {
      currentUser = auth.user!;
    }).catchError((error) {
      Navigator.pop(context);

    });
    if (currentUser != null) {
      // ignore: use_build_context_synchronously
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    hintText: 'Email',
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    fillColor: Colors.black,
                    hintText: 'Password',
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  loginUser();
                },
                child: const Text('Login'))
          ],
        ));
  }
}
