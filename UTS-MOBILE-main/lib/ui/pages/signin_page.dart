part of 'pages.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isPasswordHidden = true;
  bool loginFailed = false;

  // void showAlertSuccess(String message) {
  //   QuickAlert.show(
  //     context: context,
  //     type: QuickAlertType.success,
  //     text: message
  // }

  void ClearInputs() {
    emailController.clear();
    passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    bool isButtonPressed = false;
    return Material(
      color: Colors.white,
      child: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 16, right: 16),
                padding: const EdgeInsets.all(8.0),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 188, 20),
                      constraints: const BoxConstraints(
                        maxWidth: 147,
                      ),
                      child: const Text(
                        'Hello, Filmmania',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          height: 1.175,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 188, 10),
                      width: double.infinity,
                      height: 100,
                      constraints: const BoxConstraints(
                        maxWidth: 147,
                      ),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          image: DecorationImage(
                            image: AssetImage('assets/flutix_logo.png'),
                            fit: BoxFit.cover,
                          )),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(5, 0, 5, 22),
                      width: double.infinity,
                      height: 69,
                      child: Material(
                        color: Colors.white,
                        child: TextFormField(
                          controller: emailController,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                          decoration: const InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 20.0),
                            labelText: 'Email',
                            labelStyle: TextStyle(
                              color: Colors.deepPurple,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                            hintText: 'Input Email',
                            hintStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.deepPurple,
                                width: 2,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.deepPurple,
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(5, 0, 5, 22),
                      width: double.infinity,
                      height: 69,
                      child: Material(
                        color: Colors.white,
                        child: TextFormField(
                          // controller: TextEditingController(),
                          controller: passwordController,
                          obscureText: _isPasswordHidden,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 20.0),
                            labelText: 'Password',
                            labelStyle: const TextStyle(
                              color: Colors.deepPurple,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                            hintText: 'Input Password',
                            hintStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.deepPurple,
                                width: 2,
                              ),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.deepPurple,
                                width: 1,
                              ),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isPasswordHidden
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.deepPurple,
                              ),
                              onPressed: () {
                                // Toggle the visibility of the password
                                setState(() {
                                  _isPasswordHidden = !_isPasswordHidden;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Visibility(
                        visible: loginFailed,
                        child: const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Incorrect Email or Password',
                            style: TextStyle(
                              fontFamily: 'Raleway',
                              fontSize: 15,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 114,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        handleSubmit();
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(330, 40),
                      ).merge(
                        ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed)) {
                                isButtonPressed = true;
                                return Colors.deepPurple;
                              } else {
                                isButtonPressed = false;
                                return Colors.purple;
                              }
                            },
                          ),
                        ),
                      ),
                      child: const Text(
                        'Sign In',
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          height: 1.175,
                          color: Color(0xff000000),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                        children: [
                          const TextSpan(
                            text: 'Don’t have any account? ',
                          ),
                          TextSpan(
                            text: 'Sign Up',
                            style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.underline,
                              color: Colors.deepPurple,
                              decorationColor: Colors.deepPurple,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) {
                                    return const SignUp();
                                  },
                                ));
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  handleSubmit() async {
    if (!_formKey.currentState!.validate()) return false;
    UserData userData = Provider.of<UserData>(context, listen: false);
    final email = emailController.text;
    final password = passwordController.text;
    Map<String, dynamic> loginSucces = await Auth().login(email, password);
    print(loginSucces);
    setState(() {
      if (loginSucces['success']) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) {
          return const Home();
        },
      ));
      } else {
        loginFailed = true;
      }
    });
    if (!loginFailed) {
      userData.userId = loginSucces['userId'];
      await userData.getData();
      if (!context.mounted) return;
      final snackBar = SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'Login Successfully!',
          message: 'You are successfully login to the app!!! ',
          contentType: ContentType.success,
        ),
      );

      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);

      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) {
          return const Home();
        },
      ));
    }

    return true;
  }
}
