import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart' as shimer_base;

class CustomShimmerContainer extends StatelessWidget {
  const CustomShimmerContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return shimer_base.Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8.0,
              spreadRadius: 0.5,
              offset: const Offset(0.0, 0.0),
            ),
          ],
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.grey[300],
          ),
          title: Container(
            width: double.infinity,
            height: 10.0,
            color: Colors.grey[300],
          ),
          subtitle: Container(
            width: double.infinity,
            height: 10.0,
            margin: const EdgeInsets.only(top: 5.0),
            color: Colors.grey[300],
          ),
        ),
      ),
    );
  }
}

class Shimmer extends StatelessWidget {
  const Shimmer({
    super.key,
    required this.height,
    this.radius = 8,
    required this.width,
  });

  final double? height;
  final double radius;
  final double? width;

  @override
  Widget build(BuildContext context) => shimer_base.Shimmer.fromColors(
        baseColor: Colors.grey[200]!,
        direction: shimer_base.ShimmerDirection.ltr,
        highlightColor: Colors.grey[300]!,
        period: const Duration(seconds: 2),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              color: const Color(0xffdddddd),
              borderRadius: BorderRadius.circular(radius),
            ),
          ),
        ),
      );
}
