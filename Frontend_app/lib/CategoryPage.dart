import 'package:flutter/material.dart';

class Categorypage extends StatefulWidget {
  const Categorypage({super.key});

  @override
  State<Categorypage> createState() => _CategorypageState();
}

class _CategorypageState extends State<Categorypage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Categories"),
        bottom: TabBar(
          controller: tabController,
          indicatorColor: theme.primaryColor,
          labelColor: theme.appBarTheme.foregroundColor,
          unselectedLabelColor:
          theme.textTheme.bodySmall?.color,
          tabs: const [
            Tab(text: "MEN"),
            Tab(text: "WOMEN"),
          ],
        ),
      ),

      body: TabBarView(
        controller: tabController,
        children: const [
          CategoryBody(
            left: ["Topwear", "Bottomwear", "Footwear", "Winterwear"],
            right: ["T-Shirts", "Shirts", "Jeans", "Hoodies"],
          ),
          CategoryBody(
            left: ["Topwear", "Bottomwear", "Winterwear", "Accessories"],
            right: ["Kurtis", "Tops", "Sweatshirts", "Jackets"],
          ),
        ],
      ),
    );
  }
}
class CategoryBody extends StatefulWidget {
  final List<String> left;
  final List<String> right;

  const CategoryBody({
    super.key,
    required this.left,
    required this.right,
  });

  @override
  State<CategoryBody> createState() => _CategoryBodyState();
}

class _CategoryBodyState extends State<CategoryBody> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Row(
      children: [

        SizedBox(
          width: 110,
          child: ListView.builder(
            itemCount: widget.left.length,
            itemBuilder: (context, index) {
              final bool active = selected == index;

              return InkWell(
                onTap: () => setState(() => selected = index),
                child: Container(
                  padding:
                  const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
                  decoration: BoxDecoration(
                    color: active
                        ? theme.primaryColor.withOpacity(0.18)
                        : Colors.transparent,
                    border: active
                        ? Border(
                      left: BorderSide(
                        color: theme.primaryColor,
                        width: 3,
                      ),
                    )
                        : null,
                  ),
                  child: Text(
                    widget.left[index],
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight:
                      active ? FontWeight.bold : FontWeight.normal,
                      color: active
                          ? theme.primaryColor
                          : theme.textTheme.bodyMedium?.color,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: widget.right.length,
            gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.3,
            ),
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  color: theme.cardColor,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    if (!isDark)
                      const BoxShadow(
                        blurRadius: 4,
                        color: Colors.black12,
                      ),
                  ],
                ),
                child: Center(
                  child: Text(
                    widget.right[index],
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}


