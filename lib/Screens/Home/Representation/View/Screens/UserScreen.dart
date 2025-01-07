import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:tampo_admin_app/Screens/Home/Data/Provider.dart';
import 'package:tampo_admin_app/Screens/Home/Representation/Widget/Shimmer.dart';
import 'package:tampo_admin_app/Screens/Home/Representation/Widget/WidgetPagination.dart';

class UserListScreen extends ConsumerStatefulWidget {
  UserListScreen({super.key});

  @override
  ConsumerState<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends ConsumerState<UserListScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  int _currentPage = 1;
  final int _itemsPerPage = 10;
  bool isLoading = false;
  String _sortField = 'name';
  bool _isAscending = true;

  void _refreshData() async {
    _currentPage = 1;
    setState(() {
      isLoading = true;
    });

    await ref.refresh(fetchUsersFromRepoProvider);

    setState(() {
      isLoading = false;
    });
  }

  void _sortUsers(String field) {
    setState(() {
      if (_sortField == field) {
        _isAscending = !_isAscending;
      } else {
        _sortField = field;
        _isAscending = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final usersAsyncValue = ref.watch(fetchUsersFromRepoProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: InkWell(
          onTap: () => context.go('/home'),
          child: const Icon(LucideIcons.chevronLeft),
        ),
        backgroundColor: Colors.white,
        title: const Text('User List'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: InkWell(
              borderRadius: BorderRadius.circular(30),
              onTap: () {
                setState(() {
                  _refreshData();
                });
              },
              child: const Icon(
                LucideIcons.refreshCcw,
                color: Colors.black45,
                size: 18,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[50]!,
                    spreadRadius: 3,
                    blurRadius: 2,
                  )
                ],
                border: Border.all(color: Colors.grey[200]!),
              ),
              child: TextField(
                textAlign: TextAlign.start,
                textAlignVertical: TextAlignVertical.center,
                cursorColor: Colors.black,
                controller: _searchController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    LucideIcons.search,
                    size: 16,
                    color: Colors.black38,
                  ),
                  hintText: 'Search',
                  hintStyle: const TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
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
                onChanged: (query) {
                  setState(() {
                    _searchQuery = query.toLowerCase();
                    _currentPage = 1;
                  });
                },
              ),
            ),
          ),
          usersAsyncValue.when(
            skipLoadingOnRefresh: false,
            data: (users) {
              final filteredUsers = _searchQuery.isEmpty
                  ? users
                  : users
                      .where((user) =>
                          user.name.toLowerCase().contains(_searchQuery))
                      .toList();

              filteredUsers.sort((a, b) {
                final valueA = a.toMap()[_sortField];
                final valueB = b.toMap()[_sortField];
                return _isAscending
                    ? Comparable.compare(valueA, valueB)
                    : Comparable.compare(valueB, valueA);
              });

              final totalUsers = filteredUsers.length;
              final totalPages = (totalUsers / _itemsPerPage).ceil();
              final startIndex = (_currentPage - 1) * _itemsPerPage;
              final endIndex = min(startIndex + _itemsPerPage, totalUsers);

              final paginatedUsers =
                  filteredUsers.sublist(startIndex, endIndex);

              return Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Table(
                              border: const TableBorder(
                                horizontalInside: BorderSide.none,
                                verticalInside: BorderSide.none,
                              ),
                              columnWidths: const {
                                0: FixedColumnWidth(200),
                                1: FixedColumnWidth(250),
                                2: FixedColumnWidth(150),
                              },
                              children: [
                                TableRow(
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(8),
                                      topRight: Radius.circular(8),
                                    ),
                                    color: Color(0xFF2A3D56),
                                  ),
                                  children: [
                                    TableCell(
                                      child: InkWell(
                                        onTap: () => _sortUsers('name'),
                                        child: const Padding(
                                          padding: EdgeInsets.only(
                                              top: 8, bottom: 8, left: 12),
                                          child: Row(
                                            children: [
                                              Icon(
                                                LucideIcons.arrowDownUp,
                                                size: 14,
                                                color: Colors.white,
                                              ),
                                              SizedBox(width: 5),
                                              Text(
                                                'Name',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: InkWell(
                                        onTap: () => _sortUsers('email'),
                                        child: const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Icon(
                                                LucideIcons.arrowDownUp,
                                                size: 14,
                                                color: Colors.white,
                                              ),
                                              SizedBox(width: 5),
                                              Text(
                                                'Email',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    const TableCell(
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                          'Create At',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                ...paginatedUsers
                                    .asMap()
                                    .entries
                                    .map<TableRow>((entry) {
                                  final index = entry.key;
                                  final user = entry.value;

                                  final isEvenRow = index % 2 != 0;

                                  return TableRow(
                                    decoration: BoxDecoration(
                                      color: isEvenRow
                                          ? const Color(0x001e3a5f)
                                              .withOpacity(0.09)
                                          : Colors.transparent,
                                    ),
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 12,
                                            right: 12,
                                            top: 12,
                                            bottom: 12),
                                        child: Text(
                                          user.name,
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: const Color(0xFF2A3D56)
                                                .withOpacity(0.75),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 12,
                                            right: 12,
                                            top: 12,
                                            bottom: 12),
                                        child: Text(
                                          user.email,
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: const Color(0xFF2A3D56)
                                                .withOpacity(0.75),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 5,
                                            right: 5,
                                            top: 10,
                                            bottom: 10),
                                        child: Text(
                                          formatDate(getRandomDate()),
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: const Color(0xFF2A3D56)
                                                .withOpacity(0.75),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: PaginationWidget(
                        currentPage: _currentPage,
                        totalPages: totalPages,
                        onPreviousPage: () {
                          setState(() {
                            _currentPage--;
                          });
                        },
                        onNextPage: () {
                          setState(() {
                            _currentPage++;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
            loading: () => const ShimmerUser(),
            error: (error, stackTrace) => Center(
              child: Text('Error: $error'),
            ),
          ),
        ],
      ),
    );
  }

  DateTime getRandomDate({int startYear = 2000, int endYear = 2025}) {
    final random = Random();
    final year = random.nextInt(endYear - startYear + 1) + startYear;
    final month = random.nextInt(12) + 1;
    final day = random.nextInt(DateTime(year, month + 1, 0).day) + 1;
    final hour = random.nextInt(24);
    final minute = random.nextInt(60);
    return DateTime(year, month, day, hour, minute);
  }

  String formatDate(DateTime dateTime) {
    return DateFormat('MMM dd, yyyy hh:mm a').format(dateTime);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
