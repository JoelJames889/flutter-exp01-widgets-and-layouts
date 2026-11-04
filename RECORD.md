# EXPERIMENT 1: WORKING WITH WIDGETS AND LAYOUTS

---

## 1. AIM / OBJECTIVE
To design and develop a responsive Flutter application that displays a structured list of fruit items using core layout widgets—**`Row`**, **`Column`**, **`Container`**, **`Card`**, and **`ListView`**—and to implement reusable custom widgets (`FruitCard`, `NutritionBadge`, `CatalogHeaderBanner`) to organize the user interface cleanly and modularly.

---

## 2. HARDWARE & SOFTWARE REQUIREMENTS
- **Operating System**: Windows 10 / 11, macOS, or Linux
- **Development Tool**: Flutter SDK (v3.0.0 or higher), Dart SDK (v3.0.0 or higher)
- **IDE**: Android Studio / VS Code / IntelliJ IDEA with Flutter & Dart extensions
- **Device / Simulator**: Android Emulator / Physical Device / Chrome (Web)

---

## 3. THEORETICAL BACKGROUND

Flutter constructs user interfaces by composing widgets into an immutable hierarchical **Widget Tree**. Every visual element, layout structure, and stylistic modifier is a widget.

### 3.1 Key Widgets Utilized

| Widget | Purpose | Key Properties Applied |
| :--- | :--- | :--- |
| **`Container`** | A multi-purpose convenience widget combining painting, positioning, and sizing. | `padding`, `margin`, `decoration (BoxDecoration)`, `boxShadow`, `borderRadius` |
| **`Row`** | Displays its children in a horizontal array along the main axis. | `mainAxisAlignment`, `crossAxisAlignment`, `children: []` |
| **`Column`** | Displays its children in a vertical array along the main axis. | `mainAxisAlignment`, `crossAxisAlignment`, `children: []` |
| **`Card`** | A Material Design card featuring rounded corners and elevation shadow. | `elevation: 2`, `shape: RoundedRectangleBorder`, `child` |
| **`ListView.builder`** | A lazily-loading, scrollable list widget that constructs items only when scrolled into view, optimizing memory. | `itemCount`, `itemBuilder: (context, index)` |
| **`InkWell`** | Adds Material ripple effects and tap response gestures. | `onTap`, `borderRadius` |

### 3.2 Reusable Custom Widgets
Breaking down large monolithic widget trees into small, focused custom widgets provides:
1. **Reusability**: Widgets like `NutritionBadge` can be instantiated across multiple cards with different values and colors.
2. **Readability**: Keeps `build()` methods concise and self-documenting.
3. **Performance Optimization**: Scopes widget rebuilding only to affected subtrees.

---

## 4. ALGORITHM / STEP-BY-STEP PROCEDURE

1. **Initialize Project**: Create a Flutter project configured with Material 3 theming.
2. **Define Data Model**: Formulate a strongly typed `FruitItem` class storing ID, name, scientific name, category, price, calorie count, origin, vitamins, emoji, and accent colors.
3. **Prepare Catalog Data**: Initialize a curated immutable dataset with 8 diverse fruit records.
4. **Construct Header Banner (`CatalogHeaderBanner`)**:
   - Utilize a `Container` with a `LinearGradient` (shades of emerald green) and `BoxShadow`.
   - Embed a `Row` nesting a circular avatar container and a `Column` containing promotional text.
5. **Implement Custom `FruitCard` Widget**:
   - Wrap in a `Card` widget with custom `BorderSide` and `RoundedRectangleBorder`.
   - Nest an `InkWell` for tap responsiveness.
   - Use a `Row` to align:
     - Left: 64x64 square `Container` displaying the fruit emoji on a themed background.
     - Center (`Expanded`): `Column` containing Fruit Name, Star Rating, Scientific Name, and a `Row` of `NutritionBadge` widgets.
     - Right: `Column` displaying formatted price (`$X.XX per kg`) and navigation chevron.
6. **Implement Reusable `NutritionBadge` Widget**:
   - Accepts label string, `IconData`, and color.
   - Renders a compact pill `Container` with subtle transparency and border radius.
7. **Build Scrollable List (`ListView.builder`)**:
   - Place inside an `Expanded` widget under the header banner.
   - Dynamically bind each index of `fruits` to a `FruitCard`.
8. **Interactive Modal Sheet (`FruitDetailSheet`)**:
   - On tapping a card, trigger `showModalBottomSheet()` displaying comprehensive metric tiles (Energy, Price/kg, Category, Origin) in a multi-column row layout.

---

## 5. SOURCE CODE LISTING

### `lib/main.dart`
```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const FruitHavenApp());
}

class FruitHavenApp extends StatelessWidget {
  const FruitHavenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fruit Haven - Widgets & Layouts',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2E7D32),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      home: const FruitCatalogScreen(),
    );
  }
}

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
  final Color cardAccentColor;
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
    required this.cardAccentColor,
    required this.rating,
  });
}

class FruitCatalogScreen extends StatelessWidget {
  const FruitCatalogScreen({super.key});

  static const List<FruitItem> fruits = [
    FruitItem(
      id: '1',
      name: 'Alphonso Mango',
      scientificName: 'Mangifera indica',
      category: 'Tropical',
      pricePerKg: 4.50,
      caloriesPer100g: 60,
      origin: 'Ratnagiri, India',
      primaryVitamin: 'Vitamin A & C',
      emoji: '🥭',
      cardAccentColor: Color(0xFFFFB300),
      rating: 4.9,
    ),
    FruitItem(
      id: '2',
      name: 'Crisp Red Apple',
      scientificName: 'Malus domestica',
      category: 'Pome',
      pricePerKg: 3.20,
      caloriesPer100g: 52,
      origin: 'Himachal, India',
      primaryVitamin: 'Vitamin C & Fiber',
      emoji: '🍎',
      cardAccentColor: Color(0xFFE53935),
      rating: 4.8,
    ),
    FruitItem(
      id: '3',
      name: 'Organic Cavendish Banana',
      scientificName: 'Musa acuminata',
      category: 'Berry (Botanical)',
      pricePerKg: 1.50,
      caloriesPer100g: 89,
      origin: 'Kerala, India',
      primaryVitamin: 'Potassium & B6',
      emoji: '🍌',
      cardAccentColor: Color(0xFFFDD835),
      rating: 4.7,
    ),
    FruitItem(
      id: '4',
      name: 'Wild Strawberry',
      scientificName: 'Fragaria vesca',
      category: 'Aggregate',
      pricePerKg: 6.80,
      caloriesPer100g: 33,
      origin: 'Mahabaleshwar, India',
      primaryVitamin: 'Vitamin C & Antioxidants',
      emoji: '🍓',
      cardAccentColor: Color(0xFFE91E63),
      rating: 4.9,
    ),
    FruitItem(
      id: '5',
      name: 'Valencia Sweet Orange',
      scientificName: 'Citrus sinensis',
      category: 'Citrus',
      pricePerKg: 2.80,
      caloriesPer100g: 47,
      origin: 'Nagpur, India',
      primaryVitamin: 'Vitamin C & Folate',
      emoji: '🍊',
      cardAccentColor: Color(0xFFFB8C00),
      rating: 4.6,
    ),
    FruitItem(
      id: '6',
      name: 'Queen Pineapple',
      scientificName: 'Ananas comosus',
      category: 'Multiple Fruit',
      pricePerKg: 3.90,
      caloriesPer100g: 50,
      origin: 'Tripura, India',
      primaryVitamin: 'Bromelain & Vit C',
      emoji: '🍍',
      cardAccentColor: Color(0xFFFFA000),
      rating: 4.7,
    ),
    FruitItem(
      id: '7',
      name: 'Thompson Seedless Grapes',
      scientificName: 'Vitis vinifera',
      category: 'True Berry',
      pricePerKg: 4.10,
      caloriesPer100g: 69,
      origin: 'Nashik, India',
      primaryVitamin: 'Vitamin K & Resveratrol',
      emoji: '🍇',
      cardAccentColor: Color(0xFF8E24AA),
      rating: 4.8,
    ),
    FruitItem(
      id: '8',
      name: 'Sugar Baby Watermelon',
      scientificName: 'Citrullus lanatus',
      category: 'Pepo',
      pricePerKg: 1.90,
      caloriesPer100g: 30,
      origin: 'Karnataka, India',
      primaryVitamin: 'Lycopene & Vit A',
      emoji: '🍉',
      cardAccentColor: Color(0xFF43A047),
      rating: 4.7,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F8),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF1B5E20),
        foregroundColor: Colors.white,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Fruit Haven Market', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text('Experiment 1: Widgets & Layouts', style: TextStyle(fontSize: 12, color: Color(0xFFA5D6A7))),
          ],
        ),
      ),
      body: Column(
        children: [
          const CatalogHeaderBanner(),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              itemCount: fruits.length,
              itemBuilder: (context, index) {
                return FruitCard(
                  fruit: fruits[index],
                  onTap: () => _showFruitDetails(context, fruits[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showFruitDetails(BuildContext context, FruitItem fruit) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) => FruitDetailSheet(fruit: fruit),
    );
  }
}

// Reusable Custom Widgets
class CatalogHeaderBanner extends StatelessWidget {
  const CatalogHeaderBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF2E7D32), Color(0xFF43A047)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.green.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: const Text('🍎', style: TextStyle(fontSize: 28)),
          ),
          const SizedBox(width: 14),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Fresh Farm Harvest',
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  '100% Organic & Handpicked Daily with Verified Nutrition Facts',
                  style: TextStyle(color: Color(0xFFE8F5E9), fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FruitCard extends StatelessWidget {
  final FruitItem fruit;
  final VoidCallback onTap;

  const FruitCard({super.key, required this.fruit, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: fruit.cardAccentColor.withOpacity(0.3), width: 1.2),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: fruit.cardAccentColor.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(14),
                ),
                alignment: Alignment.center,
                child: Text(fruit.emoji, style: const TextStyle(fontSize: 34)),
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
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(Icons.star, size: 16, color: Colors.amber),
                            const SizedBox(width: 2),
                            Text(fruit.rating.toString(), style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 3),
                    Text(
                      fruit.scientificName,
                      style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic, color: Colors.grey[600]),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        NutritionBadge(
                          label: '${fruit.caloriesPer100g} kcal/100g',
                          icon: Icons.local_fire_department,
                          color: Colors.deepOrange,
                        ),
                        const SizedBox(width: 6),
                        NutritionBadge(
                          label: fruit.primaryVitamin,
                          icon: Icons.health_and_safety,
                          color: const Color(0xFF2E7D32),
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
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: Color(0xFF1B5E20)),
                  ),
                  const Text('per kg', style: TextStyle(fontSize: 11, color: Colors.grey)),
                  const SizedBox(height: 8),
                  const Icon(Icons.chevron_right, color: Colors.grey),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NutritionBadge extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;

  const NutritionBadge({super.key, required this.label, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: color),
          const SizedBox(width: 4),
          Text(label, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: color)),
        ],
      ),
    );
  }
}

class FruitDetailSheet extends StatelessWidget {
  final FruitItem fruit;

  const FruitDetailSheet({super.key, required this.fruit});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 48,
              height: 4,
              decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(2)),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: fruit.cardAccentColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(16),
                ),
                alignment: Alignment.center,
                child: Text(fruit.emoji, style: const TextStyle(fontSize: 40)),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(fruit.name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    Text(fruit.scientificName, style: TextStyle(fontSize: 13, fontStyle: FontStyle.italic, color: Colors.grey[600])),
                    const SizedBox(height: 4),
                    Text('Origin: ${fruit.origin}', style: const TextStyle(fontSize: 13, color: Color(0xFF37474F))),
                  ],
                ),
              ),
            ],
          ),
          const Divider(height: 32),
          const Text('Nutritional Profile & Details', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(child: _buildMetricTile('Energy', '${fruit.caloriesPer100g} kcal', Icons.bolt, Colors.orange)),
              const SizedBox(width: 10),
              Expanded(child: _buildMetricTile('Price', '\$${fruit.pricePerKg.toStringAsFixed(2)}/kg', Icons.attach_money, Colors.green)),
              const SizedBox(width: 10),
              Expanded(child: _buildMetricTile('Category', fruit.category, Icons.category, Colors.blue)),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2E7D32),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.check_circle_outline),
              label: const Text('Close Details', style: TextStyle(fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMetricTile(String title, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.08),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(height: 6),
          Text(title, style: TextStyle(fontSize: 11, color: Colors.grey[700])),
          const SizedBox(height: 2),
          Text(value, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: color)),
        ],
      ),
    );
  }
}
```

---

## 6. INPUT & OUTPUT SPECIFICATION

### 6.1 Input Data Sample
The application ingests an array of structured entities:
```dart
FruitItem(
  name: "Alphonso Mango",
  scientificName: "Mangifera indica",
  pricePerKg: 4.50,
  caloriesPer100g: 60,
  origin: "Ratnagiri, India",
  primaryVitamin: "Vitamin A & C",
  emoji: "🥭",
  cardAccentColor: Color(0xFFFFB300),
  rating: 4.9
)
```

### 6.2 Output Visual Layout & Wireframe Representation

```
+-------------------------------------------------------------+
| [=] Fruit Haven Market                     (i)              |
|     Experiment 1: Widgets & Layouts                         |
+-------------------------------------------------------------+
|  +-------------------------------------------------------+  |
|  | (🍎)  Fresh Farm Harvest                              |  |
|  |       100% Organic & Handpicked Daily with Nutrition  |  |
|  +-------------------------------------------------------+  |
|                                                             |
|  +-------------------------------------------------------+  |
|  | +----+  Alphonso Mango                    ★ 4.9       |  |
|  | | 🥭 |  Mangifera indica                              |  |
|  | +----+  [ 60 kcal/100g ] [ Vitamin A & C ]  $4.50/kg  >| |
|  +-------------------------------------------------------+  |
|                                                             |
|  +-------------------------------------------------------+  |
|  | +----+  Crisp Red Apple                   ★ 4.8       |  |
|  | | 🍎 |  Malus domestica                               |  |
|  | +----+  [ 52 kcal/100g ] [ Vitamin C & Fiber] $3.20/kg>| |
|  +-------------------------------------------------------+  |
|                                                             |
|  +-------------------------------------------------------+  |
|  | +----+  Organic Cavendish Banana          ★ 4.7       |  |
|  | | 🍌 |  Musa acuminata                                |  |
|  | +----+  [ 89 kcal/100g ] [ Potassium & B6 ]  $1.50/kg >| |
|  +-------------------------------------------------------+  |
|                          ... [Scrolls]                      |
+-------------------------------------------------------------+
```

### 6.3 Modal Bottom Sheet Output (On Tap)
```
+-------------------------------------------------------------+
|                           [ --- ]                           |
|  +----+  Alphonso Mango                                     |
|  | 🥭 |  Mangifera indica                                   |
|  +----+  Origin: Ratnagiri, India                           |
|  ---------------------------------------------------------  |
|  Nutritional Profile & Details                              |
|  +---------------+  +---------------+  +-----------------+  |
|  | Energy        |  | Price         |  | Category        |  |
|  | 60 kcal       |  | $4.50/kg      |  | Tropical        |  |
|  +---------------+  +---------------+  +-----------------+  |
|  [                     Close Details                     ]  |
+-------------------------------------------------------------+
```

---

## 7. VIVA VOCE QUESTIONS & ANSWERS

**Q1: What is the key difference between `ListView` and `ListView.builder`?**
> **Answer**: `ListView` creates all children at once, which consumes significant memory when dealing with large lists. `ListView.builder` creates children lazily on demand as they scroll into view, offering \(O(1)\) memory footprint relative to total item count.

**Q2: How does `Container` differ from `SizedBox`?**
> **Answer**: `SizedBox` simply imposes fixed dimensions on its child. `Container` provides decoration (borders, shadows, gradients, backgrounds), padding, margins, and transform properties in addition to width and height constraints.

**Q3: Why are custom reusable widgets preferred over helper methods like `Widget _buildFruitCard()`?**
> **Answer**: Subclassing `StatelessWidget` provides dedicated build context, fine-grained rebuild scoping, and proper widget tree element lifecycle management, which compiler optimizations can leverage via `const` constructors.

---

## 8. RESULT
The Flutter application demonstrating **`Row`**, **`Column`**, **`Container`**, **`Card`**, and **`ListView`** with reusable custom widgets was successfully designed, developed, and verified. All layout constraints behaved predictably and responsively.

