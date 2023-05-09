import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week9_authentication/models/auth_model.dart';
import '../providers/auth_provider.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController fnameController = TextEditingController();
    TextEditingController lnameController = TextEditingController();

    final fname = TextField(
      controller: fnameController,
      decoration: const InputDecoration(
        hintText: "First Name",
      ),
    );

    final lname = TextField(
      controller: lnameController,
      decoration: const InputDecoration(
        hintText: "Last Name",
      ),
    );

    final email = TextField(
      controller: emailController,
      decoration: const InputDecoration(
        hintText: "Email",
      ),
    );

    final password = TextField(
      controller: passwordController,
      obscureText: true,
      decoration: const InputDecoration(
        hintText: 'Password',
      ),
    );

    final SignupButton = Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: ElevatedButton(
        onPressed: () async {
          Users user = Users(
              email: emailController.text,
              fname: fnameController.text,
              lname: lnameController.text);
          await context.read<AuthProvider>().addUser(user);
          await context.read<AuthProvider>().signUp(
              // fnameController.text,
              // lnameController.text,
              emailController.text,
              passwordController.text);
          if (context.mounted) Navigator.of(context).pop();
        },
        child: const Text('Sign up', style: TextStyle(color: Colors.white)),
      ),
    );

    final backButton = Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: ElevatedButton(
        onPressed: () async {
          Navigator.pop(context);
        },
        child: const Text('Back', style: TextStyle(color: Colors.white)),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.only(left: 40.0, right: 40.0),
          children: <Widget>[
            const Text(
              "Sign Up",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25),
            ),
            fname,
            lname,
            email,
            password,
            SignupButton,
            backButton
          ],
        ),
      ),
    );
  }
}
