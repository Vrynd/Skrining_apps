import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skrining_apps/components/widget/empty_state_card.dart';
import 'package:skrining_apps/components/widget/health_check_card.dart';
import 'package:skrining_apps/components/widget/metric_health_card.dart';
import 'package:skrining_apps/components/widget/scaffold_widget.dart';
import 'package:skrining_apps/components/widget/section_header.dart';
import 'package:skrining_apps/components/widget/user_greeting.dart';
import 'package:skrining_apps/components/widget/user_notification.dart';
import 'package:skrining_apps/provider/firebase_auth_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? _cachedUsername;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final profile = context.read<FirebaseAuthProvider>().profile;
    if (profile != null && profile.fullname != null) {
      _cachedUsername = profile.fullname!;
    }
  }

  String _getUsername() {
    final fullname = _cachedUsername ?? "Pengguna";
    final parts = fullname.split(" ");
    if (parts.length == 1) {
      return parts.first;
    } else if (parts.length > 1) {
      return "${parts[0]} ${parts[1]}";
    }
    return "Pengguna";
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWigdet(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerLow,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    UserGreeting(
                      onTap: () {},
                      username: _getUsername(),
                      imageUrl:
                          'https://www.w3schools.com/w3images/avatar2.png',
                    ),
                    UserNotification(
                      onTap: () {},
                      icon: Icons.notifications_active_outlined,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Stack(
                  children: [
                    HealthCheckCard(
                      title: 'Yuk, Cek Kesehatanmu',
                      subtitle: 'Mulai skrining kesehatanmu\nsekarang juga',
                      buttonText: 'Mulai Periksa',
                      onPressed: () {},
                    ),
                    Positioned(
                      right: 20,
                      bottom: 45,
                      child: Image.asset(
                        'assets/images/heart-rate.png',
                        width: 82,
                        height: 82,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                SectionHeader(
                  title: 'Metriks',
                  subtitle: '12 Sept 2025',
                  subtitleIcon: Icons.update_outlined,
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          MetricCard(
                            title: "Usia anda saat ini",
                            value: "32",
                            unit: "Tahun",
                          ),
                          const SizedBox(height: 12),
                          MetricCard(
                            title: "Kolesterol",
                            value: "210",
                            unit: "Mg/dL",
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: MetricCard(
                        height: 142,
                        spacing: 8,
                        title: "Tingkat Risiko",
                        value: "20%",
                        isCircular: true,
                        percent: 0.20,
                        progressColor: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                SectionHeader(title: 'Riwayat Pemeriksan'),
                const SizedBox(height: 8),
                EmptyStateCard(
                  icon: Icons.history_toggle_off,
                  title: "Belum ada Riwayat Pemeriksaan",
                  subtitle:
                      "Mulai periksa kesehatanmu dengan\nklik tombol di atas",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
