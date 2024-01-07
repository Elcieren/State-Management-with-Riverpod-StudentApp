import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_app/pages/mesajlar_sayfasi.dart';
import 'package:student_app/pages/ogrenciler_sayfasi.dart';
import 'package:student_app/pages/ogretmenler_sayfasi.dart';
import 'package:student_app/repository/mesajlar_repository.dart';
import 'package:student_app/repository/ogrenciler_repository.dart';
import 'package:student_app/repository/ogretmenler_repository.dart';

void main() {
  runApp(const ProviderScope(child: OgrenciApp()));
}

class OgrenciApp extends StatelessWidget {
  const OgrenciApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ogrenci Uygulamasi',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AnaSayfa(title: 'Ögrenci Ana Sayfa'),
    );
  }
}

class AnaSayfa extends ConsumerWidget {
  const AnaSayfa({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ogrencilerRepository = ref.watch(ogrecilerProvider);
    final ogretmenlerRepositorry = ref.watch(ogretmenlerProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      drawer: Drawer(
          child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text(
              'Öğrenci Adi ',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.message),
            title: const Text('Öğrenciler'),
            onTap: () {
              _OgrencilereGit(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.account_circle),
            title: const Text('Öğretmenler'),
            onTap: () {
              _OgretmenlereGit(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.account_circle),
            title: const Text('Mesajlar'),
            onTap: () {
              _mesajlaraGit(context);
            },
          ),
        ],
      )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
                onPressed: () {
                  _mesajlaraGit(context);
                },
                child:
                    Text('${ref.watch(yeniMesajSayisiProvider)} Yeni Mesaj')),
            TextButton(
                onPressed: () {
                  _OgrencilereGit(context);
                },
                child:
                    Text('${ogrencilerRepository.ogrenciler.length} Ogrenci')),
            TextButton(
                onPressed: () {
                  _OgretmenlereGit(context);
                },
                child: Text(
                    '${ogretmenlerRepositorry.ogretmenler.length} Ogretmen')),
          ],
        ),
      ),
    );
  }

  void _OgrencilereGit(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const OgrencilerSayfasi(),
    ));
  }

  void _OgretmenlereGit(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const OgretmenlerSayfasi(),
    ));
  }

  Future<void> _mesajlaraGit(BuildContext context) async {
    await Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const MesajlarSayfasi(),
    ));
  }
}
