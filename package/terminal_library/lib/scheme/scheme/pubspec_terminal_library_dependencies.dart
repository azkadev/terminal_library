// ignore_for_file: non_constant_identifier_names, unused_import
import "package:general_lib/general_lib.dart";
// import "dart:convert";

import "pubspec_terminal_library_dependencies_extra.dart";

 
class PubspecTerminalLibraryDependencies extends JsonScheme {

  
  PubspecTerminalLibraryDependencies(super.rawData);
   
  static Map get defaultData {
    return {"@type":"pubspecTerminalLibraryDependencies","flutter":{"@type":"pubspecTerminalLibraryDependenciesExtra","sdk":"flutter"},"cupertino_icons":"^1.0.2"};
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


  
  PubspecTerminalLibraryDependenciesExtra get flutter {
    try {
      if (rawData["flutter"] is Map == false){
        return PubspecTerminalLibraryDependenciesExtra({}); 
      }
      return PubspecTerminalLibraryDependenciesExtra(rawData["flutter"] as Map);
    } catch (e) {  
      return PubspecTerminalLibraryDependenciesExtra({}); 
    }
  }


  
  set flutter(PubspecTerminalLibraryDependenciesExtra value) {
    rawData["flutter"] = value.toJson();
  }



  
  String? get cupertino_icons {
    try {
      if (rawData["cupertino_icons"] is String == false){
        return null;
      }
      return rawData["cupertino_icons"] as String;
    } catch (e) {
      return null;
    }
  }

  
  set cupertino_icons(String? value) {
    rawData["cupertino_icons"] = value;
  }


  
  static PubspecTerminalLibraryDependencies create({

    String special_type = "pubspecTerminalLibraryDependencies",
      PubspecTerminalLibraryDependenciesExtra? flutter,
    String? cupertino_icons,
})  {
    // PubspecTerminalLibraryDependencies pubspecTerminalLibraryDependencies = PubspecTerminalLibraryDependencies({
Map pubspecTerminalLibraryDependencies_data_create_json = {
  
      "@type": special_type,
      "flutter": (flutter != null)?flutter.toJson(): null,
      "cupertino_icons": cupertino_icons,


};


          pubspecTerminalLibraryDependencies_data_create_json.removeWhere((key, value) => value == null);
PubspecTerminalLibraryDependencies pubspecTerminalLibraryDependencies_data_create = PubspecTerminalLibraryDependencies(pubspecTerminalLibraryDependencies_data_create_json);

return pubspecTerminalLibraryDependencies_data_create;



      }
}