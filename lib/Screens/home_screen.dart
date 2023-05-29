import 'package:flutter/material.dart';

class Vegetable {
  final String name;
  final String nameTamil;
  final String image;
  final List<String> types;

  Vegetable({
    required this.name,
    required this.nameTamil,
    required this.image,
    required this.types,
  });
}

class TomatoType {
  final String name;
  final String image;

  TomatoType({
    required this.name,
    required this.image,
  });
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Vegetable> vegetables = [
    Vegetable(
      name: 'Tomato',
      nameTamil: 'தக்காளி',
      image: 'lib/images/tomato.jpg',
      types: ['Type X', 'Type Y', 'Type Z'],
    ),
    Vegetable(
      name: 'Cabbage',
      nameTamil: 'முட்டைக்கோசு',
      image: 'lib/images/cabbage.jpg',
      types: ['Type P', 'Type Q', 'Type R'],
    ),
    Vegetable(
      name: 'Potato',
      nameTamil: 'உருளைக்கிழங்கு',
      image: 'lib/images/potato.jpg',
      types: ['Type M', 'Type N', 'Type O'],
    ),
    Vegetable(
      name: 'Broccoli',
      nameTamil: 'ப்ரோக்கோலி',
      image: 'lib/images/broccoli.jpg',
      types: ['Type S', 'Type T', 'Type U'],
    ),
    Vegetable(
      name: 'Cauliflower',
      nameTamil: 'பூக்கோசு',
      image: 'lib/images/cauliflower.jpg',
      types: ['Type D', 'Type E', 'Type F'],
    ),
    Vegetable(
      name: 'Spinach',
      nameTamil: 'கீரை',
      image: 'lib/images/spinach.jpg',
      types: ['Type G', 'Type H', 'Type I'],
    ),
    Vegetable(
      name: 'carrot',
      nameTamil: 'கோட்டமிளகாய்',
      image: 'lib/images/carrot.jpg',
      types: ['Type J', 'Type K', 'Type L'],
    ),
    Vegetable(
      name: 'capsicum',
      nameTamil: 'முள்ளங்கி',
      image: 'lib/images/capsicum.jpg',
      types: ['Type V', 'Type W'],
    ),
    Vegetable(
      name: 'brinjal',
      nameTamil: 'கத்திரிக்காய்',
      image: 'lib/images/brinjal.jpg',
      types: ['Type AA', 'Type BB', 'Type CC'],
    ),
    Vegetable(
      name: 'Lettuce',
      nameTamil: 'லெட்டுஸ்',
      image: 'lib/images/lettuce.jpg',
      types: ['Type DD', 'Type EE', 'Type FF'],
    ),
    Vegetable(
      name: 'Zucchini',
      nameTamil: 'சீமைச்சுரைக்காய்',
      image: 'lib/images/zucchini.jpg',
      types: ['Type GG', 'Type HH', 'Type II'],
    ),
    Vegetable(
      name: 'Onion',
      nameTamil: 'வெங்காயம்',
      image: 'lib/images/onion.jpg',
      types: ['Type JJ', 'Type KK', 'Type LL'],
    ),
  ];

  Map<int, String?> selectedWeights = {};
  Map<int, bool> selectedCheckboxes = {};

  String searchQuery = '';
  bool isHovered = false;

  List<Vegetable> get filteredVegetables {
    return vegetables.where((vegetable) {
      final name = vegetable.name.toLowerCase();
      final nameTamil = vegetable.nameTamil.toLowerCase();
      final query = searchQuery.toLowerCase();

      return name.contains(query) || nameTamil.contains(query);
    }).toList();
  }

  bool isTomatoExpanded = false;
  int? selectedTomatoType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFA4D0A4),
      appBar: AppBar(
        title: const Text('Vegetables App'),
        backgroundColor: const Color(0xFF2E8B57), // Set the background color to Sea Green
        leading: IconButton(
          onPressed: () {
            // Perform action for the left side of the app bar
          },
          icon: const Icon(Icons.menu), // Icon for the left app bar button
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Perform action when the username link is pressed
            },
            child: Text(
              'Username',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              // Perform action for the right side of the app bar
            },
            icon: const Icon(Icons.add_shopping_cart),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: Container(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: MouseRegion(
              onHover: (_) {
                setState(() {
                  isHovered = true;
                });
              },
              onExit: (_) {
                setState(() {
                  isHovered = false;
                });
              },
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                  });
                },
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: const TextStyle(color: Colors.white70),
                  prefixIcon: const Icon(Icons.search, color: Colors.white70),
                  suffixIcon: isHovered
                      ? IconButton(
                    icon: const Icon(Icons.clear, color: Colors.white70),
                    onPressed: () {
                      setState(() {
                        searchQuery = '';
                      });
                    },
                  )
                      : null,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  filled: true,
                  fillColor: Colors.white24,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: filteredVegetables.length,
              itemBuilder: (context, index) {
                final vegetable = filteredVegetables[index];

                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Card(
                    elevation: 4,
                    child: Column(
                      children: [
                        ListTile(
                          onTap: () {
                            setState(() {
                              if (vegetable.name == 'Tomato') {
                                isTomatoExpanded = !isTomatoExpanded;
                              }
                            });
                          },
                          leading: Container(
                            width: 100,
                            height: 150,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(vegetable.image),
                              ),
                            ),
                          ),
                          title: Center(
                            child: Text(
                              vegetable.name,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.green[900],
                              ),
                            ),
                          ),
                          subtitle: Center(
                            child: Text(
                              vegetable.nameTamil,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.green[700],
                              ),
                            ),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 80,
                                height: 30,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.green, width: 1.5),
                                  borderRadius: BorderRadius.circular(4),
                                  boxShadow: [
                                    const BoxShadow(
                                      color: Colors.black26,
                                      offset: Offset(0, 2),
                                      blurRadius: 4,
                                    ),
                                  ],
                                ),
                                child: DropdownButton<String>(
                                  value: selectedWeights[index],
                                  icon: const Icon(Icons.arrow_drop_down),
                                  iconSize: 24,
                                  elevation: 16,
                                  style: const TextStyle(color: Colors.green, fontSize: 16),
                                  underline: const SizedBox(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedWeights[index] = newValue;
                                    });
                                  },
                                  items: ['1 kg', '2 kg', '3 kg'].map((weight) {
                                    return DropdownMenuItem<String>(
                                      value: weight,
                                      child: Text(weight),
                                    );
                                  }).toList(),
                                ),
                              ),
                              Checkbox(
                                value: selectedCheckboxes[index] ?? false,
                                onChanged: (bool? newValue) {
                                  setState(() {
                                    selectedCheckboxes[index] = newValue ?? false;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        if (vegetable.name == 'Tomato' && isTomatoExpanded)
                          Column(
                            children: [
                              SizedBox(height: 16),
                              Text(
                                'Tomato Types:',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green[900],
                                ),
                              ),
                              SizedBox(height: 8),
                              for (int i = 0; i < vegetable.types.length; i++)
                                ListTile(
                                  onTap: () {
                                    setState(() {
                                      selectedTomatoType = i;
                                    });
                                  },
                                  leading: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage('lib/images/tomato.jpg'),
                                      ),
                                    ),
                                  ),
                                  title: Text(vegetable.types[i]),
                                  trailing: Radio<int>(
                                    value: i,
                                    groupValue: selectedTomatoType,
                                    onChanged: (int? value) {
                                      setState(() {
                                        selectedTomatoType = value;
                                      });
                                    },
                                  ),
                                ),
                            ],
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
        bottomNavigationBar: Container(
          height: 60, // Set the desired height here
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), // Adjust the border radius as needed
              topRight: Radius.circular(20.0), // Adjust the border radius as needed
            ),
            child: BottomAppBar(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {
                      // Perform home action here
                    },
                    icon: const Icon(Icons.home, size: 30.0),
                  ),
                  IconButton(
                    onPressed: () {
                      // Perform my orders action here
                    },
                    icon: const Icon(Icons.list_alt, size: 30.0),
                  ),
                  IconButton(
                    onPressed: () {
                      // Perform call action here
                    },
                    icon: const Icon(Icons.phone, size: 30.0),
                  ),
                ],
              ),
            ),
          ),
        ),


        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            // Perform order action here
          },
          label: Text('Order'),
          icon: Icon(Icons.shopping_cart),
          backgroundColor: Colors.green,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vegetables App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomePage(),
    );
  }
}
