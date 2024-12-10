
class AppConfig {

  // Name of flavor
  // final BuildFlavor flavor;

  // Variables
  final Map<String, dynamic> variables;

  // Private constructor
  AppConfig._internal({
    // required this.flavor,
    required this.variables
  });

  // Internal instance of AppConfig
  static AppConfig? _instance;

  static Map<String, dynamic> get getVariables => instance.variables;

  // static BuildFlavor get getFlavor => instance.flavor;

  // Instance of AppConfig
  static AppConfig get instance {
    _instance ??= AppConfig();
    return _instance!;
  }

  // Factory constructor
  factory AppConfig({
    // BuildFlavor flavor = BuildFlavor.prod,
    Map<String, dynamic> variables = const {}
  }) {

    _instance = AppConfig._internal(
      // flavor: flavor,
      variables: variables
    );

    return _instance!;
  }
}