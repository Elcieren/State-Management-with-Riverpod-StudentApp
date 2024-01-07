import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OgrencilerRepository extends ChangeNotifier {
  List<Ogrenci> ogrenciler = [
    Ogrenci('Ali', 'Sönmez', 21, 'Erkek'),
    Ogrenci('Ayşe', 'Çalışkan', 23, 'Kadın'),
    Ogrenci('Eren', 'Soydan', 22, 'Erkek'),
    Ogrenci('Burak', 'Gümüş', 24, 'Erkek'),
    Ogrenci('Alp', 'Kükreyen', 24, 'Erkek'),
    Ogrenci('Zeynep', 'KüDoğankreyen', 24, 'Erkek'),
    Ogrenci('Hakan ', 'Doğan', 24, 'Erkek'),
    Ogrenci('Fatma ', 'Doğan', 24, 'Erkek'),
  ];

  final Set<Ogrenci> sevdiklerim = {};
  void sev(Ogrenci ogrenci, bool seviyorMuyum) {
    if (seviyorMuyum) {
      sevdiklerim.add(ogrenci);
    } else {
      sevdiklerim.remove(ogrenci);
    }
    notifyListeners();
  }

  bool seviyorMuyum(Ogrenci ogrenci) {
    return sevdiklerim.contains(ogrenci);
  }
}

final ogrecilerProvider= ChangeNotifierProvider((ref) {
   return OgrencilerRepository();
});


class Ogrenci {
  String ad;
  String soyad;
  int yas;
  String cinsiyet;

  Ogrenci(this.ad, this.soyad, this.yas, this.cinsiyet);

  @override
  String toString() {
    return 'Ogrenci: isim: $ad,Soyad: $soyad ,yas: $yas ';
  }
}
