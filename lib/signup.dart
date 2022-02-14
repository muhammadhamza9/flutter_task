import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();

  Widget inputTextField(String hintText) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(40),
            gapPadding: 0,
          ),
          filled: true,
          hintText: hintText,
          fillColor: Colors.black12,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xfffcb800),
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(context),
            child: const Text(
              'Sign In',
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          )
        ],
      ),
      backgroundColor: const Color(0xfffcb800),
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 18),
                child: Text(
                  'Register',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Card(
                elevation: 0,
                color: const Color(0xfffcb800),
                //alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 10),
                child: CarouselSlider(
                  items: [
                    'assets/images/signin.png',
                    'assets/images/signup.png'
                  ].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: const BoxDecoration(color: Colors.amber),
                          child: Image.asset(
                            i,
                          ),
                        );
                      },
                    );
                  }).toList(),
                  options: CarouselOptions(
                    height: 200,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    viewportFraction: 1,
                    aspectRatio: 2.5,
                    initialPage: 2,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 8, right: 8),
                  height: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Expanded(child: inputTextField('First Name')),
                          Expanded(child: inputTextField('Last Name')),
                        ],
                      ),
                      inputTextField('Phone'),
                      inputTextField('Email Address'),
                      Row(
                        children: [
                          Expanded(child: inputTextField('Password')),
                          Expanded(child: inputTextField('Confirm Password')),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                            left: 15, right: 15, bottom: 8, top: 25),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextButton(
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Processing Data')),
                              );
                            }
                          },
                          child: const Text(
                            'Sign In',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.black,
                              child: Image.asset(
                                'assets/images/mac.png',
                                height: 30,
                                width: 30,
                              ),
                            ),
                            SizedBox(width: 8),
                            CircleAvatar(
                              backgroundColor: Colors.black,
                              child: Image.asset(
                                'assets/images/facebook.png',
                                height: 30,
                                width: 30,
                              ),
                            ),
                            SizedBox(width: 8),
                            CircleAvatar(
                              backgroundColor: Colors.black,
                              child: Image.asset(
                                'assets/images/google.png',
                                height: 30,
                                width: 30,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20, right: 20, top: 5),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(width: 0.1, color: Colors.white),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black38,
                              spreadRadius: 8.0,
                              blurRadius: 8.0,
                              offset: Offset(-2, -6),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
