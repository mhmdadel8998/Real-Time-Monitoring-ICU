import 'dart:ffi';

class Sales {
  final String humidity;
  final String temperature;
  // final String colorVal;
  // Test(this.humidity, this.temperature, this.colorVal);
  Sales(this.humidity, this.temperature);

  Sales.fromMap(Map<String, dynamic> map)
      : assert(map['humidity'] != null),
        assert(map['temperature'] != null),
        // assert(map['colorVal'] != null),
        humidity = map['humidity'],
        // colorVal = map['colorVal'],
        temperature = map['temperature'];

  // @override
  // String toString() => "Record<$humidity:$temperature>";
}
