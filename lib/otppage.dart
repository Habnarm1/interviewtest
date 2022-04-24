import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inteviewtest/pincodebox.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'function.dart';

class OtpPage extends StatefulWidget {
  String verificationid;
  int verificationtype;//1 for phone 2 for email
  OtpPage({Key? key, required this.verificationid,required this.verificationtype}) : super(key: key);

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
CustomFunction allfunc =CustomFunction();
  final FirebaseAuth _auth = FirebaseAuth.instance;

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
                          Text("We’ve sent you a code", style: TextStyle(color:Color.fromRGBO(0, 0,0,1) ,fontSize: 23, fontWeight: FontWeight.w700,fontFamily: "Poppins"),),
                      
                        ],
                      ),
              const SizedBox(height: 4,),

                        const Text("Enter the confirmation code below ",style: TextStyle(color:Color.fromRGBO(0, 0,0,0.6) ,fontSize: 16, fontWeight: FontWeight.w400,fontFamily: "Poppins")),
                    ],
                  ),
                ),
              ),
        
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
              
          PinEntryTextField(
                    onSubmit: (chr) async {
                      print(chr);
                  final code =chr.trim();

if(widget.verificationtype==1){
                              AuthCredential credential =
                                  PhoneAuthProvider.credential(
                                      verificationId: widget.verificationid,
                                      smsCode: code);

  UserCredential result =  await _auth.signInWithCredential(credential).catchError((err) async {
  if ("$err".contains('The sms verification code used to create the phone auth credential is invalid')) {
                                           Fluttertoast.showToast(
        msg: "The sms verification code used to create the phone auth credential is invalid",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  } else if ("$err".contains('The sms code has expired')) {
                                   Fluttertoast.showToast(
        msg: "The sms code has expired",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
});
    User? user = result.user;

                              if (user != null) {
                                              Fluttertoast.showToast(
        msg: "OTP Verified",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
                              } else {
                                                                         Fluttertoast.showToast(
        msg: "Verification failed",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
                              }

}else{
//  email verification
                                             Fluttertoast.showToast(
        msg: "Sendgrid is no activatedon firebase, please activate it",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );



}
                    }, 
                          fields: 6,
                          fieldWidth: 39,
                          fontSize: 15,
                          lastPin:"",
                          isTextObscure: true,
                          showFieldAsBox: false,
                        ),
              const SizedBox(height: 18,),
              RichText(
                textAlign: TextAlign.start,
              text: const TextSpan(
                text: 'Didn’t recieve a code? ',
                style:  TextStyle(color:Color.fromRGBO(0, 0,0,0.6) ,fontSize:12, fontWeight: FontWeight.w400,fontFamily: "Poppins"),
                children: <TextSpan>[
                   TextSpan(text: 'Wait for 57 sec',
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
}

