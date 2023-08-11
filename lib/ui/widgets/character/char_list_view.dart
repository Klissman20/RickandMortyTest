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
          padding: const EdgeInsets.all(5.0),
          itemCount: widget.characterList.length,
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return FadeInDown(
                child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: _Slide(character: widget.characterList[index]),
            ));
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
    return Container(
      decoration: BoxDecoration(
        color: Colors.blueGrey.withOpacity(0.3),
        border: Border.all(color: Colors.blueGrey.withOpacity(0.8), width: 3),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(8.0),
      child: Stack(clipBehavior: Clip.none, children: [
        Container(
          height: MediaQuery.of(context).size.width * 0.9,
          padding: const EdgeInsets.all(20),
          child: _CharacterImage(character: character),
        ),
        TweenAnimationBuilder(
            tween: Tween(begin: -200.0, end: 10.0),
            duration: const Duration(milliseconds: 500),
            builder: (context, value, _) {
              return Positioned(
                bottom: 10,
                left: value,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    character.name,
                    maxLines: 2,
                    style: const TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              );
            }),
        Positioned(
          right: 0,
          child: TweenAnimationBuilder(
              tween: Tween(begin: 0.0, end: 1.0),
              curve: Curves.elasticInOut,
              duration: const Duration(seconds: 1),
              builder: (context, value, _) {
                return Transform.scale(
                  scale: value,
                  child: Column(
                    children: [
                      Icon(
                        character.status == 'Alive'
                            ? Icons.monitor_heart_outlined
                            : character.status == 'Dead'
                                ? Icons.local_florist
                                : Icons.question_mark,
                        size: 32,
                        color: character.status == 'Alive'
                            ? Colors.green[600]
                            : character.status == 'Dead'
                                ? Colors.red
                                : Colors.black54,
                      ),
                      Text(character.status,
                          style: TextStyle(
                              fontSize: 22,
                              color: character.status == 'Alive'
                                  ? Colors.green[600]
                                  : character.status == 'Dead'
                                      ? Colors.red
                                      : Colors.black54,
                              fontWeight: FontWeight.w500)),
                      //const Text('Status'),
                    ],
                  ),
                );
              }),
        ),
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
    return Image.network(character.image, fit: BoxFit.contain,
        loadingBuilder: (context, child, loadingProgress) {
      if (loadingProgress != null) {
        return const SizedBox(
          height: 310,
          child: Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          ),
        );
      }
      return InkWell(
        onTap: () => context.push('/character', extra: character),
        child: FadeInUp(
          delay: const Duration(milliseconds: 150),
          child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(150),
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(150), child: child),
          ),
        ),
      );
    });
  }
}
