import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  State<Homepage> createState() => _Homepage();
}

class _Homepage extends State<Homepage> {

  final PageController _bannerController = PageController();
  int _currentBanner = 0;

  final List<String> bannerImages = [
    "assets/banner1.jpeg",
    "assets/banner2.jpeg",
    "assets/banner3.jpeg",
  ];
  final List<Map<String, dynamic>> casualDummy = [
    {'title': 'Formal\nShirts', 'color': Colors.orange},
    {'title': 'Casual\nWear', 'color': Colors.green},
    {'title': 'Party\nShirts', 'color': Colors.purple},
    {'title': 'Summer\nCollection', 'color': Colors.blue},
  ];

  final List <Map<String, dynamic>> pantdummy = [
    {'title':'baggy\njeans', 'color' : Colors.blue},
    {'title':'jogger\njeans', 'color' : Colors.grey},
    {'title':'skinny\njeans', 'color' : Colors.greenAccent}
  ];

  // final List<Map<String, dynamic>> trendingitem = [
  //   {'title': 'Formal\nShirts', 'color': Colors.orange},
  //   {'title':'baggy\njeans', 'color' : Colors.blue},
  //   {'title': 'Party\nShirts', 'color': Colors.purple},
  //   {'title':'jogger\njeans', 'color' : Colors.grey},
  //
  // ];

  final List<Map<String, dynamic>> trendingProducts = [
    {
      "image": "assets/baggy.jpeg",
      "brand": "Vastra®",
      "title": "Men's Checked baggy jeans",
      "rating": 4.4,
      "price": 1699,
      "oldPrice": 3499,
      "off": "51% OFF"
    },
    {
      "image": "assets/shirt1.jpeg",
      "brand": "Vastra®",
      "title": "Men's Casual Shirt",
      "rating": 4.2,
      "price": 1499,
      "oldPrice": 2999,
      "off": "50% OFF"
    },
    {
      'image':'assets/cargo.jpeg',
      'brand':'Vastra®',
      'title':"Mens's cargo jeans",
      'rating':4.3,
      'price':749,
      'oldprice':1299,
      'off':'70% OFF'

    }
  ];


  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), autoSlide);
  }

  void autoSlide() {
    if (_currentBanner < bannerImages.length - 1) {
      _currentBanner++;
    } else {
      _currentBanner = 0;
    }

    _bannerController.animateToPage(
      _currentBanner,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );

    Future.delayed(const Duration(seconds: 3), autoSlide);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) =>
              IconButton(onPressed: () {
                Scaffold.of(context).openDrawer();

              }, icon: Icon(Icons.menu_open)),
        ),

        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.add_card_rounded)),
        ],
      ),

      body: SingleChildScrollView(

        child: Column(
          children: [
            _buildBanner(),
            const SizedBox(height: 25,),
            _buildCausalShirt(),
            const SizedBox(height: 25,),
            _buildPants(),
            const SizedBox(height: 25,),
            _buildTrending(),
          ]



        ),

      ),

      drawer: _buildDrawer(),
    );
  }


  Widget _buildCausalShirt() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Casual Shirts",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              TextButton(
                onPressed: () {},
                child: const Text("Explore all"),
              ),
            ],
          ),
        ),

        const SizedBox(height: 2),

        SizedBox(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 16),
            itemCount: casualDummy.length,
            itemBuilder: (context, index) {
              final item = casualDummy[index];

              return Container(
                width: 140,
                margin: const EdgeInsets.only(right: 12),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: item['color'],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    item['title'],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }


  Widget _buildPants() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Pants",style: Theme.of(context).textTheme.titleMedium,),
            TextButton(onPressed: (){}, child: Text("Explore all")),
          ],
        ),
      ),
      const SizedBox(height: 1,),
      SizedBox(
        height: 250,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.only(left: 16),
          itemCount: pantdummy.length,
          itemBuilder: (context,index){
            final item = pantdummy[index];
            return Container(
              width: 180,
              margin: const EdgeInsets.only(right: 12),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: item['color']
              ),

              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  item['title'],
                ),
              ),
            );
          }

        ),
      )

    ],
  );

  }

  // ---------------for product card ----------------------

  Widget _productCard(Map<String, dynamic> item) {
    return Container(
      width: 180,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(14)),
                child: Image.asset(
                  item['image'],
                  height: 170,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Text(
                    "OVERSIZED FIT",
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
              ),

              Positioned(
                top: 8,
                right: 8,
                child: Icon(Icons.favorite_border, color: Colors.white),
              )
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Row(
                  children: [
                    const Icon(Icons.star, size: 14, color: Colors.green),
                    const SizedBox(width: 4),
                    Text(item['rating'].toString(),style: TextStyle(color: Colors.green),),
                  ],
                ),

                const SizedBox(height: 4),

                Text(
                  item['brand'],
                  style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
                ),

                Text(
                  item['title'],
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 13,color: Colors.black),
                ),

                const SizedBox(height: 6),
                Row(
                  children: [
                    Text(
                      "₹${item['price']}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      "₹${item['oldPrice']}",
                      style: const TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      item['off'],
                      style: const TextStyle(
                        color: Colors.green,
                        fontSize: 12,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildTrending() {
    return Column(
     crossAxisAlignment: CrossAxisAlignment.start,
     children: [
       Padding(
         padding: const EdgeInsets.symmetric(horizontal: 16),
         child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Text("Trending",style: Theme.of(context).textTheme.titleMedium,),
             TextButton(onPressed: (){}, child: Text("Explore all"))

           ],
         ),
       ),
     const SizedBox(height: 1,),
       SizedBox(
         height: 320,
         child: ListView.builder(
           scrollDirection: Axis.horizontal,
           padding: const EdgeInsets.only(left: 16),
           itemCount: trendingProducts.length,
           itemBuilder: (context, index) {
             return _productCard(trendingProducts[index]);
             },
         ),
       )
     ],
    );
  }


  Widget _buildBanner() {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: PageView.builder(
        controller: _bannerController,
        itemCount: bannerImages.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                bannerImages[index],
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }




  Widget _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _buildDrawerHeader(),

          _buildSectionDivider("Shop In"),
          _buildDrawerItem(Icons.man, "Men"),
          _buildDrawerItem(Icons.woman, "Women"),

          _buildSectionDivider("My Account"),
          _buildDrawerItem(Icons.person_outline, "Profile"),
          _buildDrawerItem(Icons.shopping_bag_outlined, "My Orders"),

          _buildSectionDivider("Support"),
          _buildDrawerItem(Icons.help_outline, "Help & Support"),
          _buildDrawerItem(Icons.info_outline, "About Us"),

          const SizedBox(height: 20),

          _buildLogoutItem(),
        ],
      ),
    );
  }


  Widget _buildDrawerHeader() {
    return DrawerHeader(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.amber, Colors.lime],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 32,
            backgroundImage: AssetImage("assets/images/user.png"),
          ),
          const SizedBox(width: 16),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Full name",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                "View Profile",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }


  Widget _buildSectionDivider(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: Colors.grey,
          letterSpacing: 1,
        ),
      ),
    );
  }



  Widget _buildDrawerItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        title,
        style: const TextStyle(fontSize: 15),
      ),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }

  Widget _buildLogoutItem() {
    return ListTile(
      leading: const Icon(Icons.logout, color: Colors.red),
      title: const Text(
        "Logout",
        style: TextStyle(color: Colors.red),
      ),
      onTap: () {},
    );
  }



}
