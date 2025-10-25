import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:skrining_apps/env/env.dart';

class TipsService {
  late final GenerativeModel model;

  TipsService() {
    final apiKey = Env.geminiApiKey;
    model = GenerativeModel(
      model: 'gemini-2.0-flash',
      apiKey: apiKey,
      systemInstruction: Content.system(
        '''Saya adalah asisten digital yang membantu memberikan tips pencegahan atau penanganan dini resiko gagal jantung berdasarkan data pengguna. Pengguna akan memberikan data-data dari prompt dalam urutan sebagai berikut (dipisahkan dengan koma):
usia (tahun), jenis kelamin (option: M, F), chestPainType (option: TA,ATA,NAP,ASY), restingBP (angka sistoliknya saja), kolesterol, fastingBS (indikator apakah gula darah puasa > 120mg/dl, option: ya/tidak), restingECG (option: normal, ST, LVH), maxHR, exerciseAngina (option: ya/tidak), oldpeak, ST_Slope (option: up, flat, down)
Setelah menerima data dari prompt seperti contoh:
67, F, ASY, 90, 87, Tidak, Normal, 100, Ya, 0, Up
Berikan hasil berupa tips singkat (1-3 kalimat) untuk setiap poin data, disertai saran praktis untuk mencegah atau mengurangi resiko gagal jantung. Gunakan bahasa sederhana, jelas, mudah dimengerti orang awam, fokus pada gaya hidup sehat dan pemeriksaan dini bukan diagnosis medis, jangan memberikan pengobatan spesifik atau dosis obat, jika data tampak beresiko tinggi berikan saran untuk segera konsultasi dengan dokter.
Format jawaban: 
usia: (tips terkait usia), jenis kelamin: (tips), chest pain type: (tips), tekanan darah: (tips), kolesterol: (tips), gula darah puasa: (tips), restingECG: (tips), maxHR: (tips), exerciseAngina: (tips), oldpeak: (tips), st slope: (tips), summary: (tips)
kemudian akhiri dengan summary singkat (1-3 kalimat) yang merangkum semua saran umum.''',
      ),
      generationConfig: GenerationConfig(
        temperature: 0,
        responseMimeType: 'application/json',
       responseSchema: Schema(
        SchemaType.object,
        requiredProperties: ["tips"],
        properties: {
          "tips": Schema(
            SchemaType.object,
            requiredProperties: [
              "age","sex","chestPainType","cholesterol","fastingBS","restingECG",
              "maxHR","exerciseAngina","oldpeak","ST_Slope","summary"
            ],
            properties: {
              "age": Schema(SchemaType.string),
              "sex": Schema(SchemaType.string),
              "chestPainType": Schema(SchemaType.string),
              "cholesterol": Schema(SchemaType.string),
              "fastingBS": Schema(SchemaType.string),
              "restingECG": Schema(SchemaType.string),
              "maxHR": Schema(SchemaType.string),
              "exerciseAngina": Schema(SchemaType.string),
              "oldpeak": Schema(SchemaType.string),
              "ST_Slope": Schema(SchemaType.string),
              "summary": Schema(SchemaType.string),
            },
          ),
        }
       ),
      ),
    );
  }

  Future<String> generateTips(List<dynamic> inputData) async {
    final String temp = inputData.join(', ');
    String prompt = 'Berikut data-data yang didapat dari pengguna sesuai dengan urutan: $temp';
    final content = [Content.text(prompt)];
    try {
      final response = await model.generateContent(content);
      if (response.text != null) {
        return response.text!;
      } else {
        throw Exception('tidak ada output dari generative ai');
      }
    } on GenerativeAIException catch (e) {
      throw Exception('Kesalahan dari API: ${e.message}');
    } catch (e) {
      print(e.toString());
      throw Exception('Terjadi kesalahan teknis saat melakukan generative ai');
    }
  }
}