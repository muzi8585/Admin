import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Projectshimmer extends StatelessWidget {
  const Projectshimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: ListView.builder(
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6.0, vertical: 4.0),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 5),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                border: Border(
                                  bottom: BorderSide(
                                      color: Colors.black12, width: 1),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    color: Colors.white,
                                    height: 10,
                                    width: 120,
                                  ),
                                  const SizedBox(height: 8),
                                  Container(
                                    color: Colors.white,
                                    height: 16,
                                    width: double.infinity,
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Container(
                                        color: Colors.white,
                                        height: 16,
                                        width: 100,
                                      ),
                                      const Spacer(),
                                      Container(
                                        color: Colors.white,
                                        height: 10,
                                        width: 60,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
  }
}