import 'package:flutter/material.dart';
import 'package:footballcustom/MainPages/Utility/utility.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({super.key});

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  late TextEditingController _usercontroller;
  late TextEditingController _mailcontroller;
  late TextEditingController _messagecontroller;

  @override
  void initState() {
    // TODO: implement initState
    _usercontroller = TextEditingController();
    _mailcontroller = TextEditingController();
    _messagecontroller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _usercontroller.dispose();
    _mailcontroller.dispose();
    _messagecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Utility().getNormalAppBar(),
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height -
                80, // Ensure the container covers the full screen height
          ),
          color: Colors.green,
          child: Column(
            children: [

              SizedBox(height: 20,),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Feedback",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: const Column(
                  children: [
                    Text(
                        "If you have any problem or any suggestion, fell free to contact us anytime soon by writing down in the form, we will get back to you as soon as possible!!!!"),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
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
                      controller: _usercontroller,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Colors.black)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                width: 2,
                                color: Color.fromARGB(255, 60, 58, 58))),
                        hintText: "user name/acc name",
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
                      controller: _mailcontroller,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        hintText: "email",
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                width: 2,
                                color: Color.fromARGB(255, 60, 58, 58))),
                        focusedBorder: UnderlineInputBorder(
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.message_rounded,
                    size: 40,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: 320,
                    child: SingleChildScrollView(
                      child: TextField(
                        controller: _messagecontroller,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2, color: Colors.black)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2,
                                  color: Color.fromARGB(255, 60, 58, 58))),
                          hintText: "Enter your message/complain",
                        ),
                        style: TextStyle(fontSize: 20),
                        maxLength: 300,
                        maxLines: null,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        print(_usercontroller.text);
                        print(_mailcontroller.text);
                        print(_messagecontroller.text);
                      },
                      style: ElevatedButton.styleFrom(foregroundColor: Colors.black),
                      child: Text("Send",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),)),
                  SizedBox(
                    width: 20,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
