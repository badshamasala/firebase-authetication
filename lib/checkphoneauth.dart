import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/home1.dart';
import 'package:flutter_application_1/homepage.dart';
import 'package:flutter_application_1/provider.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class Checkphoneauth extends StatefulWidget {
  const Checkphoneauth({Key? key}) : super(key: key);

  @override
  State<Checkphoneauth> createState() => _CheckphoneauthState();
}

class _CheckphoneauthState extends State<Checkphoneauth> {
  GlobalKey<FormState> _formKey = GlobalKey();

  bool check10number = true;
  bool check6digit = true;
  var phonecont = TextEditingController();
  dynamic phonekanumber;
  dynamic checktoken;
  dynamic token;
  /* final provider = Provider.of<Googleprovider>(context, listen: false); */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              autofillHints: [AutofillHints.telephoneNumberDevice],
              autofocus: true,
              /*  focusNode: focusNode, */
              /* validator: (value) {
                        if (value!.length == 10) {
                          setState(() {
                            check10number = false;
                          });
                        }
                      }, */

              /*    controller: phonecont, */
              textAlign: TextAlign.start,
              maxLength: 10,
              keyboardType: TextInputType.number,
              cursorColor: Colors.blue,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                FilteringTextInputFormatter.deny(RegExp(r'^0+')),
                FilteringTextInputFormatter.deny(RegExp(r'^1+')),
                FilteringTextInputFormatter.deny(RegExp(r'^2+')),
                FilteringTextInputFormatter.deny(RegExp(r'^3+')),
                FilteringTextInputFormatter.deny(RegExp(r'^4+')),
                FilteringTextInputFormatter.deny(RegExp(r'^5+')),
              ],
              decoration: InputDecoration(
                hintText: '8888888888',
                hintStyle: TextStyle(color: Color(0xffc4c4c4)),
                /* isDense: true, */
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text(
                      "+91",
                      style: TextStyle(
                          color: /*  focusNode.hasFocus
                                      ? */
                              Colors.black,
                          /* : Color(0xffc4c4c4), */
                          fontFamily: 'Poppins',
                          fontSize: 16),
                    ),
                  ),
                ),
                prefixIconConstraints:
                    BoxConstraints(minWidth: 0, minHeight: 0),
                labelText: 'Enter your 10 digit Mobile number*',
                labelStyle: TextStyle(
                    color: /* focusNode.hasFocus
                                ? */
                        Colors.black /* : Color(0xffc4c4c4) */,
                    fontFamily: 'Poppins',
                    fontSize: 12),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide:
                        const BorderSide(color: Color(0xff333333), width: 0.5)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide:
                        const BorderSide(color: Color(0xff0087FF), width: 0.5)),
                /*     prefixText: '+91', */
                /*     prefixIconColor: Color(0xffc4c4c4c), */
                /* prefixStyle:
                            TextStyle(fontFamily: 'Poppins', fontSize: 15), */
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                // hintText: 'Enter Your Username',
                /*        contentPadding: const EdgeInsets.all(15), */
                /*  border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xff0087FF),
                              ),
                              borderRadius: BorderRadius.circular(16)
                              ) */
              ),
              onChanged: (value) {
                phonekanumber = value;
                if (value.length == 10) {
                  setState(() {
                    check10number = false;
                  });
                } else if (value.length < 10) {
                  setState(() {
                    check10number = true;
                  });
                }
                // do something
              },
            ),
            SizedBox(
              width: double.infinity,
              // height: 50,
              child: ElevatedButton(
                onPressed: check10number
                    ? null
                    : () async {
                        final provider =
                            Provider.of<Googleprovider>(context, listen: false);
                        /*    String token = await Googleprovider().otpmethod(phonekanumber); */
                        token = await provider.otpmethod(phonekanumber);
                        print('token-- $token');
                      },
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    /*        minimumSize: const Size(0.0, 40), */
                    // padding: EdgeInsets.symmetric(
                    //     horizontal: 40.0, vertical: 20.0),
                    backgroundColor: const Color(0xff0087FF),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5))),
                child: const Text(
                  "Continue",
                  style: TextStyle(
                      color: Colors.white, fontSize: 15, fontFamily: 'Poppins'),
                ),
              ),
            ),
            OtpTextField(
              filled: true,
              margin: EdgeInsets.only(right: 4.0),
              fieldWidth: 45,
              fillColor: Color(0xffDFEEFC),
              borderWidth: 1,
              focusedBorderColor: Colors.blue,
              numberOfFields: 6,
              borderColor: Colors.blue,
              //set to true to show as box or false to show as dash
              showFieldAsBox: true,
              //runs when a code is typed in
              onCodeChanged: (String value) {
                checktoken = value;
                //handle validation or checks here
              },
              //runs when every textfield is filled
              onSubmit: (String verificationCode) {
                checktoken = verificationCode;
                if (verificationCode.length == 6) {
                  setState(() {
                    check6digit = false;
                  });
                }
                if (verificationCode.length < 6) {
                  setState(() {
                    check6digit = true;
                  });
                }

                /* showDialog(
                                                              context: context,
                                                              builder: (context) {
                                                                return AlertDialog(
                                                                  title: const Text(
                                                                      "Verification Code"),
                                                                  content: Text(
                                                                      'Code entered is $verificationCode'),
                                                                );
                                                              }); */
              }, // end onSubmit
            ),
            SizedBox(
              /*     height: 45, */
              width: double.infinity,
              // height: 50,
              child: ElevatedButton(
                onPressed: check6digit
                    ? null
                    : () async {
                        final provider =
                            Provider.of<Googleprovider>(context, listen: false);
                        setState(() {
                          if (token == checktoken) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Home11()));
                          } else {
                            print('error');
                          }
                        });

                        /*  Navigator
                                                                        .push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                          builder: (context) =>
                                                                              AccountType(
                                                                                value: phonecont.text,
                                                                              )),
                                                                    ); */
                      },
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    /*      minimumSize: const Size(0.0, 40), */
                    // padding: EdgeInsets.symmetric(
                    //     horizontal: 40.0, vertical: 20.0),
                    backgroundColor: const Color(0xff0087FF),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0))),
                child: const Text(
                  "Verify & Continue",
                  style: TextStyle(
                      color: Colors.white, fontSize: 15, fontFamily: 'Poppins'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
