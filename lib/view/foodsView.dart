
import 'package:flutter/material.dart';

import 'detailsView.dart';

import '../model/meals.dart';




class FoodsView extends StatefulWidget {
  const FoodsView({Key? key}) : super(key: key);

  @override
  State<FoodsView> createState() => _FoodsViewState();
}

class _FoodsViewState extends State<FoodsView> {

  Future<List<Meals>>  getMeals() async {

    var mealsList = <Meals>[];

    var etliEkmek= Meals(meal_id: 1 , meal_name: "Etli Ekmek" , meal_price: 60.0,meal_picture: "etliekmek.jpg");
    var adana = Meals(meal_id: 2,meal_name: "Adana Kebap" , meal_price: 80.0,meal_picture: "adana.jpeg");
    var iskender = Meals(meal_id: 3,meal_name: "İskender",meal_price: 100.0,meal_picture: "iskender.JPG");
    var tavukSis = Meals(meal_id: 4,meal_name: "Tavuk Şiş",meal_price: 65.99,meal_picture: "tavuk-sis.jpg");
    var karniYarik= Meals(meal_id: 5,meal_name: "Karnıyarık",meal_price: 55.50,meal_picture: "karniyarik.jpg");
    var kuruFasulye=Meals(meal_id: 6,meal_name: "Kuru Fasulye" , meal_price: 79.99,meal_picture: "kurufasulye.jpg");
    var nohut = Meals(meal_id: 7,meal_name: "Nohut",meal_price: 66.99,meal_picture: "nohut.jpeg");
    var barbunya = Meals(meal_id: 8,meal_name: "Barbunya",meal_price: 50.0,meal_picture: "barbunya.jpg");
    var firindaTavuk = Meals(meal_id: 9,meal_name: "Fırında Tavuk", meal_price: 250.0,meal_picture: "firinda-tavuk.jpg");
    var servisDoner = Meals(meal_id: 10,meal_name: "Servis Döner",meal_price: 45.50,meal_picture: "doner.jpg");



    mealsList.add(etliEkmek);
    mealsList.add(adana);
    mealsList.add(iskender);
    mealsList.add(karniYarik);
    mealsList.add(kuruFasulye);
    mealsList.add(nohut);
    mealsList.add(servisDoner);
    mealsList.add(firindaTavuk);
    mealsList.add(tavukSis);
    mealsList.add(barbunya);










    return mealsList ;



  }

  bool search = false ;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: search ? const TextField(decoration: InputDecoration(hintText:"Aramak istediğinizi yazınız"),)
            : const Text("Yemekler"),


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
      body: FutureBuilder<List<Meals>>(
        future: getMeals(),
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
                              width: 100,height: 100,
                              child: CircleAvatar(
                                radius: 50,
                                backgroundImage: AssetImage("images/${meal.meal_picture}"),
                              )),
                             // Image.asset("images/${meal.meal_picture}" ,)),

                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Text(meal.meal_name!, style: const TextStyle(

                                  fontStyle: FontStyle.italic ,
                                  fontSize: 20,
                                  color: Colors.red,

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
