import 'package:flutter/material.dart';
import '../../core/theme/app_tokens.dart';
import '../../core/widgets/glass_card.dart';
import '../../core/widgets/nova_app_bar.dart';

class CustomersScreen extends StatelessWidget {
  const CustomersScreen({super.key});

  static const _customers = [
    ('Amina Hassan', 'Gold Tier · 2,450 pts', 'AH', AppColors.amber),
    ('James Mwangi', 'Silver Tier · 980 pts', 'JM', AppColors.textMuted),
    ('Grace Kimaro', 'Platinum · 5,120 pts', 'GK', AppColors.cyan),
    ('Ibrahim Juma', 'Bronze · 210 pts', 'IJ', AppColors.rose),
    ('Neema Shirima', 'Gold Tier · 1,870 pts', 'NS', AppColors.amber),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 120),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NovaAppBar(
            title: 'Customers',
            subtitle: '1,204 total · 27 new this week',
            actions: [NovaIconButton(icon: Icons.person_add_alt_1_rounded, onTap: () {})],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(child: _miniStat('RFM: Champions', '184', AppColors.mint)),
              const SizedBox(width: 12),
              Expanded(child: _miniStat('At Risk', '32', AppColors.rose)),
            ],
          ),
          const SizedBox(height: 18),
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
                      hintText: 'Search customers...',
                      hintStyle: TextStyle(color: AppColors.textMuted, fontSize: 13),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          ..._customers.map((c) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: _customerRow(c.$1, c.$2, c.$3, c.$4 as Color),
              )),
        ],
      ),
    );
  }

  Widget _miniStat(String label, String value, Color color) {
    return GlassCard(
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: color)),
          const SizedBox(height: 2),
          Text(label, style: const TextStyle(fontSize: 11, color: AppColors.textMuted)),
        ],
      ),
    );
  }

  Widget _customerRow(String name, String sub, String initials, Color color) {
    return GlassCard(
      padding: const EdgeInsets.all(14),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: color.withOpacity(0.18),
              shape: BoxShape.circle,
              border: Border.all(color: color.withOpacity(0.4)),
            ),
            child: Text(initials, style: TextStyle(color: color, fontWeight: FontWeight.w800, fontSize: 13)),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: AppColors.textPrimary)),
                const SizedBox(height: 2),
                Text(sub, style: const TextStyle(fontSize: 11, color: AppColors.textMuted)),
              ],
            ),
          ),
          const Icon(Icons.chevron_right_rounded, color: AppColors.textMuted),
        ],
      ),
    );
  }
}
