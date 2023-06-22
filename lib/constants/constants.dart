import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';




void showMessage(String message){
  Fluttertoast.showToast(
        msg: "This is Center Short Toast", // font forget to add message from parameter
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
}

showLoaderDialog(BuildContext context){
  AlertDialog alert = AlertDialog(
    content: Builder(builder: ((context) {
      return SizedBox(
        width: 100,
        child:Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(
              color:Color(0xffe16555),
            ),
            const SizedBox(
              height:18.0,
            ),

            Container(
              margin: const EdgeInsets.only(left:7),
              child: const Text("Loading....")
            ),

          ]
        )
      );
    })),
  );

  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    }

  );


String getMessageFromErrorCode(String errorCode){
  switch (errorCode){
    case "ERROR_EMAIL_ALREADY_IN_USE": 
    return "Email already in use. Please Login";

    case "accounts_already_exists_with_different_credentials":
    return "Email already in use. please Login";

    case "email_already_in_use":
    return "Email already used. Please Login";

    case "ERROR_WRONG_PASSWORD":
    case "wrong_password":
      return "Wrong Password";

     case "ERROR_USER_NOT_FOUND":
      return "No User Found With This Email";

    case "user-not-found":
      return "No user found with this Email"; 
      
      
    case "ERROR_USER_DISABLED": 
     return "User disabled";

    case "User-Disabled":
      return "User Disabled";

    case "ERROR_TOO_MANY_REQUESTS":
      return "Too many requests to log into this account.";

    case "ERROR_OPERATION_NOT_ALLOWED": 
      return "Too many requests to log into this account.";

    case "ERROR_INVALID_EMAIL":
      return "Email address is invalid";

    case "invalid-email":
      return "Email address is invalid";

    default:
      return "Login failed. Please try again.";
      
  
  
  //Continue 1.35.26
  
  
   }
}






}


bool loginValidation(String email,String password){
  if(email.isEmpty && password.isEmpty){
    showMessage("both feilds is Empty");
    return false;
  }
  if(password.isEmpty){
    showMessage("password is Empty");
    return false;
  }
  if(email.isEmpty){
    showMessage("Email is Empty");
    return false;
  }
  else{
    return true;
  }
}