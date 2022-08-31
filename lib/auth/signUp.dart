import 'package:events/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';

enum Genders { male, female, other }

class SignUp extends StatefulWidget {
  static String id = 'Welcome';

  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var username;
  var full_name;
  var dob;
  var phone;
  var email;

  Genders _gender = Genders.other;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        // child: Column(
        children: [
          Container(
            child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10),
                        child: const Text(
                          'Welcome',
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.w500,
                              fontSize: 30),
                        )),
                    Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10),
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(fontSize: 20),
                        )),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        //controller: nameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Username',
                        ),
                        onChanged: (username) {
                          username = username;
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        //controller: nameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Full name',
                        ),
                        onChanged: (full_name) {
                          full_name = full_name;
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        //controller: nameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Phone',
                        ),
                        onChanged: (phone) {
                          phone = phone;
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        //controller: nameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                        ),
                        onChanged: (email) {
                          email = email;
                        },
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.all(10),
                        child: DateTimePicker(
                          type: DateTimePickerType.date,
                          dateMask: 'd MMM, yyyy',
                          initialValue: DateTime.now().toString(),
                          firstDate: DateTime(1950),
                          lastDate: DateTime(2100),
                          icon: Icon(Icons.event),
                          dateLabelText: 'Date',
                          onChanged: (val) => print(val),
                          validator: (val) {
                            // print(val);
                            return null;
                          },
                          onSaved: (val) => print(val),
                        )),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Select Gender'),
                        ListTile(
                          title: const Text('Male'),
                          leading: Radio(
                            groupValue: _gender,
                            value: Genders.male,
                            onChanged: (Genders? value) {
                              setState(() {
                                _gender = value!;
                              });
                            },
                          ),
                        ),
                        ListTile(
                          title: const Text('Female'),
                          leading: Radio(
                            groupValue: _gender,
                            value: Genders.female,
                            onChanged: (Genders? value) {
                              setState(() {
                                _gender = value!;
                              });
                            },
                          ),
                        ),
                        ListTile(
                          title: const Text('Other'),
                          leading: Radio(
                            groupValue: _gender,
                            value: Genders.other,
                            onChanged: (Genders? value) {
                              setState(() {
                                _gender = value!;
                              });
                            },
                          ),
                        )
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: const TextField(
                        obscureText: true,
                        //controller: passwordController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: const TextField(
                        obscureText: true,
                        //controller: passwordController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Verify password',
                        ),
                      ),
                    ),
                    Container(
                        height: 50,
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: ElevatedButton(
                          child: const Text('Sign Up'),
                          onPressed: () {
                            // print(nameController.text);
                            // print(passwordController.text);
                          },
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text('Account already exists?'),
                        TextButton(
                          child: const Text(
                            'Sign In',
                            style: TextStyle(fontSize: 20),
                          ),
                          onPressed: () {
                            //signup screen
                          },
                        )
                      ],
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
