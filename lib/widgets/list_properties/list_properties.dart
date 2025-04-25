import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haztecasa/models/property/propety.dart';

class ListProperties extends StatelessWidget {
  final ScrollController scrollController;
  const ListProperties({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return ListView.builder(
      controller: scrollController,
      itemCount: listPropertyDummy.length,
      itemBuilder: (BuildContext context, int index) {
        final bool isFavorite = listPropertyDummy[index].isFavorite ?? false;

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(10.r)),
                  child: Stack(
                    children: [
                      Image.network(listPropertyDummy[index].image, fit: BoxFit.cover, height: 140.h, width: double.infinity),
                      Padding(
                        padding: EdgeInsets.all(6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Card(
                                  color: Colors.green,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 8.0, left: 8),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Icon(Icons.monetization_on, color: colorScheme.onPrimary),
                                        const Text("Remate", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                  ),
                                ),
                                Card(
                                  color: Colors.deepOrange,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 8.0, left: 8),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Icon(Icons.monetization_on, color: colorScheme.onPrimary),
                                        const Text("Para estrenar", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            IconButton(
                              onPressed: () {},
                              style: IconButton.styleFrom(
                                backgroundColor: colorScheme.onPrimary,
                                padding: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
                              ),
                              icon: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(isFavorite ? Icons.favorite : Icons.favorite_border, color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                ListTile(title: Text('Item $index', style: TextStyle(color: colorScheme.onSurface))),
              ],
            ),
          ),
        );
      },
    );
  }
}
