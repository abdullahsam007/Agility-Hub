import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OTPSCREEN extends StatefulWidget {
  const OTPSCREEN({Key? key}) : super(key: key);

  @override
  State<OTPSCREEN> createState() => _OTPSCREENState();
}

class _OTPSCREENState extends State<OTPSCREEN> {
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
                    Image.asset('assets/images/logo.png',),
                    SizedBox(height: 10,),
                    Align(
                        alignment: Alignment.topRight,
                        child: Text('VERSION 33(4.2)',
                          style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w400
                          ),))
                  ],
                ),
              ),
              SizedBox(height: 30,),
              Text('ENTER OTP',
                style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w700
                ),),
              SizedBox(height: 5,),
              Text('ENTER THE ONE TIME PASSWORD YOUR RECEIVED',
                style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400
                ),
              ),

              SizedBox(height: 20,),
              Container(
                width:  MediaQuery.of(context).size.width/1.2,
                height: MediaQuery.of(context).size.width/8,
                child: TextField(
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.justify,

                  cursorColor: Colors.black,
                  style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight:FontWeight.w400
                  ),
                  decoration: InputDecoration(
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
              InkWell(
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
                    child: Text('VERIFY',
                      style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700
                      ),),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              InkWell(
                onTap: (){

                },
                child: Container(
                  width: 207,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromRGBO(190, 224, 225, 1),
                  ),
                  child: Center(
                    child: Text('RESEND',
                      style: GoogleFonts.roboto(
                          color:Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w700
                      ),),
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
