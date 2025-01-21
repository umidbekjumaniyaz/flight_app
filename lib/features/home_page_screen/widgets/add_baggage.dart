import 'package:final_assignment_si/core/constants/colors.dart';
import 'package:flutter/material.dart';

class AddBaggageWidget extends StatefulWidget {
  @override
  _AddBaggageWidgetState createState() => _AddBaggageWidgetState();
}

class _AddBaggageWidgetState extends State<AddBaggageWidget> {
  int _selectedWeight = 5; // Default selected baggage weight
  final Map<int, int> _weightPrices = {
    0: 0,
    5: 210000,
    10: 510000,
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.45,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            'Add Baggage',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),

          // Passenger name
          Text(
            '1. Matt Murdock',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 16),

          // Weight options
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _weightPrices.keys.map((weight) {
              final isSelected = weight == _selectedWeight;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedWeight = weight;
                  });
                },
                child: Container(
                  width: 120,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: isSelected ? CustomColor.mainColor : Colors.white,
                    border: Border.all(
                      color: isSelected ? CustomColor.mainColor : Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Text(
                        '$weight Kg',
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        weight == 0
                            ? 'Free'
                            : 'Rp ${_weightPrices[weight]!.toString()}',
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
          SizedBox(height: 16),

          // Price breakdown
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '1. Matt Murdock',
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                    Text(
                      'Rp ${_weightPrices[_selectedWeight]!.toString()}',
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Rp ${_weightPrices[_selectedWeight]!.toString()}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 16),

          // Add Baggage button
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context, _selectedWeight);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: CustomColor.mainColor,
              padding: EdgeInsets.symmetric(vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.add, color: Colors.white),
                SizedBox(width: 8),
                Text(
                  'Add Baggage',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
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

void showAddBaggageModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) => AddBaggageWidget(),
  );
}
