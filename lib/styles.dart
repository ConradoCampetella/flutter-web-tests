import 'package:flutter/material.dart';

class AppColors {
  static final Color primaryColor = hexToColor('ff8f00');
  static final Color primaryTextColor = hexToColor('494949');
  static final Color secondaryTextColor = hexToColor('4F4F4F');
  static final Color grayLightTextColor = hexToColor('575757');
  static final Color grayBorder = hexToColor('dadada');

  static Color hexToColor(String code) {
    return Color(int.parse(code.substring(0, 6), radix: 16) + 0xFF000000);
  }
}

InputDecoration searchCountryDecoration(BuildContext context) {
  return InputDecoration(
    icon: null,
    labelStyle: TextStyle(
      color: AppColors.hexToColor('535353'),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
      fontSize: 13.0 + detectDevice(context),
    ),
    helperStyle: TextStyle(
      color: AppColors.hexToColor('535353'),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
      fontSize: 13.0 + detectDevice(context),
    ),
    prefixStyle: TextStyle(
      color: AppColors.hexToColor('535353'),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
      fontSize: 13.0 + detectDevice(context),
    ),
    hintStyle: TextStyle(
      color: AppColors.hexToColor('535353'),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
      fontSize: 13.0 + detectDevice(context),
    ),
    focusedErrorBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black,
        width: 1,
      ),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black,
        width: 1,
      ),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.hexToColor('AAAAAA'),
        width: 1,
      ),
    ),
    disabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.hexToColor('AAAAAA'),
        width: 1,
      ),
    ),
    border: UnderlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.hexToColor('AAAAAA'),
        width: 1,
      ),
    ),
    errorBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black,
        width: 1,
      ),
    ),
  );
}

TextStyle searchStyle(BuildContext context) {
  return TextStyle(
    color: AppColors.hexToColor('535353'),
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
    fontSize: 13.0 + detectDevice(context),
  );
}

TextStyle textStyleSearchField(BuildContext context) {
  return TextStyle(
    color: AppColors.hexToColor('535353'),
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
    fontSize: 13.0 + detectDevice(context),
  );
}

InputDecoration textFormFieldStyle(
    BuildContext context,
    String labelText, {
      Widget suffixIcon,
      Widget prefixIcon,
      Widget icon,
      EdgeInsetsGeometry padding,
      String prefixText = "",
      String suffixText = "",
      bool showUnderline = true,
      String hintText = "",
    }) {
  return InputDecoration(
    contentPadding: padding,
    labelText: labelText,
    hintText: hintText,
    prefixText: prefixText,
    suffixText: suffixText,
    prefixStyle: TextStyle(
      color: AppColors.primaryTextColor,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
      fontSize: 13.0 + detectDevice(context),
    ),
    suffixStyle: TextStyle(
      color: AppColors.primaryTextColor,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
      fontSize: 13.0 + detectDevice(context),
    ),
    labelStyle: TextStyle(
      color: AppColors.hexToColor('AAAAAA'),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
      fontSize: 13.0 + detectDevice(context),
    ),
    suffixIcon: (suffixIcon != null) ? suffixIcon : null,
    prefixIcon: (prefixIcon != null) ? prefixIcon : null,
    icon: (icon != null) ? icon : null,
    hintStyle: TextStyle(
      color: AppColors.hexToColor('AAAAAA'),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
      fontSize: 14.0 + detectDevice(context),
    ),
    errorStyle: TextStyle(
      color: AppColors.hexToColor('C13A3A'),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
      fontSize: 9.0 + detectDevice(context),
    ),
    focusedBorder: (showUnderline)
        ? UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black,
        width: 1,
      ),
    )
        : null,
    enabledBorder: (showUnderline)
        ? UnderlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.hexToColor('AAAAAA'),
        width: 1,
      ),
    )
        : null,
    disabledBorder: (showUnderline)
        ? UnderlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.hexToColor('AAAAAA'),
        width: 1,
      ),
    )
        : null,
  );
}

TextTheme appTextTheme() {
  return TextTheme(
    body1: TextStyle(
      color: AppColors.hexToColor('535353'),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
    ),
    body2: TextStyle(
      color: AppColors.hexToColor('535353'),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
    ),
    title: TextStyle(
      color: AppColors.hexToColor('535353'),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
    ),
    subhead: TextStyle(
      color: AppColors.hexToColor('535353'),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
    ),
    display1: TextStyle(
      color: AppColors.hexToColor('535353'),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
    ),
    display2: TextStyle(
      color: AppColors.hexToColor('535353'),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
    ),
    display3: TextStyle(
      color: AppColors.hexToColor('535353'),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
    ),
    display4: TextStyle(
      color: AppColors.hexToColor('535353'),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
    ),
  );
}

TextStyle termsOfServiceStyle(BuildContext context, {FontWeight fontWeight, Color color}) {
  return TextStyle(
    color: (color != null) ? color : AppColors.primaryTextColor,
    height: 1.7,
    fontFamily: 'Poppins',
    fontWeight: (fontWeight != null) ? fontWeight : FontWeight.w500,
    fontSize: 11.0 + detectDevice(context),
  );
}

TextStyle termsOfServiceSettingStyle(BuildContext context, {FontWeight fontWeight, Color color}) {
  return TextStyle(
    color: (color != null) ? color : AppColors.primaryTextColor,
    height: 1.7,
    fontFamily: 'Poppins',
    fontWeight: (fontWeight != null) ? fontWeight : FontWeight.w500,
    fontSize: 10.0 + detectDevice(context),
  );
}

int detectDevice(BuildContext context) {
  var device = 4;
  final mediaQueryData = MediaQuery.of(context);
  if (mediaQueryData.size.height.toInt() <= 896) {
    // print("iPhone X");
    device = 4;
  }
  if (mediaQueryData.size.height.toInt() <= 736) {
    // print("iPhone 6+/6S+/7+/8+");
    device = 3;
  }
  if (mediaQueryData.size.height.toInt() <= 667) {
    // print("iPhone 6/6S/7/8");
    device = 2;
  }
  if (mediaQueryData.size.height.toInt() <= 568) {
    // print("iPhone 5 or 5S or 5C");
    device = 1;
  }
  return device;
}