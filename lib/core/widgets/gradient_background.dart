import 'package:flutter/material.dart';
import '../theme/app_tokens.dart';

/// Base app background: deep gradient + two soft "aurora" glow blobs.
/// Wraps every screen so the glass cards have something to refract.
class GradientBackground extends StatelessWidget {
  const GradientBackground({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: AppColors.backgroundGradient),
      child: Stack(
        children: [
          Positioned(
            top: -120,
            right: -80,
            child: _glow(AppColors.violet, 260),
          ),
          Positioned(
            bottom: -100,
            left: -100,
            child: _glow(AppColors.cyan, 240),
          ),
          child,
        ],
      ),
    );
  }

  Widget _glow(Color color, double size) {
    return IgnorePointer(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: [color.withOpacity(0.28), color.withOpacity(0)],
          ),
        ),
      ),
    );
  }
}
