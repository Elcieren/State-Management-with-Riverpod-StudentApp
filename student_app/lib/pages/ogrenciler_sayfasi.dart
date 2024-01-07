import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_app/repository/ogrenciler_repository.dart';

class OgrencilerSayfasi extends ConsumerWidget {
  const OgrencilerSayfasi( {super.key});

  
  @override
  Widget build(BuildContext context,WidgetRef ref) {
   final ogrencilerRepository = ref.watch(ogrecilerProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Öğrenciler'),
      ),
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
                    '${ogrencilerRepository.ogrenciler.length} Öğrenci'),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) => OgrenciSatiri(
                ogrencilerRepository.ogrenciler[index],

              ),
              separatorBuilder: (context, index) => const Divider(),
              itemCount: ogrencilerRepository.ogrenciler.length,
            ),
          ),
          ElevatedButton(
              onPressed: () {
                print(ogrencilerRepository.sevdiklerim);
              },
              child: const Text('Sevdiğin Öğrenciler'))
        ],
      ),
    );
  }
}

class OgrenciSatiri extends ConsumerWidget {
  final Ogrenci ogrenci;

  const OgrenciSatiri(
    this.ogrenci,
     {
    super.key,
  });

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    bool seviyorMuyum =
        ref.watch(ogrecilerProvider).seviyorMuyum(ogrenci);
    return ListTile(
      title: Text(ogrenci.ad + ' ' + ogrenci.soyad),
      leading: IntrinsicWidth(
          child: Center(
              child:
                  Text(ogrenci.cinsiyet == 'Kadın' ? '👩' : '👦'))), //
      trailing: IconButton(
          onPressed: () {
            
           ref.read(ogrecilerProvider).sev(ogrenci, !seviyorMuyum);
          },
          icon: Icon(seviyorMuyum ? Icons.favorite : Icons.favorite_border)),
    );
  }
}
