import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:rick_n_morty_test/domain/entities/episode_entity.dart';

class EpisodeListView extends StatefulWidget {
  final List<EpisodeEntity> episodeList;
  final VoidCallback? loadNextPage;
  const EpisodeListView(
      {super.key, required this.episodeList, this.loadNextPage});

  @override
  State<EpisodeListView> createState() => _EpisodeListViewState();
}

class _EpisodeListViewState extends State<EpisodeListView> {
  final scrollConstroller = ScrollController();

  @override
  void initState() {
    super.initState();

    scrollConstroller.addListener(() {
      if (widget.loadNextPage == null) return;

      if ((scrollConstroller.position.pixels + 200) >=
          scrollConstroller.position.maxScrollExtent) {
        widget.loadNextPage!();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollConstroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: ListView.builder(
          controller: scrollConstroller,
          padding: const EdgeInsets.all(5.0),
          itemCount: widget.episodeList.length,
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return FadeInDown(
                child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: _Slide(episode: widget.episodeList[index]),
            ));
          },
        ))
      ],
    );
  }
}

class _Slide extends StatelessWidget {
  final EpisodeEntity episode;
  const _Slide({required this.episode});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.blueGrey.withOpacity(0.3),
          border: Border.all(color: Colors.blueGrey.withOpacity(0.8), width: 3),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text('Name: ${episode.name}'),
            Text('Number: ${episode.episode}')
          ],
        ));
  }
}
