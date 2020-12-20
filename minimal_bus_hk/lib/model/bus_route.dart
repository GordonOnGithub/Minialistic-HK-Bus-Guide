import 'package:minimal_bus_hk/interface/localized_data.dart';

class BusRoute extends LocalizedData{
final String routeCode;
final String companyCode;
final String originEnglishName;
final String originTCName;
final String originSCName;
final String destinationEnglishName;
final String destinationTCName;
final String destinationSCName;
final DateTime timestamp;
Map<String, Map<String, String>> _localizedData = Map();

static final String localizationKeyForOrigin = "origin";
static final String localizationKeyForDestination = "destination";


BusRoute.fromJson(Map<String, dynamic> json):
      routeCode = json["route"],
      companyCode = json["co"],
      originEnglishName = json["orig_en"],
      originTCName = json["orig_tc"],
      originSCName = json["orig_sc"],
      destinationEnglishName = json["dest_en"],
      destinationTCName = json["dest_tc"],
      destinationSCName = json["dest_sc"],
      timestamp = DateTime.tryParse(json["data_timestamp"]){
      Map<String, String> destinationNameData = Map();
      destinationNameData["en"] = destinationEnglishName;
      destinationNameData["tc"] = destinationTCName;
      destinationNameData["sc"] = destinationSCName;
      _localizedData[localizationKeyForDestination] = destinationNameData;

      Map<String, String> originNameData = Map();
      originNameData["en"] = originEnglishName;
      originNameData["tc"] = originTCName;
      originNameData["sc"] = originSCName;
      _localizedData[localizationKeyForOrigin] = originNameData;

}

  @override
  Map<String, Map<String, String>> getLocalizedData() {
  return _localizedData;
  }
}