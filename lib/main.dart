import 'package:flutter/material.dart';
import 'package:flutterplay23/podcastepisode.dart';
import 'package:realm/realm.dart';
import 'package:podcast_search/podcast_search.dart';

void main() async {
  MyApp.allPodastEpisodes = await createRealm();
  runApp(const MyApp());
}

Future<Realm> createRealm() async {
  final config = Configuration.local([PodcastEpisode.schema]);
  final realm = Realm(config);
  return realm;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static late Realm allPodastEpisodes;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo 1',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Tip5y'),
    );
  }
}

class PodcastList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cars = MyApp.allPodastEpisodes.all<PodcastEpisode>();

    return ListView.builder(
      itemCount: cars.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return ListTile(
          leading:
              CircleAvatar(child: Image.network(cars[index].podcastImageUrl!)),
          title: Text(cars[index].title),
          subtitle: Text(cars[index].description!),
          trailing: PopupMenuButton<ListTileTitleAlignment>(
            onSelected: (value) {
              if (value.index == 1) {
                MyApp.allPodastEpisodes.write(() {
                  MyApp.allPodastEpisodes.delete(cars[index]);
                });
                //            setState(() {});
              }
            },
            itemBuilder: (BuildContext context) =>
                <PopupMenuEntry<ListTileTitleAlignment>>[
              const PopupMenuItem<ListTileTitleAlignment>(
                value: ListTileTitleAlignment.threeLine,
                child: Text('Tip'),
              ),
              const PopupMenuItem<ListTileTitleAlignment>(
                value: ListTileTitleAlignment.titleHeight,
                child: Text('Delete'),
              ),
            ],
          ),
        );
        // Divider(height: 0),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
              const Divider(),
              PodcastList(),
            ])),
        floatingActionButton: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 0.0),
              child: Align(
                  alignment: Alignment.bottomLeft,
                  child: FloatingActionButton(
                    onPressed: _createImportantTasks,
                    tooltip: 'High priority task',
                    child: const Icon(Icons.add),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 40.0),
              child: Align(
                  alignment: Alignment.bottomRight,
                  child: FloatingActionButton(
                    onPressed: _createPodcastEpisode,
                    tooltip: 'Normal task',
                    child: const Icon(Icons.add),
                  )),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat);
  }

  void _createImportantTasks() {}

  void _createPodcastEpisode() async {
    var search = Search();

    /// Search for the "It's a Widget" podcast.
    var results = await search.search('Validated',
        country: Country.unitedKingdom, limit: 10);

    /// List the name of each podcast found.
    results.items.forEach((result) {
      print('Found podcast: ${result.trackName}');
    });

    /// Parse the first podcast.
    var podcast = await Podcast.loadFeed(url: results.items[0].feedUrl!);

    // /// Display episode titles.
    // podcast.episodes?.forEach((episode) {
    //   print('Episode title: ${episode.title}');
    // });

    var ep = podcast.episodes![0];

    MyApp.allPodastEpisodes.write(() {
      var e = PodcastEpisode(
        ObjectId(),
        ep.title,
        Uuid.nil,
      );
      e.description = podcast.title;
      e.episodeDownloadUrl = ep.contentUrl;
      e.podcastImageUrl = podcast.image;
      MyApp.allPodastEpisodes.add(e);
    });
    setState(() {});
  }
}
