import 'dart:developer';

class Utils {
  static const bool isLoggingEnabled=true;
  static printInLog(String? data){
    if(isLoggingEnabled){
      log(data??'');
    }
  }
}