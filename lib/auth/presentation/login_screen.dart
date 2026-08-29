import "package:flutter/material.dart";
import "package:frontend/auth/presentation/forgot_password_screen.dart";
import "package:frontend/auth/presentation/regsiter_screen.dart";
import "package:frontend/widgets/custom_text_filed.dart";
import "package:frontend/widgets/wave_clipper.dart";

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscurePassword = true;
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // header dạng sóng
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
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Stack(
                    children: [

                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 44,
                              width: 44,
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
                            const Text(
                              "Welcome",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                            const SizedBox(height: 6),
                            const Text(
                              "Sign in to continue",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),


            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      CustomTextField(
                        controller: _usernameController,
                        hintText: "Username",
                        icon: Icons.person,
                        obscureText: false,
                      ),
                      const SizedBox(height: 15),
                      CustomTextField(
                        controller: _passwordController,
                        hintText: "Password",
                        icon: Icons.lock,
                        obscureText: _obscurePassword,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                            size: 20,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(context,
                              MaterialPageRoute(builder: (builder) => ResgiterScreen()));

                            },
                            child: const Text(
                              "Don't  have an account Sign Up",
                              style: TextStyle(
                                color: Color(0xFF8246DC),
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),

                          TextButton(
                            onPressed: () {
                              Navigator.push(context, 
                              MaterialPageRoute(builder: (builder)=> ForgotPassword())
                              );
                            },
                            child: const Text(
                              "Forgot Password?",
                              style: TextStyle(
                                color: Color(0xFF8246DC),
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),




                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 48,
                              child: ElevatedButton(
                                onPressed: () {
                                  String name = _usernameController.text;
                                  String password =
                                      _passwordController.text;

                                  // goi api
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF8145DD),
                                  foregroundColor: Colors.white,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: const Text(
                                  "Login",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(width: 12),

                          // nút vân tay bên cạnh
                          InkWell(
                            onTap: () {
                              // TODO: gọi local_auth để xác thực vân tay
                            },
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              height: 48,
                              width: 48,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xFF8145DD)
                                    .withOpacity(0.1),
                                border: Border.all(
                                  color: const Color(0xFF8145DD),
                                  width: 1.2,
                                ),
                              ),
                              child: const Icon(
                                Icons.fingerprint,
                                color: Color(0xFF8145DD),
                                size: 26,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


