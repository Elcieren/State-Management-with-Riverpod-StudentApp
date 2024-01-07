import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MesajlarRpository  extends ChangeNotifier{
  final List<Mesaj> mesajlar = [
    Mesaj(
        'Merhaba', 'Ali', DateTime.now().subtract(const Duration(minutes: 3))),
    Mesaj('ordamisin ?', 'Ali',
        DateTime.now().subtract(const Duration(minutes: 2))),
    Mesaj('evet', 'Ayşe', DateTime.now().subtract(const Duration(minutes: 1))),
    Mesaj('Nasilsin', 'Ayşe', DateTime.now()),
  ];

}

final mesajlarProvider=ChangeNotifierProvider((ref){
   return MesajlarRpository();
});

class YeniMesaSayisi extends StateNotifier<int>{
  YeniMesaSayisi(super.state);

  void sifirla(){
    state=0;
  }
 
}


final yeniMesajSayisiProvider=StateNotifierProvider<YeniMesaSayisi ,int>((ref) {
  return YeniMesaSayisi(4);
});


class Mesaj {
  String yazi;
  String gonderen;
  DateTime zaman;

  Mesaj(this.yazi, this.gonderen, this.zaman);
}
