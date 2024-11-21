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

import 'package:fastlink_app/presentation/modules/home/home_page.dart';
import 'package:fastlink_app/presentation/utils/styles/color.dart';
import 'package:fastlink_app/presentation/utils/styles/text_size.dart';
import 'package:fastlink_app/presentation/widgets/spacer.dart';
import 'package:fastlink_app/resources/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the controller
    final ProfileController controller = Get.put(ProfileController());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: Center(child: _profileBody(controller)),
    );
  }
}

Widget _profileBody(ProfileController controller) {
  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Stack to place the plus icon near the CircleAvatar
          Stack(
            alignment: Alignment.center,
            children: [
              // CircleAvatar to display the image
              Obx(() => CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.grey[200],
                    backgroundImage: controller.selectedImagePath.value.isNotEmpty
                        ? FileImage(File(controller.selectedImagePath.value))
                        : AssetImage('assets/profile_placeholder.png')
                            as ImageProvider,
                  )),
              // Positioned Plus Icon near or below the CircleAvatar
              Positioned(
                bottom: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () {
                    controller.pickImage();
                  },
                  child: Icon(
                    Icons.add,
                    color: Colors.grey[700],
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Text(
            'Hi, Rachael',
            style: FBText.fBTextBlackBold,
          ),
          verticalSpace(30),
          Container(
            width: 340,
            decoration: BoxDecoration(
              color: FBColors.whiteColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                  ImageTextArrowRow(
                    image: Assets.images.write.image(),
                    text: 'Transaction History',
                    onTap: (){},
                    ),
      
                    ImageTextArrowRow(
                    image: Assets.images.password.image(),
                    text: 'Saved Cards',
                    onTap: (){},
                    )
            ],),
          ), 
          verticalSpace(40),
               Container(
            width: 340,
            decoration: BoxDecoration(
              color: FBColors.whiteColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment(-0.4, 0.0),
                  child: Text('ACCOUNT SETTINGS',
                  style: FBText.fBTextBlackBoldMiddMedium,
                  ),
                ),
                  ImageTextArrowRow(
                    image: Assets.images.write.image(),
                    text: 'Login Settings',
                    onTap: (){},
                    ),
                  
                    ImageTextArrowRow(
                    image: Assets.images.password.image(),
                    text: 'Transaction PIN',
                    onTap: (){},
                    ),
                    
            ],),
          ), 
          verticalSpace(30),
                      Container(
                        width: double.infinity,
                        height: 40,
                        decoration:  BoxDecoration(
              color: FBColors.whiteColor,
              borderRadius: BorderRadius.circular(20),
            ),
                        child: Center(
                          child: CustomTextButton(text: 'Log out',
                          color: FBColors.blackColor,
                          onTap: (){},
                          ),
                        ),
                      ),
        ],
      ),
    ),
  );
}





// Reusable Widget
class ImageTextArrowRow extends StatelessWidget {
  final Widget image; 
  final String text; 
   final VoidCallback onTap;

  const ImageTextArrowRow({
    Key? key,
    required this.image, 
    required this.text,   
     required this.onTap,   
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,     
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                  horizontalSpace(35),
                image,
                horizontalSpace(15),
                Text(
                  text,
                  style: FBText.fBTextBlackBoldMiddMedium
                ),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 16, 
              color: Colors.black,  
            ),
        
          ],
        ),
      ),
    );
  }
}
