import 'package:flutter/material.dart';
import 'package:local_database2/pages/sign_up.dart';
import 'package:local_database2/sevices/hiveDB.dart';
import 'package:local_database2/user/user.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static final String id = 'home_page';
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  doSignIn(){
    String email = emailController.text.toString().trim();
    String password = passwordController.text.toString().trim();

    var user= User(email: email,password: password);
    
    HiveDB().storeUser(user);
    var user1 = HiveDB().loadUser();
    print(user1.email);
    print(user1.password);

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.teal[700],
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 35),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 40,),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: AssetImage('assets/images/i.webp'),
                              fit: BoxFit.cover
                          )
                      ),
                    ),
                    SizedBox(height: 20,),
                    Text('Welcome',style: TextStyle(
                        color: Colors.teal,fontSize: 17
                    ),),
                    SizedBox(height: 7,),
                    Text('Sign In',style: TextStyle(
                        fontSize: 30,color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),),
                    SizedBox(height: 30,),
                  ],
                ),
              ),
               Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(35),
                  topLeft: Radius.circular(35)),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 35),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 45,),
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
                      Text('Password',style: TextStyle(
                        fontSize: 17,fontWeight: FontWeight.bold,
                      ),),
                      TextField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          hintText: 'Enter Password',
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
                          onPressed: doSignIn(),
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
                      SizedBox(height: 45,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Don`t have an account ?',style: TextStyle(
                              color: Colors.grey[400],fontSize: 16,
                              fontWeight: FontWeight.bold
                          ),),
                          SizedBox(width: 5,),
                          GestureDetector(
                            onTap: (){
                              Navigator.pushReplacementNamed(context, SignUp.id);
                            },
                            child: Text('Sign Up',style: TextStyle(
                                color: Colors.teal[700],fontSize: 16,
                                fontWeight: FontWeight.bold
                            ),),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
