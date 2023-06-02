import 'package:realm/realm.dart';
part 'podcastepisode.g.dart';

@RealmModel()
class _PodcastEpisode {
  @PrimaryKey()
  late ObjectId id;
  late String title;
  late String? description;
  late String? podcastImageUrl;
  late String? episodeDownloadUrl;
  late Uuid podcastid;
}
