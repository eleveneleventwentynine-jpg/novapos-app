import 'package:flutter/material.dart';
import '../../core/widgets/gradient_background.dart';
import '../../core/widgets/nova_bottom_nav.dart';
import '../dashboard/dashboard_screen.dart';
import '../pos/pos_screen.dart';
import '../inventory/inventory_screen.dart';
import '../customers/customers_screen.dart';
import '../reports/reports_screen.dart';

/// The authenticated app shell: swaps between the five core screens
/// via an IndexedStack (keeps state alive) and a floating glass nav bar.
class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _index = 0;

  static const _screens = [
    DashboardScreen(),
    PosScreen(),
    InventoryScreen(),
    CustomersScreen(),
    ReportsScreen(),
  ];

  static const _navItems = [
    NavItemData(icon: Icons.grid_view_rounded, activeIcon: Icons.grid_view_rounded, label: 'Home'),
    NavItemData(icon: Icons.point_of_sale_rounded, activeIcon: Icons.point_of_sale_rounded, label: 'POS'),
    NavItemData(icon: Icons.inventory_2_outlined, activeIcon: Icons.inventory_2_rounded, label: 'Stock'),
    NavItemData(icon: Icons.people_outline_rounded, activeIcon: Icons.people_rounded, label: 'Clients'),
    NavItemData(icon: Icons.bar_chart_rounded, activeIcon: Icons.bar_chart_rounded, label: 'Reports'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: GradientBackground(
        child: SafeArea(
          bottom: false,
          child: IndexedStack(index: _index, children: _screens),
        ),
      ),
      bottomNavigationBar: NovaBottomNav(
        items: _navItems,
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
      ),
    );
  }
}
