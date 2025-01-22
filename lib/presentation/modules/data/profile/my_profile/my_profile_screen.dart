import 'package:fastlink_app/presentation/utils/colors.dart';
import 'package:fastlink_app/presentation/utils/strings.dart';
import 'package:fastlink_app/presentation/utils/styles/text_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 30.h),
        child: Column(
          children: [
            Container(
              width: 340.w,
              height: 82.h,
              //width: 335.w,
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(10),
                ///////////////////Correct-Shadow-Effect////////////////
                boxShadow: [
                  BoxShadow(
                    color: Colors.black
                        .withOpacity(0.1), // Slightly dark, neutral gray shadow
                    spreadRadius: 2, // Increases the size of the shadow
                    blurRadius: 5, // Makes the shadow softer
                    offset: Offset(0, 3), // Moves the shadow slightly downwards
                  ),
                ],
                ///////////////////Correct-Shadow-Effect////////////////
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: Row(
                  children: [
                    
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.primary,
                          width: 1.0,
                        ),
                      ),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          GestureDetector(
                            onTap: () {
                              // Navigate to the profile screen
                              // Get.put(ProfileController());
                              // Get.to(() => ProfileScreen());
                            },
                            child: ClipOval(
                              child: Image.network(
                                kUrl,
                                fit: BoxFit.cover,
                                width: 49,
                                height: 49,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom:
                                3, // Adjust the position of the orange container
                            right: -5,
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                color: AppColors.primary,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppColors.primary,
                                  width: 1.0,
                                ),
                              ),
                              child: Icon(
                                Icons.camera_alt,
                                size: 12,
                                color: AppColors.whiteColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                        
                    Gap(20.w),
                    Padding(
                      padding: EdgeInsets.only(top: 10.h),
                      child: NameAndPhoneNumber(
                        name: 'Rachael Abigeal',
                        phoneNumber: '08123456789',
                      ),
                    )
                  ],
                ),
              ),
            ),
            Gap(80.h),
          ///////////////Double-Text-Widget-Container////////////////
            Container(
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(10),
                 ///////////////////Correct-Shadow-Effect////////////////
                boxShadow: [
                  BoxShadow(
                    color: Colors.black
                        .withOpacity(0.1), // Slightly dark, neutral gray shadow
                    spreadRadius: 2, // Increases the size of the shadow
                    blurRadius: 5, // Makes the shadow softer
                    offset: Offset(0, 3), // Moves the shadow slightly downwards
                  ),
                ],
                ///////////////////Correct-Shadow-Effect////////////////
              ),
              child: Column(
                children: [
                  DoubleText(
                    firstText: 'Full Name',
                    secondText: 'Rachael Abigeal',
                    ),
                     DoubleText(
                    firstText: 'Mobile Number',
                    secondText: '08123456789',
                    ),
                     DoubleText(
                    firstText: 'Email',
                    secondText: 'rachaelabigael@mail.com',
                    ),
                    Gap(10.h),
                ]
            ),
            )
          
          ],
        ),
      ),
    );
  }
}


// Reusable Widget
class DoubleText extends StatelessWidget {
  final String firstText;
  final String secondText;

  const DoubleText({
    Key? key,
    required this.firstText,
    required this.secondText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: 25.0.w, right: 15.w, top: 15.h, bottom: 7.h),
      child: Row(
       
        children: [
          Expanded(
            child: Text(
              firstText,
              style: AppText.fBTextBlackSmall,
            ),
          ),

          Text(
              secondText,
              style: AppText.fbTextLightGreyW500S10,
            ),
         
        ],
      ),
    );
  }
}


class NameAndPhoneNumber extends StatelessWidget {
  final String name;
  final String phoneNumber;
  NameAndPhoneNumber(
      {required this.name, required this.phoneNumber, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(name,
            //'Rachael Abigeal',
            style: AppText.blackTextW600S20),
        Gap(5.h),
        Text(phoneNumber,
            //'+234 812 345 6789',
            style: AppText.fBTextBlackSmall),
      ],
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'dart:io';
// import 'profile_controller.dart';

// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // Initialize my controller
//     final ProfileController controller = Get.put(ProfileController());

//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: true,
//       ),
//       body: _profileBody(controller),
//     );
//   }
// }

// Widget _profileBody(ProfileController controller) {
//   return SingleChildScrollView(
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         // CircleAvatar to display the image
//         Obx(() => CircleAvatar(
//               radius: 60,
//               backgroundColor: Colors.grey[200],
//               backgroundImage: controller.selectedImagePath.value.isNotEmpty
//                   ? FileImage(File(controller.selectedImagePath.value))
//                   : AssetImage('assets/profile_placeholder.png')
//                       as ImageProvider, // Placeholder image
//             )),
//         SizedBox(height: 20),
//         // Button to trigger image picking
//         ElevatedButton(
//           onPressed: () {
//             controller.pickImage(); // Call the image picker function
//           },
//           child: Text('Pick Image'),
//         ),
//       ],
//     ),
//   );
// }
