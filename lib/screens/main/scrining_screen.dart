import 'package:flutter/material.dart';
import 'package:skrining_apps/components/widget/choice_card.dart';
import 'package:skrining_apps/components/widget/click_button.dart';
import 'package:skrining_apps/components/widget/input_card.dart';
import 'package:skrining_apps/components/widget/scaffold_widget.dart';
import 'package:skrining_apps/components/widget/section_title.dart';
import 'package:skrining_apps/components/widget/tile_card.dart';
import 'package:skrining_apps/components/widget/tile_section.dart';

class ScriningScreen extends StatefulWidget {
  const ScriningScreen({super.key});

  @override
  State<ScriningScreen> createState() => _ScriningScreenState();
}

class _ScriningScreenState extends State<ScriningScreen> {
  final _ageController = TextEditingController();
  final _bloodController = TextEditingController();
  final _cholesterolControlller = TextEditingController();
  final _heartController = TextEditingController();
  final _depressionController = TextEditingController();

  String? selectedGender;
  String? selectedBloodSugar;
  String? selectedHeartDisease;
  String? selectedChestPainType;
  String? selectedEKGResult;
  String? selectedExercisePain;
  String? selectedStSlope;

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
                      title: 'Minggu, 12 Oktober 2025',
                      trailing: Text('00.40'),
                      isTitleBold: true,
                    ),
                    TileCard(
                      icon: Icons.assignment_turned_in_outlined,
                      lightColor: Colors.green,
                      darkColor: Colors.green.shade200,
                      title: "Hasil Skrining",
                      isTitleBold: true,
                      onTap: () {},
                    ),
                  ],
                ),
                SizedBox(height: 32),

                SectionTitle(title: 'Informasi Dasar'),
                SizedBox(height: 8),
                InputCard(
                  controller: _ageController,
                  title: 'Berapa usia anda saat ini?',
                  hintText: 'Masukkan usia dalam tahun',
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    debugPrint("Usia: $value");
                  },
                ),
                SizedBox(height: 16),
                ChoiceCard(
                  title: 'Apa jenis kelamin anda?',
                  options: ['Laki - Laki', 'Perempuan'],
                  selectedValue: selectedGender,
                  onChanged: (value) {
                    setState(() => selectedGender = value);
                  },
                ),
                SizedBox(height: 32),

                SectionTitle(title: 'Gejala dan Kondisi Fisik'),
                SizedBox(height: 8),
                InputCard(
                  controller: _bloodController,
                  title: 'Berapa tekanan darah anda saat istirahat?',
                  hintText: 'Masukkan tekanan darah (mm/Hg)',
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    debugPrint("Tekanan darah: $value");
                  },
                ),
                SizedBox(height: 16),
                InputCard(
                  controller: _cholesterolControlller,
                  title: 'Berapa kadar kolesterol total anda dalam darah?',
                  hintText: 'Masukkan kadar kolesterol (mg/dl)',
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    debugPrint("Level cholestrol: $value");
                  },
                ),
                SizedBox(height: 16),
                ChoiceCard(
                  title:
                      'Apakah gula darah anda >120 mg/dl setelah puasa 8 jam?',
                  options: ['Ya', 'Tidak'],
                  selectedValue: selectedBloodSugar,
                  onChanged: (value) {
                    setState(() => selectedBloodSugar = value);
                  },
                ),
                SizedBox(height: 16),
                ChoiceCard(
                  title: 'Apakah anda memiliki penyakit jantung?',
                  options: ['Ya', 'Tidak'],
                  selectedValue: selectedHeartDisease,
                  onChanged: (value) {
                    setState(() => selectedHeartDisease = value);
                  },
                ),
                SizedBox(height: 16),
                InputCard(
                  controller: _heartController,
                  title:
                      'Berapa detak jantung maksimum yang pernah anda capai?',
                  hintText: 'Masukkan detak jantung (bpm)',
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    debugPrint("Detak jantung: $value");
                  },
                ),
                SizedBox(height: 16),
                InputCard(
                  controller: _depressionController,
                  title:
                      'Berapa nilai depresi ST dibandingkan kondisi istirahat Anda?',
                  hintText: 'Masukkan nilai depresi',
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    debugPrint("Depresi: $value");
                  },
                ),
                SizedBox(height: 32),

                SectionTitle(title: 'Gejala Nyeri Dada'),
                SizedBox(height: 8),
                ChoiceCard(
                  title: 'Tipe nyeri dada apa yang paling sering Anda rasakan?',
                  options: [
                    'Typical Angina',
                    'Atypical Angina',
                    'Non-Anginal Pain',
                    'Asymptomatic',
                  ],
                  infoItems: [
                    {
                      'title': 'TA - Typical Angina',
                      'subtitle':
                          'Nyeri dada saat beraktivitas, dan hilang saat istirahat.',
                    },
                    {
                      'title': 'ATA - Atypical Angina',
                      'subtitle':
                          'Nyeri dada tidak biasa, muncul meski tidak aktif.',
                    },
                    {
                      'title': 'NAP - Non-Anginal Pain',
                      'subtitle':
                          'Nyeri dada bukan dari jantung, biasanya otot/tulang.',
                    },
                    { 
                      'title': 'ASY - Asymptomatic',
                      'subtitle': 'Tidak ada nyeri dada, pemeriksaan rutin tetap penting.',
                    },
                  ],
                  selectedValue: selectedChestPainType,
                  onChanged: (value) {
                    setState(() => selectedChestPainType = value);
                  },
                ),
                SizedBox(height: 16),
                ChoiceCard(
                  title:
                      'Apa hasil Elektrokardiogram (EKG) Anda saat istirahat?',
                  options: [
                    'Normal',
                    'gelombang ST-T abnormal',
                    'Left Ventricular Hypertrophy',
                  ],
                  infoItems: [
                    {
                      'title': 'Normal',
                      'subtitle':
                          'Jantung bekerja normal, aktivitas listrik jantung sehat',
                    },
                    {
                      'title': 'ST (Gelombang ST-T Abnormal)',
                      'subtitle':
                          'Gelombang listrik jantung berubah, aliran darah terganggu',
                    },
                    {
                      'title': 'LVH (Left Ventricular Hypertrophy)',
                      'subtitle':
                          'Otot jantung bagian kiri menebal, karena tekanan darah tinggi',
                    },
                  ],
                  selectedValue: selectedEKGResult,
                  onChanged: (value) {
                    setState(() => selectedEKGResult = value);
                  },
                ),
                SizedBox(height: 16),
                ChoiceCard(
                  title: 'Apakah anda mengalami nyeri dada saat berolahraga?',
                  options: ['Ya', 'Tidak'],
                  selectedValue: selectedExercisePain,
                  onChanged: (value) {
                    setState(() => selectedExercisePain = value);
                  },
                ),
                SizedBox(height: 16),
                ChoiceCard(
                  title:
                      'Bagaimana pola kemiringan segmen ST anda saat olahraga?',
                  options: ['Menanjak', 'Datar', 'Menurun'],
                  infoItems: [
                    {
                      'title': 'Menanjak (Up)',
                      'subtitle':
                          'Grafik naik, jantung merespon dengan baik saat aktivitas',
                    },
                    {
                      'title': 'Datar (Flat)',
                      'subtitle':
                          'Grafik datar, jantung tidak banyak berubah saat aktivitas',
                    },
                    {
                      'title': 'Menurun (Down)',
                      'subtitle':
                          'Grafik menurun, mungkin jantung kesulitan mendapat oksigen',
                    },
                  ],
                  selectedValue: selectedStSlope,
                  onChanged: (value) {
                    setState(() => selectedStSlope = value);
                  },
                ),
                SizedBox(height: 16),
                ClickButton(onPressed: () {}, textAction: 'Mulai Skrining'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _ageController.dispose();
    _bloodController.dispose();
    _cholesterolControlller.dispose();
    _heartController.dispose();
    _depressionController.dispose();
    super.dispose();
  }
}
