// ignore_for_file: non_constant_identifier_names, unused_import
import "package:general_lib/general_lib.dart";
// import "dart:convert";


 
class PubspecTerminalLibraryEnvironment extends JsonScheme {

  
  PubspecTerminalLibraryEnvironment(super.rawData);
   
  static Map get defaultData {
    return {"@type":"pubspecTerminalLibraryEnvironment","sdk":">=2.18.5 <3.0.0"};
  }

  
  String? get special_type {
    try {
      if (rawData["@type"] is String == false){
        return null;
      }
      return rawData["@type"] as String;
    } catch (e) {
      return null;
    }
  }

  
  set special_type(String? value) {
    rawData["@type"] = value;
  }


  
  String? get sdk {
    try {
      if (rawData["sdk"] is String == false){
        return null;
      }
      return rawData["sdk"] as String;
    } catch (e) {
      return null;
    }
  }

  
  set sdk(String? value) {
    rawData["sdk"] = value;
  }


  
  static PubspecTerminalLibraryEnvironment create({

    String special_type = "pubspecTerminalLibraryEnvironment",
    String? sdk,
})  {
    // PubspecTerminalLibraryEnvironment pubspecTerminalLibraryEnvironment = PubspecTerminalLibraryEnvironment({
Map pubspecTerminalLibraryEnvironment_data_create_json = {
  
      "@type": special_type,
      "sdk": sdk,


};


          pubspecTerminalLibraryEnvironment_data_create_json.removeWhere((key, value) => value == null);
PubspecTerminalLibraryEnvironment pubspecTerminalLibraryEnvironment_data_create = PubspecTerminalLibraryEnvironment(pubspecTerminalLibraryEnvironment_data_create_json);

return pubspecTerminalLibraryEnvironment_data_create;



      }
}