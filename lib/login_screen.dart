import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final userIdController = TextEditingController();
  final passwordController = TextEditingController();
  final FocusNode _passwordFocusNode = FocusNode();
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Kormi No/User ID:',
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: userIdController,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.blue.shade900,
                        fontSize: 16),
                    keyboardType: TextInputType.text,
                    textCapitalization: TextCapitalization.characters,
                    textInputAction: TextInputAction.next,
                    onEditingComplete: () =>
                        FocusScope.of(context).requestFocus(_passwordFocusNode),
                    decoration: InputDecoration(
                      hintText: 'Enter your User ID',
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 11, horizontal: 10),
                      //hintStyle: robotoSlab.copyWith(color: Colors.black45),
                      // filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            width: 1, color: Color.fromARGB(255, 10, 85, 143)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          width: 2,
                          color: Color.fromARGB(255, 10, 85, 143),
                        ),
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Password:',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 16,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: _isObscure,
                    focusNode: _passwordFocusNode,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.blue.shade900,
                        fontSize: 20),
                    decoration: InputDecoration(
                        hintText: 'Enter your Password',
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 11, horizontal: 10),
                        //hintStyle: robotoSlab.copyWith(color: Colors.black45),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(width: 2, color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            width: 2,
                            color: Color.fromARGB(255, 10, 85, 143),
                          ),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                          icon: Icon(_isObscure
                              ? Icons.visibility
                              : Icons.visibility_off),
                        )),
                    onEditingComplete: () {
                    
                    },
                  ),
                ),InkWell(
                    onTap: () {
                      //authProvider.toggleRememberMe();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Row(
                        children: [
                          Container(
                            width: 18,
                            height: 18,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              border: Border.all(
                                  color: Colors.grey),
                              borderRadius: BorderRadius.circular(3),
                            ),
                            child:  const SizedBox.shrink(),
                          ),
                         // const SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
                          Text(
                            'Remember me',
                            //style: robotoSlab.copyWith(),
                          )
                        ],
                      ),
                    ),
                  ),
                const SizedBox(
                  height: 13,
                ),
                Center(
                  child: Container(
                      width: 250,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(26),
                      ),
                      child:  ElevatedButton(
                              onPressed: (){},
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  const Color.fromARGB(255, 231, 109, 100),
                                ),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: const BorderSide(color: Colors.red),
                                  ),
                                ),
                              ),
                              child: const Text(
                                'Sign In',
                                style: TextStyle(
                                    fontWeight: FontWeight.w800, fontSize: 18),
                              ),
                            )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
