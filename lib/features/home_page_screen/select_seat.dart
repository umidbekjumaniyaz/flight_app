import 'package:final_assignment_si/core/constants/colors.dart';
import 'package:final_assignment_si/features/home_page_screen/widgets/double_check.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';




class SeatSelectionPage extends StatefulWidget {
  @override
  _SeatSelectionPageState createState() => _SeatSelectionPageState();
}

class _SeatSelectionPageState extends State<SeatSelectionPage> {
  String selectedSeat = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           const Text(
              '  Search Flights',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Wed, OCT 26 2022",
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "New York, USA",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text(
                          "(LGA)",
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    ),
                     Image.asset(
                'assets/piloticon.png', // Subtotaldan keyingi icon
                height: 80,
                width: 80,
              ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "9:37 PM",
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Danang, VIE",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text(
                          "(DAD)",
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                // Horizontal alphabet row with background
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(7, (index) {
                      return Text(
                        String.fromCharCode(65 + index),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      );
                    }),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                  ),
                  child: Column(
                    children: List.generate(8, (rowIndex) {
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Left group of seats
                              ...List.generate(3, (seatIndex) {
                                bool isAvailable =
                                    (rowIndex + seatIndex) % 3 != 0;
                                bool isSelected = selectedSeat ==
                                    "${String.fromCharCode(65 + seatIndex)}${rowIndex + 1}";

                                return GestureDetector(
                                  onTap: isAvailable
                                      ? () {
                                          setState(() {
                                            selectedSeat =
                                                "${String.fromCharCode(65 + seatIndex)}${rowIndex + 1}";
                                          });
                                        }
                                      : null,
                                  child: Container(
                                    margin: EdgeInsets.all(6),
                                    width: 36,
                                    height: 36,
                                    decoration: BoxDecoration(
                                      color: isSelected
                                          ? CustomColor.mainColor
                                          : isAvailable
                                              ? Colors.white
                                              : Colors.transparent,
                                      border: isAvailable
                                          ? Border.all(color: CustomColor.mainColor,)
                                          : Border.all(color: Colors.transparent),
                                      shape: BoxShape.circle,
                                    ),
                                    child: !isAvailable
                                        ? Center(
                                            child: Icon(
                                              Icons.close,
                                              color: Colors.grey,
                                              size: 18,
                                            ),
                                          )
                                        : null,
                                  ),
                                );
                              }),
                              // Row number in the center
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 16),
                                child: Text(
                                  "${rowIndex + 1}",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              // Right group of seats
                              ...List.generate(3, (seatIndex) {
                                bool isAvailable =
                                    (rowIndex + seatIndex) % 3 != 0;
                                bool isSelected = selectedSeat ==
                                    "${String.fromCharCode(68 + seatIndex)}${rowIndex + 1}";

                                return GestureDetector(
                                  onTap: isAvailable
                                      ? () {
                                          setState(() {
                                            selectedSeat =
                                                "${String.fromCharCode(68 + seatIndex)}${rowIndex + 1}";
                                          });
                                        }
                                      : null,
                                  child: Container(
                                    margin: EdgeInsets.all(6),
                                    width: 36,
                                    height: 36,
                                    decoration: BoxDecoration(
                                      color: isSelected
                                          ? CustomColor.mainColor
                                          : isAvailable
                                              ? Colors.white
                                              : Colors.transparent,
                                      border: isAvailable
                                          ? Border.all(color: CustomColor.mainColor,)
                                          : Border.all(color: Colors.transparent),
                                      shape: BoxShape.circle,
                                    ),
                                    child: !isAvailable
                                        ? Center(
                                            child: Icon(
                                              Icons.close,
                                              color: Colors.grey,
                                              size: 18,
                                            ),
                                          )
                                        : null,
                                  ),
                                );
                              }),
                            ],
                          ),
                        ],
                      );
                    }),
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildLegendCircle(CustomColor.buttonColor, "SELECTED"),
                    buildLegendCircle(Colors.white, "AVAILABLE"),
                    buildLegendCircle(Colors.transparent, "NOT AVAILABLE"),
                  ],
                ),
              ],
            ),
          ),
          Spacer(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Selected Seat:",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          Container(
  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start, // Tugmani chapga joylashtirish
    children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: CustomColor.buttonColor, // Orqa fon rangi
          borderRadius: BorderRadius.circular(8), // Yumuq burchaklar
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min, // Tugmaning enini ichidagi kontentga moslashtirish
          children: [
            Icon(
              Icons.person,
              color: Colors.white, // Ikonka rangi
              size: 20,
            ),
            const SizedBox(width: 8), // Icon va matn orasidagi masofa
            Text(
              selectedSeat.isNotEmpty
                  ? "#1 $selectedSeat"
                  : "No seat selected",
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white, // Matn rangi
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      const SizedBox(height: 20),
      SwipeButton.expand(
        thumb: const Icon(
          Icons.double_arrow,
          color: Colors.white,
        ),
        activeThumbColor: CustomColor.buttonColor,
        activeTrackColor: Colors.blue[100]!,
        onSwipeEnd: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            builder: (context) => BookingModal(),
          );
        },
        child: Text(
          "Slide to Book",
          style: TextStyle(
            fontSize: 18,
            color: CustomColor.buttonColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  ),
),
               
        ],
      ),
    );
  }

  Widget buildLegendCircle(Color color, String label) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.all(4.0),
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: 4),
        Text(
          label,
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }
}
