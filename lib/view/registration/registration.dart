import 'package:exam_shared_prefernce/controller/login_controller/login_controller.dart';
import 'package:exam_shared_prefernce/view/login_page/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController emailCOntroller = TextEditingController();
    TextEditingController passwordCOntroller = TextEditingController();
    TextEditingController confirmPasswordCOntroller = TextEditingController();
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Register here",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
            ),
          ),
          // email
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: emailCOntroller,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Required";
                } else if (value.contains("@") && value.contains(".com")) {
                  return null;
                } else {
                  return "Invalid Email";
                }
              },
              decoration: InputDecoration(
                  hintText: "Email", border: OutlineInputBorder()),
            ),
          ),
          // password
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: passwordCOntroller,
              validator: (value) {
                if (passwordCOntroller.text.length < 8) {
                  return "Password must be atleast 8 characters";
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(
                  hintText: "Password", border: OutlineInputBorder()),
            ),
          ),
          // confirm password
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: confirmPasswordCOntroller,
              validator: (value) {
                if (confirmPasswordCOntroller.text == passwordCOntroller.text) {
                  return null;
                } else {
                  return "Password does not match";
                }
              },
              decoration: InputDecoration(
                  hintText: "Confirm Password", border: OutlineInputBorder()),
            ),
          ),
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ));
              },
              child: Text("Already have an account?")),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  Provider.of<LoginController>(context, listen: false)
                      .setCredentials(
                          emailCOntroller.text, confirmPasswordCOntroller.text);
                  Provider.of<LoginController>(context, listen: false)
                      .getCredentials();
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Registration successful')));
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ));
                } else {
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Registration failed')));
                }
              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.circular(15)),
                child: Center(
                  child: Text(
                    'Register',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
