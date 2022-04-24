import 'package:flutter/material.dart';

class EmailPage extends StatefulWidget {
  final String emailsendin;
  const EmailPage({Key? key,required this.emailsendin}) : super(key: key);

  @override
  State<EmailPage> createState() => _EmailPageState();
}

class _EmailPageState extends State<EmailPage> {
late TextEditingController userinput;
@override
void initState() {
  userinput=TextEditingController(text:widget.emailsendin);
  super.initState();
  
}
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
                
              
              Container(
                                decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(9),
    border: Border.all(color: const Color(0xffECECEC)),
    color: Colors.white,
   
    ),

                             child: Padding(
                               padding: const EdgeInsets.only(left:15.0,right:15),
                               child: TextFormField(
                                 controller: userinput,
                      style:const TextStyle(color:Colors.black,fontWeight: FontWeight.w500,fontSize: 18,fontFamily:"Poppins"),
                                 
                  decoration: const InputDecoration(
                    label:Text("Email"),
                      labelStyle:TextStyle(color:Colors.black,fontWeight: FontWeight.w400,fontSize: 12,fontFamily:"Poppins") ,
                    border:InputBorder.none,
                    //  const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))
                    // )
                    ),
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