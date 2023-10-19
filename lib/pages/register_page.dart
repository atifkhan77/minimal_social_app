import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:minimal_social_ap/components/my_button.dart';
import 'package:minimal_social_ap/components/text_fields.dart';
import 'package:minimal_social_ap/helper/helper_function.dart';

class RegisterPage extends StatefulWidget {
  //ontap Method
  final void Function()? onTap;

  const RegisterPage({super.key, this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPwController = TextEditingController();

  // register method
  void RegisterUser() async {
    //loading Circle
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    //make sure pass match
    if (passwordController.text != confirmPwController.text) {
      //pop oading circle
      Navigator.pop(context);

      //show error dialogue
      DisplayMessegeToUser("Password don't match!", context);
    }

    //if password do not match
    else {
      try {
        //try creating user
        UserCredential? userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: emailController.text, password: passwordController.text);

        Navigator.pop(context);
      } on FirebaseAuthException catch (e) {
        Navigator.pop(context);

        //show messege
        DisplayMessegeToUser(e.code, context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //logo
            children: [
              Icon(
                Icons.person,
                size: 80,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              const SizedBox(
                height: 25,
              ),
              //app Name
              const Text(
                "M I N I M A L",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              //username
              MyTextField(
                hintText: 'User Name',
                obsecureText: false,
                controller: usernameController,
              ),
              const SizedBox(
                height: 10,
              ),
              //email field
              MyTextField(
                hintText: 'Email',
                obsecureText: false,
                controller: emailController,
              ),
              const SizedBox(
                height: 10,
              ),
              //password field
              MyTextField(
                hintText: 'Password',
                obsecureText: true,
                controller: passwordController,
              ),
              const SizedBox(
                height: 10,
              ),
              //confirm passwrod
              MyTextField(
                hintText: 'Confirm Password',
                obsecureText: true,
                controller: confirmPwController,
              ),
              const SizedBox(
                height: 10,
              ),

              //forgot password
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Forgot Password?",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              //sign in button
              MyButton(
                text: "Register",
                onTap: RegisterUser,
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary),
                  ),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      " Login Here",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )

              //don't have account register
            ],
          ),
        ),
      ),
    );
  }
}
