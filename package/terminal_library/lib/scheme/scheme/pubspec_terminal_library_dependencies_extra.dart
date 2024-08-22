// ignore_for_file: non_constant_identifier_names, unused_import
import "package:general_lib/general_lib.dart";
// import "dart:convert";


 
class PubspecTerminalLibraryDependenciesExtra extends JsonScheme {

  
  PubspecTerminalLibraryDependenciesExtra(super.rawData);
   
  static Map get defaultData {
    return {"@type":"pubspecTerminalLibraryDependenciesExtra","sdk":"flutter"};
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


  
  static PubspecTerminalLibraryDependenciesExtra create({

    String special_type = "pubspecTerminalLibraryDependenciesExtra",
    String? sdk,
})  {
    // PubspecTerminalLibraryDependenciesExtra pubspecTerminalLibraryDependenciesExtra = PubspecTerminalLibraryDependenciesExtra({
Map pubspecTerminalLibraryDependenciesExtra_data_create_json = {
  
      "@type": special_type,
      "sdk": sdk,


};


          pubspecTerminalLibraryDependenciesExtra_data_create_json.removeWhere((key, value) => value == null);
PubspecTerminalLibraryDependenciesExtra pubspecTerminalLibraryDependenciesExtra_data_create = PubspecTerminalLibraryDependenciesExtra(pubspecTerminalLibraryDependenciesExtra_data_create_json);

return pubspecTerminalLibraryDependenciesExtra_data_create;



      }
}