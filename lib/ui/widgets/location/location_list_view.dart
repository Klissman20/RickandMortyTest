import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:rick_n_morty_test/domain/entities/location_entity.dart';

class LocationListView extends StatefulWidget {
  final List<LocationEntity> locationList;
  final VoidCallback? loadNextPage;
  const LocationListView(
      {super.key, required this.locationList, this.loadNextPage});

  @override
  State<LocationListView> createState() => _LocationListViewState();
}

class _LocationListViewState extends State<LocationListView> {
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
          itemCount: widget.locationList.length,
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return FadeInDown(
                child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: _Slide(location: widget.locationList[index]),
            ));
          },
        ))
      ],
    );
  }
}

class _Slide extends StatelessWidget {
  final LocationEntity location;
  const _Slide({required this.location});

  @override
  Widget build(BuildContext context) {
    Future<void> dialogBuilder(BuildContext context) {
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: Colors.white,
              elevation: 2,
              scrollable: true,
              titlePadding: const EdgeInsets.all(20),
              actionsPadding: const EdgeInsets.all(10),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      location.name,
                      maxLines: 2,
                      style: const TextStyle(fontSize: 25),
                    ),
                  ),
                ],
              ),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        'Type: ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(
                        location.type,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        'Dimension: ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(location.dimension,
                          style: const TextStyle(fontSize: 18)),
                    ],
                  ),
                ],
              ),
              actions: [
                TextButton(
                  child: const Text('Close'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
    }

    return InkWell(
      onTap: () => dialogBuilder(context),
      child: Container(
          decoration: BoxDecoration(
            color: Colors.blueGrey.withOpacity(0.3),
            border:
                Border.all(color: Colors.blueGrey.withOpacity(0.8), width: 3),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text('Name: ${location.name}'),
              Text('Type: ${location.type}')
            ],
          )),
    );
  }
}
