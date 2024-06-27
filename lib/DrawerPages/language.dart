import 'package:flutter/material.dart';
import 'package:footballcustom/MainPages/Utility/utility.dart';


class LanguagePage extends StatefulWidget {
 
  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Utility().getNormalAppBar(),
      body: const Column(
        
        children: [
          SizedBox(
            height: 10,
          ),
          Text(
            "The updates are still in process.....",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
          ),
          
        ],
      ),
    );
  }
}
