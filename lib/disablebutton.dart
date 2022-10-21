import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Button1 extends StatefulWidget {
  const Button1({super.key});

  @override
  State<Button1> createState() => _Button1State();
}

class _Button1State extends State<Button1> {
  var button = TextEditingController();
  bool buttonactive = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    button = TextEditingController();
    button.addListener(() {
      final buttonactive = button.text.isNotEmpty;
      setState(() => this.buttonactive = buttonactive);
    });
  }

  // @override
  // void dispose() {
  //   button.dispose();
  //   // TODO: implement dispose
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: button,
            decoration: InputDecoration(
              labelText: 'Enter Your Username',
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Color(0xff0087FF), width: 1)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Color(0xff0087FF), width: 1)),
              suffixIcon: Icon(Icons.check),
              // hintText: 'Enter Your Username',
              contentPadding: const EdgeInsets.all(15),
              /*  border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xff0087FF),
                          ),
                          borderRadius: BorderRadius.circular(16)
                          ) */
            ),
            onChanged: (value) {
              // do something
            },
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            width: double.infinity,
            // height: 50,
            child: ElevatedButton(
              onPressed: buttonactive
                  ? () {
                      setState(() {
                        buttonactive = false;
                        button.clear();
                      });
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(0.0, 40),
                  // padding: EdgeInsets.symmetric(
                  //     horizontal: 40.0, vertical: 20.0),
                  backgroundColor: Color(0xff0087FF),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0))),
              child: Text(
                "Login",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
