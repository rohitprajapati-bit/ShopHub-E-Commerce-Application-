import "dart:convert";

import "package:flutter/material.dart";
import 'package:http/http.dart' as http;
import "package:shopHub/screen/home_page.dart";

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isVisible = false;
  bool isLoding = false;
  final _formKey = GlobalKey<FormState>();

  Future<void> login(String username, password) async {
    setState(() {
    });
    final response = await http.post(
        Uri.parse('https://fakestoreapi.com/auth/login'),
        body: {'username': username, 'password': password});
    if (response.statusCode == 200) {
      final jsonDCode = jsonDecode(response.body.toString());

      final token = jsonDCode['token'];
      if (token != null) {
        print('Login successfully');
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      }
    } else {
      print('Login failed: Invalid credentials');
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Invalid username or password")));
    }
    setState(() {
      isLoding = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // color: Colors.white,
        body: ListView(
      children: [
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/hey.png",
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 15.0,
              ),
            const  Text(
                "Welcome ",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            const  SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 30.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: userNameController,
                      decoration:const InputDecoration(
                        hintText: "Enter Username",
                        labelText: "Username",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "username cannot be empty";
                        }
                        return null;
                      },
                      // onChanged: (value) {
                      //   name = value;
                      //   setState(() {});
                      // },
                    ),
                   const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: passwordController,
                      obscureText: isVisible ? false : true,
                      decoration: InputDecoration(
                          hintText: "Enter Password",
                          labelText: "Password",
                          suffixIcon: IconButton(
                            icon: Icon(isVisible
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                isVisible = !isVisible;
                                // if (isVisible) {
                                //   isVisible = false;
                                // } else {
                                //   isVisible = true;
                                // }
                              });
                            },
                          )),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password cannot be empty";
                        } else if (value.length < 6) {
                          return "Password lenght should be atleast 6";
                        }

                        return null;
                      },
                    ),
                  const  SizedBox(
                      height: 35.0,
                    ),
                    isLoding
                        ?const CircularProgressIndicator()
                        : ElevatedButton(
                            child:  Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.white, // Button text ka color
                                fontSize: 18,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Colors.purple, // Button ka background color
                              minimumSize: Size(130, 40),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () {
                              login(userNameController.text.toString(),
                                  passwordController.text.toString());
                              // if (_formKey.currentState?.validate() ?? false) {}
                            },
                          )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    ));
  }
}
