import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:googlesignin/auth_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Column(
        children: [
          //----------------Text-Welcome------------------
          const Center(
            child: const Padding(
              padding: EdgeInsets.only(top: 400.0),
              child: Text(
                'Welcome',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: GestureDetector(
              onTap: (){
                AuthService().signOut();
              },
              child: Container(
                width: 150,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadiusDirectional.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 1,
                      blurRadius: 8,
                      offset: Offset(4, 4),
                    ),
                    BoxShadow(
                      color: Colors.blue,
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: Offset(-4, -4),
                    ),
                  ],
                ),
                child: const Center(
                  child: const Text('Logout',style: TextStyle(color: Colors.black),),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
