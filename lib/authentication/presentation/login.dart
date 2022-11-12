import 'package:flutter/material.dart';
import 'package:waste_manage_sys/authentication/presentation/register.dart';
import 'package:waste_manage_sys/routes/routes_constant.dart';
import 'package:waste_manage_sys/widget/waveclipper.dart';

final number = TextEditingController();
final password = TextEditingController();

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String userNumber = "9808901365";
    const String userPassword = "11111111";

    return Scaffold(
        backgroundColor: Colors.white,
        body: GestureDetector(
          onTap: () {
            // call this method here to hide soft keyboard
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: logInWid(number, password, context, userNumber, userPassword),
        ));
  }

  Widget logInWid(TextEditingController email, TextEditingController password, var context, String userNumber, String userPassword) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              ClipPath(
                clipper: WaveClipper(),
                child: Container(
                  padding: const EdgeInsets.only(bottom: 450),
                  color: Colors.deepOrange.withOpacity(.8),
                  height: 220,
                  alignment: Alignment.center,
                ),
              ),
              ClipPath(
                clipper: WaveClipper(waveDeep: 0, waveDeep2: 100),
                child: Container(
                  padding: const EdgeInsets.only(bottom: 50),
                  color: Colors.deepOrange.withOpacity(.3),
                  height: 180,
                  alignment: Alignment.center,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "SIGN IN",
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.w400, color: Colors.black),
                ),
                const Divider(),
                const SizedBox(height: 20),
                emailText(email),
                const SizedBox(height: 20),
                PasswordWidget(password: password),
                const SizedBox(height: 30),
                loginBtn(context, email, password, userNumber, userPassword),
                const SizedBox(height: 18),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(fontWeight: FontWeight.w400),
                    )),
                const SizedBox(height: 15),
                const Text("---------------------- OR ------------------------"),
                const SizedBox(height: 10),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(elevation: 0.5, backgroundColor: Colors.deepOrange[500]),
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => const CreateUser()));
                    },
                    child: const Text("Create New Account", style: TextStyle(fontWeight: FontWeight.w300))),
              ],
            ),
          ),
        ],
      ),
    );
  }

  TextFormField emailText(TextEditingController email) {
    return TextFormField(
      maxLength: 10,
      controller: email,
      decoration: const InputDecoration(labelText: "Phone No.", counterText: ""),
      textInputAction: TextInputAction.next,
      cursorColor: Colors.black,
      autofocus: false,
      keyboardType: TextInputType.number,
    );
  }

  SizedBox loginBtn(context, TextEditingController email, TextEditingController password, String userNumber, String userPassword) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 100,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(elevation: 0.5, backgroundColor: Colors.deepOrange),
          onPressed: () {
            if (email.text == userNumber && password.text == userPassword) {
              Navigator.pushReplacementNamed(context, RouteConstant.homeScreen);
            }
          },
          child: const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text("LOG IN", style: TextStyle(fontSize: 15)),
          )),
    );
  }
}

class PasswordWidget extends StatefulWidget {
  const PasswordWidget({
    Key? key,
    required this.password,
  }) : super(key: key);

  final TextEditingController password;

  @override
  State<PasswordWidget> createState() => _PasswordWidgetState();
}

class _PasswordWidgetState extends State<PasswordWidget> {
  bool obscure = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.password,
      decoration: InputDecoration(
        labelText: "Password",
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              obscure = !obscure;
            });
          },
          child: Icon(obscure ? Icons.visibility : Icons.visibility_off),
        ),
      ),
      textInputAction: TextInputAction.next,
      cursorColor: Colors.black,
      obscureText: obscure ? false : true,
      autofocus: false,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Enter a valid password!';
        }
        if (value.length < 6) {
          return 'Invalid Password';
        }
        return null;
      },
    );
  }
}
