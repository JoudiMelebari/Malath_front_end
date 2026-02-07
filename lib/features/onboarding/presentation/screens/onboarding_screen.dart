import 'package:flutter/material.dart';
import 'package:front_end/widgets/custom_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentPage = 0;

  late PageController _controller;

  final List<Map<String, dynamic>> pages = [
    {
      "title": "مرحبًا بك في ملاذ",
      "desc":
          "مساعدك القانوني الذكي باللغة العربية لمساعدتك على فهم مشكلاتك القانونية والحصول على الإرشادات الصحيحة.",
      "buttonText": "التالي",
      "image": "assets/images/onboarding1.png",
    },
    {
      "title": "كيف تريد إدخال قضيتك؟",
      "desc": "اختر الطريقة الأنسب لك لتزويد ملاذ بتفاصيل القضية.",
      "buttonText": "التالي",
      "image": "assets/images/onboarding2.png",
    },
    {
      "title": "خصوصيتك أولويتنا",
      "desc":
          "كل المعلومات التي تشاركها مع ملاذ تبقى سرية وآمنة، ولن يتم مشاركتها مع أي جهة خارجية.",
      "buttonText": "ابدأ الآن →",
      "image": "assets/images/onboarding3.png",
    },
  ];

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // ===== الصفحات =====
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: pages.length,
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  final page = pages[index];

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(page["image"], height: 250),

                        const SizedBox(height: 40),

                        Text(
                          page["title"],
                          style: const TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF4C5494),
                          ),
                          textAlign: TextAlign.center,
                        ),

                        const SizedBox(height: 20),

                        Text(
                          page["desc"],
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // ===== المؤشرات =====
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                pages.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  height: 10,
                  width: currentPage == index ? 20 : 10,
                  decoration: BoxDecoration(
                    color:
                        currentPage == index
                            ? const Color(0xFF4C5494)
                            : const Color(0xFF4C5494).withOpacity(0.3),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // ===== زر التالي =====
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: CustomButton(
                text: pages[currentPage]["buttonText"],
                onPressed: () {
                  if (currentPage == pages.length - 1) {
                    Navigator.pushReplacementNamed(context, '/login');
                  } else {
                    _controller.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
