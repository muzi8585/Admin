import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class SearchInputField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;

  const SearchInputField({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Container(
        height: 50,
        width: double.infinity,
        padding: const EdgeInsets.only(bottom: 4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[50]!,
              spreadRadius: 3,
              blurRadius: 2,
            ),
          ],
          border: Border.all(color: Colors.grey[200]!),
        ),
        child: Row(
          children: [
            TextField(
              cursorColor: Colors.black,
              controller: controller,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  LucideIcons.search,
                  size: 18,
                  color: Colors.black38,
                ),
                hintText: 'Search',
                hintStyle: const TextStyle(
                  height: 0,
                  color: Colors.black54,
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: onChanged,
            ),
          ],
        ),
      ),
    );
  }
}
