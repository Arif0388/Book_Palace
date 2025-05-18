import 'package:book_palacee/AuthPage/sign_up_page.dart';
import 'package:book_palacee/Controller/authcontroller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  AuthController authController = Get.put(AuthController());
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:true,
      body:SingleChildScrollView(
        scrollDirection:Axis.vertical,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: IntrinsicHeight(
            child: Column(
              children: [
                Container(
                  width:MediaQuery.of(context).size.width,
                  height:300,
                  color: Colors.blue,
                  child:Image.asset('assets/Images/s.jpg',fit:BoxFit.cover,),
                ),
                const SizedBox(height:20),
                Container(
                  margin:const EdgeInsets.only(left:7),
                  child:Column(
                    children: [
                      Text('Login',style:GoogleFonts.poppins(fontSize:20,fontWeight:FontWeight.w600)),
                      Text('Please enter the details to continue.',style:GoogleFonts.poppins(fontSize:15,fontWeight:FontWeight.w500)),
                      ListTile(
                        title:Text('Email',style:Theme.of(context).textTheme.bodyLarge),
                        subtitle:Container(
                          padding:const EdgeInsets.all(5),
                          width:MediaQuery.of(context).size.width,
                          height:50,
                          decoration:BoxDecoration(
                            borderRadius:BorderRadius.circular(10),
                            color:Colors.blueGrey[100],
                          ),
                          child:TextFormField(
                            controller: _emailController,
                            style:Theme.of(context).textTheme.labelLarge,
                            decoration:const InputDecoration(
                                hintText:'Enter Email',
                                border:InputBorder.none,
                                prefixIcon:Icon(Icons.email_outlined,color:Colors.blueAccent,)
                            ),
                          ),
                        ),
                      ),
                      ListTile(
                        title:Text('Password',style:Theme.of(context).textTheme.bodyLarge),
                        subtitle:Container(
                          padding:const EdgeInsets.all(5),
                          width:MediaQuery.of(context).size.width,
                          height:50,
                          decoration:BoxDecoration(
                            borderRadius:BorderRadius.circular(10),
                            color:Colors.blueGrey[100],
                          ),
                          child:TextFormField(
                            controller: _passwordController,
                            style:Theme.of(context).textTheme.labelLarge,
                            decoration:const InputDecoration(
                                hintText:'Enter Password',
                                border:InputBorder.none,
                                prefixIcon:Icon(Icons.password,color:Colors.blueAccent,)
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment:MainAxisAlignment.end,
                        children: [
                          Text('Forget Password?',style:GoogleFonts.aleo()),
                          const SizedBox(width:15),
                        ],
                      ),
                      const SizedBox(height:15),
                      InkWell(
                        onTap:(){
                         if(_emailController.text.isNotEmpty && _passwordController.text.isNotEmpty){
                           authController.login(_emailController.text.trim(), _passwordController.text.trim());
                         }else{
                            Fluttertoast.showToast(
                             msg:'Please fill all field',
                             backgroundColor:Colors.greenAccent,
                           );
                         }
                        },
                        child: Card(
                          elevation:2,
                          child: Container(
                            width:MediaQuery.of(context).size.width/2,
                            height:50,
                            decoration:BoxDecoration(
                              color:Colors.greenAccent,
                              borderRadius:BorderRadius.circular(13),
                            ),
                            child:Obx(() => Center(child:authController.isLoading.value?  const CupertinoActivityIndicator() :  Text('Login',style:Theme.of(context).textTheme.bodyLarge?.copyWith(color:Colors.white)))),
                          ),
                        ),
                      ),
                      const SizedBox(height:15),
                      Row(
                        mainAxisAlignment:MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account?",style:Theme.of(context).textTheme.bodyLarge),
                          const SizedBox(width:8),
                          InkWell(
                              onTap:(){
                                Get.to(const SignUpPage());
                              },
                              child: Text('Sign Up',style:GoogleFonts.poppins(fontWeight:FontWeight.w600)))
                        ],
                      )
                    ],
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
