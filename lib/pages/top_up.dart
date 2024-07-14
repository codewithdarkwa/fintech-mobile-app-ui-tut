import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../widgets/top_up_sheet.dart';

class TopUpPage extends StatefulWidget {
  const TopUpPage({super.key});

  @override
  State<TopUpPage> createState() => _TopUpPageState();
}

class _TopUpPageState extends State<TopUpPage> {
  String selectedProvider = 'Bank Of America';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton.outlined(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: const Text("Top Up"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Bank Transfer",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            PaymentProvider(
              image: "assets/bank_of_america.jpg",
              name: "Bank Of America",
              account: "**** **** **** 1990",
              isSelected: selectedProvider == 'Bank Of America',
              onChanged: (value) {
                if (value == true) {
                  setState(() {
                    selectedProvider = 'Bank Of America';
                  });
                }
              },
            ),
            PaymentProvider(
              image: "assets/us_bank.png",
              name: "U.S Bank",
              account: "**** **** **** 1990",
              isSelected: selectedProvider == 'U.S Bank',
              onChanged: (value) {
                if (value == true) {
                  setState(() {
                    selectedProvider = 'U.S Bank';
                  });
                }
              },
            ),
            const Text(
              "Other",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            PaymentProvider(
              image: "assets/paypal.jpg",
              name: "Paypal",
              account: "Easy payment",
              isSelected: selectedProvider == 'Paypal',
              onChanged: (value) {
                if (value == true) {
                  setState(() {
                    selectedProvider = 'Paypal';
                  });
                }
              },
            ),
            PaymentProvider(
              image: "assets/apple.png",
              name: "Apple pay",
              account: "Easy payment",
              isSelected: selectedProvider == 'Apple pay',
              onChanged: (value) {
                if (value == true) {
                  setState(() {
                    selectedProvider = 'Apple pay';
                  });
                }
              },
            ),
            PaymentProvider(
              image: "assets/google.png",
              name: "Google pay",
              account: "Easy payment",
              isSelected: selectedProvider == 'Google pay',
              onChanged: (value) {
                if (value == true) {
                  setState(() {
                    selectedProvider = 'Google pay';
                  });
                }
              },
            ),
            ElevatedButton(
              onPressed: () {
                showBarModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20)
                    )
                  ),
                  builder: (context) =>  TopUpBottomSheet(
                    selectedProvider: selectedProvider,
                    image: getImageForProvider(selectedProvider),
                    account:getAccountForProvider(selectedProvider)
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  fixedSize: const Size(double.maxFinite, 60),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
              child: const Text(
                "Confirm",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  String getAccountForProvider(String provider) {
    switch (provider) {
      case 'Bank Of America':
        return '**** **** **** 1990';
      case 'U.S Bank':
        return '**** **** **** 1990';
      default:
        return 'Easy Payment';
    }
  }

  String getImageForProvider(String provider) {
    switch (provider) {
      case 'Bank Of America':
        return 'assets/bank_of_america.jpg';
      case 'U.S Bank':
        return 'assets/us_bank.png';
      case 'Paypal':
        return 'assets/paypal.jpg';
      case 'Apple pay':
        return 'assets/apple.png';
      case 'Google pay':
        return 'assets/google.png';
      default:
        return 'assets/default.png';
    }
  }
}

class PaymentProvider extends StatelessWidget {
  const PaymentProvider(
      {super.key,
      required this.image,
      required this.name,
      required this.account,
      required this.isSelected,
      required this.onChanged});

  final String image;
  final String name;
  final String account;
  final bool isSelected;
  final ValueChanged<bool?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            radius: 15,
            backgroundImage: AssetImage(image),
            backgroundColor: Colors.white,
          ),
          title: Text(name),
          subtitle: Text(account),
          trailing: Transform.scale(
            scale: 1.5,
            child: Radio.adaptive(
              value: true,
              groupValue: isSelected,
              onChanged: onChanged,
              activeColor: const Color.fromARGB(255, 16, 80, 98),
            ),
          ),
          contentPadding: const EdgeInsets.all(12),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: const BorderSide(
                color: Colors.black12,
              )),
        ),
        const SizedBox(height: 20)
      ],
    );
  }
}
