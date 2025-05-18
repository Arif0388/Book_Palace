import 'package:book_palacee/AuthPage/login_page.dart';
import 'package:book_palacee/Controller/authcontroller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  AuthController authController = Get.put(AuthController());
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:true,
      body:SingleChildScrollView(
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
                      Text('Sign Up',style:GoogleFonts.poppins(fontSize:20,fontWeight:FontWeight.w600)),
                      Text('Please enter the details to continue.',style:GoogleFonts.poppins(fontSize:15,fontWeight:FontWeight.w500)),
                      ListTile(
                        title:Text('Name',style:Theme.of(context).textTheme.bodyLarge),
                        subtitle:Container(
                          padding:const EdgeInsets.all(5),
                          width:MediaQuery.of(context).size.width,
                          height:50,
                         decoration:BoxDecoration(
                           borderRadius:BorderRadius.circular(10),
                           color:Colors.blueGrey[100],
                         ),
                          child:TextFormField(
                            controller:_nameController,
                            style:Theme.of(context).textTheme.labelLarge,
                            decoration:const InputDecoration(
                              hintText:'Enter Name',
                              border:InputBorder.none,
                              prefixIcon:Icon(Icons.person,color:Colors.blueAccent,)
                            ),
                          ),
                        ),
                      ),
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
                            controller:_emailController,
                            // style:Theme.of(context).textTheme.labelLarge,
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
                            controller:_passwordController,
                            style:Theme.of(context).textTheme.labelLarge,
                            decoration:const InputDecoration(
                                hintText:'Enter Password',
                                border:InputBorder.none,
                                prefixIcon:Icon(Icons.password,color:Colors.blueAccent,)
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height:15),
                      InkWell(
                        hoverColor:Colors.transparent,
                        focusColor:Colors.transparent,
                        highlightColor:Colors.transparent,
                        splashColor:Colors.transparent,
                        onTap:(){
                          if(_nameController.text.isNotEmpty && _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty){
                            authController.signup(_emailController.text.trim(),_passwordController.text.trim(),_nameController.text.trim());
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
                            child:Obx(() =>Center(child: authController.isLoading.value? const CupertinoActivityIndicator() : Text('Sign Up',style:Theme.of(context).textTheme.bodyLarge?.copyWith(color:Colors.white)))),
                          ),
                        ),
                      ),
                      const SizedBox(height:15),
                      Row(
                       mainAxisAlignment:MainAxisAlignment.center,
                        children: [
                           Text('Already have an account?',style:Theme.of(context).textTheme.bodyLarge),
                          const SizedBox(width:8),
                          InkWell(
                              onTap:(){
                                Get.to(const LoginPage());
                              },
                              child: Text('Login',style:GoogleFonts.poppins(fontWeight:FontWeight.w600)))
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
