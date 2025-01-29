// Ana Ekran
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/screens/favori_screen.dart';
import 'package:go_router/go_router.dart';

import '../widgets/bottom_menu.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 8, 24, 8),
      // AppBar
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Yemek Kutusu'),
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.bell),
            onPressed: () {},
          ),
        ],
      ),

      // Drawer (Yan Menü)
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 230, 161, 82),
        elevation: 0,
        child: Column(
          children: [
            // Drawer Header
            Container(
              height: 200,
              //color: Colors.blue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    CupertinoIcons.person_circle,
                    size: 80,
                    color: Color.fromARGB(255, 5, 5, 5),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            // Menü öğeleri
            ListTile(
              leading: const Icon(CupertinoIcons.home),
              title: const Text('Ana Sayfa'),
              onTap: () {
                context.go("/home");
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.book),
              title: const Text('Günün Tarifleri'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.book),
              title: const Text('Popüler Tarifler'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.star),
              title: const Text('Favori Tariflerin'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.person),
              title: const Text('Profil'),
              onTap: () {
                context.go("/profile");
              },
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.settings),
              title: const Text('Ayarlar'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),

      // Ana içerik
      body: RecipeGridPage(),

      // Alt navigasyon çubuğu
      bottomNavigationBar: BottomMenu(),
    );
  }
}

class RecipeGridPage extends StatefulWidget {
  @override
  _RecipeGridPageState createState() => _RecipeGridPageState();
}

class _RecipeGridPageState extends State<RecipeGridPage> {
  final List<Map<String, String>> recipes = [
    {
      'name': 'Spaghetti Bolognese',
      'image': 'assets/images/aaaa.jpg',
      'content': '''A delicious spaghetti recipe with bolognese saucehgfhsf
      sfghsfghsfgh
      gfhgf
      hfghngfnf
      gfn
      gfhngf
      ngfnh
      gfhn
      fghngf
      hngf
      h
      gfhfgs
      hgfs.'''
    },
    {
      'name': 'Chicken Curry',
      'image': 'assets/images/aaaa.jpg',
      'content': 'A flavorful chicken curry with spices.'
    },
    {
      'name': 'Beef Stew',
      'image': 'assets/images/bbb.webp',
      'content': 'A hearty beef stew with vegetables.'
    },
    {
      'name': 'Vegetable Stir Fry',
      'image': 'assets/images/bbb.webp',
      'content': 'A quick and healthy vegetable stir fry.'
    },
    {
      'name': 'Grilled Salmon',
      'image': 'assets/images/bbb.webp',
      'content': 'Perfectly grilled salmon with a lemon glaze.'
    },
    {
      'name': 'Taco Salad',
      'image': 'assets/images/bbb.webp',
      'content': 'A fresh and crunchy taco salad.'
    },
    {
      'name': 'Pancakes',
      'image': 'assets/images/bbb.webp',
      'content': 'Fluffy pancakes with syrup.'
    },
    {
      'name': 'Chocolate Cake',
      'image': 'assets/images/bbb.webp',
      'content': 'Rich and moist chocolate cake.'
    }
  ];

  final List<Map<String, String>> favorites = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 183, 228, 177),
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoritesPage(favorites: favorites),
                ),
              );
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 sütunlu düzen
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: recipes.length,
          itemBuilder: (context, index) {
            return Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RecipeDetailPage(
                          name: recipes[index]['name']!,
                          image: recipes[index]['image']!,
                          content: recipes[index]['content']!,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 97, 142, 163),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: Image.network(
                              recipes[index]['image']!,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            recipes[index]['name']!,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 8.0,
                  right: 8.0,
                  child: IconButton(
                    icon: Icon(
                      favorites.contains(recipes[index])
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: favorites.contains(recipes[index])
                          ? Colors.red
                          : Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        if (favorites.contains(recipes[index])) {
                          favorites.remove(recipes[index]);
                        } else {
                          favorites.add(recipes[index]);
                        }
                      });
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class RecipeDetailPage extends StatelessWidget {
  final String name;
  final String image;
  final String content;

  RecipeDetailPage({
    required this.name,
    required this.image,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 200.0,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                name,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                content,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FavoritesPage extends StatelessWidget {
  final List<Map<String, String>> favorites;

  FavoritesPage({required this.favorites});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: favorites.isEmpty
          ? Center(
              child: Text('No favorites yet!'),
            )
          : ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RecipeDetailPage(
                          name: favorites[index]['name']!,
                          image: favorites[index]['image']!,
                          content: favorites[index]['content']!,
                        ),
                      ),
                    );
                  },
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      favorites[index]['image']!,
                      fit: BoxFit.cover,
                      width: 50.0,
                      height: 50.0,
                    ),
                  ),
                  title: Text(favorites[index]['name']!),
                  subtitle: Text(
                    favorites[index]['content']!,
                    maxLines: 1,
                  ),
                );
              },
            ),
    );
  }
}
