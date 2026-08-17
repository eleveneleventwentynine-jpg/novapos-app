import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../core/theme/app_tokens.dart';
import '../../core/widgets/glass_card.dart';
import '../../core/widgets/nova_app_bar.dart';

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({super.key});

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  int _period = 1;
  final _periods = const ['Day', 'Week', 'Month', 'Year'];

  static const _breakdown = [
    ('Fabrics', 0.42, AppColors.violet),
    ('Ready-made', 0.28, AppColors.cyan),
    ('Accessories', 0.18, AppColors.mint),
    ('Services', 0.12, AppColors.amber),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 120),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NovaAppBar(
            title: 'Reports',
            subtitle: 'Business intelligence overview',
            actions: [NovaIconButton(icon: Icons.ios_share_rounded, onTap: () {})],
          ),
          const SizedBox(height: 16),
          Row(
            children: List.generate(_periods.length, (i) {
              final active = i == _period;
              return Expanded(
                child: GestureDetector(
                  onTap: () => setState(() => _period = i),
                  child: Container(
                    margin: const EdgeInsets.only(right: 8),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      gradient: active ? AppColors.brandGradient : null,
                      color: active ? null : AppColors.glassFill,
                      borderRadius: BorderRadius.circular(AppRadii.pill),
                      border: Border.all(color: AppColors.glassBorder),
                    ),
                    child: Text(_periods[i],
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: active ? Colors.white : AppColors.textMuted)),
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 18),
          GlassCard(
            glowColor: AppColors.cyan,
            padding: const EdgeInsets.fromLTRB(18, 18, 18, 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Sales by Day', style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 16),
                SizedBox(
                  height: 150,
                  child: BarChart(
                    BarChartData(
                      gridData: const FlGridData(show: false),
                      borderData: FlBorderData(show: false),
                      titlesData: const FlTitlesData(show: false),
                      barTouchData: BarTouchData(enabled: false),
                      barGroups: [
                        for (int i = 0; i < 7; i++)
                          BarChartGroupData(x: i, barRods: [
                            BarChartRodData(
                              toY: [3.2, 4.1, 2.8, 5.0, 4.4, 6.1, 4.9][i],
                              gradient: AppColors.brandGradient,
                              width: 16,
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ]),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Text('Category Breakdown', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 12),
          GlassCard(
            padding: const EdgeInsets.all(18),
            child: Column(
              children: _breakdown.map((b) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(b.$1, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
                          Text('${(b.$2 * 100).toStringAsFixed(0)}%', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: b.$3 as Color)),
                        ],
                      ),
                      const SizedBox(height: 6),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(AppRadii.pill),
                        child: LinearProgressIndicator(
                          value: b.$2,
                          minHeight: 6,
                          backgroundColor: AppColors.glassFillStrong,
                          valueColor: AlwaysStoppedAnimation(b.$3 as Color),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
