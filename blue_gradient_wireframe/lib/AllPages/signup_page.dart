import 'package:blue_gradient_wireframe/AllPages/login_page.dart';
import 'package:blue_gradient_wireframe/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignupPage extends StatelessWidget {
  SignupPage({Key? key}) : super(key: key);

  TextEditingController fullNameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController userNameTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage("lib/img/aquarium-iphone-12-pro-max.jpg"),fit: BoxFit.cover)
        ),
        child: SingleChildScrollView(
          child: Column(
            children:  [
              const SizedBox(height: 65.0,),
              const Text(
                  "Aqua \nScanner",
                  style: TextStyle(
                      fontSize: 64.0,
                      color: CupertinoColors.white,
                      fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.center
              ),
              const SizedBox(height: 100.0,),

              Padding(

                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                child: TextField(
                  controller: emailTextEditingController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(25.0)),),
                    hintText: 'Email or Phone Number',
                    filled: true,
                    fillColor: CupertinoColors.white,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: fullNameTextEditingController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(25.0)),),
                    hintText: 'Full Name',
                    filled: true,
                    fillColor: CupertinoColors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                child: TextField(
                  controller: userNameTextEditingController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(25.0)),),
                    hintText: 'Username',
                    filled: true,
                    fillColor: CupertinoColors.white,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                child: TextField(
                  obscureText: true,
                  controller: passwordTextEditingController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(25.0)),),
                    hintText: 'Password',
                    filled: true,
                    fillColor: CupertinoColors.white,
                  ),
                ),
              ),
              const SizedBox(height: 10.0,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.resolveWith<OutlinedBorder>((_) {
                      return RoundedRectangleBorder(borderRadius: BorderRadius.circular(25));
                    }),
                    backgroundColor: MaterialStateProperty.all(Colors.indigoAccent),
                  ),
                  child: Container(
                    height: 50.0,
                    child: const Center(
                      child: Text(
                        "SIGN UP",
                        style: TextStyle(fontSize: 18.0, fontFamily: "Brand Bold",color: Colors.white),
                      ),
                    ),
                  ),

                  onPressed: (){
                    registerNewUser(context);
                  },
                ),
              ),
              TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                child: const Text('Already have an account.LOG IN'),
              ),
              const SizedBox(height: 160.0,),

            ],
          ),
        ),
      ),
    );
  }
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void registerNewUser(BuildContext context) async{
    final User? firebaseUser = (await _firebaseAuth
    .createUserWithEmailAndPassword(
        email: emailTextEditingController.text,
        password: passwordTextEditingController.text).catchError((errMsg){
          Fluttertoast.showToast(msg: "error");
    })).user;

    Map UserDataMap = {
      "name":fullNameTextEditingController.text.trim(),
      "username":fullNameTextEditingController.text.trim(),
      "email": emailTextEditingController.text.trim(),
    };

    usersRef.child(firebaseUser!.uid).set(UserDataMap);

  }
}
