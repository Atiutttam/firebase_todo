import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_todo/homepage.dart';
import 'package:firebase_todo/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInPage extends StatelessWidget {

  static const String PREF_UID_KEY="uid";

  var emailController=TextEditingController();
  var passController=TextEditingController();

  FirebaseAuth firebaseAuth=FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign In"),),
      body: Padding(
        padding: const EdgeInsets.all(11.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Login to you account", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 15,),
            TextField(
              controller: emailController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                label: Text("email"),
                hintText: "Enter email",
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(width: 2,color: Colors.blueAccent),),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20)
                )
              ),
            ),
            SizedBox(height: 15,),
            TextField(
              controller: passController,
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(
                  label: Text("password"),
                  hintText: "password",
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(width: 1,color: Colors.blueAccent)
                  ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20)
                )
              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(
                onPressed: (){
                  try{
                    firebaseAuth.signInWithEmailAndPassword(
                        email: emailController.text.toString(),
                        password: passController.text.toString()).then((value)async{
                      print("user logged in ${value.user!.uid}");
                      ///shared prefs
                      var prefs=await SharedPreferences.getInstance();
                      prefs.setString(PREF_UID_KEY, value.user!.uid);
                      
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));

                    });
                  } on FirebaseAuthException catch(e){
                    print("invalid credentials");
                  }
                  catch(e){
                    print("error${e}");
                  }
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                },
                child: Text("Login")),
            SizedBox(height: 20,),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpPage()));
              },
                child: Text("SignUp here"))

          ],
        ),
      ),
    );
  }
}
