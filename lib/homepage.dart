import 'package:flutter/material.dart';
import 'package:inteviewtest/phonenumberpage.dart';

import 'emailpage.dart';
import 'function.dart';

class AccountPage extends StatefulWidget {
  AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
late TextEditingController userinput;
@override
void initState() {
  userinput=TextEditingController();
  super.initState();
  
}
CustomFunction allfunc =CustomFunction();

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

                        const Text("We’ll send you a confirmation code",style: TextStyle(color:Color.fromRGBO(0, 0,0,0.6) ,fontSize: 16, fontWeight: FontWeight.w400,fontFamily: "Poppins")),
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
                
              
              TextField(
                controller: userinput,
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network("https://cdn.britannica.com/33/4833-004-828A9A84/Flag-United-States-of-America.jpg", width: 10,height:10),
                  ),
                  hintText: "Phone number or Email",
                  hintStyle:const  TextStyle(color:Color.fromRGBO(0, 0,0,1) ,fontSize:15, fontWeight: FontWeight.w500,fontFamily: "Poppins"),
                  border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
              ),
              const SizedBox(height: 21,),

              Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                  color:const Color.fromRGBO(197, 255, 41, 1),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: TextButton(onPressed: (){
                      var textinputed= userinput.text;
                     if(allfunc.validateEmail(textinputed) && !allfunc.isNumeric(textinputed)){
                      //   email page
                      Navigator.push(
context,
MaterialPageRoute(builder: (context) => EmailPage(emailsendin:textinputed,)),);
                     }else{
                      //  phone page
                                 Navigator.push(
context,
MaterialPageRoute(builder: (context) => PhonePage(phonesendin:textinputed,)),);
                     }
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
                  TextSpan(text: ' and allow Zedfi to use your information for future',
                style:  TextStyle(color:Color.fromRGBO(0, 0,0,0.6) ,fontSize:12, fontWeight: FontWeight.w400,fontFamily: "Poppins"),),
                  TextSpan(text: ' Marketing purposes',
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