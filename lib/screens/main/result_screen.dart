import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skrining_apps/components/widget/scaffold_widget.dart';
import 'package:skrining_apps/models/tips_response.dart';
import 'package:skrining_apps/provider/generate_tips_provider.dart';
import 'package:skrining_apps/provider/prediction_provider.dart';
import 'package:skrining_apps/screens/routes/route_screen.dart';
import 'package:skrining_apps/state/prediction_result_state.dart';

class ResultScreen extends StatefulWidget {
  final List<dynamic> inputData;
  final List<dynamic> data;
  const ResultScreen({super.key,required this.inputData,required this.data});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      await context.read<PredictionProvider>().fetchPrediction(widget.inputData);
      await context.read<GenerateTipsProvider>().generateAnswer(widget.data);
    });
  }

  @override
  Widget build(BuildContext context) {
    final isApiLoading = context.watch<PredictionProvider>().resultState;
    final isGenerateTipsLoading = context.watch<GenerateTipsProvider>().isLoading;
    if (isApiLoading is PredictionLoadingState || isGenerateTipsLoading == true) {
      return ScaffoldWigdet(
        appBar: AppBar(
          title: Text('Hasil'),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        body: SafeArea(
          child: Center(child: CircularProgressIndicator()),
        ),
      );
      
    }else if(isApiLoading is PredictionLoadedState){
      return buildUI(context);
    }else if (isApiLoading is PredictionErrorState){
      String message = isApiLoading.error;
      return ScaffoldWigdet(
        appBar: AppBar(
          title: Text('Hasil'),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        body: SafeArea(
          child: Center(child: Text(message)),
        ),
      );
    }else{
      return ScaffoldWigdet(
        appBar: AppBar(
          title: Text('Hasil'),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        body: SizedBox(),
      );
    }
  }

  Widget buildUI(BuildContext context) {
    final viewData = context.read<GenerateTipsProvider>().answer;
    // late TipsResponse viewData;

    return ScaffoldWigdet(
      appBar: AppBar(
        title: Text('Hasil'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
          children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerLowest,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Theme.of(context).colorScheme.outlineVariant,
                ),
              ),
              child: Column(
                children: [
                  ListTile(
                    dense: true,
                    title: Text('Usia'),
                    trailing: Text(widget.data[0]),
                  ),
                  Divider(
                    height: 0,
                    color: Theme.of(context).colorScheme.outlineVariant,
                  ),
                  ListTile(
                    dense: true,
                    title: Text('Jenis Kelamin'),
                    trailing: widget.data[1] == 'M' ? Text('Laki-Laki') : Text('Perempuan'),
                  ),
                  Divider(
                    height: 0,
                    color: Theme.of(context).colorScheme.outlineVariant,
                  ),
                  ListTile(
                    dense: true,
                    title: Text('Tipe nyeri dada'),
                    trailing: Text(widget.data[2]),
                  ),
                  Divider(
                    height: 0,
                    color: Theme.of(context).colorScheme.outlineVariant,
                  ),
                  ListTile(
                    dense: true,
                    title: Text('Tekanan Darah'),
                    trailing: Text(widget.data[3]),
                  ),
                  Divider(
                    height: 0,
                    color: Theme.of(context).colorScheme.outlineVariant,
                  ),
                  ListTile(
                    dense: true,
                    title: Text('Kadar Kolestrol'),
                    trailing: Text(widget.data[4]),
                  ),
                  Divider(
                    height: 0,
                    color: Theme.of(context).colorScheme.outlineVariant,
                  ),
                  ListTile(
                    dense: true,
                    title: Text('Gula Darah > 120'),
                    trailing: Text(widget.data[5]),
                  ),
                  Divider(
                    height: 0,
                    color: Theme.of(context).colorScheme.outlineVariant,
                  ),
                  ListTile(
                    dense: true,
                    title: Text('Hasil Elektrokardiagram'),
                    trailing: Text(widget.data[6]),
                  ),
                  Divider(
                    height: 0,
                    color: Theme.of(context).colorScheme.outlineVariant,
                  ),
                  ListTile(
                    dense: true,
                    title: Text('Berapa detak jantung anda'),
                    trailing: Text(widget.data[7]),
                  ),
                  Divider(
                    height: 0,
                    color: Theme.of(context).colorScheme.outlineVariant,
                  ),
                  ListTile(
                    dense: true,
                    title: Text('Nyeri dada saat beroalahraga'),
                    trailing: Text(widget.data[8]),
                  ),
                  Divider(
                    height: 0,
                    color: Theme.of(context).colorScheme.outlineVariant,
                  ),
                  ListTile(
                    dense: true,
                    title: Text('Berapa nilai depresi'),
                    trailing: Text(widget.data[9]),
                  ),
                  Divider(
                    height: 0,
                    color: Theme.of(context).colorScheme.outlineVariant,
                  ),
                  ListTile(
                    dense: true,
                    title: Text('Pola Kemiringan saat berolahraga'),
                    trailing: Text(widget.data[10]),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerLowest,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Theme.of(context).colorScheme.outlineVariant,
                ),
              ),
              child: Column(
                children: [
                  // ListTile(
                  //   dense: true,
                  //   title: Text('Apakah Memiliki Penyakit Jantung?'),
                  //   trailing: Text('Ya/Tidak'),
                  // ),
                  Text(viewData!.tips.age),
                  Text(viewData.tips.sex),
                  Text(viewData.tips.chestPainType),
                  Text(viewData.tips.cholesterol),
                  Text(viewData.tips.fastingBs),
                  Text(viewData.tips.restingEcg),
                  Text(viewData.tips.maxHr),
                  Text(viewData.tips.exerciseAngina),
                  Text(viewData.tips.oldpeak),
                  Text(viewData.tips.stSlope),
                  Text(viewData.tips.summary),
                ],
              ),
            ),
            SizedBox(height: 24),
            Container(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerLowest,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Theme.of(context).colorScheme.outlineVariant,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('Resiko Terkena Penyakit Gagal Jantung?'),
                  SizedBox(height: 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Rendah',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      Icon(
                        Icons.check_circle_outline,
                        color: Theme.of(context).colorScheme.primary,
                        size: 30,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, RouteScreen.home.name);
              },
              child: Text('Kembali Ke Beranda'),
            ),
          ],
        ),
      ),
    );
  }
}