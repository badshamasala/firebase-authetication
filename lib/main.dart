import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/disablebutton.dart';
import 'package:flutter_application_1/google.dart';
import 'package:flutter_application_1/homepage.dart';
import 'package:flutter_application_1/list.dart';
import 'package:flutter_application_1/newfile.dart';
import 'package:flutter_application_1/practise.dart';
import 'package:flutter_application_1/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Badshaprovier()),
        ChangeNotifierProvider(create: (_) => Googleprovider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(),
        // home: const MyHomePage(title: 'Flutter Demo Home Page'),
        home: HomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool obscure = true;
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Color(0xff0087FF),
        ),
        body: SingleChildScrollView(
          reverse: true,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(image: AssetImage('assets/mobile.png')),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter Your Username',
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide:
                            BorderSide(color: Color(0xff0087FF), width: 1)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide:
                            BorderSide(color: Color(0xff0087FF), width: 1)),
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
                TextField(
                  obscureText: obscure,
                  decoration: InputDecoration(
                    labelText: 'Enter Password',
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide:
                            BorderSide(color: Color(0xff0087FF), width: 1)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide:
                            BorderSide(color: Color(0xff0087FF), width: 1)),
                    suffixIcon: GestureDetector(
                      child: Icon(
                          obscure ? Icons.visibility_off : Icons.visibility),
                      onTap: () {
                        setState(() {
                          obscure = !obscure;
                        });
                      },
                    ),
                    // hintText: 'Enter Password',
                    contentPadding: const EdgeInsets.all(15),
                    /*  border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xff0087FF),
                          ),
                          borderRadius: BorderRadius.circular(15)) */
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
                    onPressed: () {},
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
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      color: Colors.black,
                      height: 1,
                      width: 120,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('OR'),
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                      color: Colors.black,
                      height: 1,
                      width: 120,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    icon: FaIcon(
                      FontAwesomeIcons.google,
                      color: Colors.black,
                    ),
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        side: BorderSide(
                          color: Color(0xff0087FF),
                        ),
                        minimumSize: Size(0, 40),
                        /*  padding: EdgeInsets.symmetric(
                            horizontal: 40.0, vertical: 20.0), */
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                    label: Text(
                      "Continue with Google",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text('don\'t have an account?'),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          color: Color(0xff0087FF),
                        ),
                        /*  padding: EdgeInsets.symmetric(
                            horizontal: 40.0, vertical: 20.0), */
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(color: Color(0xff0087FF), fontSize: 18),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  // color: Colors.red,
                  child: Row(
                    children: [
                      SizedBox(
                        height: 10,
                        width: 20,
                        child: Checkbox(
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            value: value,
                            onChanged: (value) {
                              setState(() {
                                this.value = value!;
                              });
                            }),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        'I accepted terms of services & privacy policy and licence agreement?',
                        style: TextStyle(fontSize: 9),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
