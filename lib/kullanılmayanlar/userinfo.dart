


import 'package:cloud_firestore/cloud_firestore.dart';

class UsersInfo{
  late String id ;
  late String name ;
  late String surName ;
  late String address ;

  UsersInfo({required this.id ,required this.name , required this.surName , required this.address}) ;




  factory UsersInfo.fromSnapshot(DocumentSnapshot snapshot) {
    return UsersInfo(
      id : snapshot.id ,
      name : snapshot["name"],
      surName: snapshot["surname"],
      address: snapshot["address"],

    );

    }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'surName': surName,
      'address': address,

    };
  }


  UsersInfo.fromFirestore(Map<String, dynamic> firestore) : id = firestore["id"],
  name = firestore['name'],
  surName = firestore['surName'],
  address = firestore['address'];

  }
