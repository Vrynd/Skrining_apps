class Term {
  final String title;
  final String subtitle;

  Term({required this.title, required this.subtitle});
}

class MedicalTerms {
  static final List<Term> chestPainTerms = [
    Term(
      title: 'TA (Typical Angina)',
      subtitle: 'Nyeri dada saat beraktivitas, dan hilang saat istirahat',
    ),
    Term(
      title: 'ATA (Atypical Angina)',
      subtitle: 'Nyeri dada tidak biasa, muncul meski tidak aktif',
    ),
    Term(
      title: 'NAP (Non-Anginal Pain)',
      subtitle: 'Nyeri dada bukan dari jantung, biasanya otot/tulang',
    ),
    Term(
      title: 'ASY (Asymptomatic)',
      subtitle: 'Tidak ada nyeri dada, pemeriksaan rutin tetap penting',
    ),
  ];

  static final List<Term> ekgTerms = [
    Term(
      title: 'Normal',
      subtitle: 'Jantung bekerja normal, aktivitas listrik jantung sehat',
    ),
    Term(
      title: 'ST (Gelombang ST-T Abnormal)',
      subtitle: 'Gelombang listrik jantung berubah, aliran darah terganggu',
    ),
    Term(
      title: 'LVH (Left Ventricular Hypertrophy)',
      subtitle: 'Otot jantung bagian kiri menebal, karena tekanan darah tinggi',
    ),
  ];

  static final List<Term> stSlopeTerms = [
    Term(
      title: 'Menanjak (Up)',
      subtitle: 'Grafik naik, jantung merespon dengan baik saat aktivitas',
    ),
    Term(
      title: 'Datar (Flat)',
      subtitle: 'Grafik datar, jantung tidak banyak berubah saat aktivitas',
    ),
    Term(
      title: 'Menurun (Down)',
      subtitle: 'Grafik menurun, mungkin jantung kesulitan mendapat oksigen',
    ),
  ];

  static final List<Term> exercisePainTerms = [
    Term(
      title: 'Ya',
      subtitle: 'Nyeri dada saat olahraga bisa tanda penyempitan pembuluh darah',
    ),
    Term(
      title: 'Tidak',
      subtitle: 'Tidak ada nyeri, jantung kemungkinan merespon normal',
    ),
  ];
}
