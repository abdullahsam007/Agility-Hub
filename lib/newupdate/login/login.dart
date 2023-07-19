import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:women_lose_weight_flutter/newupdate/login/RegisterScreen.dart';
import 'package:women_lose_weight_flutter/newupdate/login/forget.dart';
import 'package:women_lose_weight_flutter/newupdate/login/otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:women_lose_weight_flutter/store/home.dart';
import 'package:women_lose_weight_flutter/store/login_scrreen.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool? _success;
  String? _userEmail;
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
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
                  width: MediaQuery.of(context).size.width*.6,
                  padding: const EdgeInsets.only(top: 250),
                  child: Column(
                    children: [

                      SizedBox(height: 10,),
                      Text('Agility Hub',
                        style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: 22,
                        fontWeight: FontWeight.w400
                        ),)
                    ],
                  ),
                ),
                SizedBox(height: 30,),
                Text('PASSWORD AUTHENTICATION',
                  style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w700
                  ),),
                SizedBox(height: 5,),
                Text('ENTER YOUR PASSWORD AND LOGIN BELOW',
                  style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400
                  ),),
                SizedBox(height: 20,),
                Container(
                  width:  MediaQuery.of(context).size.width/1.2,
                  child: Column(
                    children: [
                      Container(
                        width:  MediaQuery.of(context).size.width/1.2,
                        height: MediaQuery.of(context).size.width/8,
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
                              fontWeight: FontWeight.w400
                          ),
                          decoration: InputDecoration(
                            hintText: 'LOGIN NAME',
                            hintStyle: GoogleFonts.roboto(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10)
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        width:  MediaQuery.of(context).size.width/1.2,
                        height: MediaQuery.of(context).size.width/8,
                        child: TextFormField(
                          obscureText: true,
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
                              fontWeight: FontWeight.w400
                          ),
                          decoration: InputDecoration(
                            hintText: 'PASSWORD',
                            hintStyle: GoogleFonts.roboto(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10)
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Align(
                        alignment: Alignment.topRight,
                        child: InkWell(

                          onTap: (){
                            setState(() {
                              if (_formKey.currentState!.validate()) {
                                _signInWithEmailAndPassword();
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
                              child: Text('SIGN IN',
                                style: GoogleFonts.roboto(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700
                                ),),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    _success == null
                        ? ''
                        : (_success!
                        ? 'Successfully signed in ' + _userEmail!
                        : 'Sign in failed'),
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                TextButton(
                  onPressed: (){
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context)=>RegisterScreen()));
                  },
                  child:Text(
                    'CREATE ACCOUNT',
                    style: GoogleFonts.roboto(
                        decoration: TextDecoration.underline,
                        color: Color.fromRGBO(190, 224, 225, 1),
                        fontSize: 14,
                        fontWeight: FontWeight.w400
                    ),),)
                // ...serverWidgets


              ],
            ),
          ),
        ),
      ),
    );

  }

  void _signInWithEmailAndPassword() async {
    final User? user = (await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    )).user;

    if (user != null) {
      setState(() {
        Navigator.pushNamed(context, '/home');
        _success = true;
        _userEmail = user.email;
      });
    } else {
      setState(() {
        _success = false;
      });
    }
  }

}
class YourApp extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return  FirebaseAuth.instance.currentUser != null ? HomeScreenStore() : LoginScreen1();
    }
  }