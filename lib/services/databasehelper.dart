
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {

    static final  String databaseName = "meals.db" ;

    static Future<Database> databaseAccess() async {

      String databaseWay = join(await getDatabasesPath(),databaseName) ;

      if(await databaseExists(databaseWay)) { //veritabanı kontrol

      } else {
        //assetten veri alıyoruz.
        ByteData data = await rootBundle.load("database/${databaseName}");
        //veri tabanı kopyalamak için byte dönüşümü
        List<int> bytes = data.buffer.asUint8List(data.offsetInBytes,data.lengthInBytes);
        //veritabanını kopyalıyoruz
        await File(databaseWay).writeAsBytes(bytes,flush: true);

      }
      //veritabanını açıyoruz.
      return openDatabase(databaseWay);


    }

}