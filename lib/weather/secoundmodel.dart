class Secoundmodel {
// ignore_for_file: unused_local_variable

  late ForecastClass forecast;
  late LocationClass location;
  late currentClass current;

  Secoundmodel.formjson(Map<String, dynamic> json) {
    location = LocationClass.formjson(json['location']);
    current = currentClass.formjson(json['current']);
    forecast = ForecastClass.formjson(json['forecast']);
  }
}

class LocationClass {
  late final String name;
  // LocationClass({required this.name});
  LocationClass.formjson(Map<String, dynamic> json) {
    name = json['name'];
  }
}

class currentClass {
  late final String last_updated;

  currentClass.formjson(Map<String, dynamic> json) {
    last_updated = json['last_updated'];
  }
}

class ForecastClass {
  List<forecastdayClass> forecastday = [];
  ForecastClass.formjson(Map<String, dynamic> json) {
    json['forecastday'].forEach((Element) {
      forecastday.add(forecastdayClass.formjson(Element));
    });
  }
}

class forecastdayClass {
  late DayClass day;

  forecastdayClass.formjson(Map<String, dynamic> json) {
    day = DayClass.formjson(json['day']);
  }
}

class DayClass {
  late final double maxtemp;
  late final double mintemp;
  late final double temp;
  late conditionClass condition;

  DayClass.formjson(Map<String, dynamic> json) {
    maxtemp = json['maxtemp_c'];
    mintemp = json['mintemp_c'];
    temp = json['avgtemp_c'];
    condition = conditionClass.formjson(json['condition']);
  }
}

class conditionClass {
  late final String image;
  late final String weathercondition;

  conditionClass.formjson(Map<String, dynamic> json) {
    image = json['icon'];
    weathercondition = json['text'];
  }
}
