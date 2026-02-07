import 'package:flutter/material.dart';
import 'package:front_end/widgets/CustomTextField.dart';
import 'package:front_end/widgets/custom_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl, // ✅ RTL لكل الصفحة
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end, // النصوص من اليمين
                children: [
                  const SizedBox(height: 50),
                  const Center(
                    child: Text(
                      'انشاء حساب جديد',
                      style: TextStyle(
                        fontSize: 24,
                        color: Color(0xFF4C5494),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),

                  // الاسم
                  const Text("الاسم الكامل", style: TextStyle(fontSize: 16)),
                  const SizedBox(height: 8),
                  CustomTextField(
                    hintText: 'ادخل اسمك الكامل',
                    controller: nameController,
                    keyboardType: TextInputType.name,
                  ),
                  const SizedBox(height: 16),

                  // رقم الجوال
                  const Text("رقم الجوال", style: TextStyle(fontSize: 16)),
                  const SizedBox(height: 8),
                  CustomTextField(
                    hintText: 'ادخل رقم جوالك',
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: 16),

                  // البريد الالكتروني
                  const Text(
                    "البريد الالكتروني",
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  CustomTextField(
                    hintText: 'ادخل بريدك الالكتروني',
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 16),

                  // كلمة المرور
                  const Text("كلمة المرور", style: TextStyle(fontSize: 16)),
                  const SizedBox(height: 8),
                  CustomTextField(
                    hintText: 'ادخل كلمة المرور',
                    obscureText: true,
                    controller: passwordController,
                  ),
                  const SizedBox(height: 48),

                  // زر التسجيل
                  CustomButton(
                    text: 'تسجيل',
                    onPressed: () {
                      // هنا تضيفين كود التسجيل
                    },
                  ),

                  const SizedBox(height: 30),

                  // الشروط والأحكام
                  Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        style: TextStyle(
                          color: Color(0xFF818898),
                          fontSize: 14,
                        ),
                        children: [
                          TextSpan(text: 'بالتسجيل، أنت توافق على \n'),
                          TextSpan(
                            text: 'الشروط والأحكام',
                            style: TextStyle(
                              color: Color(0xFF4C5494),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(text: ' و '),
                          TextSpan(
                            text: 'سياسة الخصوصية',
                            style: TextStyle(
                              color: Color(0xFF4C5494),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // تسجيل الدخول
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "هل لديك حساب بالفعل؟ ",
                          style: TextStyle(
                            color: Color(0xFF818898),
                            fontSize: 16,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(context, '/login');
                          },
                          child: const Text(
                            "تسجيل الدخول",
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
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
