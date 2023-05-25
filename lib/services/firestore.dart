



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:yemek_app/model/userinfo.dart';

class FireStoreService {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance ;

   // Veri ekleme
 Future<UsersInfo> addData(String name , String surName , String address) async {
    var ref = _firestore.collection("UserInfo") ;

    var documentRef = await  ref.add({

      'name' : name ,
      'surName' : surName ,
      'address' : address
    });

    return UsersInfo(id: documentRef.id , name: name , surName:  surName ,address:  address) ;



  }

   // Veri gösterme

    /*   getData() async {
       var userStream =   _firestore.collection("UserInfo").snapshots() ;
       userStream.listen((event) {
         event.docs.forEach((element) {
           element.data() ;
         });
       }
       );
       }

     */
     Stream<QuerySnapshot> getData() {
       var ref = _firestore.collection("UserInfo").snapshots();

       return ref ;

     }



     // Veri silme

    Future<void> removeData(String Id) {
   var ref = _firestore.collection("UserInfo").doc(Id).delete() ;

   return ref ;

    }

}