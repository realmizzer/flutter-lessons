class Character {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final Location origin;
  final Location location;
  final String image;
  final List<String> episode;
  final String url;
  final DateTime created;

  const Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': int id,
        'name': String name,
        'status': String status,
        'species': String species,
        'type': String type,
        'gender': String gender,
        'origin': Map<String, dynamic> origin,
        'location': Map<String, dynamic> location,
        'image': String image,
        'episode': List<dynamic> episode,
        'url': String url,
        'created': String created,
      } =>
        Character(
          id: id,
          name: name,
          status: status,
          species: species,
          type: type,
          gender: gender,
          origin: Location.fromJson(origin),
          location: Location.fromJson(location),
          image: image,
          episode: episode.cast<String>(),
          url: url,
          created: DateTime.parse(created),
        ),
      _ => throw const FormatException('Failed to load character.'),
    };
  }
}

class Location {
  final String name;
  final String url;

  const Location({required this.name, required this.url});

  factory Location.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {'name': String name, 'url': String url} => Location(
        name: name,
        url: url,
      ),
      _ => throw const FormatException('Failed to load location.'),
    };
  }
}
