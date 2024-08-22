// ignore_for_file: non_constant_identifier_names, unused_import
import "package:general_lib/general_lib.dart";
// import "dart:convert";

import "pubspec_terminal_library_platforms.dart";
import "pubspec_terminal_library_environment.dart";
import "pubspec_terminal_library_dependencies.dart";
import "pubspec_terminal_library_dev_dependencies.dart";
import "terminal_library_pubspec_config.dart";

class PubspecTerminalLibrary extends JsonScheme {
  PubspecTerminalLibrary(super.rawData);

  static Map get defaultData {
    return {
      "@type": "pubspecTerminalLibrary",
      "name": "example",
      "description": "A sample command-line application.",
      "version": "0.0.0",
      "publish_to": "none",
      "homepage": "https://youtube.com/{youtube_owner_username}",
      "repository": "https://github.com/azkadev/packagex.git",
      "issue_tracker": "https://github.com/azkadev/terminal_library/issues",
      "documentation": "https://github.com/azkadev/terminal_library/tree/main/docs",
      "funding": ["https://github.com/sponsors/azkadev"],
      "platforms": {"@type": "pubspecTerminalLibraryPlatforms", "android": null, "ios": null, "linux": null, "macos": null, "web": null, "windows": null},
      "environment": {"@type": "pubspecTerminalLibraryEnvironment", "sdk": ">=2.18.5 <3.0.0"},
      "dependencies": {
        "@type": "pubspecTerminalLibraryDependencies",
        "flutter": {"@type": "pubspecTerminalLibraryDependenciesExtra", "sdk": "flutter"},
        "cupertino_icons": "^1.0.2"
      },
      "dev_dependencies": {
        "@type": "pubspecTerminalLibraryDevDependencies",
        "lints": "^2.0.0",
        "test": "^1.16.0",
        "packagex": {"@type": "pubspecTerminalLibraryDevDependenciesExtra", "path": "../"},
        "msix": "^1.0.6"
      },
      "terminal_library": {"@type": "packageFullTemplatePubspecConfig"}
    };
  }

  String? get special_type {
    try {
      if (rawData["@type"] is String == false) {
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

  String? get name {
    try {
      if (rawData["name"] is String == false) {
        return null;
      }
      return rawData["name"] as String;
    } catch (e) {
      return null;
    }
  }

  set name(String? value) {
    rawData["name"] = value;
  }

  String? get description {
    try {
      if (rawData["description"] is String == false) {
        return null;
      }
      return rawData["description"] as String;
    } catch (e) {
      return null;
    }
  }

  set description(String? value) {
    rawData["description"] = value;
  }

  String? get version {
    try {
      if (rawData["version"] is String == false) {
        return null;
      }
      return rawData["version"] as String;
    } catch (e) {
      return null;
    }
  }

  set version(String? value) {
    rawData["version"] = value;
  }

  String? get publish_to {
    try {
      if (rawData["publish_to"] is String == false) {
        return null;
      }
      return rawData["publish_to"] as String;
    } catch (e) {
      return null;
    }
  }

  set publish_to(String? value) {
    rawData["publish_to"] = value;
  }

  String? get homepage {
    try {
      if (rawData["homepage"] is String == false) {
        return null;
      }
      return rawData["homepage"] as String;
    } catch (e) {
      return null;
    }
  }

  set homepage(String? value) {
    rawData["homepage"] = value;
  }

  String? get repository {
    try {
      if (rawData["repository"] is String == false) {
        return null;
      }
      return rawData["repository"] as String;
    } catch (e) {
      return null;
    }
  }

  set repository(String? value) {
    rawData["repository"] = value;
  }

  String? get issue_tracker {
    try {
      if (rawData["issue_tracker"] is String == false) {
        return null;
      }
      return rawData["issue_tracker"] as String;
    } catch (e) {
      return null;
    }
  }

  set issue_tracker(String? value) {
    rawData["issue_tracker"] = value;
  }

  String? get documentation {
    try {
      if (rawData["documentation"] is String == false) {
        return null;
      }
      return rawData["documentation"] as String;
    } catch (e) {
      return null;
    }
  }

  set documentation(String? value) {
    rawData["documentation"] = value;
  }

  List<String> get funding {
    try {
      if (rawData["funding"] is List == false) {
        return [];
      }
      return (rawData["funding"] as List).cast<String>();
    } catch (e) {
      return [];
    }
  }

  set funding(List<String> value) {
    rawData["funding"] = value;
  }

  PubspecTerminalLibraryPlatforms get platforms {
    try {
      if (rawData["platforms"] is Map == false) {
        return PubspecTerminalLibraryPlatforms({});
      }
      return PubspecTerminalLibraryPlatforms(rawData["platforms"] as Map);
    } catch (e) {
      return PubspecTerminalLibraryPlatforms({});
    }
  }

  set platforms(PubspecTerminalLibraryPlatforms value) {
    rawData["platforms"] = value.toJson();
  }

  PubspecTerminalLibraryEnvironment get environment {
    try {
      if (rawData["environment"] is Map == false) {
        return PubspecTerminalLibraryEnvironment({});
      }
      return PubspecTerminalLibraryEnvironment(rawData["environment"] as Map);
    } catch (e) {
      return PubspecTerminalLibraryEnvironment({});
    }
  }

  set environment(PubspecTerminalLibraryEnvironment value) {
    rawData["environment"] = value.toJson();
  }

  PubspecTerminalLibraryDependencies get dependencies {
    try {
      if (rawData["dependencies"] is Map == false) {
        return PubspecTerminalLibraryDependencies({});
      }
      return PubspecTerminalLibraryDependencies(rawData["dependencies"] as Map);
    } catch (e) {
      return PubspecTerminalLibraryDependencies({});
    }
  }

  set dependencies(PubspecTerminalLibraryDependencies value) {
    rawData["dependencies"] = value.toJson();
  }

  PubspecTerminalLibraryDevDependencies get dev_dependencies {
    try {
      if (rawData["dev_dependencies"] is Map == false) {
        return PubspecTerminalLibraryDevDependencies({});
      }
      return PubspecTerminalLibraryDevDependencies(rawData["dev_dependencies"] as Map);
    } catch (e) {
      return PubspecTerminalLibraryDevDependencies({});
    }
  }

  set dev_dependencies(PubspecTerminalLibraryDevDependencies value) {
    rawData["dev_dependencies"] = value.toJson();
  }

  TerminalLibraryPubspecConfig get terminal_library {
    try {
      if (rawData["terminal_library"] is Map == false) {
        return TerminalLibraryPubspecConfig({});
      }
      return TerminalLibraryPubspecConfig(rawData["terminal_library"] as Map);
    } catch (e) {
      return TerminalLibraryPubspecConfig({});
    }
  }

  set terminal_library(TerminalLibraryPubspecConfig value) {
    rawData["terminal_library"] = value.toJson();
  }

  static PubspecTerminalLibrary create({
    String special_type = "pubspecTerminalLibrary",
    String? name,
    String? description,
    String? version,
    String? publish_to,
    String? homepage,
    String? repository,
    String? issue_tracker,
    String? documentation,
    List<String>? funding,
    PubspecTerminalLibraryPlatforms? platforms,
    PubspecTerminalLibraryEnvironment? environment,
    PubspecTerminalLibraryDependencies? dependencies,
    PubspecTerminalLibraryDevDependencies? dev_dependencies,
    TerminalLibraryPubspecConfig? terminal_library,
  }) {
    // PubspecTerminalLibrary pubspecTerminalLibrary = PubspecTerminalLibrary({
    Map pubspecTerminalLibrary_data_create_json = {
      "@type": special_type,
      "name": name,
      "description": description,
      "version": version,
      "publish_to": publish_to,
      "homepage": homepage,
      "repository": repository,
      "issue_tracker": issue_tracker,
      "documentation": documentation,
      "funding": funding,
      "platforms": (platforms != null) ? platforms.toJson() : null,
      "environment": (environment != null) ? environment.toJson() : null,
      "dependencies": (dependencies != null) ? dependencies.toJson() : null,
      "dev_dependencies": (dev_dependencies != null) ? dev_dependencies.toJson() : null,
      "terminal_library": (terminal_library != null) ? terminal_library.toJson() : null,
    };

    pubspecTerminalLibrary_data_create_json.removeWhere((key, value) => value == null);
    PubspecTerminalLibrary pubspecTerminalLibrary_data_create = PubspecTerminalLibrary(pubspecTerminalLibrary_data_create_json);

    return pubspecTerminalLibrary_data_create;
  }
}
