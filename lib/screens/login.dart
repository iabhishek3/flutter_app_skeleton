import 'package:flutter/material.dart';
import 'package:myvcapp/blocs/user_infromation_bloc.dart';
import 'package:provider/provider.dart';
import '../Animation/FadeAnimation.dart';
import '../routes/routeconfig.dart';
import '../main.dart';
// import '../widget/Healthwaycolor.dart';
// import '../API/patientapi.dart';
import 'dart:convert';


class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {

  bool _isLoading=false;
  // Color _Healthwaycolor = Healthwaycolor("#2790A5");
  @override
  Widget build(BuildContext context) {
   
    return Stack(// <-- STACK AS THE SCAFFOLD PARENT
    children: [
        Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage("assets/bg.jpg"), // <-- BACKGROUND IMAGE
        fit: BoxFit.cover,
      ),
    ),
        ),
        Scaffold(
    resizeToAvoidBottomInset: false,
    backgroundColor: Colors.white.withOpacity(0.7),
    body: SingleChildScrollView(
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 80,
          ),
          Center(
            child: Image.asset(
           'assets/Lgo2.png',
              width: 200,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                FadeAnimation(
                  1,
                  Center(
                    child: Text(
                      "Login to continue",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                FadeAnimation(
                  1,
                  Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.transparent,
                    ),
                    child: Column(
                      children: <Widget>[
                        textremail("Email", Icons.email),
                         SizedBox(height: 30,),
                        textpassoword("Password", Icons.lock)
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Center(
                  child: FadeAnimation(
                    1,
                    Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                FadeAnimation(
                  1,
                  Container(
                    height: 50,
                    margin: EdgeInsets.symmetric(horizontal: 60),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.blueAccent,
                    ),
                    child:_isLoading ? Center(child: CircularProgressIndicator()): Center(
                      child: new GestureDetector(
                        onTap: () {
                          setState((){
                            _isLoading=true;
                          });
                          signIn(emailController.text,passwordController.text);

                        },
                        child: new Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                FadeAnimation(
                  1,
                  Center(
                      child: InkWell(
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed('/Signup');
                    },
                  )),
                ),
              ],
            ),
          )
        ],
      ),
    ),
        ),
      ],
      );
  }



  signIn( String email, password) async {

   

       Provider.of<UserInformation>(context).setUserInfo(User("Abhishek","iabisigmail.com"));
       
    // Patientclass _Patientclass = new Patientclass();
    // var response = await _Patientclass.login(email, password);
    // if(response!=null){
    //   JsonEncoder encoder = new JsonEncoder.withIndent('  ');
    //   String prettyprint = encoder.convert(response);
    //   print(prettyprint);

    //   _isLoading=false;
     

    // }
 Navigator.of(context).pushNamed('/AppHome');
  }
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextFormField textremail(String title, IconData icon) {
    return TextFormField(
      controller: emailController,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
          hintText: title,
          hintStyle: TextStyle(color :Colors.black),
          icon: Icon(icon)
      ),
    );
  }
  TextFormField textpassoword(String title, IconData icon) {
    return TextFormField(
      controller: passwordController,
      obscureText: true,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
          hintText: title,
          hintStyle: TextStyle(color :Colors.black),
          icon: Icon(icon)
      ),
    );
  }


}



