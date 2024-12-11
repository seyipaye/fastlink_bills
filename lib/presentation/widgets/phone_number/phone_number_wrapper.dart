import 'package:fastlink_app/presentation/utils/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../resources/assets.gen.dart';
import '../../modules/airtime/buy_airtime/buy_airtime_controller.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../app_text_form_field.dart';
import 'phone_wrapper_controller.dart';

class PhoneNumberWrapper extends StatelessWidget {
  const PhoneNumberWrapper({
    super.key,
    required this.child,
    required this.topBoxHeight,
  });

  final Widget child;
  final double topBoxHeight;

  @override
  Widget build(BuildContext context) {
    return GetX<PhoneWrapperController>(
      init: PhoneWrapperController(),
      builder: (controller) {
        return Stack(
          children: [
            Positioned.fill(
              child: Column(
                children: [
                  Container(
                    height: topBoxHeight,
                    padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: NetworkSelector(),
                  ),
                  Expanded(child: child),
                ],
              ),
            ),
            if (controller.overlay.value != null)
              Positioned(
                top: topBoxHeight,
                left: 0,
                right: 0,
                bottom: 0,
                child: Column(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          controller.clearOverlay();
                          ;
                        },
                        child: Container(
                          color: AppColors.offset,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            if (controller.overlay.value != null)
              Positioned(
                top: topBoxHeight,
                left: 0,
                right: 0,
                child: (controller.overlay.value == AppOverlay.network)
                    ? NetworkOverlay()
                    : SizedBox(),
              )
          ],
        );
      },
    );
  }
}

class NetworkOverlay extends GetWidget<PhoneWrapperController> {
  NetworkOverlay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OverlayContainer(
      child: Obx(
        () => Column(
          children: [
            _buildItem(
              value: MobileNetwork.mtn,
              groupValue: controller.selectedNetwork.value,
              onTap: controller.onNetworkItemTap,
            ),
            _buildItem(
              value: MobileNetwork.airtel,
              groupValue: controller.selectedNetwork.value,
              onTap: controller.onNetworkItemTap,
            ),
            _buildItem(
              value: MobileNetwork.glo,
              groupValue: controller.selectedNetwork.value,
              onTap: controller.onNetworkItemTap,
            ),
            _buildItem(
              value: MobileNetwork.nineMobile,
              groupValue: controller.selectedNetwork.value,
              onTap: controller.onNetworkItemTap,
            ),
          ],
        ),
      ),
    );
  }

  ListTile _buildItem({
    required final MobileNetwork value,
    required final MobileNetwork groupValue,
    required final ValueChanged<MobileNetwork> onTap,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 28),
      dense: true,
      leading: Image.asset(value.imagePath, width: 26, height: 26),
      // Assets.images.mtnLogo.image(width: 26, height: 26),
      title: Text(
        value.displayName,
        style: TextStyle(
          fontFamily: kRaleway500,
        ),
      ),
      trailing: CupertinoRadio<MobileNetwork>(
        activeColor: AppColors.primary,
        value: value,
        groupValue: groupValue,
        onChanged: (_) => onTap(value),
      ),
      onTap: () => onTap(value),
    );
  }
}

class OverlayContainer extends StatelessWidget {
  OverlayContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Material(
        color: Colors.transparent,
        clipBehavior: Clip.antiAlias,
        child: child,
      ),
    );
  }
}

//A widget for selecting network.
class NetworkSelector extends GetView<PhoneWrapperController> {
  const NetworkSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GetX<PhoneWrapperController>(
          builder: (_) {
            return IconButton(
              onPressed: controller.onNetworkPressed,
              icon: Row(
                children: [
                  Image.asset(
                    controller.selectedNetwork.value.imagePath,
                    width: 32,
                    height: 32,
                  ),
                  // Icon(
                  //   Icons.import_contacts,
                  // ),
                  gap8,
                  Assets.icons.downIcon.svg(),
                ],
              ),
            );
          },
        ),
        gap8,
        Expanded(
          child: AppTextFormField(
            // textEditingController: controller.emailText,
            // label: 'Email Address',
            autofillHints: [AutofillHints.telephoneNumber],
            hintText: 'Enter Phone Number e.g 081X',
            // onSaved: (val) => controller.email = val!.trim(),
            // validator: Validator.isNotEmpty,
          ),
        ),
      ],
    );
  }
}
