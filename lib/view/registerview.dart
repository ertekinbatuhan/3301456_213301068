import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yemek_app/services/auth.dart';
import 'package:yemek_app/view/main.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var  formKey = GlobalKey<FormState>();
  var userEmail = TextEditingController();
  var userPassword = TextEditingController();

  AuthService _authService = AuthService() ;




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kayıt Olunuz"),

      ),
      body: Center(

        child: Column(
          children: [
            Image.asset("icons/register.png",width: 300,),

            Form(key: formKey,
            child: Column(
              children: [

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: userEmail,
                    decoration: const InputDecoration(
                      hintText: "E posta giriniz" ,
                      prefixIcon: Icon(Icons.account_box),
                        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(25.0)))),
                    ),
                ),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: userPassword,
                    decoration: const InputDecoration(
                      hintText: "Şifre giriniz" ,
                      prefixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(25.0)))),
                    ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: SizedBox(width: 150,
                    child: ElevatedButton(
                      child:  Text("Kayıt Ol"),
                      style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10.0))
                          )
                      ),



                      onPressed: () {
                        _authService.createPerson(userEmail.text, userPassword.text).then((value) {
                          return Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp())) ;

                        });
                        //Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp())) ;

                      },
                    ),
                  ),
                )


              ],
            ),),



          ],
        ),
      ),
    );

  }

}
