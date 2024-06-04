import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_todo/homepage.dart';
import 'package:firebase_todo/user_model.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {

  var nameController=TextEditingController();
  var emailController=TextEditingController();
  var passController=TextEditingController();
  var ageController=TextEditingController();
  var genderController=TextEditingController();
  var mobNoController=TextEditingController();

  FirebaseAuth fireAuth=FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore=FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign In"),),
      body: Padding(
        padding: const EdgeInsets.all(11.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(" create your account",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              SizedBox(height: 15,),
              ///name
              TextField(
                controller: nameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    label: Text("name"),
                    hintText: "name",
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(width: 1,color: Colors.blueAccent),),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                    )
                ),
              ),
              SizedBox(height: 15,),
              ///email
              TextField(
                controller: emailController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    label: Text("email"),
                    hintText: "email",
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
              ///age
              TextField(
                controller: ageController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    label: Text("age"),
                    hintText: "age",
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
              ///gender
              TextField(
                controller: genderController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    label: Text("gender"),
                    hintText: "gender",
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
              ///mobile no
              TextField(
                controller: mobNoController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    label: Text("mobile number"),
                    hintText: "mobile number",
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
              ///password
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
                  onPressed: ()async {
                    try{
                      UserCredential? userCredential;
                      userCredential=await fireAuth.createUserWithEmailAndPassword(
                          email: emailController.text.toString(),
                          password: passController.text.toString());
                       // print("User d:${cred.user!.uid}");
                      UserModel newUser=UserModel(
                          name: nameController.text.toString(),
                          email: emailController.text.toString(),
                          mobNumber: mobNoController.text.toString(),
                          gender: genderController.text.toString(),
                          age: ageController.text.toString());

                      firebaseFirestore.collection("users").doc(userCredential.user!.uid).set(newUser.toDoc()).then((value){
                        print("user is created");
                        Navigator.pop(context);
                      });
                    }
                    on FirebaseAuthException catch(e){
                      if (e.code == 'weak-password') {
                        print('The password provided is too weak.');
                      } else if (e.code == 'email-already-in-use') {
                        print('The account already exists for that email.');
                      }
                    }
                    catch(e){
                      print("$e");
                    }
          
                  },
                  child: Text("Sign Up"))
          
            ],
          ),
        ),
      ),
    );
  }
}