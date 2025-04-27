import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:haztecasa/models/property/propety.dart';
import 'package:haztecasa/utils/colors/colors.dart';
import 'package:haztecasa/utils/functions/functions.dart';

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
        final Property property = listPropertyDummy[index];
        final bool isFavorite = property.isFavorite ?? false;
        final bool inAuction = property.remate ?? false;
        final PropertyAge? propertyAge = property.propertyAge;
        final String neighborhood = property.neighborhood;
        final String city = property.city;
        final String state = property.state;
        final String address = "$neighborhood, $city, $state";
        final int bedrooms = property.bedrooms;
        final double bathrooms = property.baths;
        final double construction = property.construction;
        final double dimension = property.dimension;

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(10.r)),
                  child: Stack(
                    children: [
                      CachedNetworkImage(
                        fit: BoxFit.cover,
                        height: 140.h,
                        width: double.infinity,
                        imageUrl: listPropertyDummy[index].image,
                        placeholder: (context, url) => Center(child: const CircularProgressIndicator()),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (inAuction) ...[
                                  Card(
                                    color: Colors.green,
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 8.0, left: 8),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Icon(Icons.monetization_on, color: colorScheme.onPrimary, size: 14.sp),
                                          const Text("REMATE", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                                if (propertyAge != null && propertyAge != PropertyAge.none) ...[
                                  Card(
                                    color: propertyAge == PropertyAge.openNewHouse ? Colors.deepOrange : Colors.yellow[700],
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 8.0, left: 8),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Icon(
                                            propertyAge == PropertyAge.openNewHouse ? Icons.star_outlined : Icons.new_releases,
                                            color: colorScheme.onPrimary,
                                            size: 14.sp,
                                          ),
                                          Text(
                                            propertyAge == PropertyAge.openNewHouse ? "PARA ESTRENAR" : "PREVENTA",
                                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
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
                                child: Icon(isFavorite ? Icons.favorite : Icons.favorite_border, color: Colors.pink),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.location_on_outlined),
                          SizedBox(width: 4.w),
                          Flexible(child: Text(address, style: TextStyle(fontWeight: FontWeight.w500))),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(formatMoneyMXM(listPropertyDummy[index].price), style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20.sp)),
                          Text("Ver más", style: TextStyle(color: colorScheme.primary, fontWeight: FontWeight.w500, fontSize: 14.sp)),
                        ],
                      ),
                      SizedBox(height: 4.h),
                      Row(
                        children: [
                          Icon(Icons.bed, color: colorScheme.primary),
                          Text("$bedrooms", style: TextStyle(fontWeight: FontWeight.w500)),
                          SizedBox(width: 20.w),
                          Icon(Icons.bathroom, color: colorScheme.primary),
                          Text(bathroomsToString(bathrooms), style: TextStyle(fontWeight: FontWeight.w500)),
                          SizedBox(width: 20.w),
                          Icon(Icons.house_rounded, color: colorScheme.primary),
                          Text("$construction m²", style: TextStyle(fontWeight: FontWeight.w500)),
                          SizedBox(width: 20.w),
                          Icon(Icons.square_foot, color: colorScheme.primary),
                          Text("$dimension m²", style: TextStyle(fontWeight: FontWeight.w500)),
                        ],
                      ),
                      SizedBox(height: 4.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Hace 7 dias", style: TextStyle(fontWeight: FontWeight.w600, color: Colors.grey[500])),
                          OutlinedButton.icon(
                            onPressed: () {},
                            icon: FaIcon(
                              FontAwesomeIcons.whatsapp,
                              color: colorWhatsApp, // Verde WhatsApp
                            ),
                            label: Text("Contactar", style: TextStyle(color: colorWhatsApp, fontWeight: FontWeight.w600)),
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: colorWhatsApp, width: 1.5),
                              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
