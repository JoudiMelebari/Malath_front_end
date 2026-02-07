import 'package:flutter/material.dart';
import 'package:front_end/widgets/CustomTextField.dart';
import 'package:front_end/widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl, // ✅ RTL
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end, // ✅ من اليمين
            children: [
              const SizedBox(height: 80),

              const Center(
                child: Text(
                  'أهلًا بك',
                  style: TextStyle(
                    fontSize: 28,
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 60),

              // ===== البريد =====
              const Text("البريد الإلكتروني", style: TextStyle(fontSize: 16)),
              const SizedBox(height: 8),

              CustomTextField(
                hintText: 'أدخل بريدك الإلكتروني',
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
              ),

              const SizedBox(height: 20),

              // ===== كلمة المرور =====
              const Text("كلمة المرور", style: TextStyle(fontSize: 16)),
              const SizedBox(height: 8),

              CustomTextField(
                hintText: 'أدخل كلمة المرور',
                obscureText: true,
                controller: passwordController,
              ),

              const SizedBox(height: 40),

              // ===== زر الدخول =====
              CustomButton(
                text: 'تسجيل الدخول',
                onPressed: () {
                  // هنا تضيفين تسجيل الدخول
                },
              ),

              const Spacer(),

              // ===== التسجيل =====
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "ليس لديك حساب؟ ",
                      style: TextStyle(fontSize: 16),
                    ),
                    GestureDetector(
                      onTap: () {
                        // ينقله على صفحة التسجيل
                        Navigator.pushReplacementNamed(context, '/signup');
                      },
                      child: const Text(
                        "إنشاء حساب",
                        style: TextStyle(
                          color: Color(0xFF4C5494),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
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
