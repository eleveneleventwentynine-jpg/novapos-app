import 'dart:ui';
import 'package:flutter/material.dart';
import '../theme/app_tokens.dart';

/// The signature surface of the NovaPOS next-gen UI: a frosted glass
/// panel with a soft border, subtle sheen, and optional accent glow.
class GlassCard extends StatelessWidget {
  const GlassCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(AppSpacing.md),
    this.borderRadius = AppRadii.lg,
    this.glowColor,
    this.strong = false,
    this.onTap,
    this.margin,
  });

  final Widget child;
  final EdgeInsets padding;
  final double borderRadius;
  final Color? glowColor;
  final bool strong;
  final VoidCallback? onTap;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(borderRadius);

    return Container(
      margin: margin,
      decoration: glowColor != null
          ? BoxDecoration(
              borderRadius: radius,
              boxShadow: AppElevation.glow(glowColor!, opacity: 0.22),
            )
          : null,
      child: ClipRRect(
        borderRadius: radius,
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: AppBlur.card,
            sigmaY: AppBlur.card,
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              child: Container(
                padding: padding,
                decoration: BoxDecoration(
                  color: strong ? AppColors.glassFillStrong : AppColors.glassFill,
                  borderRadius: radius,
                  border: Border.all(color: AppColors.glassBorder, width: 1),
                  gradient: AppColors.glassSheen,
                ),
                child: child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
