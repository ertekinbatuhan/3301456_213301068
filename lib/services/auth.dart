import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';




class AuthService {


  final FirebaseAuth _auth = FirebaseAuth.instance ;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance ;

   // giriş fonksiyonu
   Future<User?> signIn(String email , String password) async {

    var user =  await _auth.signInWithEmailAndPassword(email: email , password: password) ;

    return user.user ;



  }
   // çıkış fonksiyonu
  signOut()  async {
     return await _auth.signOut() ;


  }

  Future<User?> createPerson(String email , String password) async {

     var user = await _auth.createUserWithEmailAndPassword(email: email, password: password) ;

     await _firestore.collection("Kisi").doc(user.user!.uid).set({
       "userEmail : " : email ,
       "userPassword" : password
     });


     return user.user ;



  }



}