import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class PaginationWidget extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final VoidCallback onPreviousPage;
  final VoidCallback onNextPage;

  PaginationWidget({
    Key? key,
    required this.currentPage,
    required this.totalPages,
    required this.onPreviousPage,
    required this.onNextPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          InkWell(
            onTap: currentPage > 1 ? onPreviousPage : null,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Color(0xFF2A3D56).withOpacity(0.5),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                size: 18,
                LucideIcons.chevronLeft,
                color: Colors.white,
              ),
            ),
          ),
          const Spacer(),
          Text(
            'Page $currentPage of $totalPages',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12,
              color: Color(0xFF2A3D56).withOpacity(0.5),
            ),
          ),
          const Spacer(),
          InkWell(
            onTap: currentPage < totalPages ? onNextPage : null,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Color(0xFF2A3D56).withOpacity(0.5),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                size: 18,
                LucideIcons.chevronRight,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
