import 'package:flutter/material.dart';
import '../../core/theme/app_tokens.dart';
import '../../core/widgets/glass_card.dart';
import '../../core/widgets/nova_app_bar.dart';

class PosScreen extends StatefulWidget {
  const PosScreen({super.key});

  @override
  State<PosScreen> createState() => _PosScreenState();
}

class _PosScreenState extends State<PosScreen> {
  int _category = 0;
  final _categories = const ['All', 'Fabrics', 'Ready-made', 'Accessories', 'Services'];

  final _products = const [
    ('Ankara Print (yd)', 'TZS 12,000', Icons.checkroom_rounded, AppColors.violet),
    ('Men\'s Suit — Custom', 'TZS 185,000', Icons.checkroom_rounded, AppColors.cyan),
    ('Zipper 10cm', 'TZS 1,500', Icons.hardware_rounded, AppColors.amber),
    ('Silk Lining (yd)', 'TZS 9,000', Icons.checkroom_rounded, AppColors.magenta),
    ('Alteration Service', 'TZS 15,000', Icons.content_cut_rounded, AppColors.mint),
    ('Buttons (dozen)', 'TZS 2,000', Icons.hardware_rounded, AppColors.rose),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
          child: NovaAppBar(
            title: 'Point of Sale',
            subtitle: 'Terminal 2 · Cashier: Bmone',
            actions: [
              NovaIconButton(icon: Icons.qr_code_scanner_rounded, onTap: () {}),
            ],
          ),
        ),
        SizedBox(
          height: 40,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: _categories.length,
            separatorBuilder: (_, __) => const SizedBox(width: 8),
            itemBuilder: (_, i) {
              final active = i == _category;
              return GestureDetector(
                onTap: () => setState(() => _category = i),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    gradient: active ? AppColors.brandGradient : null,
                    color: active ? null : AppColors.glassFill,
                    borderRadius: BorderRadius.circular(AppRadii.pill),
                    border: Border.all(color: AppColors.glassBorder),
                  ),
                  child: Text(
                    _categories[i],
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: active ? Colors.white : AppColors.textMuted,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 14),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
            itemCount: _products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 14,
              crossAxisSpacing: 14,
              childAspectRatio: 0.95,
            ),
            itemBuilder: (_, i) {
              final p = _products[i];
              return GlassCard(
                onTap: () {},
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: (p.$4 as Color).withOpacity(0.15),
                        borderRadius: BorderRadius.circular(AppRadii.sm),
                      ),
                      child: Icon(p.$3 as IconData, size: 20, color: p.$4 as Color),
                    ),
                    const Spacer(),
                    Text(
                      p.$1 as String,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.textPrimary),
                    ),
                    const SizedBox(height: 4),
                    Text(p.$2 as String, style: const TextStyle(fontSize: 12, color: AppColors.cyan, fontWeight: FontWeight.w700)),
                  ],
                ),
              );
            },
          ),
        ),
        _cartBar(context),
      ],
    );
  }

  Widget _cartBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 100),
      child: GlassCard(
        strong: true,
        glowColor: AppColors.violet,
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
        child: Row(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                const Icon(Icons.shopping_cart_rounded, color: AppColors.textPrimary),
                Positioned(
                  top: -6,
                  right: -8,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(color: AppColors.rose, shape: BoxShape.circle),
                    child: const Text('3', style: TextStyle(fontSize: 9, color: Colors.white, fontWeight: FontWeight.w700)),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('3 items in cart', style: TextStyle(fontSize: 12, color: AppColors.textMuted)),
                  Text('TZS 27,500', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: AppColors.textPrimary)),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                gradient: AppColors.brandGradient,
                borderRadius: BorderRadius.circular(AppRadii.md),
              ),
              child: const Text('Checkout', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 13)),
            ),
          ],
        ),
      ),
    );
  }
}
