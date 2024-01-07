import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OgrtmenlerRepositorry extends ChangeNotifier{
  List<Ogretmen> ogretmenler = [
    Ogretmen('Ali', 'Sönmez', 21, 'Erkek'),
    Ogretmen('Eren', 'Soydan', 22, 'Erkek'),
    Ogretmen('Burak', 'Gümüş', 24, 'Erkek'),
  ];

  final Set<Ogretmen> sevdiklerim = {};
  void sev(Ogretmen ogretmen, bool seviyorMuyum) {
    if (seviyorMuyum) {
      sevdiklerim.add(ogretmen);
    } else {
      sevdiklerim.remove(ogretmen);
    }
    notifyListeners();
  }

  bool seviyorMuyum(Ogretmen ogretmen) {
    return sevdiklerim.contains(ogretmen);
  }
}
final ogretmenlerProvider=ChangeNotifierProvider((ref) {
       return OgrtmenlerRepositorry();
});

class Ogretmen {
  String ad;
  String soyad;
  int yas;
  String cinsiyet;

  Ogretmen(this.ad, this.soyad, this.yas, this.cinsiyet);
}
