import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/credits_response.dart';

class ActorMapper {
  static Actor castToEntity(Cast casting) {
    return Actor(
        id: casting.id,
        name: casting.name,
        profilePath: casting.profilePath != null
            ? 'https://image.tmdb.org/t/p/w500${casting.profilePath}'
            : 'https://static3.bigstockphoto.com/9/1/3/large1500/31903202.jpg',
        character: casting.character);
  }
}
