import 'package:flutter/material.dart';
import 'package:skrining_apps/widgets/health_check_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selamat Datang, Kevin 👋'),
        backgroundColor: Theme.of(context).primaryColorLight,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 24,
            children: [
              // Card(
              //   elevation: 4,
              //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              //   color: Colors.blue[50],
              //   child: Padding(
              //     padding: const EdgeInsets.all(20),
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         const Text(
              //           'Cek kondisi kesehatan kamu sekarang',
              //           style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              //         ),
              //         const SizedBox(height: 12),
              //         Align(
              //           alignment: Alignment.centerRight,
              //           child: ElevatedButton(
              //             onPressed: () {
              //               Navigator.push(context, MaterialPageRoute(builder: (_) => const PageA()));
              //             },
              //             child: const Text('Mulai'),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              HealthCheckCard(),
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 12,
                    children: [
                      const Text(
                        'Riwayat Pemeriksaan Terakhir',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        height: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text('Anda belum pernah melakukan pemeriksaan!'),
                        ),
                      ),
                      // ..._history.map((item) => ListTile(
                      //       contentPadding: EdgeInsets.zero,
                      //       title: Text(item['date']!),
                      //       subtitle: Text('Hasil: ${item['result']}'),
                      //       leading: const Icon(Icons.medical_services),
                      //     )),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            // Navigator.push(context, MaterialPageRoute(builder: (_) => const HistoryPage()));
                          },
                          child: const Text('Lihat Semua Riwayat'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
