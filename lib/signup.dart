import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:footballcustom/login.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController? _nameController;
  TextEditingController? _mailController;
  TextEditingController? _passwrodController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController = TextEditingController();
    _mailController = TextEditingController();
    _passwrodController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _nameController?.dispose();
    _mailController?.dispose();
    _passwrodController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            color: Colors.green,
            child: Column(children: [
              const SizedBox(
                height: 80,
              ),
              Icon(
                Icons.account_circle_rounded,
                size: 120,
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                child: Text(
                  "Sign Up",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.person,
                    size: 40,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: 320,
                    child: TextField(
                      controller: _nameController,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Colors.black)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2,
                                color: Color.fromARGB(255, 60, 58, 58))),
                        hintText: "Enter your name here",
                      ),
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.email,
                    size: 40,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: 320,
                    child: TextField(
                      controller: _mailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        hintText: "Enter your email here",
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2,
                                color: Color.fromRGBO(60, 58, 58, 1))),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: Colors.black),
                        ),
                      ),
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.lock,
                    size: 40,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: 320,
                    child: TextField(
                      controller: _passwrodController,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: const InputDecoration(
                        hintText: "Enter your password here",
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2,
                                color: Color.fromRGBO(60, 58, 58, 1))),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: Colors.black),
                        ),
                      ),
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
               Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.checklist_sharp,
                    size: 40,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: 320,
                    child: TextField(
                      controller: _passwrodController,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: const InputDecoration(
                        hintText: "Confirm Password Here",
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2,
                                color: Color.fromRGBO(60, 58, 58, 1))),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: Colors.black),
                        ),
                      ),
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        print('ok');
                      },
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      )),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  "Forget Your account!! Click Here",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account??"),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) {
                        return Login();
                      }));
                    },
                    child: Text(
                      "Log in",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
            ])),
      ),
    );
  }
}
