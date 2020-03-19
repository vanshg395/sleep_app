import 'package:flutter/material.dart';

import './signup_screen.dart';
import './login_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 100,
              ),
              Hero(
                tag: 'logo',
                child: Icon(
                  Icons.track_changes,
                  size: 80,
                  color: Color(0xFF4767EB),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Sleep App',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 40,
                ),
              ),
              SizedBox(
                height: 70,
              ),
              Text(
                'A Complete\nSleep Tracking Solution',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 120,
              ),
              Hero(
                tag: 'loginButton',
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 50),
                  height: 50,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color(0xFF6A9FF8),
                      Color(0xFF4767EB),
                    ]),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Material(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3),
                      // side: BorderSide(color: borderColor),
                    ),
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(3),
                      // onTap: onPressed,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => LoginScreen(),
                          ),
                        );
                      },
                      child: Center(
                        child: Text(
                          'LOGIN',
                          // title.toUpperCase(),
                          style: TextStyle(
                            letterSpacing: 2,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Hero(
                tag: 'signupButton',
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 50),
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Material(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3),
                      side: BorderSide(
                        color: Color(0xFF4767EB),
                      ),
                    ),
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(3),
                      // onTap: onPressed,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => SignupScreen(),
                          ),
                        );
                      },
                      child: Center(
                        child: Text(
                          'SIGN UP',
                          // title.toUpperCase(),
                          style: TextStyle(
                            letterSpacing: 2,
                            fontSize: 18,
                            color: Color(0xFF4767EB),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
