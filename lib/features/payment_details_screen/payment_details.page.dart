import 'package:final_assignment_si/core/constants/colors.dart';
import 'package:final_assignment_si/features/home_page_screen/widgets/touch_id.dart';
import 'package:flutter/material.dart';

class PaymentDetailsPage extends StatelessWidget {
  const PaymentDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                const Text(
                  'Digital payment method(s)',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4.0),
                const Text(
                  'Swipe left to set your default method',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 16.0),

                // Payment Methods List
                PaymentMethodItem(
                  iconPath: 'assets/mastercard.png',
                  label: '***8976',
                  description: 'Get 10\$ Discount',
                  isSelected: true,
                ),
                PaymentMethodItem(
                  iconPath: 'assets/paypal.png',
                  label: 'Paypal',
                  description: 'Get 10\$ Discount',
                  isSelected: false,
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Add methods',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 16.0),
                PaymentMethodItem(
                  iconPath: 'assets/credit_card.png',
                  label: 'Credit or debit card',
                  description: 'Visa, Mastercard, AMEX and JCB',
                  isSelected: false,
                  actionLabel: 'Add',
                ),
                PaymentMethodItem(
                  iconPath: 'assets/Refund.png',
                  label: 'Transfer',
                  description: 'Transferring via ATM, Internet \nBanking & Mobile Banking\nget \$10 discount',
                  isSelected: false,
                  actionLabel: 'Add',
                ),
              ],
            ),
          ),

          // Footer Section
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  offset: const Offset(0, -1),
                  blurRadius: 10.0,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Subtotal',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      const SizedBox(height: 4.0),
                      
                      const Text(
                        '\$132',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                      ),
                      builder: (context) => FingerprintModal(),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CustomColor.mainColor,
                    padding: const EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 24.0,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Row(
                    children: const [
                      Text(
                        'Proceed The Payment',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 8.0),
                      Icon(Icons.check_circle, color: Colors.white),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PaymentMethodItem extends StatelessWidget {
  final String iconPath; // Rasm yo‘li
  final String label;
  final String description;
  final bool isSelected;
  final String? actionLabel;

  const PaymentMethodItem({
    Key? key,
    required this.iconPath,
    required this.label,
    required this.description,
    this.isSelected = false,
    this.actionLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  iconPath,
                  width: 40,
                  height: 40,
                  fit: BoxFit.contain,
                ),
                const SizedBox(width: 16.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      description,
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            if (actionLabel != null)
              Text(
                actionLabel!,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: CustomColor.mainColor,
                ),
              ),
            if (actionLabel == null)
              Radio(
                value: true,
                groupValue: isSelected,
                onChanged: (value) {},
                 activeColor: CustomColor.mainColor,
              ),
          ],
        ),
        const Divider(height: 32.0, thickness: 1.0, color: Colors.grey),
      ],
    );
  }
}
