



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/auth/presentation/login_screen.dart';
import 'package:frontend/widgets/wave_clipper.dart';

import '../../widgets/custom_text_filed.dart';

class ResetPasswordScreen  extends  StatefulWidget {
   const ResetPasswordScreen ({super.key});

   @override
  State<StatefulWidget> createState() => _ResetPasswordScreen();

}

class _ResetPasswordScreen extends State<ResetPasswordScreen>{

  final TextEditingController _lastPasswordController=TextEditingController();
  final TextEditingController _NewPassWordController=TextEditingController();
  final TextEditingController _exceptPasswordController=TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.white,
       body: SafeArea(child:Column(
         children: [
           ClipPath(
             clipper: WaveClipper(),
             child: Container(
               height: 260,
               width: double.infinity,
               decoration: BoxDecoration(
                 gradient: LinearGradient(
                   begin: Alignment.topLeft,
                   end:Alignment.bottomRight,
                     colors: [
                     Color(0xFF9C4DFF),
                   Color(0xFF7040D9),
                 ]
                 ),
               ),
               child: Padding(
                 padding: EdgeInsets.only(bottom: 40),

                child: Stack(

                  children: [
                    Positioned(
                        left:0,
                        top: 8,

                        child: IconButton(
                          onPressed: (){

                          },
                          icon: Icon(Icons.arrow_back,
                          color:Colors.white),

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
                              shape:BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.spa,
                              color:Colors.white,
                              size:22
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

           const SizedBox(height: 14,),

           CustomTextField(
             hintText: "Nhập Mật khẩu cũ",
             autoFocus: true,
             controller: _lastPasswordController,
             icon: Icons.lock_open,
           ),

           const SizedBox(height: 14,),

           CustomTextField(
             hintText: "Nhập Mật Khẩu mới",
             autoFocus: true,
             controller: _NewPassWordController,
             icon: Icons.lock_outline,

           ),

           const SizedBox(height: 14,),

           CustomTextField(
             hintText: "Nhập lại để xác nhận",
             autoFocus: true,
             controller: _exceptPasswordController,
             icon: Icons.lock_reset,
           ),

         ],
       )
       ),

        bottomNavigationBar: SafeArea(child:
            Padding(padding:EdgeInsets.symmetric(vertical: 14,horizontal: 14),

            child: ElevatedButton(onPressed: (){

              Navigator.pushAndRemoveUntil(context, 
                  MaterialPageRoute(builder: (builder) => LoginScreen()),

                  (route) => false); // là xóa bỏ các trang củ


            },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF9C4DFF),
                  shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)
                  )
                ),
                child: Text("Xác Nhận", style: TextStyle(
                    color:Colors.white,
                    fontSize: 24,
                  fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.center,

                )

            ),

            )
       ),

    );

  }
}