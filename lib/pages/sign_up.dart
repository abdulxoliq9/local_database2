import 'package:flutter/material.dart';
import 'package:local_database2/pages/home_page.dart';
import 'package:local_database2/sevices/hiveDB.dart';
import 'package:local_database2/user/user.dart';
class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);
  static final String id = 'sign_up';
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final emailController = TextEditingController();
  final numberlController = TextEditingController();
  final addressController = TextEditingController();

  doSignUp(){
    String email = emailController.text.toString().trim();
    String number = numberlController.text.toString().trim();
    String address = addressController.text.toString().trim();

    var user = User(email: email,number: number,address: address);

    HiveDB().storeUser(user);
    var user1 = HiveDB().loadUser();
    print(user1.email);
    print(user1.number);
    print(user1.address);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[700],
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 35),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30,),
                    Text('Welcome',style: TextStyle(
                        color: Colors.teal,fontSize: 17
                    ),),
                    SizedBox(height: 7,),
                    Text('Sign Up',style: TextStyle(
                        fontSize: 30,fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),),
                    SizedBox(height: 25,),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 35),
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(35,),
                      topRight: Radius.circular(35))
                    ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  SizedBox(height: 40,),
                  Text('Email',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: 'Enter Email',
                      hintStyle: TextStyle(color: Colors.grey[400]),
                    ),
                  ),
                  SizedBox(height: 25,),
                  Text('Number',style: TextStyle(
                    fontSize: 17,fontWeight: FontWeight.bold,
                  ),),
                  TextField(
                    controller: numberlController,
                    decoration: InputDecoration(
                      hintText: 'Enter Number',
                      hintStyle: TextStyle(color: Colors.grey[400]
                      ),
                    ),
                  ),
                    SizedBox(height: 25,),
                    Text('Address',style: TextStyle(
                      fontSize: 17,fontWeight: FontWeight.bold,
                    ),),
                    TextField(
                      controller: addressController,
                      decoration: InputDecoration(
                        hintText: 'Enter Address',
                        hintStyle: TextStyle(color: Colors.grey[400]
                        ),
                      ),
                    ),
                  SizedBox(height: 30,),
                  Container(
                    alignment: Alignment.center,
                    child: Text('Forgot Password ?',style: TextStyle(
                        color: Colors.grey[400],fontSize: 16,
                        fontWeight: FontWeight.bold
                    ),),
                  ),
                  SizedBox(height: 25,),
                  Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.teal[700],
                        borderRadius: BorderRadius.circular(8)
                    ),
                    child: FlatButton(
                      onPressed: doSignUp(),
                      child: Text('Sign In',style: TextStyle(
                          color: Colors.white,fontSize: 17
                      ),),
                    ),
                  ),
                  SizedBox(height: 17,),
                  Container(alignment: Alignment.center,
                    child: Text('OR',style: TextStyle(
                        color: Colors.grey[400],fontSize: 16,
                        fontWeight: FontWeight.bold
                    ),),
                  ),
                  SizedBox(height: 25,),
                  Row(
                    children: [
                      Expanded(
                          child: Container(
                            height: 25,
                            width: 25,
                            child: Image(
                              image: AssetImage('assets/images/face2.webp',),
                            ),
                          )
                      ),
                      Expanded(
                          child: Container(
                            height: 18,
                            width: 18,
                            child: Image(
                              image: AssetImage('assets/images/twitter.png'),
                            ),
                          )
                      ),
                      Expanded(
                          child: Container(
                            height: 18,
                            width: 18,
                            child: Image(
                              image: AssetImage('assets/images/INST.png'),
                            ),
                          )
                      ),

                    ],
                  ),
                  SizedBox(height: 35,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don`t have an account ?',style: TextStyle(
                          color: Colors.grey[400],fontSize: 16,
                          fontWeight: FontWeight.bold
                      ),),
                      SizedBox(width: 5,),
                      GestureDetector(
                        onTap:() {
                            Navigator.pushReplacementNamed(context, HomePage.id);
                          },
                        child: Text('Sign Up',style: TextStyle(
                            color: Colors.teal[700],fontSize: 16,
                            fontWeight: FontWeight.bold
                        ),),
                      )
                    ],
                  ),
                  ],
                ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
