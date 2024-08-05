import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.data});

  final Map<String, Object> data;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F8F1),
      body: SingleChildScrollView(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Column(
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height - 250,
                  foregroundDecoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                        Colors.transparent,
                        Colors.transparent,
                        Colors.black.withOpacity(0.5),
                      ])),
                  child: Image.asset(widget.data['image'].toString(),
                      fit: BoxFit.cover),
                ),
                const SizedBox(height: 200),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 20,
              right: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.data['name'].toString(),
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          )),
                  const SizedBox(height: 8),
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                    const Icon(Icons.location_on_outlined,
                        color: Colors.white, size: 20),
                    const SizedBox(width: 2),
                    Text(widget.data['location'].toString(),
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Colors.white, fontWeight: FontWeight.w500)),
                  ]),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 300,
                    width: MediaQuery.of(context).size.width - 40,
                    child: Card(
                      surfaceTintColor: Colors.white,
                      elevation: 3,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    for (int i = 0; i < 5; i++)
                                      Container(
                                        height: 15,
                                        width: 15,
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 1.5),
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
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  "4.9 (6.2k reviews)",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium!
                                      .copyWith(color: Colors.grey.shade600),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            RichText(
                                text: TextSpan(
                                    text: "Starts from",
                                    style:
                                        Theme.of(context).textTheme.labelMedium,
                                    children: [
                                  TextSpan(
                                      text:
                                          "  \$${widget.data['price'].toString()}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.green)),
                                  TextSpan(
                                      text: "/day",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium!
                                          .copyWith(
                                              color: Colors.grey.shade600)),
                                ])),
                            const SizedBox(height: 10),
                            Text(
                              widget.data["description"].toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: Colors.grey.shade600),
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: InkWell(
                                customBorder: ContinuousRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                splashColor: const Color(0xFF77A42F),
                                onTap: () {},
                                child: Ink(
                                  width: double.infinity,
                                  height: 50,
                                  decoration: ShapeDecoration(
                                      shadows: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 1,
                                          blurRadius: 3,
                                          offset: const Offset(0, 3),
                                        )
                                      ],
                                      shape: ContinuousRectangleBorder(
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      gradient: const LinearGradient(
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                          colors: [
                                            Color(0xFF89B641),
                                            Color(0xFF77A42F),
                                          ])),
                                  child: Center(
                                    child: Text(
                                      "BOOK NOW",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
