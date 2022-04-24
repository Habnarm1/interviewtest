import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'otppage.dart';

class PhonePage extends StatefulWidget {
    final String phonesendin;
  const  PhonePage({Key? key,required this.phonesendin}) : super(key: key);


  @override
  State<PhonePage> createState() => _PhonePageState();
}

class _PhonePageState extends State<PhonePage> {
late TextEditingController userinput;
String verificationid="";
@override
void initState() {
  userinput=TextEditingController(text:widget.phonesendin);
  super.initState();
  
}
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:   Stack(
        fit:StackFit.expand,
        children: [
              Container(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: const [
                          SizedBox(width: 5,),
                          Icon(Icons.arrow_back,color: Color.fromRGBO(19, 15, 38, 1),size: 19,),
                          SizedBox(width: 10,),
                          Text("Connect your wallet", style: TextStyle(color:Color.fromRGBO(0, 0,0,1) ,fontSize: 25, fontWeight: FontWeight.w700,fontFamily: "Poppins"),),
                      
                        ],
                      ),
              const SizedBox(height: 4,),

                        const Text("We’ll need this to verify your identity",style: TextStyle(color:Color.fromRGBO(0, 0,0,0.6) ,fontSize: 16, fontWeight: FontWeight.w400,fontFamily: "Poppins")),
                    ],
                  ),
                ),
              ),
        
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                
              
              Container(
                                decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(9),
    border: Border.all(color: const Color(0xffECECEC)),
    color: Colors.white,
   
    ),

                             child: TextFormField(
                               controller: userinput,
                      style:const TextStyle(color:Colors.black,fontWeight: FontWeight.w500,fontSize: 18,fontFamily:"Poppins"),
                               
                  decoration: InputDecoration(
                    label:const Text("Phone"),
                      labelStyle:const TextStyle(color:Colors.black,fontWeight: FontWeight.w400,fontSize: 12,fontFamily:"Poppins") ,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network("https://cdn.britannica.com/33/4833-004-828A9A84/Flag-United-States-of-America.jpg", width: 10,height:10),
                    ),
                    // hintText: "Phone number or Email",
                    hintStyle:const  TextStyle(color:Color.fromRGBO(0, 0,0,1) ,fontSize:15, fontWeight: FontWeight.w500,fontFamily: "Poppins"),
                    border:InputBorder.none,
                    //  const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))
                    // )
                    ),
                ),
              ),
              const SizedBox(height: 21,),

              Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                  color:const Color.fromRGBO(197, 255, 41, 1),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: TextButton(onPressed: (){

                          loginUser(userinput.text, context);

                  }, child: const Text("Continue" ,
                  style:  TextStyle(color:Color.fromRGBO(0, 0,0,1) ,fontSize:18, fontWeight: FontWeight.w500,fontFamily: "Poppins"),))),

              const SizedBox(height: 21,),
              // By signing up I agree to Zëdfi’s Privacy Policy and Terms of Use and allow Zedfi to use your information for future Marketing purposes.
              RichText(
                textAlign: TextAlign.justify,
              text: const TextSpan(
                text: 'By signing up I agree to Zëdfi’s ',
                style:  TextStyle(color:Color.fromRGBO(0, 0,0,0.6) ,fontSize:12, fontWeight: FontWeight.w400,fontFamily: "Poppins"),
                children: <TextSpan>[
                   TextSpan(text: 'Privacy Policy',
                style: TextStyle(color:Color.fromRGBO(0, 0,0,1) ,fontSize:12, fontWeight: FontWeight.bold,fontFamily: "Poppins")),
                  TextSpan(text: ' and ',
                style:  TextStyle(color:Color.fromRGBO(0, 0,0,0.6) ,fontSize:12, fontWeight: FontWeight.w400,fontFamily: "Poppins")),
                  TextSpan(text: 'Terms of Use',
                style: TextStyle(color:Color.fromRGBO(0, 0,0,1) ,fontSize:12, fontWeight: FontWeight.bold,fontFamily: "Poppins")),
                 
                ],
              )),
            
              ],
            ),
          ),
        ],
      )
    );
  }

 // ignore: missing_return
loginUser(String phone, BuildContext context) async {
    _auth.verifyPhoneNumber(
        phoneNumber: phone,
        timeout: const Duration(seconds: 60),
        verificationCompleted: (AuthCredential credential) async {
    Fluttertoast.showToast(
        msg: "Verification Complete",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
        
        },
        verificationFailed: (FirebaseAuthException exception) {
          print(exception.message);
          Fluttertoast.showToast(
        msg: "Verification Error try again later",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
        },
        codeSent: (String verificationId1, int? forceResendingToken) {
              Fluttertoast.showToast(
        msg: "Verification Code sent",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
          setState(() {
            verificationid=verificationId1;
          });
           Navigator.push(
context,
MaterialPageRoute(builder: (context) => OtpPage(verificationid:verificationId1,verificationtype:1)),);
        }, 
        codeAutoRetrievalTimeout: (String verificationId) {  },
        );
  }
}