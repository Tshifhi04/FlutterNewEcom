import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_ecom_app/widgets/title_heading.dart';

import '../../constants/routes.dart';
import '../auth_ui/login/login.dart';


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
             children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BackButton(),
            Expanded(
              child: Text("heyy thrtr")
            ),
             CupertinoButton(
                                  onPressed: () {
                                               Routes.instance.push(widget: const Login(), context:context);
        
                                  },
                                  child: const Text("Login"),
                                ),
          ],
        ),
        SizedBox(height: 300),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: "Email",
              prefixIcon: Icon(Icons.email_outlined, color: Colors.grey),
            ),
          ),
        ),
      ],
          )

    );
  }
}