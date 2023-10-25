import 'package:flutter/material.dart';
import '../resources/stylo.dart';
import '../services/auth.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _onLoading = false;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;
  late TextEditingController _username;
  final _auth = FireAuth();
  final stylo = Stylo();
  bool _obscure = true;
  bool _obscureC = true;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    _username = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _username.dispose();
    super.dispose();
  }

  void _obscurePass() {
    setState(() {
      _obscure = !_obscure;
    });
  }

  void _obscureConfirm() {
    setState(() {
      _obscureC = !_obscureC;
    });
  }

  void _createAccount(email, password, confirmPassword, username) async {
    setState(() {
      _onLoading = !_onLoading;
    });
    if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(stylo.snackBar("Some Fields are missing"));
      setState(() {
        _onLoading = !_onLoading;
      });
      return;
    }
    // Perform validation and check if the password and confirm password match
    if (password != confirmPassword) {
      ScaffoldMessenger.of(context)
          .showSnackBar(stylo.snackBar("Password Mismatch"));
    } else {
      String toastPhrase = await _auth.signUp(email, password, username);
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(stylo.snackBar(toastPhrase));
    }
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
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15, 5, 0, 0),
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: 'Username',
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                      controller: _username,
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
                              hintText: 'Re-Type Password',
                              hintStyle: TextStyle(color: Colors.white),
                            ),
                            controller: _confirmPasswordController,
                            obscureText: _obscureC,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          _obscureConfirm();
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
                    ? stylo.waitForAsync()
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
                                onPressed: () {
                                  _createAccount(
                                    _emailController.text,
                                    _passwordController.text,
                                    _confirmPasswordController.text,
                                    _username.text,
                                  );
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  'Sign Up',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Already have an account?",
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
