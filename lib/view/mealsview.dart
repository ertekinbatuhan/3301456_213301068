
import 'package:flutter/material.dart';
import 'package:yemek_app/model/kategoriler.dart';
import 'package:yemek_app/model/mealsdao.dart';

import 'detailsview.dart';

import '../model/meals.dart';




class MealsView extends StatefulWidget {

  Kategoriler kategoriler ;

  MealsView({required this.kategoriler});

  @override
  State<MealsView> createState() => _MealsViewState();
}

class _MealsViewState extends State<MealsView> {

  Future<List<Yemekler>>  tumYemekler(int kategori_id) async {

    var mealsList =  await Mealsdao().tumYemekler(kategori_id);

  //  var etliEkmek= Yemekler(yemek_id: 1 , yemek_isim: "Etli Ekmek" , yemek_fiyat: 60,meal_picture: "etliekmek.jpg");
   // var adana = Yemekler(yemek_id: 2,yemek_isim: "Adana Kebap" , yemek_fiyat: 80,meal_picture: "adana.jpeg");
   // var iskender = Yemekler(yemek_id: 3,yemek_isim: "İskender",yemek_fiyat: 100,meal_picture: "iskender.JPG");
   // var tavukSis = Yemekler(yemek_id: 4,yemek_isim: "Tavuk Şiş",yemek_fiyat: 65,meal_picture: "tavuk-sis.jpg");
   // var karniYarik= Yemekler(yemek_id: 5,yemek_isim: "Karnıyarık",yemek_fiyat: 55,meal_picture: "karniyarik.jpg");
   // var kuruFasulye=Yemekler(yemek_id: 6,yemek_isim: "Kuru Fasulye" , yemek_fiyat: 79,meal_picture: "kurufasulye.jpg");
   // var nohut = Yemekler(yemek_id: 7,yemek_isim: "Nohut",yemek_fiyat: 66,meal_picture: "nohut.jpeg");
   // var barbunya = Yemekler(yemek_id: 8,yemek_isim: "Barbunya",yemek_fiyat: 50,meal_picture: "barbunya.jpg");
   // var firindaTavuk = Yemekler(yemek_id: 9,yemek_isim: "Fırında Tavuk", yemek_fiyat: 250,meal_picture: "firinda-tavuk.jpg");
   // var servisDoner = Yemekler(yemek_id: 10,yemek_isim: "Servis Döner",yemek_fiyat: 45,meal_picture: "doner.jpg");



   // mealsList.add(etliEkmek);
   // mealsList.add(adana);
   // mealsList.add(iskender);
   // mealsList.add(karniYarik);
   // mealsList.add(kuruFasulye);
   // mealsList.add(nohut);
   // mealsList.add(servisDoner);
   // mealsList.add(firindaTavuk);
   // mealsList.add(tavukSis);
   // mealsList.add(barbunya);


    return mealsList ;











    return mealsList ;



  }

  bool search = false ;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: search ? const TextField(decoration: InputDecoration(hintText:"Aramak istediğinizi yazınız"),)
            : Text(widget.kategoriler.kategori_isim),


        actions: [
          search ?
          IconButton(
            icon: Icon(Icons.cancel),
            onPressed: () {
              setState(() {
                search = false ;

              });

            },

          )

              : IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              setState(() {
                search = true ;
              });

            },
          )
        ],
      ),
      body: FutureBuilder<List<Yemekler>>(
        future: tumYemekler(widget.kategoriler.kategori_id),
        builder: (context, getData){

          if(getData.hasData) {
            var mealList = getData.data ;
            return ListView.builder(
              itemCount: mealList!.length,
              itemBuilder: (context , index ) {
                var meal = mealList[index];


                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Details(meals: meal )));
                  },
                  child: Card(
                      child:Row(
                        children: [
                          SizedBox(
                              width: 80,height: 100,
                              child: CircleAvatar(
                                radius: 50,
                                backgroundImage: AssetImage("images/${meal.yemek_resim}"),
                              )),
                             // Image.asset("images/${meal.meal_picture}" ,)),

                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Text(meal.yemek_isim!, style: const TextStyle(

                                  fontStyle: FontStyle.italic ,
                                  fontSize: 20,
                                  color: Colors.black,

                                ),),
                              )

                            ],
                          ),
                          const Spacer(),
                          Icon(Icons.arrow_right)
                        ],
                      )
                  ),
                );
              },
            );


          }else {
            return const Center() ;

          }
        },
      ),

    );
  }
}
