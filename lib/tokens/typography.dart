import "colors.dart";
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle get body {
  return GoogleFonts.inter(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: Color(0xFF646C7D),
    height: 1.3,
  );
}

TextStyle get bodyBlack {
  return GoogleFonts.inter(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: Color(0xFF646C7D),
    height: 1.3,
  );
}

TextStyle get bodyGray40 {
  return GoogleFonts.inter(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: Color(0xFF646C7D),
    height: 1.3,
  );
}

TextStyle get subtitle {
  return GoogleFonts.poppins(
    fontWeight: FontWeight.w500,
    fontSize: 13,
    color: grayText,
  );
}

TextStyle get heading {
  return GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );
}

TextStyle get ctaGray {
  return GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: grayText,
  );
}

TextStyle get subheadingPrimary {
  return GoogleFonts.poppins(
    color: primary,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
}

TextStyle get subheadingDone {
  return GoogleFonts.poppins(
    color: done,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
}

TextStyle get fieldLabel {
  return GoogleFonts.poppins(
    color: grayText,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
}

TextStyle get fieldValue {
  return GoogleFonts.poppins(
    color: Colors.black,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
}

TextStyle get fieldValueWarning {
  return GoogleFonts.poppins(
    color: warning,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
}

TextStyle get fieldValuePrimary {
  return GoogleFonts.poppins(
    color: primary,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
}

TextStyle get minimal {
  return GoogleFonts.inter(
    fontWeight: FontWeight.w400,
    fontSize: 10,
    color: Color(0xFF646C7D),
    height: 1.3,
  );
}

////
ButtonStyle get buttonSecondary {
  return ButtonStyle(
    backgroundColor: MaterialStateProperty.all(buttonBgSecondary),
    foregroundColor: MaterialStateProperty.all(Colors.black),
  );
}
