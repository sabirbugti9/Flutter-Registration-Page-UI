import 'package:flutter/material.dart';
import 'package:flutter_golang_yt/screens/home_screen.dart';
import 'package:flutter_golang_yt/screens/login.dart';
import 'package:get/get.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyRegisterState createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
  @override
  Widget build(BuildContext context) {
    var edgeInsets = EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.28);
    return Container(
      decoration: _bobDeco(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: _customAppBar(),
        body:  Stack(
          children: [
            const CreateText(),
            SingleChildScrollView(
              child: Container(
                padding: edgeInsets,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 35,right: 35),
                      child: const Column(
                        children: [
                          NameInput(),
                          SizedBox(height: 30,),
                          EmailInput(),
                          SizedBox(height: 30,),
                          PasswordInput(),
                          SizedBox(height: 40,),
                          SignUpWidget(),
                          SizedBox(height: 40,),
                          SignInText(),
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
    
    );
  }

































  AppBar _customAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  BoxDecoration _bobDeco() {
    return const BoxDecoration(
      image: DecorationImage(
          image: AssetImage('assets/register.png'), fit: BoxFit.cover),
    );
  }
}

class SignInText extends StatelessWidget {
  const SignInText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () {
            Get.to(() => const MyLogin(),
                transition: Transition.rightToLeftWithFade,
                duration: const Duration(seconds: 1));
          },
          style: const ButtonStyle(),
          child: const Text(
            'Sign In',
            textAlign: TextAlign.left,
            style: TextStyle(
                decoration: TextDecoration.underline,
                color: Colors.white,
                fontSize: 18),
          ),
        ),
      ],
    );
  }
}

class SignUpWidget extends StatelessWidget {
  const SignUpWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Sign Up',
          style: TextStyle(
              color: Colors.white, fontSize: 27, fontWeight: FontWeight.w700),
        ),
        CircleAvatar(
          radius: 25,
          backgroundColor: const Color(0xff4c505b),
          child: IconButton(
              color: Colors.white,
              onPressed: () {
                Get.to(() => const MyLogin(),
                    transition: Transition.rightToLeftWithFade,
                    duration: const Duration(seconds: 1));
              },
              icon: const Icon(
                Icons.arrow_forward,
              )),
        )
      ],
    );
  }
}

class PasswordInput extends StatelessWidget {
  const PasswordInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(color: Colors.white),
      obscureText: true,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.white,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.black,
            ),
          ),
          hintText: "Password",
          hintStyle: const TextStyle(color: Colors.white),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );
  }
}

class EmailInput extends StatelessWidget {
  const EmailInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.white,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.black,
            ),
          ),
          hintText: "Email",
          hintStyle: const TextStyle(color: Colors.white),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );
  }
}

class NameInput extends StatelessWidget {
  const NameInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.white,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.black,
            ),
          ),
          hintText: "Name",
          hintStyle: const TextStyle(color: Colors.white),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );
  }
}

class CreateText extends StatelessWidget {
  const CreateText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 35, top: 30),
      child: const Text(
        'Create\nAccount',
        style: TextStyle(color: Colors.white, fontSize: 33),
      ),
    );
  }
}
