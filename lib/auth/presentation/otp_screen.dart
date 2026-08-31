import "dart:async";
import 'package:flutter/material.dart';
import "package:frontend/auth/presentation/ResetPasswordScreen.dart";
import "package:frontend/widgets/wave_clipper.dart";
import "package:pinput/pinput.dart";

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController _pinController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  // Quản lý bộ đếm ngược
  Timer? _timer;
  int _start = 60;
  bool _canRefresh = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    setState(() {
      _start = 60;
      _canRefresh = false;
    });
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start == 0) {
        setState(() {
          _canRefresh = true;
          timer.cancel();
        });
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pinController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 60,
      textStyle: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        border: Border.all(color: Colors.blue, width: 2),
      ),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: Colors.blue.shade50,
        border: Border.all(color: Colors.blue.shade200),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header Clipper
              ClipPath(
                clipper: WaveClipper(),
                child: Container(
                  height: 260,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF9C4DFF),
                        Color(0xFF7040D9),
                      ],
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 8,
                        child: IconButton(
                          onPressed: () => Navigator.of(context).pop(),
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 44,
                              height: 44,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.15),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.spa,
                                color: Colors.white,
                                size: 22,
                              ),
                            ),
                            const SizedBox(height: 14),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),


              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Xác nhận mã OTP',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color:Colors.black
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Mã xác thực đã được gửi đến số điện thoại của bạn',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 32),


                    Pinput(
                      length: 6,
                      controller: _pinController,
                      focusNode: _focusNode,
                      defaultPinTheme: defaultPinTheme,
                      focusedPinTheme: focusedPinTheme,
                      submittedPinTheme: submittedPinTheme,
                      onCompleted: (pin) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Xác thực thành công với mã: $pin'),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 32),


                    _canRefresh
                        ? TextButton(
                      onPressed: () {
                        _startTimer();

                      },
                      child: const Text(
                        'Gửi lại mã OTP',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )
                        : Text(
                      'Gửi lại mã sau: ${_start.toString().padLeft(2, '0')}s',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),


            ],
          ),
        ),
      ),

      bottomNavigationBar: SafeArea(child: Padding(
          padding:EdgeInsets.symmetric(vertical: 12,horizontal: 12),
        child: ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (bulider)=> ResetPasswordScreen()));
        },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF9C4DFF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              )
            )
        , child: Text("Xác nhận",style:
              TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white
              )
              ,)),

      ),

      ),
    );
  }
}