

 import 'package:flutter/material.dart';

 class UserInformation extends ChangeNotifier {

    var details = new Map(); 
     Map get userinfo=> details;

    
      setUserInfo( User user){
   details['name'] = user.name;
   details['email'] = user.email; 
   print(details);
   notifyListeners();
     }
         
        


 }

 class User{

    String name;
    String email;

    User(this.name,this.email);


 }