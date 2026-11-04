import 'dart:ui';
import 'package:flutter/material.dart';

void main() {
  runApp(const FruitHavenApp());
}

/// Root Application with Dark Glassmorphism Theme
class FruitHavenApp extends StatelessWidget {
  const FruitHavenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fruit Haven - Dark Glassmorphism',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF090D16),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF10B981), // Neon Emerald
          secondary: Color(0xFF34D399),
          surface: Color(0xFF111827),
        ),
        useMaterial3: true,
      ),
      home: const FruitCatalogScreen(),
    );
  }
}

/// Data Model
class FruitItem {
  final String id;
  final String name;
  final String scientificName;
  final String category;
  final double pricePerKg;
  final int caloriesPer100g;
  final String origin;
  final String primaryVitamin;
  final String emoji;
  final Color neonAccent;
  final double rating;

  const FruitItem({
    required this.id,
    required this.name,
    required this.scientificName,
    required this.category,
    required this.pricePerKg,
    required this.caloriesPer100g,
    required this.origin,
    required this.primaryVitamin,
    required this.emoji,
    required this.neonAccent,
    required this.rating,
  });
}

/// Main Screen with Glassmorphic Layout
class FruitCatalogScreen extends StatelessWidget {
  const FruitCatalogScreen({super.key});

  static const List<FruitItem> fruits = [
    FruitItem(
      id: '1',
      name: 'Alphonso Mango',
      scientificName: 'Mangifera indica',
      category: 'Tropical Harvest',
      pricePerKg: 4.50,
      caloriesPer100g: 60,
      origin: 'Ratnagiri, India',
      primaryVitamin: 'Vit A & C',
      emoji: '🥭',
      neonAccent: Color(0xFFFBBF24), // Neon Amber
      rating: 4.9,
    ),
    FruitItem(
      id: '2',
      name: 'Crisp Red Apple',
      scientificName: 'Malus domestica',
      category: 'Pome Elite',
      pricePerKg: 3.20,
      caloriesPer100g: 52,
      origin: 'Himachal, India',
      primaryVitamin: 'Vit C & Fiber',
      emoji: '🍎',
      neonAccent: Color(0xFFF43F5E), // Neon Rose
      rating: 4.8,
    ),
    FruitItem(
      id: '3',
      name: 'Organic Cavendish Banana',
      scientificName: 'Musa acuminata',
      category: 'Botanical Berry',
      pricePerKg: 1.50,
      caloriesPer100g: 89,
      origin: 'Kerala, India',
      primaryVitamin: 'Potassium B6',
      emoji: '🍌',
      neonAccent: Color(0xFFFACC15), // Neon Yellow
      rating: 4.7,
    ),
    FruitItem(
      id: '4',
      name: 'Wild Strawberry',
      scientificName: 'Fragaria vesca',
      category: 'Aggregate Gem',
      pricePerKg: 6.80,
      caloriesPer100g: 33,
      origin: 'Mahabaleshwar, India',
      primaryVitamin: 'Antioxidants',
      emoji: '🍓',
      neonAccent: Color(0xFFEC4899), // Neon Pink
      rating: 4.9,
    ),
    FruitItem(
      id: '5',
      name: 'Valencia Sweet Orange',
      scientificName: 'Citrus sinensis',
      category: 'Citrus Core',
      pricePerKg: 2.80,
      caloriesPer100g: 47,
      origin: 'Nagpur, India',
      primaryVitamin: 'Vitamin C Boost',
      emoji: '🍊',
      neonAccent: Color(0xFFFB923C), // Neon Orange
      rating: 4.6,
    ),
    FruitItem(
      id: '6',
      name: 'Queen Pineapple',
      scientificName: 'Ananas comosus',
      category: 'Multiple Tropical',
      pricePerKg: 3.90,
      caloriesPer100g: 50,
      origin: 'Tripura, India',
      primaryVitamin: 'Bromelain Enzyme',
      emoji: '🍍',
      neonAccent: Color(0xFFEAB308), // Neon Gold
      rating: 4.7,
    ),
    FruitItem(
      id: '7',
      name: 'Thompson Seedless Grapes',
      scientificName: 'Vitis vinifera',
      category: 'True Berry Vine',
      pricePerKg: 4.10,
      caloriesPer100g: 69,
      origin: 'Nashik, India',
      primaryVitamin: 'Resveratrol',
      emoji: '🍇',
      neonAccent: Color(0xFFA855F7), // Neon Purple
      rating: 4.8,
    ),
    FruitItem(
      id: '8',
      name: 'Sugar Baby Watermelon',
      scientificName: 'Citrullus lanatus',
      category: 'Pepo Melon',
      pricePerKg: 1.90,
      caloriesPer100g: 30,
      origin: 'Karnataka, India',
      primaryVitamin: 'Lycopene Hydration',
      emoji: '🍉',
      neonAccent: Color(0xFF10B981), // Neon Mint
      rating: 4.7,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF090D16),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        flexibleSpace: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF090D16).withOpacity(0.75),
                border: Border(
                  bottom: BorderSide(
                    color: Colors.white.withOpacity(0.08),
                    width: 1,
                  ),
                ),
              ),
            ),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  'FRUIT',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.2,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'HAVEN',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.2,
                    color: const Color(0xFF10B981),
                    shadows: [
                      Shadow(
                        color: const Color(0xFF10B981).withOpacity(0.8),
                        blurRadius: 12,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Text(
              'Glassmorphic Layout & Widgets Showcase',
              style: TextStyle(fontSize: 10, color: Color(0xFF94A3B8)),
            ),
          ],
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 14),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.06),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white.withOpacity(0.12)),
            ),
            child: const Row(
              children: [
                Text('🟢', style: TextStyle(fontSize: 10)),
                SizedBox(width: 4),
                Text(
                  '8 ITEMS',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF34D399),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            top: -60,
            right: -60,
            child: Container(
              width: 220,
              height: 220,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF10B981).withOpacity(0.15),
              ),
            ),
          ),
          Positioned(
            bottom: 120,
            left: -80,
            child: Container(
              width: 260,
              height: 260,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF6366F1).withOpacity(0.12),
              ),
            ),
          ),
          Column(
            children: [
              const GlassHeaderBanner(),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.fromLTRB(14, 4, 14, 20),
                  itemCount: fruits.length,
                  itemBuilder: (context, index) {
                    return GlassFruitCard(
                      fruit: fruits[index],
                      onTap: () => _showDetailSheet(context, fruits[index]),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showDetailSheet(BuildContext context, FruitItem fruit) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => GlassDetailSheet(fruit: fruit),
    );
  }
}

class GlassHeaderBanner extends StatelessWidget {
  const GlassHeaderBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFF10B981).withOpacity(0.2),
            const Color(0xFF047857).withOpacity(0.08),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFF10B981).withOpacity(0.35),
          width: 1.2,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF10B981).withOpacity(0.15),
            blurRadius: 20,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF10B981).withOpacity(0.2),
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF10B981).withOpacity(0.5),
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF10B981).withOpacity(0.3),
                  blurRadius: 10,
                ),
              ],
            ),
            child: const Text('✨', style: TextStyle(fontSize: 22)),
          ),
          const SizedBox(width: 14),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Fresh Cybernetic Harvest',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  '100% Organically Hydroponic with Cryptographically Verified Nutrition',
                  style: TextStyle(color: Color(0xFF94A3B8), fontSize: 11),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class GlassFruitCard extends StatelessWidget {
  final FruitItem fruit;
  final VoidCallback onTap;

  const GlassFruitCard({super.key, required this.fruit, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF111827).withOpacity(0.65),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: fruit.neonAccent.withOpacity(0.28),
          width: 1.2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
          BoxShadow(
            color: fruit.neonAccent.withOpacity(0.08),
            blurRadius: 18,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Row(
              children: [
                Container(
                  width: 58,
                  height: 58,
                  decoration: BoxDecoration(
                    color: fruit.neonAccent.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: fruit.neonAccent.withOpacity(0.4),
                      width: 1.2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: fruit.neonAccent.withOpacity(0.25),
                        blurRadius: 12,
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  child: Text(fruit.emoji, style: const TextStyle(fontSize: 30)),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              fruit.name,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.amber.withOpacity(0.12),
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(
                                  color: Colors.amber.withOpacity(0.3)),
                            ),
                            child: Row(
                              children: [
                                const Icon(Icons.star,
                                    size: 12, color: Colors.amber),
                                const SizedBox(width: 3),
                                Text(
                                  fruit.rating.toString(),
                                  style: const TextStyle(
                                    fontSize: 10.5,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.amber,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Text(
                        fruit.scientificName,
                        style: const TextStyle(
                          fontSize: 11,
                          fontStyle: FontStyle.italic,
                          color: Color(0xFF64748B),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          NeonPillBadge(
                            label: '${fruit.caloriesPer100g} kcal',
                            icon: Icons.bolt,
                            color: const Color(0xFFF97316),
                          ),
                          const SizedBox(width: 6),
                          NeonPillBadge(
                            label: fruit.primaryVitamin,
                            icon: Icons.shield_outlined,
                            color: fruit.neonAccent,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '\$${fruit.pricePerKg.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                        color: fruit.neonAccent,
                        shadows: [
                          Shadow(
                            color: fruit.neonAccent.withOpacity(0.6),
                            blurRadius: 8,
                          ),
                        ],
                      ),
                    ),
                    const Text(
                      '/ kg',
                      style: TextStyle(fontSize: 10, color: Color(0xFF64748B)),
                    ),
                    const SizedBox(height: 6),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 12,
                      color: Colors.white.withOpacity(0.3),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NeonPillBadge extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;

  const NeonPillBadge({
    super.key,
    required this.label,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2.5),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color.withOpacity(0.3), width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 10, color: color),
          const SizedBox(width: 3),
          Text(
            label,
            style: TextStyle(
              fontSize: 9.5,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

class GlassDetailSheet extends StatelessWidget {
  final FruitItem fruit;

  const GlassDetailSheet({super.key, required this.fruit});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            color: const Color(0xFF0F172A).withOpacity(0.85),
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(28)),
            border: Border.all(
              color: Colors.white.withOpacity(0.12),
              width: 1.2,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 44,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 18),
              Row(
                children: [
                  Container(
                    width: 68,
                    height: 68,
                    decoration: BoxDecoration(
                      color: fruit.neonAccent.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: fruit.neonAccent.withOpacity(0.5),
                        width: 1.5,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: fruit.neonAccent.withOpacity(0.3),
                          blurRadius: 16,
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                    child: Text(fruit.emoji, style: const TextStyle(fontSize: 36)),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          fruit.name,
                          style: const TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          fruit.scientificName,
                          style: const TextStyle(
                            fontSize: 12,
                            fontStyle: FontStyle.italic,
                            color: Color(0xFF94A3B8),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Origin: ${fruit.origin}',
                          style: const TextStyle(
                            fontSize: 11.5,
                            color: Color(0xFF38BDF8),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Divider(color: Colors.white12, height: 28),
              Row(
                children: [
                  Expanded(
                    child: _buildMetricTile(
                      'Energy',
                      '${fruit.caloriesPer100g} kcal',
                      Icons.bolt,
                      const Color(0xFFF97316),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _buildMetricTile(
                      'Price',
                      '\$${fruit.pricePerKg.toStringAsFixed(2)}/kg',
                      Icons.attach_money,
                      fruit.neonAccent,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _buildMetricTile(
                      'Class',
                      fruit.category,
                      Icons.category_outlined,
                      const Color(0xFF60A5FA),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF10B981),
                    foregroundColor: const Color(0xFF022C22),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Close Inspection',
                      style: TextStyle(fontWeight: FontWeight.w900)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMetricTile(
      String title, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.04),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 18),
          const SizedBox(height: 4),
          Text(title,
              style: const TextStyle(fontSize: 10, color: Color(0xFF94A3B8))),
          const SizedBox(height: 2),
          Text(
            value,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: color,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
