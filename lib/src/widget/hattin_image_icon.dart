import 'package:flutter/material.dart';

class HattinImageIcon extends StatelessWidget {
  final String path;
  const HattinImageIcon({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
      fit: BoxFit.cover,
    );
  }
}

class ImagePath {
  static String get logo => "asset/image/hattin_logo.png";
  static String get dialog => "asset/image/dialog_icon.png";
  static String get homeOn => "asset/image/bottom_nav_home_on.png";
  static String get homeOff => "asset/image/bottom_nav_home_off.png";
  static String get routinOn => "asset/image/bottom_nav_routin_on.png";
  static String get routinOff => "asset/image/bottom_nav_routin_off.png";
  static String get feedOn => "asset/image/bottom_nav_feed_on.png";
  static String get feedOff => "asset/image/bottom_nav_feed_off.png";
  static String get mypageOn => "asset/image/bottom_nav_mypage_on.png";
  static String get mypageOff => "asset/image/bottom_nav_mypage_off.png";
  static String get onboardLogo => "asset/image/onboard_logo.png";
  static String get signupCenter => "asset/image/signup_center.png";
  static String get findEmail => "asset/image/find_email.png";
  static String get love => "asset/image/love.png";
  static String get chat => "asset/image/chat.png";
  static String get share => "asset/image/share.png";
}
