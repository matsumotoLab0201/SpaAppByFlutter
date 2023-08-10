class Spa {
  final int id;
  final String name;
  final String station;
  final int cost1;
  final int cost2;
  final int time;
  final int walk;
  final String imageUrl;

  Spa({
    required this.id,
    required this.name,
    required this.station,
    required this.cost1,
    required this.cost2,
    required this.time,
    required this.walk,
    required this.imageUrl,
  });

  factory Spa.fromJson(Map<String, dynamic> json) {
    return Spa(
      id: json['id'],
      name: json['name'],
      station: json['station'],
      cost1: json['cost1'],
      cost2: json['cost2'],
      time: json['time'],
      walk: json['walk'],
      imageUrl: json['imageUrl'],
    );
  }
}
