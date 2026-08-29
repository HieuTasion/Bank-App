import 'package:flutter/material.dart';
import 'package:frontend/auth/presentation/login_screen.dart';
import 'package:frontend/widgets/wave_clipper.dart';
import 'package:frontend/widgets/custom_text_filed.dart';


class ResgiterScreen extends StatefulWidget {
  const ResgiterScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ResgiterScreenState();


}

class _ResgiterScreenState extends State<ResgiterScreen> {

  final usernameControler=TextEditingController();
  final useremailControler=TextEditingController();
  final userpasswordControler=TextEditingController();
  final userAplyPasswordControler=TextEditingController();
  bool _obscurePassword=true;

  @override
  void dispose(){
    usernameControler.dispose();
    userpasswordControler.dispose();
    useremailControler.dispose();
    userAplyPasswordControler.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {

   return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child:Column(

            children: [
              ClipPath(
                clipper: WaveClipper(),
                child: Container(
                  height: 260,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                     gradient: LinearGradient(
                       begin:Alignment.topLeft,
                       end:Alignment.bottomRight,
                       colors:[
                         Color(0xFF9C4DFF),
                         Color(0xFF7040D9),
                       ],

                     )
                  ),
                  child: Padding(padding: const EdgeInsets.only(bottom: 40),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 8,
                          left: 0,
                          child: IconButton(onPressed: (){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder) => LoginScreen()));
                          },
                          icon:const Icon(
                            Icons.arrow_back,
                            color:Colors.white,
                          )
                          ),
                        ),
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 44,
                                width: 44,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.15),
                                  shape:BoxShape.circle
                                ),
                                child: const Icon(
                                  Icons.spa,
                                  color:Colors.white,
                                  size:22,
                                ),
                              ),
                              const SizedBox(height: 10,),

                              const Text(
                                "You can esily sign up",
                                style: TextStyle(
                                  color:Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize:24,
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

              Expanded(
                  child:Padding(padding:
                   const EdgeInsets.symmetric(horizontal: 24),
                    child:SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(height:10),
                          CustomTextField(controller: usernameControler,
                              hintText: "User name",
                              icon: Icons.person,
                              obscureText: false
                          ),
                          const SizedBox(height: 15,),
                          CustomTextField(controller: useremailControler
                              , hintText: "User email",
                              icon: Icons.email,
                              obscureText: false
                          ),

                          const SizedBox(height: 15,),
                          CustomTextField(controller: userpasswordControler
                              , hintText: "you password",
                               obscureText: _obscurePassword,
                              icon:Icons.lock,
                              suffixIcon: IconButton(onPressed:
                              (){
                                setState(() {
                                  _obscurePassword=!_obscurePassword;
                                });
                              }
                              , icon: Icon(
                                    _obscurePassword ? Icons.visibility_off
                                        : Icons.visibility,
                                    size: 20,
                                    color:Colors.grey
                                  )
                              )

                          ),
                          const SizedBox(height: 15,),
                          CustomTextField(controller: userAplyPasswordControler
                              , hintText: "Repeat Password",
                              obscureText: _obscurePassword,
                              icon:Icons.lock,
                              suffixIcon: IconButton(onPressed:
                                  (){
                                setState(() {
                                  _obscurePassword=!_obscurePassword;
                                });
                              }
                                  , icon: Icon(
                                      _obscurePassword ? Icons.visibility_off
                                          : Icons.visibility,
                                      size: 20,
                                      color:Colors.grey
                                  )
                              )

                          ),

                          const SizedBox(height: 15,),

                          Row(
                            children: [
                              Expanded(child:
                              ElevatedButton(onPressed: (){
                                 Navigator.pop(context,
                                     MaterialPageRoute(builder: (builder)
                                     => LoginScreen() ));
                              },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFF8145DD),
                                      foregroundColor: Colors.white,
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10)
                                      )
                                  ), child: const Text("Register",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14
                                    ),
                                  ))


                              )

                            ],

                          )

                        ],
                      ),
                    )
                  ) ,
              ),
            ],
          )

       ),
   );

  }

}






