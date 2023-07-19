import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController __fullnamecontroller = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool? _success;
  String? _userEmail;
  @override
  void dispose() {
    _emailController.dispose();
    __fullnamecontroller.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 84, 101, 1),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * .6,
                  padding: const EdgeInsets.only(top: 250),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Agility Hub',
                        style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: Column(
                    children: [
                      // Container(
                      //   width: MediaQuery.of(context).size.width / 1.2,
                      //   height: MediaQuery.of(context).size.width / 8,
                      //   child: TextFormField(
                      //     validator: (value) {
                      //       if (value!.isEmpty) {
                      //         return 'Please enter some text';
                      //       }
                      //       return null;
                      //     },
                      //     controller: __fullnamecontroller,
                      //     textAlign: TextAlign.justify,
                      //     cursorColor: Colors.black,
                      //     style: GoogleFonts.roboto(
                      //         color: Colors.black,
                      //         fontSize: 14,
                      //         fontWeight: FontWeight.w400),
                      //     decoration: InputDecoration(
                      //       hintText: 'FULL NAME',
                      //       hintStyle: GoogleFonts.roboto(
                      //           color: Colors.black,
                      //           fontSize: 14,
                      //           fontWeight: FontWeight.w400),
                      //       filled: true,
                      //       fillColor: Colors.white,
                      //       border: OutlineInputBorder(
                      //           borderSide: BorderSide.none,
                      //           borderRadius: BorderRadius.circular(10)),
                      //     ),
                      //   ),
                      // ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        height: MediaQuery.of(context).size.width / 8,
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          controller: _emailController,
                          textAlign: TextAlign.justify,
                          cursorColor: Colors.black,
                          style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                          decoration: InputDecoration(
                            hintText: 'EMAIL',
                            hintStyle: GoogleFonts.roboto(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        height: MediaQuery.of(context).size.width / 8,
                        child: TextFormField(

                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          controller: _passwordController,
                          textAlign: TextAlign.justify,
                          cursorColor: Colors.black,
                          style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                          decoration: InputDecoration(
                            hintText: 'Password',
                            hintStyle: GoogleFonts.roboto(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),


                      Align(
                        alignment: Alignment.topRight,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              if (_formKey.currentState!.validate()) {
                                _register();
                              }
                            });

                          },
                          child: Container(
                            width: 207,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black,
                            ),
                            child: Center(
                              child: Text(
                                'REGISTER',
                                style: GoogleFonts.roboto(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(_success == null
                            ? ''
                            : (_success!
                            ? 'Successfully registered ' + _userEmail!
                            : 'Registration failed')),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.2,
                  height: 120,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'ALREADY HAVE\nACCOUNT?',
                        style: GoogleFonts.roboto(
                            decoration: TextDecoration.underline,
                            color: Color.fromRGBO(190, 224, 225, 1),
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        },
                        child: Text(
                          'SIGN IN',
                          style: GoogleFonts.roboto(
                              decoration: TextDecoration.underline,
                              color: Color.fromRGBO(190, 224, 225, 1),
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _register() async {
    final User? user = (await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: _emailController.text,

      password: _passwordController.text,
    ))
        .user;
    if (user != null) {
      setState(() {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => LoginScreen()));
        _success = true;
        _userEmail = user.email;
      });
    } else {
      setState(() {
        _success = true;
      });
    }
  }
 
}
