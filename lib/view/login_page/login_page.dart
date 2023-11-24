import 'package:exam_shared_prefernce/controller/login_controller/login_controller.dart';
import 'package:exam_shared_prefernce/view/places_list_screen/places_list_screen.dart';
import 'package:exam_shared_prefernce/view/registration/registration.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  getFunction() async {
    await Provider.of<LoginController>(context, listen: false).getCredentials();
    print('Function called');
  }

  @override
  void initState() {
    getFunction();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    GlobalKey _formKey = GlobalKey<FormState>();

    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Login here",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
            ),
          ),
          // email
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: emailController,
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
              controller: passwordController,
              validator: (value) {
                if (passwordController.text.length < 8) {
                  return "Password must be atleast 8 characters";
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(
                  hintText: "Password", border: OutlineInputBorder()),
            ),
          ),

          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegistrationScreen(),
                    ));
              },
              child: Text("Don't have an account?")),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: ()async {
                await Provider.of<LoginController>(context,listen: false).getCredentials();
                if (emailController.text ==
                        Provider.of<LoginController>(context, listen: false)
                            .email &&
                    passwordController.text ==
                        Provider.of<LoginController>(context, listen: false)
                            .password) {
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Logged in successfully')));
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ));
                } else {
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Credentials does not match')));
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
                    'Login',
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
