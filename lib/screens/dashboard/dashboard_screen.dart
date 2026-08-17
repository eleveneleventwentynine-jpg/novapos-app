import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../core/theme/app_tokens.dart';
import '../../core/widgets/glass_card.dart';
import '../../core/widgets/nova_app_bar.dart';
import '../../core/widgets/stat_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 120),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NovaAppBar(
            title: 'Good evening, Bmone',
            subtitle: 'Dar es Salaam HQ · Today',
            actions: [
              NovaIconButton(icon: Icons.search_rounded, onTap: () {}),
              NovaIconButton(icon: Icons.notifications_none_rounded, badge: true, onTap: () {}),
            ],
          ),
          const SizedBox(height: 20),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 14,
            crossAxisSpacing: 14,
            childAspectRatio: 1.35,
            children: const [
              StatCard(
                label: "Today's Revenue",
                value: 'TZS 4.82M',
                icon: Icons.payments_rounded,
                accent: AppColors.violet,
                delta: '+12.4%',
                deltaUp: true,
              ),
              StatCard(
                label: 'Transactions',
                value: '312',
                icon: Icons.receipt_long_rounded,
                accent: AppColors.cyan,
                delta: '+5.1%',
                deltaUp: true,
              ),
              StatCard(
                label: 'Low Stock Items',
                value: '18',
                icon: Icons.inventory_2_rounded,
                accent: AppColors.amber,
                delta: '-3',
                deltaUp: false,
              ),
              StatCard(
                label: 'New Customers',
                value: '27',
                icon: Icons.person_add_alt_1_rounded,
                accent: AppColors.mint,
                delta: '+8.9%',
                deltaUp: true,
              ),
            ],
          ),
          const SizedBox(height: 20),
          _revenueCard(context),
          const SizedBox(height: 20),
          _sectionHeader(context, 'Recent Activity', 'View all'),
          const SizedBox(height: 12),
          _activityCard(),
        ],
      ),
    );
  }

  Widget _sectionHeader(BuildContext context, String title, String action) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleMedium),
        Text(action, style: const TextStyle(color: AppColors.cyan, fontSize: 12, fontWeight: FontWeight.w600)),
      ],
    );
  }

  Widget _revenueCard(BuildContext context) {
    final spots = const [
      FlSpot(0, 2.1), FlSpot(1, 2.8), FlSpot(2, 2.4), FlSpot(3, 3.6),
      FlSpot(4, 3.1), FlSpot(5, 4.2), FlSpot(6, 4.8),
    ];
    return GlassCard(
      glowColor: AppColors.violet,
      padding: const EdgeInsets.fromLTRB(20, 20, 12, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Text('Revenue — 7 Day Trend', style: Theme.of(context).textTheme.titleMedium),
              ),
              Container(
                margin: const EdgeInsets.only(right: 8),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: AppColors.mint.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(AppRadii.pill),
                ),
                child: const Text('Forecast +9%', style: TextStyle(color: AppColors.mint, fontSize: 11, fontWeight: FontWeight.w700)),
              ),
            ],
          ),
          const SizedBox(height: 18),
          SizedBox(
            height: 140,
            child: LineChart(
              LineChartData(
                gridData: const FlGridData(show: false),
                titlesData: const FlTitlesData(show: false),
                borderData: FlBorderData(show: false),
                lineTouchData: const LineTouchData(enabled: false),
                minY: 0,
                lineBarsData: [
                  LineChartBarData(
                    spots: spots,
                    isCurved: true,
                    gradient: AppColors.brandGradient,
                    barWidth: 3,
                    dotData: const FlDotData(show: false),
                    belowBarData: BarAreaData(
                      show: true,
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [AppColors.violet.withOpacity(0.28), AppColors.violet.withOpacity(0)],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _activityCard() {
    final items = [
      ('Sale #A2931 completed', 'POS Terminal 2 · 2 min ago', Icons.check_circle_rounded, AppColors.mint),
      ('Stock received: 40 units', 'Goods Receipt #GR-118 · 25 min ago', Icons.local_shipping_rounded, AppColors.cyan),
      ('Low stock alert: Zipper 10cm', 'Inventory · 1 hr ago', Icons.warning_amber_rounded, AppColors.amber),
      ('New customer registered', 'CRM · 3 hrs ago', Icons.person_rounded, AppColors.violet),
    ];
    return GlassCard(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        children: items.map((e) {
          final isLast = e == items.last;
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
            decoration: BoxDecoration(
              border: isLast ? null : const Border(bottom: BorderSide(color: AppColors.glassBorder)),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: (e.$4 as Color).withOpacity(0.15),
                    borderRadius: BorderRadius.circular(AppRadii.sm),
                  ),
                  child: Icon(e.$3 as IconData, size: 16, color: e.$4 as Color),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(e.$1 as String, style: const TextStyle(color: AppColors.textPrimary, fontSize: 13, fontWeight: FontWeight.w600)),
                      const SizedBox(height: 2),
                      Text(e.$2 as String, style: const TextStyle(color: AppColors.textMuted, fontSize: 11)),
                    ],
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
