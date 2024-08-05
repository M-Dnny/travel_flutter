import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:travel/fakedata/popular_places.dart';
import 'package:travel/screens/detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F8F1),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 80),
              const Header(),
              const SizedBox(height: 30),
              const SearchAndFilter(),
              const SizedBox(height: 20),
              const Places(data: popularPlaces, labelTitle: "Popular Places"),
              const SizedBox(height: 20),
              Places(
                  data: popularPlaces.reversed.toList(),
                  labelTitle: "Recommended Places"),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class Places extends StatelessWidget {
  const Places({
    super.key,
    required this.labelTitle,
    required this.data,
  });

  final String labelTitle;
  final List<Map<String, Object>> data;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              labelTitle,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  foregroundColor: Colors.green,
                  textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                child: const Text("SEE ALL"))
          ],
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 310,
          child: ListView.builder(
            itemCount: data.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return PlacesCard(index: index, data: data);
            },
          ),
        )
      ],
    );
  }
}

class PlacesCard extends StatefulWidget {
  const PlacesCard({super.key, required this.index, required this.data});

  final int index;

  final List<Map<String, Object>> data;

  @override
  State<PlacesCard> createState() => _PlacesCardState();
}

class _PlacesCardState extends State<PlacesCard> {
  @override
  Widget build(BuildContext context) {
    final item = widget.data[widget.index];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: SizedBox(
        height: 300,
        width: 200,
        child: OpenContainer(
          closedElevation: 3,
          openElevation: 3,
          closedColor: Colors.white,
          closedShape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          openShape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          clipBehavior: Clip.antiAlias,
          transitionType: ContainerTransitionType.fade,
          middleColor: Colors.white30,
          transitionDuration: const Duration(seconds: 1),
          openBuilder: (context, action) {
            return DetailScreen(data: item);
          },
          closedBuilder: (context, action) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  clipBehavior: Clip.antiAlias,
                  child: Image.asset(item['image'].toString())),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item['name'].toString(),
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                            )),
                    const SizedBox(height: 3),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.location_on_outlined,
                              color: Colors.grey.shade600, size: 20),
                          const SizedBox(width: 2),
                          Text(item['location'].toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      color: Colors.grey.shade600,
                                      fontWeight: FontWeight.w500)),
                        ]),
                    const SizedBox(height: 3),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                              text: "\$${item['price'].toString()}",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.green),
                              children: [
                                TextSpan(
                                    text: "/day",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                          color: Colors.grey.shade600,
                                        ))
                              ]),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            for (int i = 0; i < 5; i++)
                              Container(
                                height: 12,
                                width: 12,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 1.5),
                                decoration: const ShapeDecoration(
                                  color: Colors.green,
                                  shape: StarBorder(
                                    innerRadiusRatio: 0.4,
                                    pointRounding: 0.2,
                                    points: 5,
                                  ),
                                ),
                              ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ).animate().fadeIn().slide(
            begin: const Offset(1, 0),
            curve: Curves.fastLinearToSlowEaseIn,
            duration: Duration(seconds: 2)),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: "Find Your",
          style: Theme.of(context).textTheme.displaySmall,
          children: [
            TextSpan(
                text: "${"\n"}Destination",
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(fontWeight: FontWeight.bold))
          ]),
    );
  }
}

class SearchAndFilter extends StatelessWidget {
  const SearchAndFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 55,
          width: MediaQuery.of(context).size.width - 105,
          child: TextField(
            decoration: InputDecoration(
                hintText: "Search location",
                hintStyle: const TextStyle(color: Colors.grey),
                filled: true,
                contentPadding: const EdgeInsets.all(15),
                fillColor: Colors.white,
                prefixIcon: const Icon(Icons.search_rounded,
                    color: Colors.grey, size: 25),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide:
                      BorderSide(color: Colors.grey.shade400, width: 1.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.grey.shade500, width: 2),
                )),
          ),
        ),
        IconButton.filled(
          onPressed: () {},
          iconSize: 33,
          style: IconButton.styleFrom(
            backgroundColor: Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          icon: const Icon(Icons.filter_alt_rounded),
        )
      ],
    );
  }
}
