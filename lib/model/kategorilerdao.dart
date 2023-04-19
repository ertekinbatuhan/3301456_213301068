
import 'package:yemek_app/model/databasehelper.dart';
import 'package:yemek_app/model/kategoriler.dart';

class KategorilerDao{



  Future<List<Kategoriler>> tumKategoriler() async {


    var dataBase = await DatabaseHelper.databaseAccess() ;

    List<Map<String,dynamic>> maps = await  dataBase.rawQuery("SELECT * FROM kategoriler") ;


    return List.generate(maps.length, (index) {
      var line = maps[index] ;
      
      return Kategoriler(kategori_id: line["kategori_id"], kategori_isim: line["kategori_isim"], kategori_resim: line["kategori_resim"]);
      

    });


  }

}