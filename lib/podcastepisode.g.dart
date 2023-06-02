// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'podcastepisode.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class PodcastEpisode extends _PodcastEpisode
    with RealmEntity, RealmObjectBase, RealmObject {
  PodcastEpisode(
    ObjectId id,
    String title,
    Uuid podcastid, {
    String? description,
    String? podcastImageUrl,
    String? episodeDownloadUrl,
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'title', title);
    RealmObjectBase.set(this, 'description', description);
    RealmObjectBase.set(this, 'podcastImageUrl', podcastImageUrl);
    RealmObjectBase.set(this, 'episodeDownloadUrl', episodeDownloadUrl);
    RealmObjectBase.set(this, 'podcastid', podcastid);
  }

  PodcastEpisode._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get title => RealmObjectBase.get<String>(this, 'title') as String;
  @override
  set title(String value) => RealmObjectBase.set(this, 'title', value);

  @override
  String? get description =>
      RealmObjectBase.get<String>(this, 'description') as String?;
  @override
  set description(String? value) =>
      RealmObjectBase.set(this, 'description', value);

  @override
  String? get podcastImageUrl =>
      RealmObjectBase.get<String>(this, 'podcastImageUrl') as String?;
  @override
  set podcastImageUrl(String? value) =>
      RealmObjectBase.set(this, 'podcastImageUrl', value);

  @override
  String? get episodeDownloadUrl =>
      RealmObjectBase.get<String>(this, 'episodeDownloadUrl') as String?;
  @override
  set episodeDownloadUrl(String? value) =>
      RealmObjectBase.set(this, 'episodeDownloadUrl', value);

  @override
  Uuid get podcastid => RealmObjectBase.get<Uuid>(this, 'podcastid') as Uuid;
  @override
  set podcastid(Uuid value) => RealmObjectBase.set(this, 'podcastid', value);

  @override
  Stream<RealmObjectChanges<PodcastEpisode>> get changes =>
      RealmObjectBase.getChanges<PodcastEpisode>(this);

  @override
  PodcastEpisode freeze() => RealmObjectBase.freezeObject<PodcastEpisode>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(PodcastEpisode._);
    return const SchemaObject(
        ObjectType.realmObject, PodcastEpisode, 'PodcastEpisode', [
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('title', RealmPropertyType.string),
      SchemaProperty('description', RealmPropertyType.string, optional: true),
      SchemaProperty('podcastImageUrl', RealmPropertyType.string,
          optional: true),
      SchemaProperty('episodeDownloadUrl', RealmPropertyType.string,
          optional: true),
      SchemaProperty('podcastid', RealmPropertyType.uuid),
    ]);
  }
}
