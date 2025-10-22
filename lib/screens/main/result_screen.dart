import 'package:flutter/material.dart';
import 'package:skrining_apps/components/widget/scaffold_widget.dart';
import 'package:skrining_apps/screens/routes/route_screen.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    trailing: Text('23'),
                  ),
                  Divider(
                    height: 0,
                    color: Theme.of(context).colorScheme.outlineVariant,
                  ),
                  ListTile(
                    dense: true,
                    title: Text('Jenis Kelamin'),
                    trailing: Text('Laki-Laki'),
                  ),
                  Divider(
                    height: 0,
                    color: Theme.of(context).colorScheme.outlineVariant,
                  ),
                  ListTile(
                    dense: true,
                    title: Text('Tekanan Darah'),
                    trailing: Text('120'),
                  ),
                  Divider(
                    height: 0,
                    color: Theme.of(context).colorScheme.outlineVariant,
                  ),
                  ListTile(
                    dense: true,
                    title: Text('Kadar Kolestrol'),
                    trailing: Text('120'),
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
                  ListTile(
                    dense: true,
                    title: Text('Gula Darah > 120'),
                    trailing: Text('Ya/Tidak'),
                  ),
                  Divider(
                    height: 0,
                    color: Theme.of(context).colorScheme.outlineVariant,
                  ),
                  ListTile(
                    dense: true,
                    title: Text('Apakah Memiliki Penyakit Jantung?'),
                    trailing: Text('Ya/Tidak'),
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
                  ListTile(
                    dense: true,
                    title: Text('Berapa detak jantung anda'),
                    trailing: Text('180'),
                  ),
                  Divider(
                    height: 0,
                    color: Theme.of(context).colorScheme.outlineVariant,
                  ),
                  ListTile(
                    dense: true,
                    title: Text('Berapa nilai depresi'),
                    trailing: Text('100'),
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
                  ListTile(
                    dense: true,
                    title: Text('Tipe nyeri dada'),
                    trailing: Text('Asymptoatic'),
                  ),
                  Divider(
                    height: 0,
                    color: Theme.of(context).colorScheme.outlineVariant,
                  ),
                  ListTile(
                    dense: true,
                    title: Text('Hasil Elektrokardiagram'),
                    trailing: Text('Normal'),
                  ),
                  Divider(
                    height: 0,
                    color: Theme.of(context).colorScheme.outlineVariant,
                  ),
                  ListTile(
                    dense: true,
                    title: Text('Nyeri dada saat beroalahraga'),
                    trailing: Text('Ya'),
                  ),
                  Divider(
                    height: 0,
                    color: Theme.of(context).colorScheme.outlineVariant,
                  ),
                  ListTile(
                    dense: true,
                    title: Text('Pola Kemiringan saat berolahraga'),
                    trailing: Text('Menanjak'),
                  ),
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
