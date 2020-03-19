import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Icon(
                    Icons.track_changes,
                    size: 80,
                    color: Color(0xFF4767EB),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 50),
                  child: TextFormField(
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 20,
                      ),
                      hintText: 'Email',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFF3F5FA),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFF3F5FA),
                        ),
                      ),
                      filled: true,
                      fillColor: Color(0xFFF3F5FA),
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      errorStyle: TextStyle(
                        fontSize: 14,
                        color: Colors.redAccent,
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == '') {
                        return 'This field is required.';
                      }
                      // if (!RegExp(
                      //         r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@vitstudent.ac.in")
                      //     .hasMatch(value)) {
                      //   return 'Please enter a valid VIT gmail id.';
                      // }
                    },
                    onSaved: (value) {
                      // _credentials['email'] = value;
                    },
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 50),
                  child: TextFormField(
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                    obscureText: true,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 20,
                      ),
                      hintText: 'Password',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFF3F5FA),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFF3F5FA),
                        ),
                      ),
                      filled: true,
                      fillColor: Color(0xFFF3F5FA),
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      errorStyle: TextStyle(
                        fontSize: 14,
                        color: Colors.redAccent,
                      ),
                    ),
                    validator: (value) {
                      if (value == '') {
                        return 'This field is required.';
                      }
                      if (!RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@vitstudent.ac.in")
                          .hasMatch(value)) {
                        return 'Please enter a valid VIT gmail id.';
                      }
                    },
                    onSaved: (value) {
                      // _credentials['email'] = value;
                    },
                  ),
                ),
                SizedBox(
                  height: 30,
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
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(
                          //     builder: (ctx) => LoginScreen(),
                          //   ),
                          // );
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
                  height: 30,
                ),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xFF4767EB),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Color(0xFF4767EB),
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
