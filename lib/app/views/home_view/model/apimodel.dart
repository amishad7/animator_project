class Planets {
  var name;
  var type;
  var orbit_distance_km;
  var diameter_km;
  var mass_kg;
  var moons;
  var des;
  var des2;
  var image;

  Planets({
    required this.name,
    required this.type,
    required this.orbit_distance_km,
    required this.diameter_km,
    required this.mass_kg,
    required this.moons,
    required this.des,
    required this.des2,
    required this.image,
  });

  factory Planets.fromData({required Map data}) {
    return Planets(
      name: data['name'],
      type: data['type'],
      orbit_distance_km: data['orbit_distance_km'],
      diameter_km: data['diameter_km'],
      mass_kg: data['mass_kg'],
      moons: data['moons'],
      des: data['des'],
      des2: data['des2'],
      image: data['image'],
    );
  }
}
