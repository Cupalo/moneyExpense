import 'package:flutter/material.dart';

/// Centralized color palette for the application.
/// Keep this focused only on colors for better organization.
class AppColors {
  // Private constructor to prevent instantiation.
  AppColors._();

  // Brand colors
  static const Color primaryTeal = Color(0xFF0EA5A5);
  static const Color primaryBlue = Color(0xFF0F9DC2);

  // Background colors
  static const Color scaffold = Colors.white;
  static const Color card = Colors.white;
  static const Color divider = Color(0xFFCFD8DC);
  static const Color grey = Color(0xFFBDBDBD);
  static const Color greyLight = Color(0xFFE0E0E0);

  // Category colors (match design.png/icons.png)
  static const int catMakananHex = 0xFFF0C040;
  static const int catInternetHex = 0xFF59C8F2;
  static const int catTransportHex = 0xFF9C6FE3;
  static const int catHiburanHex = 0xFF2E7AEF;
  static const int catHadiahHex = 0xFFF45D5D;
  static const int catOlahragaHex = 0xFF36A3E6;
  static const int catBelanjaHex = 0xFF2EB872;
  static const int catEdukasiHex = 0xFFFF9F43;
  static const int catAlatRumahHex = 0xFFB588EB;

  // Category color objects
  static const Color catMakanan = Color(catMakananHex);
  static const Color catInternet = Color(catInternetHex);
  static const Color catTransport = Color(catTransportHex);
  static const Color catHiburan = Color(catHiburanHex);
  static const Color catHadiah = Color(catHadiahHex);
  static const Color catOlahraga = Color(catOlahragaHex);
  static const Color catBelanja = Color(catBelanjaHex);
  static const Color catEdukasi = Color(catEdukasiHex);
  static const Color catAlatRumah = Color(catAlatRumahHex);
}
