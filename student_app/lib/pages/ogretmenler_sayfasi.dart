import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_app/repository/ogretmenler_repository.dart';

class OgretmenlerSayfasi extends ConsumerWidget {

  const OgretmenlerSayfasi( {super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final ogretmenlerRepositorry=ref.watch(ogretmenlerProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Ogretmenler')),
      body: Column(
        children: [
          PhysicalModel(
            color: Colors.white,
            elevation: 10,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 32.0, vertical: 32.0),
                child: Text(
                    '${ogretmenlerRepositorry.ogretmenler.length} öğretmen'),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) => OgretmenlerListe(
                  ogretmenlerRepositorry.ogretmenler[index]),
              separatorBuilder: (context, index) => const Divider(),
              itemCount: ogretmenlerRepositorry.ogretmenler.length,
            ),
          ),
        ],
      ),
    );
  }
}

class OgretmenlerListe extends ConsumerWidget {
  final Ogretmen ogretmen;

  const OgretmenlerListe(
    this.ogretmen,  {
    super.key,
  });

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    bool seviyorMuyum = ref.watch(ogretmenlerProvider).seviyorMuyum(ogretmen);
    return ListTile(
      title: Text(ogretmen.ad + ' ' + ogretmen.soyad),
      leading:  IntrinsicWidth(
          child: Center(
              child:
                  Text(ogretmen.cinsiyet == 'Kadın' ? '👩' : '👦'))), //
      trailing: IconButton(
          onPressed: () {
           ref.read(ogretmenlerProvider).sev(ogretmen,!seviyorMuyum);
          },
          icon: Icon(seviyorMuyum
              ? Icons.favorite
              : Icons.favorite_border)),
    );
  }
}
