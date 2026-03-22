import 'package:flutter/material.dart';

/// Centralized color palette for the 021 Trade app.
abstract final class AppColors {
  // ── Backgrounds ──────────────────────────────────────────────────────────
  static const Color scaffoldBackground = Color(0xFF0A0E1A);
  static const Color cardBackground = Color(0xFF111827);
  static const Color surfaceVariant = Color(0xFF1C2333);
  static const Color divider = Color(0xFF1E2940);

  // ── Accent / Brand ───────────────────────────────────────────────────────
  static const Color accent = Color(0xFF3D7FFF);
  static const Color accentGlow = Color(0x1A3D7FFF);

  // ── Text ─────────────────────────────────────────────────────────────────
  static const Color textPrimary = Color(0xFFEAEFF8);
  static const Color textSecondary = Color(0xFF8A96B0);
  static const Color textMuted = Color(0xFF4F5D78);

  // ── Market Colors ─────────────────────────────────────────────────────────
  static const Color gain = Color(0xFF10B981);
  static const Color gainBackground = Color(0x1A10B981);
  static const Color gainBorder = Color(0x3310B981);

  static const Color loss = Color(0xFFEF4444);
  static const Color lossBackground = Color(0x1AEF4444);
  static const Color lossBorder = Color(0x33EF4444);

  // ── Drag / Interaction ────────────────────────────────────────────────────
  static const Color dragHandle = Color(0xFF3A4560);
  static const Color dragHighlight = Color(0xFF1A2540);
  static const Color dragShadow = Color(0x803D7FFF);
}
