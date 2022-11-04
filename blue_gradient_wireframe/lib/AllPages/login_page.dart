import 'package:blue_gradient_wireframe/AllPages/home_page.dart';
import 'package:blue_gradient_wireframe/AllPages/password_reset_page.dart';
import 'package:blue_gradient_wireframe/AllPages/signup_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage("lib/img/bg1.jpg"),fit: BoxFit.cover)
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

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(25.0)),),
                    hintText: 'Phone Number, Username or Email',
                    filled: true,
                    fillColor: CupertinoColors.white,
                  ),
                ),
              ),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                child: TextField(
                  decoration: InputDecoration(
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
                        "Login",
                        style: TextStyle(fontSize: 18.0, fontFamily: "Brand Bold",color: Colors.white),
                      ),
                    ),
                  ),

                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
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
                    MaterialPageRoute(builder: (context) => const PasswordReset()),
                  );
                },
                child: const Text('Forgot Password?'),
              ),
              //const SizedBox(height: 160.0, ),

              TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignupPage()),
                  );
                },
                child: const Text('Don\'t have an account?'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
