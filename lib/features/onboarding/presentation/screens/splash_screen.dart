import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _controller.forward();

    _navigate();
  }

  void _navigate() async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pushReplacementNamed(context, '/onboarding');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const mainColor = Color(0xFF731314);
    const bottomLineColor = Color(0xFF414980);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            /// ===== وسط الصفحة =====
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// اللوقو
                  Image.asset('assets/images/logo.png', width: 160),

                  const SizedBox(height: 40),

                  /// خط التحميل
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: AnimatedBuilder(
                      animation: _controller,
                      builder: (_, __) {
                        return LinearProgressIndicator(
                          value: _controller.value,
                          minHeight: 6,
                          backgroundColor: mainColor.withOpacity(
                            0.41,
                          ), // الجزء المتبقي
                          valueColor: const AlwaysStoppedAnimation(
                            mainColor,
                          ), // الجزء المكتمل
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            /// ===== الخط السفلي =====
            Container(
              height: 4,
              width: double.infinity,
              color: bottomLineColor,
            ),
          ],
        ),
      ),
    );
  }
}
