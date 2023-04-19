

import 'kategoriler.dart';

class Yemekler {

  int yemek_id ;
  String yemek_isim ;
  int yemek_fiyat;
  String yemek_resim ;
  Kategoriler kategori ;

  Yemekler({required this.yemek_id, required this.yemek_isim, required this.yemek_fiyat, required this.yemek_resim,
    required this.kategori});
}