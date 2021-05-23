import 'package:flutter/material.dart';

//colors
const app_background_grey_color = Color(0xFF2E2E35);
const app_background_dark_color = Color(0xFF212121);

const lune = Color(0xff459A93);
const lune_inactive = Color(0xffAFC6C3);
const green = Color(0xff469B93);
const lune_dark = Color(0xff0A6666);
const lune_light = Color(0xffC2D2D1);
const text_main = Color(0xff5C5C5C);
const clor = Color(0xffC5C5C5);
const orange = Color(0xffFF9408);
const light = Color(0xffF7F6EC);
const error_red = Color(0xffFD3A3A);
const inactive = Color(0xffc5c5c5);
const secondary_text = Color(0xFF5C5C5C);
const color_grey = Color(0xFFA6A6A6);
const label_dark = Color(0xff2F2F2F);
const primary_blue = Color(0xFF2F80ED);
const primary_pink = Color(0xFFED217C);
const light_text = Color(0xff9D9D9C);
const background_dark = Color(0xff282828);
const background_blue = Color(0xFF0000AA);
const font_family_default = 'Effra';
//text styles

const h16White = TextStyle(
  fontSize: 16.0,
  color: Colors.white,
);

const h15White = TextStyle(
  fontSize: 15.0,
  color: Colors.white,
);
const h14White = TextStyle(
  fontSize: 14.0,
  color: Colors.white,
);

const bigBlackStyle = TextStyle(
    fontSize: 42.0,
    color: label_dark,
    fontFamily: font_family_default,
    fontWeight: FontWeight.bold);

const bigGreyStyle = TextStyle(
    fontSize: 42.0,
    color: Color(0xffa4a4a4),
    fontFamily: font_family_default,
    letterSpacing: 0.7,
    fontWeight: FontWeight.bold);

const h32LightStyle = TextStyle(
  fontSize: 32.0,
  color: light_text,
  fontFamily: font_family_default,
);

const h14main = TextStyle(
  fontSize: 14.0,
  color: text_main,
  fontFamily: font_family_default,
);

const h14mainDark = TextStyle(
  fontSize: 14.0,
  color: Color(0xff434343),
  fontFamily: font_family_default,
);
const h14GreenBold = TextStyle(
  fontSize: 14.0,
  color: green,
  fontWeight: FontWeight.bold,
  fontFamily: font_family_default,
);
const h14mainBold = TextStyle(
  fontSize: 14.0,
  fontWeight: FontWeight.bold,
  color: text_main,
  fontFamily: font_family_default,
);
const h14dark = TextStyle(
  fontSize: 14.0,
  letterSpacing: 0.75,
  color: label_dark,
  fontFamily: font_family_default,
);

const h14LightWith60Opacity = TextStyle(
  fontSize: 14.0,
  color: Colors.white60,
  fontFamily: font_family_default,
);
const h14LightBold = TextStyle(
  fontSize: 14.0,
  fontWeight: FontWeight.bold,
  color: light_text,
  fontFamily: font_family_default,
);
const h12mainWhiteUnderline = TextStyle(
  fontSize: 12.0,
  color: Colors.white,
  fontFamily: font_family_default,
  decoration: TextDecoration.underline,
);

const h12dark = TextStyle(
  fontSize: 12.0,
  color: text_main,
  fontFamily: font_family_default,
);

const h12White = TextStyle(
  fontSize: 12.0,
  color: Colors.white,
);

const h12orange = TextStyle(
  fontSize: 12.0,
  color: orange,
  fontFamily: font_family_default,
);

const h16active = TextStyle(
  fontSize: 16.0,
  color: lune,
  fontFamily: font_family_default,
);

const h16TextMainBold = TextStyle(
    fontSize: 16.0,
    color: text_main,
    fontFamily: font_family_default,
    fontWeight: FontWeight.bold);

const h16TextDark = TextStyle(
  fontSize: 16.0,
  color: label_dark,
  fontFamily: font_family_default,
);

const h16inactive = TextStyle(
  fontSize: 16.0,
  color: inactive,
  fontFamily: font_family_default,
);

const h16error = TextStyle(
  fontSize: 16.0,
  color: Color(0xffCF1B1B),
  fontFamily: font_family_default,
);

const h18LightBold = TextStyle(
    color: light,
    fontSize: 18.0,
    fontFamily: font_family_default,
    fontWeight: FontWeight.bold);

const h18LuneBold = TextStyle(
    color: lune,
    fontSize: 18.0,
    fontFamily: font_family_default,
    fontWeight: FontWeight.bold);

const h16LightBold = TextStyle(
    color: light,
    fontSize: 16.0,
    fontFamily: font_family_default,
    fontWeight: FontWeight.bold);

const h16LuneBold = TextStyle(
    color: lune,
    fontSize: 16.0,
    fontFamily: font_family_default,
    fontWeight: FontWeight.bold);
const h18DarkBold = TextStyle(
    color: label_dark,
    fontSize: 18.0,
    fontFamily: font_family_default,
    letterSpacing: 0.75,
    fontWeight: FontWeight.bold);
const h18Dark = TextStyle(
  color: label_dark,
  fontSize: 18.0,
  fontFamily: font_family_default,
  letterSpacing: 0.75,
);
const h22DarkBold = TextStyle(
    color: label_dark,
    fontSize: 22.0,
    fontFamily: font_family_default,
    fontWeight: FontWeight.bold);

const h18BlackDarkBold = TextStyle(
    color: label_dark,
    fontSize: 18.0,
    fontFamily: font_family_default,
    fontWeight: FontWeight.bold);

const h24BlackBold = TextStyle(
    color: label_dark,
    fontSize: 24.0,
    fontFamily: font_family_default,
    fontWeight: FontWeight.bold);

const h14link = TextStyle(
  fontSize: 14.0,
  color: lune,
  fontWeight: FontWeight.bold,
  fontFamily: font_family_default,
//    decoration: TextDecoration.underline
);

const focusedLabe = TextStyle(
  color: lune,
  fontSize: 16.0,
  fontFamily: font_family_default,
);

const unfocusedLabel = TextStyle(
  color: text_main,
  fontSize: 16.0,
  fontFamily: font_family_default,
);

const h12error = TextStyle(
  color: error_red,
  fontSize: 12.0,
  fontFamily: font_family_default,
);

const h1 = TextStyle(
  color: label_dark,
  fontSize: 24.0,
  fontFamily: font_family_default,
);
const h1Bold = TextStyle(
  color: label_dark,
  fontSize: 24.0,
  fontWeight: FontWeight.bold,
  fontFamily: font_family_default,
);

const h2 = TextStyle(
  color: label_dark,
  fontSize: 18.0,
  fontFamily: font_family_default,
);

const h2bold = TextStyle(
    color: label_dark,
    fontSize: 18.0,
    fontFamily: font_family_default,
    fontWeight: FontWeight.bold);

const h2Grey = TextStyle(
  color: secondary_text,
  fontSize: 18.0,
  fontFamily: font_family_default,
);

const h3 = TextStyle(
  color: label_dark,
  fontSize: 14.0,
  fontFamily: font_family_default,
);

const h3grey = TextStyle(
  color: secondary_text,
  fontSize: 14.0,
  fontFamily: font_family_default,
);

const main = TextStyle(
  color: text_main,
  fontSize: 16.0,
  fontFamily: font_family_default,
);
const h20Main = TextStyle(
  color: text_main,
  fontSize: 20.0,
  letterSpacing: 0.75,
  fontFamily: font_family_default,
);
