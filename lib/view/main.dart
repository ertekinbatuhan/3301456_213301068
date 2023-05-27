import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';



import 'package:yemek_app/json/homepage.dart';

import 'package:yemek_app/provider/file_operations.dart';
import 'package:yemek_app/services/auth.dart';


import 'package:yemek_app/view/kategorilerview.dart';

import 'package:yemek_app/view/registerview.dart';


import 'package:yemek_app/view/userinfoview.dart';



import '../firestore/homepage.dart';
import '../kullanılmayanlar/firabaseview.dart';
import 'addview.dart';
import 'package:google_fonts/google_fonts.dart';




Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Foods App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home:


     // FireStoreHomePage()
     // HomePage()

     // Testing()

      // DomainFirmsView()
     // StatusListPage()
     // Products()


    MyHomePage(title: 'Hoşgeldiniz'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {








  var  formKey = GlobalKey<FormState>();
  var userEmail = TextEditingController();
  var userPassword = TextEditingController();

  AuthService _authService = AuthService();








  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [

              const DrawerHeader(child: Center(child: Text("Follow me", style: TextStyle(fontSize: 25.0),)),
                decoration: BoxDecoration(color: Colors.orange),),
              const ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage("icons/github.jpg"),
                ),
                title: Text("GitHub"),
                subtitle: Text("github.com/ertekinbatuhan",style: TextStyle(color: Colors.black),),

              ),
              const ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage("icons/linkedin.jpg"),
                ),
                title: Text("Linkedin"),
                subtitle: Text("Batuhan Berk Ertekin",style: TextStyle(color: Colors.black),)
                ,
              ),
              const ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage("icons/instagram.jpg") ,
                ),
                title: Text("Instagram"),
                subtitle: Text("berk.btuhan",style: TextStyle(color: Colors.black),),
              ),
              const ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage("icons/gmail.jpg"),
                ),
                title: Text("E-mail"),
                subtitle: Text("batuhanertekinn@gmail.com",style: TextStyle(color: Colors.black),),
              ),
              ListTile(
                leading: const CircleAvatar(
                  backgroundImage: AssetImage("icons/firebase.png"),
                ),
                title: const Text("FireStore CRUD"),
                onTap: () {
                 // Navigator.push(context, MaterialPageRoute(builder: (context) => UserInfo()));
                  //Navigator.push(context, MaterialPageRoute(builder: (context) => UserInfoo())) ;
                    Navigator.push(context, MaterialPageRoute(builder: (context) => FireStoreHomePage())) ;



                },
              ),
              ListTile(
                leading: const CircleAvatar(
                  backgroundImage: AssetImage("icons/iletisim.png"),
                ),
                title: const Text("İletişim"),
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => UserInfo()));
                  //Navigator.push(context, MaterialPageRoute(builder: (context) => UserInfoo())) ;
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage())) ;



                },
              )



            ],
          ),
        ),

        appBar: AppBar(
          title: Text(widget.title,style: GoogleFonts.acme(),),
        ),
        body: Column(

          children: [
            Image.asset("images/team.png",width: 500, height: 250,),
            Form(
              key: formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: userEmail,
                      decoration:  const InputDecoration(hintText: "E posta giriniz" ,
                          prefixIcon: Icon(Icons.account_circle),
                          filled: true ,
                          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20.0)))),
                      validator: (input){

                      //  if (input!.isEmpty) {
                        //  return "Kullanıcı adı giriniz " ;

                      //  }
                       // if (input != "batuhan") {
                        //  return "Kullanıcı adı yanlış " ;

                      //  }
                       // return null ;

                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      obscureText: true,
                      controller: userPassword,
                      decoration: const InputDecoration(hintText: "Şifre giriniz " ,
                          prefixIcon: Icon(Icons.lock),
                          filled: true,

                          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20.0)))),
                      validator: (input){
                       // if (input!.isEmpty) {
                         // return "Parola giriniz " ;

                       // }
                      //  if ( input.length < 6 ) {
                        //  return "Şifre 6 haneden küçük olamaz" ;
                       // }
                       // if ( input != "123456") {
                         // return "Yanlış şifre" ;

                       // }
                       // return null ;


                      },
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      width: 300,
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.keyboard_arrow_right,size: 18,),
                        label: const Text("Giriş Yap"),
                        style: ElevatedButton.styleFrom(

                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(20.0)),

                            )
                        ),
                        onPressed: () {
                          //her şey null ise true gelir.

                          _authService.signIn(userEmail.text, userPassword.text).then((value) {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const KategorilerView()));
                          });

                        //  bool controllerResult = formKey.currentState!.validate();
                        //  if ( controllerResult ) {



                         // }

                        },

                      ),
                    ),
                  ),
                  SizedBox(
                    width: 300,
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.keyboard_arrow_right,size: 18,),
                      label: const Text("Kayıt Ol"),



                      style: ElevatedButton.styleFrom(
                          shape:  const RoundedRectangleBorder(

                              borderRadius: BorderRadius.all(Radius.circular(20.0))
                          )
                      ),
                      onPressed: () {


                       // Navigator.push(context, MaterialPageRoute(builder: (context) => const XdPage()));
                     Navigator.push(context, MaterialPageRoute(builder: (context) => const Register()));
                       // ScaffoldMessenger.of(context).showSnackBar(
                          // const SnackBar(content: Text("Kayıt ol butonu daha sonra aktif olacak."))


                       // );






                      },

                    ),
                  ),
                 /* Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(width: 300,
                      child: ElevatedButton.icon(
                        label: const Text("Bilgi Ekle"),
                        icon: const Icon(Icons.add),
                        style: ElevatedButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(20.0))
                            )
                        ),

                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Adduserinfo()));



                        },
                      ),
                    ),
                  ),

                  */
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(width: 300,
                      child: ElevatedButton.icon(
                        label: const Text("Dosya Oku"),
                        icon: const Icon(Icons.mark_chat_read),
                        style: ElevatedButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(20.0))
                            )
                        ),

                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => FileOperationsScreen()));



                        },
                      ),
                    ),
                  )

                ],
              ),
            )



          ],
        )

    );
  }
}