import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_n_morty_test/domain/entities/char_entity.dart';

class CharacterListView extends StatefulWidget {
  final List<CharacterEntity> characterList;
  final VoidCallback? loadNextPage;
  const CharacterListView(
      {super.key, required this.characterList, this.loadNextPage});

  @override
  State<CharacterListView> createState() => _CharacterListViewState();
}

class _CharacterListViewState extends State<CharacterListView> {
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
          itemCount: widget.characterList.length,
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return FadeInDown(
                child: _Slide(character: widget.characterList[index]));
          },
        ))
      ],
    );
  }
}

class _Slide extends StatelessWidget {
  final CharacterEntity character;
  const _Slide({required this.character});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Stack(clipBehavior: Clip.none, children: [
        SizedBox(
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: _CharacterImage(character: character),
          ),
        ),
        Positioned.fill(
          child: IgnorePointer(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: const DecoratedBox(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.6, 1.0],
                          colors: [Colors.transparent, Colors.black87]))),
            ),
          ),
        ),
        Positioned.fill(
            bottom: 20,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                character.name,
                maxLines: 2,
                style: const TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            )),
        Positioned.fill(
            right: 10,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Text(
                'Status:${character.status}',
                maxLines: 1,
                style: TextStyle(
                    fontSize: 20,
                    color:
                        character.status == 'Alive' ? Colors.green : Colors.red,
                    fontWeight: FontWeight.w500),
              ),
            )),
      ]),
    );
  }
}

class _CharacterImage extends StatelessWidget {
  const _CharacterImage({
    required this.character,
  });

  final CharacterEntity character;

  @override
  Widget build(BuildContext context) {
    return Image.network(character.image, fit: BoxFit.cover, height: 350,
        loadingBuilder: (context, child, loadingProgress) {
      if (loadingProgress != null) {
        return const Padding(
          padding: EdgeInsets.all(8),
          child: Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          ),
        );
      }
      return InkWell(
          onTap: () => context.push('/character', extra: character),
          child: FadeInRight(child: child));
    });
  }
}
