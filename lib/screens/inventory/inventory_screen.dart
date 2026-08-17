import 'package:flutter/material.dart';
import '../../core/theme/app_tokens.dart';
import '../../core/widgets/glass_card.dart';
import '../../core/widgets/nova_app_bar.dart';

class InventoryScreen extends StatelessWidget {
  const InventoryScreen({super.key});

  static const _items = [
    ('Ankara Print Fabric', 'FAB-0021', 42, 100, AppColors.mint),
    ('Silk Lining (White)', 'FAB-0088', 18, 100, AppColors.amber),
    ('Zipper 10cm — Black', 'ACC-0142', 8, 100, AppColors.rose),
    ('Suit Buttons (Brass)', 'ACC-0056', 63, 100, AppColors.mint),
    ('Thread Spool — Navy', 'ACC-0071', 25, 100, AppColors.amber),
    ('Cotton Twill (yd)', 'FAB-0034', 71, 100, AppColors.mint),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 120),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NovaAppBar(
            title: 'Inventory',
            subtitle: '312 SKUs · 18 low stock',
            actions: [NovaIconButton(icon: Icons.tune_rounded, onTap: () {})],
          ),
          const SizedBox(height: 16),
          GlassCard(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Row(
              children: const [
                Icon(Icons.search_rounded, size: 18, color: AppColors.textMuted),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    style: TextStyle(color: AppColors.textPrimary, fontSize: 14),
                    decoration: InputDecoration(
                      isDense: true,
                      hintText: 'Search products, SKU, category...',
                      hintStyle: TextStyle(color: AppColors.textMuted, fontSize: 13),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 34,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _chip('All', true),
                _chip('Fabrics', false),
                _chip('Accessories', false),
                _chip('Low Stock', false),
              ],
            ),
          ),
          const SizedBox(height: 18),
          ..._items.map((e) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: _stockRow(e.$1, e.$2, e.$3, e.$4, e.$5 as Color),
              )),
        ],
      ),
    );
  }

  Widget _chip(String label, bool active) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: active ? AppColors.brandGradient : null,
        color: active ? null : AppColors.glassFill,
        borderRadius: BorderRadius.circular(AppRadii.pill),
        border: Border.all(color: AppColors.glassBorder),
      ),
      child: Text(label, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: active ? Colors.white : AppColors.textMuted)),
    );
  }

  Widget _stockRow(String name, String sku, int qty, int max, Color color) {
    final pct = (qty / max).clamp(0.0, 1.0);
    return GlassCard(
      padding: const EdgeInsets.all(14),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: color.withOpacity(0.15),
              borderRadius: BorderRadius.circular(AppRadii.sm),
            ),
            child: Icon(Icons.inventory_2_rounded, color: color, size: 20),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: AppColors.textPrimary)),
                const SizedBox(height: 2),
                Text(sku, style: const TextStyle(fontSize: 11, color: AppColors.textMuted)),
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(AppRadii.pill),
                  child: LinearProgressIndicator(
                    value: pct,
                    minHeight: 5,
                    backgroundColor: AppColors.glassFillStrong,
                    valueColor: AlwaysStoppedAnimation(color),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Text('$qty', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800, color: color)),
        ],
      ),
    );
  }
}
