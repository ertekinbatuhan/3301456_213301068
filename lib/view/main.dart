import 'package:flutter/material.dart';

import 'foodsView.dart';
import 'package:google_fonts/google_fonts.dart';




void main() {
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
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(title: 'Hoşgeldiniz'),
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
  var userName = TextEditingController();
  var userPassword = TextEditingController();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: const [
              DrawerHeader(child: Center(child: Text("Follow me", style: TextStyle(fontSize: 20.0),)),
                decoration: BoxDecoration(color: Colors.purple),),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage("icons/github.jpg"),
                ),
                title: Text("GitHub"),
                subtitle: Text("github.com/ertekinbatuhan",style: TextStyle(color: Colors.black),),

              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage("icons/linkedin.jpg"),
                ),
                title: Text("Linkedin"),
                subtitle: Text("Batuhan Berk Ertekin",style: TextStyle(color: Colors.black),)
                ,
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage("icons/instagram.jpg") ,
                ),
                title: Text("Instagram"),
                subtitle: Text("berk.btuhan",style: TextStyle(color: Colors.black),),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage("icons/gmail.jpg"),
                ),
                title: Text("E-mail"),
                subtitle: Text("batuhanertekinn@gmail.com",style: TextStyle(color: Colors.black),),
              )

            ],
          ),
        ),

        appBar: AppBar(
          title: Text(widget.title,style: GoogleFonts.acme(),),
        ),
        body: Column(

          children: [
            Image.asset("images/login.png",width: 500, height: 250,),
            Form(
              key: formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: userName,
                      decoration:  const InputDecoration(hintText: "Kullanıcı adı giriniz " ,
                          prefixIcon: Icon(Icons.account_circle),
                          filled: true ,
                          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20.0)))),
                      validator: (input){

                        if (input!.isEmpty) {
                          return "Kullanıcı adı giriniz " ;

                        }
                        if (input != "batuhan") {
                          return "Kullanıcı adı yanlış " ;

                        }
                        return null ;

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
                        if (input!.isEmpty) {
                          return "Parola giriniz " ;

                        }
                        if ( input.length < 6 ) {
                          return "Şifre 6 haneden küçük olamaz" ;
                        }
                        if ( input != "123456") {
                          return "Yanlış şifre" ;

                        }
                        return null ;


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
                          bool controllerResult = formKey.currentState!.validate();
                          if ( controllerResult ) {

                            Navigator.push(context, MaterialPageRoute(builder: (context) => const FoodsView()));

                          }

                        },

                      ),
                    ),
                  ),
                  SizedBox(
                    width: 300,
                    child: ElevatedButton.icon(
                      icon: Icon(Icons.keyboard_arrow_right,size: 18,),
                      label: Text("Kayıt Ol"),



                      style: ElevatedButton.styleFrom(
                          shape:  const RoundedRectangleBorder(

                              borderRadius: BorderRadius.all(Radius.circular(20.0))
                          )
                      ),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Kayıt ol butonu daha sonra aktif olacak."))
                        );






                      },

                    ),
                  ),

                ],
              ),
            )



          ],
        )

    );
  }
}