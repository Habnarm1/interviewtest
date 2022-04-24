

class CustomFunction{


bool isNumeric(String s) {
if (s == "") {
   return false;
 }
 return double.tryParse(s) != null;
}


//EMAIL VALIDATOR
bool validateEmail(String value) {
 bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value);
 return emailValid;
}

}