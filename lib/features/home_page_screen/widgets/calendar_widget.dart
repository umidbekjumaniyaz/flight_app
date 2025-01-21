import 'package:final_assignment_si/core/constants/colors.dart';
import 'package:flutter/material.dart';

class CalendarWidget extends StatefulWidget {
  @override
  _CustomCalendarWidgetState createState() => _CustomCalendarWidgetState();
}

class _CustomCalendarWidgetState extends State<CalendarWidget> {
  DateTime _selectedDate = DateTime.now();
  ViewMode _viewMode = ViewMode.date; // Current view mode (date or month)

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title: "Select Date" or "Select Month"
          SizedBox(height: 20),
          Text(
            _viewMode == ViewMode.date ? 'Select Date' : 'Select Month',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            
          ),
          
          Text(
            _viewMode == ViewMode.date ? 'june 20, 2022' : 'Sep, 2022',
            style: TextStyle(fontSize: 18, color: Colors.grey[600]),
            
          ),
          SizedBox(height: 5),

          // Header with navigation buttons and month/year display
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back_ios, color: CustomColor.mainColor,),
                onPressed: () {
                  setState(() {
                    if (_viewMode == ViewMode.date) {
                      _selectedDate = DateTime(_selectedDate.year, _selectedDate.month - 1);
                    } else if (_viewMode == ViewMode.month) {
                      _selectedDate = DateTime(_selectedDate.year - 1);
                    }
                  });
                },
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (_viewMode == ViewMode.date) {
                      _viewMode = ViewMode.month;
                    }
                  });
                },
                child: Text(
                  _viewMode == ViewMode.date
                      ? '${_monthName(_selectedDate.month)} ${_selectedDate.year}'
                      : '${_selectedDate.year}',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              IconButton(
                icon: Icon(Icons.arrow_forward_ios, color: CustomColor.mainColor,),
                onPressed: () {
                  setState(() {
                    if (_viewMode == ViewMode.date) {
                      _selectedDate = DateTime(_selectedDate.year, _selectedDate.month + 1);
                    } else if (_viewMode == ViewMode.month) {
                      _selectedDate = DateTime(_selectedDate.year + 1);
                    }
                  });
                },
              ),
            ],
          ),
          SizedBox(height: 16),

          // Main content: either date grid or month grid
          Expanded(
            child: _viewMode == ViewMode.date
                ? _buildDateGrid(_selectedDate.year, _selectedDate.month)
                : _buildMonthGrid(),
          ),

          // Select button
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context, _selectedDate);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: CustomColor.mainColor,
              padding: EdgeInsets.symmetric(vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Center(
              child: Text(
                'Search date',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Date grid view
  Widget _buildDateGrid(int year, int month) {
    final daysInMonth = DateTime(year, month + 1, 0).day;
    final firstDay = DateTime(year, month, 1).weekday;
    final days = List.generate(daysInMonth, (index) => index + 1);

    return GridView.builder(
      itemCount: daysInMonth + firstDay - 1,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
      ),
      itemBuilder: (context, index) {
        if (index < firstDay - 1) return SizedBox.shrink();
        final day = days[index - firstDay + 1];
        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedDate = DateTime(year, month, day);
            });
          },
          child: Center(
            child: Text(
              '$day',
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
          ),
        );
      },
    );
  }

  // Month grid view
  Widget _buildMonthGrid() {
    final months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    return GridView.builder(
      itemCount: 12,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedDate = DateTime(_selectedDate.year, index + 1);
              _viewMode = ViewMode.date;
            });
          },
          child: Center(
            child: Text(
              months[index],
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
          ),
        );
      },
    );
  }

  String _monthName(int month) {
    const months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    return months[month - 1];
  }
}

enum ViewMode { date, month }
