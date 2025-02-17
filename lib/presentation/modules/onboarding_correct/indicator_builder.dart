import 'package:flutter/material.dart';

class IndicatorBuilder {
  final int activePage;
  final int totalPages;
  final String activeColor;
  final Color inactiveColor;

  IndicatorBuilder({
    required this.activePage,
    required this.totalPages,
    this.activeColor = '#E0371D',
    this.inactiveColor = const Color(0xFF2AFA4),
  });

  List<Widget> get buildIndicator {
    return List.generate(
      totalPages,
      (index) => activePage == index ? _indicatorsTrue() : _indicatorsFalse(),
    );
  }

  Widget _indicatorsTrue() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 10,
      width: 10,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: hexToColor(activeColor),
      ),
    );
  }

  Widget _indicatorsFalse() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 8,
      width: 8,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: inactiveColor,
      ),
    );
  }
}

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex));

  return Color(int.parse(hex.substring(1), radix: 16) +
      (hex.length == 7 ? 0xFF000000 : 0x00000000));
}
