import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();

  List<String> recentSearches = [
    "Saree",
    "Kurti",
    "Lehenga",
    "Cotton Fabric",
    "Silk Dupatta"
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Search"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
              decoration: BoxDecoration(
                color: theme.cardColor,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 10,
                  )
                ],
              ),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: "Search fabrics, sarees, kurtis...",
                  hintStyle: theme.textTheme.bodySmall,
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: _searchController.text.isNotEmpty
                      ? IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      _searchController.clear();
                      setState(() {});
                    },
                  )
                      : null,
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.all(16),
                ),
                onChanged: (value) {
                  setState(() {});
                },
              ),
            ),

            const SizedBox(height: 24),

            Text(
              "Recent Searches",
              style: theme.textTheme.titleMedium,
            ),

            const SizedBox(height: 12),

            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: recentSearches.map((item) {
                return GestureDetector(
                  onTap: () {
                    _searchController.text = item;
                    setState(() {});
                  },
                  child: Chip(
                    label: Text(item),
                    backgroundColor: theme.primaryColor.withOpacity(0.15),
                    labelStyle: theme.textTheme.bodySmall,
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 30),

            Text(
              "Popular Categories",
              style: theme.textTheme.titleMedium,
            ),

            const SizedBox(height: 16),

            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
                childAspectRatio: 1.3,
                children: [
                  _categoryCard(context, "Sarees", Icons.checkroom),
                  _categoryCard(context, "Kurtis", Icons.woman),
                  _categoryCard(context, "Lehengas", Icons.shopping_bag),
                  _categoryCard(context, "Fabrics", Icons.texture),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _categoryCard(BuildContext context, String title, IconData icon) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
          )
        ],
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 34, color: theme.primaryColor),
            const SizedBox(height: 10),
            Text(
              title,
              style: theme.textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
