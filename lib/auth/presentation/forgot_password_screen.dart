

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/auth/presentation/login_screen.dart';
import 'package:frontend/auth/presentation/otp_screen.dart';
import 'package:frontend/widgets/custom_text_filed.dart';
import 'package:frontend/widgets/wave_clipper.dart';

class ForgotPassword extends StatefulWidget{
    const ForgotPassword ({super.key});

   @override
  State<ForgotPassword> createState() => _ForgotPassword();

}

class _ForgotPassword extends State<ForgotPassword>{
  final _emailornumberControler=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Mat Mat Khau",
      showPerformanceOverlay: false,

      home: Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(child:
            Column(
              children: [



                ClipPath(

                  clipper: WaveClipper(),
                  child: Container(
                    height: 260,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight
                          ,colors: [
                            Color(0xFF9C4DFF),
                            Color(0xFF7040D9)
                      ])
                    ),

                    child: Padding(padding:
                      const EdgeInsets.only(bottom: 40
                      ),

                      child: Stack(
                        children: [

                          Positioned(
                              left: 0,
                              top: 8,


                              child: IconButton(onPressed: (){
                                Navigator.pop(context
                                 );
                              }

                                  , icon: Icon(
                                    Icons.arrow_back,
                                    color:Colors.white
                                  )
                              )
                          ),



                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 44,
                                  width: 44,
                                  decoration: BoxDecoration(
                                    color:Colors.white.withOpacity(0.15),
                                    shape: BoxShape.circle
                                  ),
                                  child: Icon(
                                    Icons.spa,
                                    color:Colors.white,
                                    size: 22,
                                  ),
                                ),
                                const SizedBox(height: 14,),
                                
                                const Text("You enter you number or password",
                                style: TextStyle(
                                  color:Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold
                                ),)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),

                  ),

                ),

                const SizedBox(height: 14,),

                Expanded(


                    child: Padding(padding:
                      const EdgeInsets.all(24),

                      child: Column(
                        children: [
                          CustomTextField(

                            controller: _emailornumberControler,
                            hintText: "Enter your email or phone number",
                            icon:Icons.email,
                            autoFocus: true,

                          ),

                         const Spacer(),

                          SizedBox(
                            height: 45,
                            width: double.infinity,
                            child: ElevatedButton(onPressed: (){
                              Navigator.push(context,
                              MaterialPageRoute(builder: (builder) => OtpScreen())
                              );
                            },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF8145DD),
                                  foregroundColor: Colors.white,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40)

                                  )

                                ),
                                child: Text("Send",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14
                                  ),
                                ),
                            )

                            ,)
                        ],
                      ),
                    ),
                )

              ],


            ),



          ),

      ),

    );
  }

}