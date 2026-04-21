import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// ===== MAIN APP =====
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SMT Cuisine',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepOrange,
          primary: Colors.deepOrange,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey[100],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.deepOrange, width: 2),
          ),
          prefixIconColor: Colors.deepOrange,
        ),
      ),
      home: const OrderScreen(),
    );
  }
}

// ===== ORDER SCREEN =====
class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  // ===== Controllers =====
  final TextEditingController nameController = TextEditingController();
  final TextEditingController promoController = TextEditingController();

  // ===== Error handling for validation =====
  String? errorText;

  // ===== Dropdown variables =====
  String selectedSize = "Small";
  final List<String> sizes = ["Small", "Medium", "Large", "Party Size"];

  @override
  void dispose() {
    nameController.dispose();
    promoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SMT Cuisine Order",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.deepOrange,
        elevation: 2,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.deepOrange.withOpacity(0.05), Colors.white],
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(Icons.restaurant_menu, size: 80, color: Colors.deepOrange),
              const SizedBox(height: 16),
              Text(
                "Customize Your Pizza",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              Card(
                elevation: 8,
                shadowColor: Colors.black26,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Customer Info",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 16),

                
                      // TASK 1: Basic Input & Styling (TextField)
                      // Captures customer name
                      // Uses InputDecoration with icon, hint, border
                   

                      TextField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          labelText: "Full Name",
                          hintText: "Who is this for?",
                          prefixIcon: Icon(Icons.person_outline),
                        ),
                      ),
                      const SizedBox(height: 20),

                 
                      // TASK 2: Live Validation (TextFormField + onChanged)
                      // Checks if promo code contains spaces
                      // Shows error message dynamically
                   
                      TextFormField(
                        controller: promoController,
                        onChanged: (value) {
                          setState(() {
                            if (value.contains(" ")) {
                              errorText = "Spaces are not allowed";
                            } else {
                              errorText = null;
                            }
                          });
                        },
                        decoration: InputDecoration(
                          labelText: "Promo Code",
                          errorText: errorText,
                          prefixIcon: const Icon(Icons.local_offer_outlined),
                          hintText: "HAVE-A-PUNCH",
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Divider(),
                      const SizedBox(height: 24),

                
                      // TASK 3: DropdownButton (Selecting Pizza Size)
                      // Displays list of sizes
                      // Updates UI when selection changes
                  
                  

                      const Text("Select Size",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey[300]!),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            isExpanded: true,
                            value: selectedSize,
                            icon: const Icon(Icons.keyboard_arrow_down,
                                color: Colors.deepOrange),
                            items: sizes.map((size) {
                              return DropdownMenuItem(
                                value: size,
                                child: Text(size,
                                    style: const TextStyle(fontSize: 16)),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedSize = value!;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),

  
              // TASK 4: Navigation & Data Passing
              // Sends data to ConfirmationScreen
              // Receives result (true/false)


              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 60),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  elevation: 4,
                ),
                child: const Text("CONTINUE TO SUMMARY",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                onPressed: () async {
                  if (nameController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Please enter your name")),
                    );
                    return;
                  }

                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ConfirmationScreen(
                        customerName: nameController.text,
                        pizzaSize: selectedSize,
                      ),
                    ),
                  );

                  if (result == true) {
                    nameController.clear();
                    promoController.clear();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Order Confirmed! Enjoy your pizza!"),
                        backgroundColor: Colors.green,
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ===== CONFIRMATION SCREEN =====
class ConfirmationScreen extends StatelessWidget {
  final String customerName;
  final String pizzaSize;

  const ConfirmationScreen({
    super.key,
    required this.customerName,
    required this.pizzaSize,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Review Order",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.green,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.check_circle_outline,
                  size: 100, color: Colors.green),
              const SizedBox(height: 24),
              const Text(
                "Order Summary",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 32),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      _buildSummaryRow(Icons.person, "Customer", customerName),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Divider(),
                      ),
                      _buildSummaryRow(Icons.local_pizza, "Size", pizzaSize),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 48),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 60),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                ),
                child: const Text("CONFIRM ORDER",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                onPressed: () {
                  Navigator.pop(context, true);
                },
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Back to Edit",
                    style: TextStyle(color: Colors.grey, fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSummaryRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, color: Colors.green),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label,
                style: const TextStyle(color: Colors.grey, fontSize: 14)),
            Text(value,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
          ],
        ),
      ],
    );
  }
}
