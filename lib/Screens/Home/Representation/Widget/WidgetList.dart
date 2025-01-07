import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class WidgetList extends StatelessWidget {
  final String title;
  final VoidCallback ontap;
  const WidgetList({super.key, required this.title, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5, left: 16, right: 16),
      child: ListTile(
        contentPadding: EdgeInsets.only(left: 12, right: 6),
        onTap: ontap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        tileColor: Colors.grey.withOpacity(0.05),
        title: Text(title),
        titleTextStyle: const TextStyle(
            color: Colors.black, fontWeight: FontWeight.w300, fontSize: 15),
        trailing: const Icon(LucideIcons.chevronRight),
      ),
    );
  }
}
