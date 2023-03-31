class AppMetadata {
  const AppMetadata({
    required this.isWeb,
    required this.isRelease,
    required this.appVersion,
    required this.appPackageName,
    required this.appName,
    required this.operatingSystem,
    required this.processorsCount,
    required this.appLaunchedTimestamp,
    required this.locale,
    required this.deviceRepresentation,
    required this.deviceLogicalSideMin,
    required this.deviceLogicalSideMax,
  });

  final bool isWeb;
  final bool isRelease;
  final String appVersion;

  final int appLaunchedTimestamp;

  final String appPackageName;
  final String appName;
  final String operatingSystem;
  final int processorsCount;
  final String locale;

  final String deviceRepresentation;
  final num deviceLogicalSideMin;
  final num deviceLogicalSideMax;

  Map<String, String> toHeaders() => <String, String>{
        'Meta-Is-Web': isWeb ? 'true' : 'false',
        'Meta-Is-Release': isRelease ? 'true' : 'false',
        'Meta-App-Version': appVersion,
        'Meta-App-Package-Name': appPackageName,
        'Meta-App-Name': appName,
        'Meta-Operating-System': operatingSystem,
        'Meta-Processors-Count': processorsCount.toString(),
        'Meta-App-Launched-Timestamp': appLaunchedTimestamp.toString(),
        'Meta-Locale': locale,
        'Meta-Device-Representation': deviceRepresentation,
        'Meta-Device-Logical-Side-Min': deviceLogicalSideMin.toString(),
        'Meta-Device-Logical-Side-Max': deviceLogicalSideMax.toString(),
      };
}
