import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:herlytics/components/custom_button.dart';
import 'package:herlytics/components/my_text_field.dart';
import 'package:herlytics/components/square_tile.dart';
import 'package:herlytics/services/auth_services.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  LoginPage({super.key,   this.onTap});
 
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // editing controller
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  void signUserIn() async {
    // showing loading circle

   
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      
     // error message
      showErrorcode(e.code);
    }
  }

  void showErrorcode(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return  AlertDialog(
          backgroundColor: Colors.blue,
          title: Text(message),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(224, 224, 224, 1),
      body: SafeArea(
        // right side
        child: Center(
          child: Container(
            width:
                MediaQuery.of(context).size.width * 0.8, // 80% of screen width
            height:
                MediaQuery.of(context).size.height * 1, // 80% of screen height
            child: SingleChildScrollView(
              child: Row(
                children: [
                  //left side

                  Expanded(
                    child: Container(
                        child: Lottie.asset(
                            'assets/Animation - 1727895899627.json')),
                  ),

                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Column(
                        children: [
                          TextLiquidFill(
                            text: 'HERlytics',
                            waveColor: Colors.blueAccent,
                            boxBackgroundColor:
                                Color.fromRGBO(224, 224, 224, 1),
                            textStyle: TextStyle(
                              fontSize: 60.0,
                              fontWeight: FontWeight.bold,
                            ),
                            boxHeight: 100.0,
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Text(
                            "Login to your Account",
                            style: TextStyle(
                                color: Color.fromARGB(255, 66, 66, 66),
                                fontSize: 16),
                          ),
                          SizedBox(height: 25),
                          CustomTextfiled(
                            controller: emailController,
                            hintText: 'Email',
                            obscureText: false,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CustomTextfiled(
                            controller: passwordController,
                            hintText: 'Password',
                            obscureText: true,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Forget Password?',
                                style: TextStyle(color: Colors.grey[600]),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          CustomButton(onTap: signUserIn, text: 'Sign In'),
                          SizedBox(
                            height: 40,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 25.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Divider(
                                    thickness: 0.5,
                                    color: Colors.grey[400],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Text(
                                    "Or sign in with",
                                    style: TextStyle(color: Colors.grey[700]),
                                  ),
                                ),
                                Expanded(
                                  child: Divider(
                                    thickness: 0.5,
                                    color: Colors.grey[400],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal, 
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SquareTile(
                                    onTap: ()=> AuthService().signInWithGoogle()
                                    , imagePath: 'assets/google.png'),
                                const SizedBox(
                                  width: 35,
                                ),
                                SquareTile(
                                    onTap: () {},
                                    imagePath: 'assets/facebook.jpg'),
                                const SizedBox(
                                  width: 35,
                                ),
                                SquareTile(
                                    onTap: () {}, imagePath: 'assets/apple.png'),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an account?",
                                style: TextStyle(color: Colors.grey[700]),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              GestureDetector(
                                onTap: widget.onTap,
                                child: Text(
                                  "Sign up",
                                  style: TextStyle(
                                      color:
                                          const Color.fromRGBO(33, 150, 243, 1),
                                      fontWeight: FontWeight.bold),
                                ),
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
        ),
      ),
    );
  }
}
