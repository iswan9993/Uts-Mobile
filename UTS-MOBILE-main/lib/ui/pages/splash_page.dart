part of 'pages.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SplashPage> {
  bool signinPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Column(
        children: [
          const SizedBox(height: 200),
          Container(
            width: 300,
            height: 119,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/flutix_logo.png"),
              ),
            ),
          ),
          const SizedBox(height: 40),
          const Text("Your Journey",
              style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color:Colors.black,
              )),
          const SizedBox(height: 15),
          const Text(
            "Movie is much better",
            style: TextStyle(
              fontSize: 16,
              color: Colors.purple,
            ),
          ),
          const Text("So exited than before.",
              style: TextStyle(
                  fontFamily: 'Raleway',
                  fontSize: 16,
                  color: Colors.purple)
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.deepPurple,
                  backgroundColor: Colors.deepPurple,
                  padding: const EdgeInsets.symmetric(horizontal: 120.0),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const SignUp();
                  }));
                },
                child: const Text(
                  "Started your Journey!",
                  style: TextStyle(
                      fontFamily: 'Raleway',
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Already has an account? ",
                style: TextStyle(
                  fontFamily: 'Raleway',
                  fontSize: 13,
                  color: Colors.black,
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    signinPressed = !signinPressed;
                  });
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return const SignIn();
                  }));
                },
                child: Text(
                  "Sign In",
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    color: signinPressed
                        ? Colors.deepPurple
                        : Colors.deepPurple,
                    fontSize: 13,
                    decoration: TextDecoration.underline,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 80),
        ],
      )),
    );
  }
}
