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

TextStyle get bodyWhite {
  return GoogleFonts.inter(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: Colors.white,
    height: 1.3,
  );
}

TextStyle get bodyBlack {
  return GoogleFonts.inter(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: Colors.black,
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

TextStyle get minimal {
  return GoogleFonts.inter(
    fontWeight: FontWeight.w400,
    fontSize: 10,
    color: Color(0xFF646C7D),
    height: 1.3,
  );
}

TextStyle get heading2Primary {
  return GoogleFonts.poppins(
      fontWeight: FontWeight.w600, fontSize: 16, color: primary);
}

TextStyle get heading2Black {
  return GoogleFonts.poppins(
    fontWeight: FontWeight.w600,
    fontSize: 16,
    color: Colors.black,
  );
}
