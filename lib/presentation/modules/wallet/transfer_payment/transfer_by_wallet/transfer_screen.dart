import 'package:fastlink_app/presentation/modules/fund_wallet/bank_transfer/account_display/transfer_controller.dart';
import 'package:fastlink_app/presentation/utils/styles/color.dart';
import 'package:fastlink_app/presentation/utils/styles/fb_button.dart';
import 'package:fastlink_app/presentation/utils/styles/text_size.dart';
import 'package:fastlink_app/presentation/widgets/spacer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';

class TransferScreen extends GetView<TransferController> {
  const TransferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FBColors.whiteColor,
      appBar: AppBar(
        title: Text('Fund Wallet by Transfer'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Account Details',
                style: FBText.fBTextOrangeBigMedium,
              ),
              verticalSpace(10),
              Text(
                  'Fund your Wallet by making a direct transfer to the account details below.'),
              verticalSpace(50),
              Column(
                children: [
                  TransferDetailsWidget(
                    firstText: 'Account Number:',
                    secondText: '0123456789',
                    showIcon: true,
                  ),
                  verticalSpace(5),
                  TransferDetailsWidget(
                    firstText: 'Account Name:',
                    secondText: 'FASTLINK-Rachael',
                    showIcon: false,
                  ),
                  verticalSpace(5),
                  TransferDetailsWidget(
                    firstText: 'Bank Name:',
                    secondText: 'GTB',
                    showIcon: false,
                  ),
                  verticalSpace(5),
                  TransferDetailsWidget(
                    firstText: 'Fee:',
                    secondText: 'Free',
                    showIcon: false,
                  ),
                ],
              ),
              verticalSpace(320),
              SizedBox(
                width: 340,
                height: 50,
                child: FBButton(
                  title: 'I’ve sent the money',
                  textColor: FBColors.whiteColor,
                  color: FBColors.orangeColor,
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class TransferDetailsWidget extends StatelessWidget {
//   final String firstText;
//   final String secondText;
//   final bool showIcon;

//   TransferDetailsWidget({
//     required this.firstText,
//     required this.secondText,
//     this.showIcon = false,
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Text(
//           firstText,
//           style: FBText.fbLightBlactText,
//         ),
//         horizontalSpace(20),
//         Text(
//           secondText,
//           style: FBText.fbLightBlactText,
//         ),
//         if (showIcon)
//           Padding(
//             padding: const EdgeInsets.only(left: 8.0),
//             child: GestureDetector(
//               onTap: () {
//                 Clipboard.setData(ClipboardData(text: secondText));
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(content: Text("Copied to clipboard!")),
//                 );
//               },
//               child: Icon(
//                 Icons.copy,
//                 color: FBColors.orangeColor,
//               ),
//             ),
//           ),
//       ],
//     );
//   }
// }

class TransferDetailsWidget extends StatelessWidget {
  final String firstText;
  final String secondText;
  final bool showIcon;

  TransferDetailsWidget({
    required this.firstText,
    required this.secondText,
    this.showIcon = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          firstText,
          style: FBText.fbLightBlactText,
        ),
        horizontalSpace(50),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Text(
              secondText,
              style: FBText.fBTextBlackBoldMidMedium16,
            ),
          ),
        ),
        if (showIcon)
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: GestureDetector(
              onTap: () {
                Clipboard.setData(ClipboardData(text: secondText,
                
                ));
                _showCustomCopyDialog();
              },
              child: Icon(
                Icons.copy,
                color: FBColors.orangeColor,
              ),
            ),
          ),
      ],
    );
  }

  void _showCustomCopyDialog() {
    Get.defaultDialog(
      barrierDismissible: false,
      title: "",
      content: Container(
        width: 320,
        height: 220,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              child: Transform.translate(
                offset: Offset(-100, 0.0), 
                child: IconButton(
                  icon: Icon(Icons.close, color: Colors.black),
                  onPressed: () => Get.back(),
                ),
              ),
            ),

            //  Align(
            //    child: IconButton(
            //         icon: Icon(Icons.close, color: Colors.black),
            //         onPressed: () => Get.back(),
            //       ),
            //  ),
            Text("Account Number copied to clipboard",
                style: FBText.fBTextBlackSmall),
                verticalSpace(10),
            SizedBox(
              width: 250,
              height: 48,
              child: FBButton(
                title: 'Okay',
                color: FBColors.orangeColor,
                textColor: FBColors.whiteColor,
                onTap: () => Get.back(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
