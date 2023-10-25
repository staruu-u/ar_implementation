import 'package:ar_implementation/resources/stylo.dart';
import 'package:ar_implementation/screens/sign_up.dart';
import 'package:flutter/material.dart';

import '../services/auth.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _onLoading = false;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  final _auth = FireAuth();
  final _stylo = Stylo();
  bool _obscure = true;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _obscurePass() {
    setState(() {
      _obscure = !_obscure;
    });
  }

  void _signIn(email, password) async {
    setState(() {
      _onLoading = !_onLoading;
    });
    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(_stylo.snackBar("Some Fields are missing"));
      setState(() {
        _onLoading = !_onLoading;
      });
      return;
    }
    String toastPhrase = await _auth.logIn(email, password);
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(_stylo.snackBar(toastPhrase));
    setState(() {
      _onLoading = !_onLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF142464),
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: Align(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: <Widget>[
                const SizedBox(height: 20),
                Image.asset('images/logo.png'),
                Container(
                  height: 60,
                  width: 310,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15, 5, 0, 0),
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: 'Email',
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                      controller: _emailController,
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                Container(
                  height: 60,
                  width: 310,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 5, 0, 0),
                        child: SizedBox(
                          width: 245,
                          child: TextField(
                            decoration: const InputDecoration(
                              hintText: 'Password',
                              hintStyle: TextStyle(color: Colors.white),
                            ),
                            controller: _passwordController,
                            obscureText: _obscure,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          _obscurePass();
                        },
                        icon: const Icon(
                          Icons.visibility,
                          color: Color.fromARGB(255, 59, 136, 193),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 35),
                _onLoading
                    ? _stylo.waitForAsync()
                    : Container(
                        alignment: Alignment.center,
                        height: 55,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Stack(
                          children: <Widget>[
                            Align(
                              alignment: const Alignment(0, -.7),
                              child: ElevatedButton(
                                onPressed: (() => _signIn(_emailController.text,
                                    _passwordController.text)),
                                child: const Text('Sign In',
                                    style: TextStyle(color: Colors.white)),
                              ),
                            ),
                          ],
                        ),
                      ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpPage()),
                    );
                  },
                  child: const Text(
                    'Don\'t have an account?',
                    style: TextStyle(
                      fontSize: 10,
                      shadows: [
                        Shadow(
                          color: Color.fromARGB(255, 59, 136, 193),
                          offset: Offset(0, -5),
                        ),
                      ],
                      color: Colors.transparent,
                      decoration: TextDecoration.underline,
                      decorationColor: Color.fromARGB(255, 59, 136, 193),
                      decorationThickness: 4,
                      decorationStyle: TextDecorationStyle.solid,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
