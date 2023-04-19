
import 'package:yemek_app/model/kategoriler.dart';
import 'package:yemek_app/model/meals.dart';

import 'databasehelper.dart';

class Mealsdao{
  Future<List<Yemekler>> tumYemekler(int kategori_id) async {


    var dataBase = await DatabaseHelper.databaseAccess() ;

    List<Map<String,dynamic>> maps = await dataBase.rawQuery("SELECT * FROM yemekler,kategoriler "
        "WHERE yemekler.kategori_id = kategoriler.kategori_id and yemekler.kategori_id = $kategori_id"
    );


    return List.generate(maps.length, (index) {
      
      var line = maps[index] ;
      
      var kategori = Kategoriler(kategori_id: line["kategori_id"], kategori_isim: line["kategori_isim"], kategori_resim: line["kategori_isim"]);
      var yemek = Yemekler(yemek_id: line["yemek_id"], yemek_isim: line["yemek_isim"], yemek_fiyat: line["yemek_fiyat"], yemek_resim: line["yemek_resim"], kategori: kategori);



      return yemek ;


    });


  }
}