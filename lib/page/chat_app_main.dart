import 'package:flutter/material.dart';
import 'package:testapp/config/palette.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:testapp/page/chat_screen.dart';

class LoginSinUpScreen extends StatefulWidget {
  const LoginSinUpScreen({Key? key}) : super(key: key);

  @override
  State<LoginSinUpScreen> createState() => _LoginSinUpScreenState();
}

class _LoginSinUpScreenState extends State<LoginSinUpScreen> {
  final _authentication = FirebaseAuth.instance;
  bool isSingupScreen = true;
  final _formKey = GlobalKey<FormState>();
  String userName = '';
  String userEmail = '';
  String userPassword = '';
  void _tryValidation() {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              child: Container(
                height: 300,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/chatapp/red.jpg"),
                        fit: BoxFit.fill)),
                child: Container(
                  padding: const EdgeInsets.only(top: 90, left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                            text: "Welcome",
                            style: TextStyle(
                              letterSpacing: 1.0,
                              fontSize: size.width * 0.05,
                              color: Colors.white,
                            ),
                            children: [
                              TextSpan(
                                  text: isSingupScreen
                                      ? " to Yummy chat!"
                                      : " back",
                                  style: TextStyle(
                                      letterSpacing: 1.0,
                                      fontSize: size.width * 0.05,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold))
                            ]),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        isSingupScreen
                            ? "Singup to continue"
                            : "Signin to continue",
                        style: const TextStyle(
                            color: Colors.white, letterSpacing: 1.0),
                      )
                    ],
                  ),
                ),
              ),
            ),
            //배경
            AnimatedPositioned(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeIn,
              top: 180,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeIn,
                padding: const EdgeInsets.all(20),
                height: isSingupScreen ? 280 : 250,
                width: size.width - 40,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 15,
                          spreadRadius: 5)
                    ]),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSingupScreen = false;
                            });
                          },
                          child: Column(
                            children: [
                              Text("LOGIN",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: !isSingupScreen
                                        ? Palette.activeColor
                                        : Palette.textColor1,
                                  )),
                              if (!isSingupScreen)
                                Container(
                                  margin: const EdgeInsets.only(top: 3),
                                  height: 2,
                                  width: 55,
                                  color: Colors.orange,
                                )
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSingupScreen = true;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                "SIGNUP",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: !isSingupScreen
                                        ? Palette.textColor1
                                        : Palette.activeColor),
                              ),
                              if (isSingupScreen)
                                Container(
                                  margin: const EdgeInsets.only(top: 3),
                                  height: 2,
                                  width: 55,
                                  color: Colors.orange,
                                )
                            ],
                          ),
                        )
                      ],
                    ),
                    if (isSingupScreen)
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                key: const ValueKey(1),
                                validator: (value) {
                                  if (value!.isEmpty || value.length < 4) {
                                    return "Please enter at least 4 charcters";
                                  }
                                  return null;
                                },
                                onSaved: ((value) {
                                  userName = value!;
                                }),
                                onChanged: (value) {
                                  userName = value;
                                },
                                decoration: const InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.account_circle,
                                      color: Palette.iconColor,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Palette.textColor1,
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(35.0)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Palette.textColor1,
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(35.0)),
                                    ),
                                    hintText: "User name",
                                    hintStyle: TextStyle(
                                      fontSize: 14,
                                      color: Palette.textColor1,
                                    ),
                                    contentPadding: EdgeInsets.all(10)),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                key: const ValueKey(2),
                                validator: (value) {
                                  if (value!.isEmpty || !value.contains("@")) {
                                    return "Please enter a valid email address.";
                                  }
                                  return null;
                                },
                                onSaved: ((value) {
                                  userEmail = value!;
                                }),
                                onChanged: (value) {
                                  userEmail = value;
                                },
                                decoration: const InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.email,
                                      color: Palette.iconColor,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Palette.textColor1,
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(35.0)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Palette.textColor1,
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(35.0)),
                                    ),
                                    hintText: "email",
                                    hintStyle: TextStyle(
                                      fontSize: 14,
                                      color: Palette.textColor1,
                                    ),
                                    contentPadding: EdgeInsets.all(10)),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              TextFormField(
                                obscureText: true,
                                key: const ValueKey(3),
                                validator: ((value) {
                                  if (value!.isEmpty || value.length < 6) {
                                    return "Password must be at least 8 characters long ";
                                  }
                                  return null;
                                }),
                                onSaved: ((value) {
                                  userPassword = value!;
                                }),
                                onChanged: ((value) {
                                  userPassword = value;
                                }),
                                decoration: const InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.lock,
                                      color: Palette.iconColor,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Palette.textColor1,
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(35.0)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Palette.textColor1,
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(35.0)),
                                    ),
                                    hintText: "password",
                                    hintStyle: TextStyle(
                                      fontSize: 14,
                                      color: Palette.textColor1,
                                    ),
                                    contentPadding: EdgeInsets.all(10)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    if (!isSingupScreen)
                      Container(
                        margin: const EdgeInsets.only(top: 30),
                        child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  key: const ValueKey(4),
                                  validator: (value) {
                                    if (value!.isEmpty ||
                                        !value.contains("@")) {
                                      return "Please enter a valid email address.";
                                    }
                                    return null;
                                  },
                                  onSaved: ((value) {
                                    userEmail = value!;
                                  }),
                                  onChanged: (value) {
                                    userEmail = value;
                                  },
                                  decoration: const InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.email,
                                        color: Palette.iconColor,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Palette.textColor1,
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(35.0)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Palette.textColor1,
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(35.0)),
                                      ),
                                      hintText: "email",
                                      hintStyle: TextStyle(
                                        fontSize: 14,
                                        color: Palette.textColor1,
                                      ),
                                      contentPadding: EdgeInsets.all(10)),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                TextFormField(
                                  obscureText: true,
                                  key: const ValueKey(5),
                                  validator: ((value) {
                                    if (value!.isEmpty || value.length < 6) {
                                      return "Password must be at least 8 characters long ";
                                    }
                                    return null;
                                  }),
                                  onSaved: ((value) {
                                    userPassword = value!;
                                  }),
                                  onChanged: ((value) {
                                    userPassword = value;
                                  }),
                                  decoration: const InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.lock,
                                        color: Palette.iconColor,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Palette.textColor1,
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(35.0)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Palette.textColor1,
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(35.0)),
                                      ),
                                      hintText: "password",
                                      hintStyle: TextStyle(
                                        fontSize: 14,
                                        color: Palette.textColor1,
                                      ),
                                      contentPadding: EdgeInsets.all(10)),
                                ),
                              ],
                            )),
                      ),
                  ]),
                ),
              ),
            ),
            //텍스트 폼 필드
            AnimatedPositioned(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeIn,
                top: isSingupScreen ? 420 : 390,
                right: 0,
                left: 0,
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50)),
                    child: GestureDetector(
                      onTap: () async {
                        if (isSingupScreen) {
                          _tryValidation();
                          try {
                            final newUser = await _authentication
                                .createUserWithEmailAndPassword(
                                    email: userEmail, password: userPassword);

                            if (newUser.user != null) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return const ChatScreen();
                                  },
                                ),
                              );
                            }
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    "Please check your email and password"),
                                backgroundColor: Colors.blue,
                              ),
                            );
                          }
                        }
                        if (!isSingupScreen) {
                          _tryValidation();

                          try {
                            final newUser = await _authentication
                                .signInWithEmailAndPassword(
                              email: userEmail,
                              password: userPassword,
                            );
                            if (newUser.user != null) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return const ChatScreen();
                                  },
                                ),
                              );
                            }
                          } catch (e) {
                            // ignore: avoid_print
                            print(e);
                          }
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                                colors: [Colors.orange, Colors.red],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight),
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                spreadRadius: 1,
                                blurRadius: 1,
                                offset: const Offset(0, 1),
                              ),
                            ]),
                        child: const Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )),
            //전송버튼
            AnimatedPositioned(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeIn,
              top: isSingupScreen ? size.height - 125 : size.height - 165,
              right: 0,
              left: 0,
              child: Column(children: [
                Text(isSingupScreen ? "or Singup with" : "or Signin with"),
                const SizedBox(
                  height: 10,
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                  label: const Text("Google"),
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      minimumSize: const Size(155, 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: Palette.googleColor),
                )
              ]),
            )
            //구글 로그인 버튼
          ],
        ),
      ),
    );
  }
}
