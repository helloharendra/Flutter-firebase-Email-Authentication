import 'package:firebase_demo/auth/login.dart';
import 'package:firebase_demo/auth/register.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue, Colors.grey],
                  begin: FractionalOffset(0.0, 0.0),
                  end: FractionalOffset(1.0, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp,
                ),
              ),
            ),
            automaticallyImplyLeading:
                false, //removes the default back arrow button from screen
            title: const Text(
              'Auth Demo',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            centerTitle: true,
            bottom: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.lock,
                    color: Colors.white,
                  ),
                  text: ('Login'),
                ),
                Tab(
                  icon: Icon(
                    Icons.lock,
                    color: Colors.white,
                  ),
                  text: ('Register'),
                ),
              ],
              indicatorColor: Colors.white,
              indicatorWeight: 6,
            ),
          ),
          body: const TabBarView(children: [LoginSecreen(), RegisterSecreen()]),
        ),
      ),
    );
  }
}
