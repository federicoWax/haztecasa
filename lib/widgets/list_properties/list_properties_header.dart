import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListPropertiesHeader extends StatelessWidget {
  final int totalList;
  const ListPropertiesHeader({super.key, required this.totalList});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return IgnorePointer(
      ignoring: true,
      child: Center(
        child: Container(
          height: 20.h,
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(color: colorScheme.primary, borderRadius: BorderRadius.circular(10.r)),
          child: Padding(
            padding: const EdgeInsets.all(1.0),
            child: Text(
              "Propiedades disponibles: $totalList",
              style: TextStyle(color: colorScheme.onPrimary, fontSize: 14.sp, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}
