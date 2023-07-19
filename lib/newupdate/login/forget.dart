import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 84, 161, 1),
      body: SingleChildScrollView(
        child: Center(
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
              Text('SET YOUR PASSWORD',
                style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w700
                ),),
              SizedBox(height: 5,),
              Text('SET YOUR PASSWORD FOR YOUR LOGIN BELOW',
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
                      child: TextField(
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
                    Container(
                      width:  MediaQuery.of(context).size.width/1.2,
                      height: MediaQuery.of(context).size.width/8,
                      child: TextField(
                        textAlign: TextAlign.justify,
                        cursorColor: Colors.black,
                        style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400
                        ),
                        decoration: InputDecoration(
                          hintText: 'CONFIRM PASSWORD',
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
                        },
                        child: Container(
                          width: 207,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black,
                          ),
                          child: Center(
                            child: Text('SET PASSWORD',
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




            ],
          ),
        ),
      ),
    );
  }
}
