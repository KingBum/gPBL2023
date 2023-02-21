
class Weather {
  final double temp;
  final Object id;
  final List list;
  final Object city;
  final int cnt;

  const Weather({
    required this.temp,
    required this.id,
    required this.cnt,
    required this.list,
    required this.city,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      temp: json['temp'],
      id: Object,
      cnt: json['cnt'],
      list: json['list'], city: Object,
    );
  }
}