import 'package:flutter/material.dart';

class WidgetConatiner extends StatelessWidget {
  final String title;
  final String length;
  final IconData icon;
  final Color color;
  final VoidCallback ontap;
  const WidgetConatiner(
      {super.key,
      required this.title,
      required this.length,
      required this.icon,
      required this.color,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: const EdgeInsets.all(13),
        margin: const EdgeInsets.all(5),
        height: MediaQuery.sizeOf(context).height * 0.15,
        width: MediaQuery.sizeOf(context).width * 0.44,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: color.withOpacity(0.05),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              length,
              style: TextStyle(fontSize: 22, color: color),
            ),
            const Spacer(),
            Row(
              children: [
                Icon(
                  icon,
                  size: 18,
                  color: Colors.black,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  title,
                  style:const  TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


