import 'package:flutter/material.dart';
import 'package:skrining_apps/components/widget/scaffold_widget.dart';
import 'package:skrining_apps/components/widget/screening_card.dart';
import 'package:skrining_apps/components/widget/section_title.dart';
import 'package:skrining_apps/components/widget/tile_card.dart';
import 'package:skrining_apps/components/widget/tile_section.dart';

class ScriningScreen extends StatelessWidget {
  const ScriningScreen({super.key});

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
                    Text(
                      'Skrining',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ],
                ),
                SizedBox(height: 16),
                TileSection(
                  children: [
                    TileCard(
                      icon: Icons.calendar_today_outlined,
                      lightColor: Colors.indigo,
                      darkColor: Colors.indigo.shade200,
                      title: "Kamis",
                      isTitleBold: true,
                      subtitle: "2 Oktober 2025",
                      trailing: Text(
                        '08:00',
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                    TileCard(
                      icon: Icons.sticky_note_2_outlined,
                      lightColor: Colors.deepOrange,
                      darkColor: Colors.deepOrange.shade200,
                      title: "Catatan",
                      isTitleBold: true,
                      subtitle: 'Baca terlebih dahulu seblum skrining',
                      onTap: () {},
                    ),
                    TileCard(
                      icon: Icons.assignment_turned_in_outlined,
                      lightColor: Colors.green,
                      darkColor: Colors.green.shade200,
                      title: "Hasil Skrining",
                      isTitleBold: true,
                      subtitle: 'Lihat hasil skrining Anda',
                      onTap: () {},
                    ),
                  ],
                ),
                SizedBox(height: 32),

                SectionTitle(title: 'Informasi Dasar'),
                SizedBox(height: 8),
                ScreeningCard(
                  title: "Berapa usia Anda saat ini?",
                  hint: "Masukkan usia dalam tahun",
                ),
                SizedBox(height: 16),
                ScreeningCard(
                  title: "Apa jenis kelamin Anda?",
                  hint: "Pilih jenis kelamin",
                  options: const ["Laki-laki", "Perempuan"],
                  onChanged: (val) => debugPrint("Dipilih: $val"),
                ),
                SizedBox(height: 32),

                SectionTitle(title: 'Gejala dan Kondisi Fisik'),
                SizedBox(height: 8),
                ScreeningCard(
                  title:
                      "Berapa tekanan darah Anda saat istirahat (dalam mm Hg)?",
                  hint: "Masukkan tekanan darah",
                ),
                SizedBox(height: 16),
                ScreeningCard(
                  title: "Berapa kadar kolesterol serum Anda (dalam mg/dl)?",
                  hint: "Masukkan kadar kolesterol",
                ),
                SizedBox(height: 16),
                ScreeningCard(
                  title: "Apakah gula darah puasa Anda lebih dari 120 mg/dl?",
                  hint: "Pilih Ya atau Tidak",
                  options: const ["Ya", "Tidak"],
                  onChanged: (val) => debugPrint("Dipilih: $val"),
                ),
                SizedBox(height: 16),
                ScreeningCard(
                  title: "Apakah anda memiliki penyakit jantung?",
                  hint: "Pilih Ya atau Tidak",
                  options: const ["Ya", "Tidak"],
                  onChanged: (val) => debugPrint("Dipilih: $val"),
                ),
                SizedBox(height: 16),
                ScreeningCard(
                  title:
                      "Berapa detak jantung maksimum yang pernah Anda capai?",
                  hint: "Masukkan detak jantung dalam bpm",
                ),
                SizedBox(height: 16),
                ScreeningCard(
                  title:
                      "Berapa nilai depresi ST dibandingkan kondisi istirahat Anda?",
                  hint: "Masukkan nilai depresi",
                ),
                SizedBox(height: 32),

                SectionTitle(title: 'Gejala Nyeri Dada'),
                SizedBox(height: 8),
                ScreeningCard(
                  title: "Tipe nyeri dada apa yang paling sering Anda rasakan?",
                  hint: "Pilih tipe nyeri dada",
                  options: const [
                    "Typical Angina",
                    "Atypical Angina",
                    "Non-Anginal Pain",
                    "Asymptomatic",
                  ],
                  onChanged: (val) => debugPrint("Dipilih: $val"),
                ),
                SizedBox(height: 16),
                ScreeningCard(
                  title:
                      "Apa hasil Elektrokardiogram (EKG) Anda saat istirahat?",
                  hint: "Pilih hasil EKG",
                  options: const [
                    "Normal",
                    "gelombang ST-T abnormal",
                    "Left Ventricular Hypertrophy",
                  ],
                  onChanged: (val) => debugPrint("Dipilih: $val"),
                ),
                SizedBox(height: 16),
                ScreeningCard(
                  title: "Apakah Anda mengalami nyeri dada saat berolahraga?",
                  hint: "Pilih Ya atau Tidak",
                  options: const ["Ya", "Tidak"],
                  onChanged: (val) => debugPrint("Dipilih: $val"),
                ),
                SizedBox(height: 16),
                ScreeningCard(
                  title:
                      "Bagaimana pola kemiringan segmen ST Anda saat olahraga?",
                  hint: "Pilih pola kemiringan",
                  options: const ["Menanjak", "Datar", "Menurun"],
                  onChanged: (val) => debugPrint("Dipilih: $val"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
