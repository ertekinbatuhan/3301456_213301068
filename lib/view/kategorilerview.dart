

import 'package:flutter/material.dart';
import 'package:yemek_app/model/kategorilerdao.dart';
import 'package:yemek_app/view/mealsview.dart';

import '../model/kategoriler.dart';

class KategorilerView extends StatefulWidget {
  const KategorilerView({Key? key}) : super(key: key);

  @override
  State<KategorilerView> createState() => _KategorilerViewState();

}

class _KategorilerViewState extends State<KategorilerView> {


    Future<List<Kategoriler>> tumKategoriler() async {

      var kategoriList = await KategorilerDao().tumKategoriler() ;



      return kategoriList ;


    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kategoriler"),
      ),
      body: FutureBuilder<List<Kategoriler>>(
        future: tumKategoriler(),
        builder: (context , snapshot){

          if( snapshot.hasData) {
            var kategoriList = snapshot.data ;

            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1 ,
                childAspectRatio: 2


              ),
              itemCount: kategoriList!.length,
              itemBuilder: (context , index) {
                var kategori = kategoriList[index] ;

                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MealsView(kategoriler: kategori)));

                  },
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 100,
                            child: Image.asset("images/${kategori.kategori_resim}")),
                        Text(kategori.kategori_isim,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),)
                      ],
                    ),
                  ),
                );





              },




            );


          } else {

            return Center() ;
          }

        }


      ),
    );
  }
}
