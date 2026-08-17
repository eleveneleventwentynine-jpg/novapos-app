import 'package:flutter/material.dart';

/// NovaPOS Design Tokens
/// Single source of truth for the "next-gen dark glass" visual language.
/// Mirrors the token-system approach used in the NovaPOS web app and
/// the DRBMCalc Flutter app, so the brand feels consistent across
/// every surface.
class AppColors {
  AppColors._();

  // Base surfaces
  static const Color bgTop = Color(0xFF0A0E1A);
  static const Color bgBottom = Color(0xFF12172A);
  static const Color bgCard = Color(0xFF161B2E);

  // Glass
  static const Color glassFill = Color(0x14FFFFFF); // white @ 8%
  static const Color glassFillStrong = Color(0x1FFFFFFF); // white @ 12%
  static const Color glassBorder = Color(0x26FFFFFF); // white @ 15%
  static const Color glassHighlight = Color(0x40FFFFFF); // white @ 25%

  // Brand accents
  static const Color violet = Color(0xFF7C5CFF);
  static const Color violetDeep = Color(0xFF5B3DF0);
  static const Color cyan = Color(0xFF00E5FF);
  static const Color magenta = Color(0xFFFF4FD8);
  static const Color mint = Color(0xFF2CE8A6);
  static const Color amber = Color(0xFFFFB020);
  static const Color rose = Color(0xFFFF5C7A);

  // Text
  static const Color textPrimary = Color(0xFFF5F6FA);
  static const Color textSecondary = Color(0xFFA0A6BF);
  static const Color textMuted = Color(0xFF6B7194);

  // Status
  static const Color success = mint;
  static const Color warning = amber;
  static const Color danger = rose;
  static const Color info = cyan;

  static const LinearGradient backgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [bgTop, bgBottom],
  );

  static const LinearGradient brandGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [violet, cyan],
  );

  static const LinearGradient auroraGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [violet, magenta, cyan],
  );

  static LinearGradient glassSheen = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Colors.white.withOpacity(0.10), Colors.white.withOpacity(0.02)],
  );
}

class AppRadii {
  AppRadii._();

  static const double xs = 8;
  static const double sm = 12;
  static const double md = 16;
  static const double lg = 20;
  static const double xl = 28;
  static const double pill = 999;
}

class AppSpacing {
  AppSpacing._();

  static const double xs = 4;
  static const double sm = 8;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 32;
  static const double xxl = 48;
}

class AppBlur {
  AppBlur._();

  static const double card = 18;
  static const double nav = 24;
  static const double modal = 30;
}

class AppElevation {
  AppElevation._();

  static List<BoxShadow> glow(Color color, {double opacity = 0.35}) => [
        BoxShadow(
          color: color.withOpacity(opacity),
          blurRadius: 24,
          spreadRadius: -4,
          offset: const Offset(0, 8),
        ),
      ];

  static List<BoxShadow> soft = [
    BoxShadow(
      color: Colors.black.withOpacity(0.35),
      blurRadius: 20,
      offset: const Offset(0, 10),
    ),
  ];
}
