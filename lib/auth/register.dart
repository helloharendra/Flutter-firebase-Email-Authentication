
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_demo/home_screen.dart';
import 'package:flutter/material.dart';

class RegisterSecreen extends StatefulWidget {
  const RegisterSecreen({super.key});

  @override
  State<RegisterSecreen> createState() => _RegisterSecreenState();
}

class _RegisterSecreenState extends State<RegisterSecreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  void registerUser()async{
    try {
  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: emailController.text.trim(),
    password: passwordController.text.trim(),
  );
} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    print('The password provided is too weak.');
  } else if (e.code == 'email-already-in-use') {
    print('The account already exists for that email.');
  }
} catch (e) {
  print(e);
}
  }

  // void registerUser() async {
  //   User? currentUser;
  //   await firebaseAuth
  //       .createUserWithEmailAndPassword(
  //     email: emailController.text.trim(),
  //     password: passwordController.text.trim(),
  //   ).then((auth) {
  //     currentUser = auth.user;
  //   }).catchError((error) {
  //     Navigator.pop(context);
  //   });
  //   if (currentUser != null) {
  //     saveDataToFireStore(currentUser!).then((value) {
  //       Navigator.pop(context);
  //       Navigator.push(
  //           context, MaterialPageRoute(builder: (context) => const HomeScreen()));
  //     });
  //   }
  // }

  Future saveDataToFireStore(User currentUser) async {
    FirebaseFirestore.instance.collection('users').doc(currentUser.uid).set({
      "userUID": currentUser.uid,
      "UserEmail": currentUser.email,
    });
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
                  registerUser();
                },
                child: const Text('Register'))
          ],
        ));
  }
}
