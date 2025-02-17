import 'package:fastlink_app/presentation/modules/auth/login/login_screen.dart';
import 'package:fastlink_app/presentation/modules/home/home_page.dart';
import 'package:fastlink_app/presentation/modules/onboarding_correct/onboarding_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}



class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();

  go(BuildContext context) {}
}
class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

  int _activePage = 0;

  void onNextPage(BuildContext context) {
    if (_activePage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastEaseInToSlowEaseOut,
      );
    } else {
      // Navigate to CategorySelectionScreen if on the last page
      Get.to(() =>  HomePage());
    }
  }

  final List<Map<String, dynamic>> _pages = [
    {
      'titleOne': 'Welcome to Fastlink Bills',
      'image': 'assets/images/onboard_1.png',
      'description':
      "Your one-stop app to manage bills, buy data and airtime, and stay connected with Fastlink WiFi.",
      'next': false
    },
    {
      'titleOne': 'Fastlink WiFi Integration',
      'image': 'assets/images/onboard_2.png',
      'description':
      "Link your Fastlink WiFi account for seamless satellite data management.",
      'next': false
    },
    {
      'titleOne': 'Earn with Referrals',
      'image': 'assets/images/onboard_3.png',
      'description':
      "Invite friends and earn bonuses for every successful transaction.",
      'next': true
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _pages.length,
            scrollBehavior: AppScrollBehavior(),
            onPageChanged: (int page) {
              setState(() {
                _activePage = page; // Update active page dynamically
              });
            },
            itemBuilder: (BuildContext context, int index) {
              return OnboardingWidget(
                titleOne: _pages[index]['titleOne'],
                description: _pages[index]['description'],
                image: _pages[index]['image'],
                next: _pages[index]['next'],
                onTab: () => onNextPage(context), // Pass the callback here
                activePage: _activePage, // Pass activePage to OnboardingWidget
                totalPages:
                    _pages.length, // Pass totalPages to OnboardingWidget
              );
            },
          ),
        ],
      ),
    );
  }
}



///////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////Do not touch this code below////////////////////////////////////////////////////////////////

//   List<Widget> _buildIndicator() {
//     final indicators = <Widget>[];

//     for (var i = 0; i < _pages.length; i++) {
//       if (_activePage == i) {
//         indicators.add(_indicatorsTrue());
//       } else {
//         indicators.add(_indicatorsFalse());
//       }
//     }
//     return indicators;
//   }

//   Widget _indicatorsTrue() {
//     final String color;
//     if (_activePage == 0) {
//       color = '#2539ED';
//     } else if (_activePage == 1) {
//       color = '#2539ED';
//     } else {
//       color = '#2539ED';
//     }

//     return AnimatedContainer(
//       duration: const Duration(microseconds: 300),
//       height: 10,
//       width: 10,
//       margin: const EdgeInsets.only(right: 8),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(50),
//         color: hexToColor(color),
//       ),
//     );
//   }

//   Widget _indicatorsFalse() {
//     return AnimatedContainer(
//       duration: const Duration(microseconds: 300),
//       height: 8,
//       width: 8,
//       margin: const EdgeInsets.only(right: 8),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(5),
//         color: const Color(0xFFE0E0E0),
//       ),
//     );
//   }
// }



///////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////Do not touch this code above////////////////////////////////////////////////////////////////