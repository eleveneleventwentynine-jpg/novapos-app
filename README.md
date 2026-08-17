# NovaPOS — Flutter UI Skeleton

Next-gen dark glassmorphic UI skeleton for the NovaPOS mobile app.
No backend wiring yet — this is pure UI/navigation, built to plug real
data into next.

## What's included

- **Design system** (`lib/core/theme/`): `app_tokens.dart` (colors,
  gradients, radii, spacing, blur, glow) + `app_theme.dart` (ThemeData).
  Same token-driven approach as the NovaPOS web app and DRBMCalc.
- **Reusable widgets** (`lib/core/widgets/`): `GlassCard` (frosted glass
  panel), `GradientBackground` (aurora glow backdrop), `NovaBottomNav`
  (floating pill nav bar), `NovaAppBar` / `NovaIconButton`, `StatCard`.
- **Screens** (`lib/screens/`):
  - `auth/login_screen.dart` — glass login form
  - `dashboard/dashboard_screen.dart` — KPI grid, revenue trend chart, activity feed
  - `pos/pos_screen.dart` — category chips, product grid, glass cart bar
  - `inventory/inventory_screen.dart` — search, filters, stock level bars
  - `customers/customers_screen.dart` — RFM stats, loyalty tier list
  - `reports/reports_screen.dart` — period selector, bar chart, category breakdown
  - `shell/main_shell.dart` — IndexedStack + bottom nav wiring it all together

All data on screen is placeholder/mock — wire it to your NovaPOS PHP
API next (matching the JSON your `ask.php` / module endpoints already
return).

## Getting a real Flutter project from this skeleton

This repo currently ships only `lib/` + `pubspec.yaml` — no `android/`
or `ios/` folders, since those are large generated scaffolds better
created by the Flutter SDK itself.

**Option A — let GitHub Actions do it (already set up):**
Push to `main` (or run the workflow manually) and
`.github/workflows/build-apk.yml` will:
1. Install Flutter
2. Run `flutter create --platforms=android --org com.novapos .` if `android/` is missing
3. `flutter pub get`
4. `flutter build apk --debug`
5. Upload the APK as a workflow artifact (Actions tab → run → Artifacts)

**Option B — generate locally, then push:**
```bash
flutter create --platforms=android,ios --org com.novapos .
flutter pub get
flutter run
```
This won't overwrite `lib/` or `pubspec.yaml` — it only fills in the
missing platform folders.

## Next steps

- Wire `LoginScreen` to your auth endpoint, store session/branch context
- Replace mock lists in POS/Inventory/Customers/Reports with real API calls
- Add a state layer (Provider/Riverpod/Bloc — your call) once data is live
- Add app icon + splash screen once branding assets are ready
