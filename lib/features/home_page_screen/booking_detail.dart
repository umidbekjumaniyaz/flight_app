import 'package:final_assignment_si/core/constants/colors.dart';
import 'package:final_assignment_si/features/home_page_screen/contact_details.dart';
import 'package:final_assignment_si/features/home_page_screen/passenger_info.dart';
import 'package:final_assignment_si/features/home_page_screen/select_seat.dart';
import 'package:final_assignment_si/features/home_page_screen/widgets/add_baggage.dart';
import 'package:flutter/material.dart';

class BookingDetail extends StatelessWidget {
  const BookingDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Image.asset('assets/chevron.left.png', height: 24, width: 24),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const Text(
              'Search Flights',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Contact Details',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              '(For E-Ticket/Voucher)',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 8),
            _contactDetailsSection(context),
            const SizedBox(height: 16),
            const Text(
              'Passenger Info',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            _passengerInfoSection(context),
            const SizedBox(height: 16),
            const Text(
              'Facility',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            _facilitySection(context),
            const SizedBox(height: 16),
            const Text(
              'Extra Protection',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            _extraProtectionSection(),
            const SizedBox(height: 16),
            _subtotalAndButtonSection(context),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _contactDetailsSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Matt Murdock',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PassengerInfoPage(),
                    ),
                  );
                },
                child: const Text(
                  'Edit',
                  style: TextStyle(
                    fontSize: 16,
                    color: CustomColor.mainColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Row(
            children: [
              Icon(Icons.email_outlined,
                  color: CustomColor.buttonColor, size: 18),
              SizedBox(width: 8),
              Text('imnotdaredevil@mail.com',
                  style: TextStyle(color: Colors.grey)),
            ],
          ),
          const SizedBox(height: 8),
          const Row(
            children: [
              Icon(Icons.local_phone_outlined,
                  color: CustomColor.buttonColor, size: 18),
              SizedBox(width: 8),
              Text('+6281232323922', style: TextStyle(color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }
  Widget _passengerInfoSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Same As Contact Details',
                style: TextStyle(fontSize: 16),
              ),
              Switch(
                value: true,
                activeColor: CustomColor.mainColor,
                onChanged: (bool value) {},
              ),
            ],
          ),
          const SizedBox(height: 15),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ContactDetailsPage(),
                ),
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Selena Kayle',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _facilitySection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Baggage',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                builder: (context) => AddBaggageWidget(),
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Add extra baggage',
                  style: TextStyle(color: Colors.grey),
                ),
                Icon(Icons.add, color: Colors.grey, size: 25),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _extraProtectionSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/safe.png',
                    height: 25,
                    width: 25,
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Travel Insurance',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              const Text(
                '\$125',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          
          const Text(
            
            '✓ Coverage for Accidents up to \$10000\n✓ Coverage for trip cancellation by passengers \n    up to \$1250',
            style: TextStyle(color: Colors.grey, height: 1.5),
          ),
          
          const SizedBox(height: 16),
          Center(
            // Buttonni markazga joylashtirish
            child: SizedBox(
              width: double.infinity, // Tugma to'liq kenglikni egallaydi
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[100], 
                  padding: const EdgeInsets.symmetric(
                      vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  // Add Insurance Action
                },
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center, 
                  children: [
                    Image.asset(
                      'assets/vector.png', 
                      height: 24,
                      width: 24,
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Add Insurance',
                      style: TextStyle(
                        fontSize: 20,
                   
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
Widget _subtotalAndButtonSection(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                'Subtotal',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(width: 4), // Icon va matn orasidagi masofa
              Image.asset(
                'assets/down.png',
                 // Subtotaldan keyingi icon
                height: 16,
                width: 16,
              ),
            ],
          ),
          const SizedBox(height: 4), // "Subtotal" va qiymat orasidagi masofa
          const Text(
            '\$132',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: CustomColor.mainColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 24,
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SeatSelectionPage(),
            ),
          );
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Select Seat',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(width: 8), // Matn va icon orasidagi masofa
            Image.asset(
              'assets/checked.png', // Tugmadagi icon
              height: 16,
              width: 16,
            ),
          ],
        ),
      ),
    ],
  );
}
}