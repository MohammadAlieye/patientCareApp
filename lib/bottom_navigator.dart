import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:patient_care_app/patients_screen.dart';
import 'about.dart';
import 'alrams_screen.dart';
import 'call_screen.dart';

class BottomNavigator extends StatefulWidget {
  const BottomNavigator({Key key}) : super(key: key);

  @override
  _BottomNavigatorState createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  int _selectedIndex = 0;
  Color _backgroundColor = Colors.white;

  List<Widget> itmes = [
    AlarmScreen(patientName: 'patient name', severity: 'low',time: 'Monday, 10:12 AM',type: 'low'),
    Patients(),
    CallScreen(),
    About(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      backgroundColor: _backgroundColor,
      body: itmes[_selectedIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),

        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation:5,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          selectedItemColor: Color(0xff457B9D),
          unselectedItemColor: Color(0xFFB1B1B1),

          onTap: (index){
            setState(() {
              _selectedIndex = index;
            });
            switch(index){
              case 3:
              case 0:
              case 1:setState(() {
              _backgroundColor = Colors.white;
              });
              break;
              case 2:setState(() {
                _backgroundColor = Color(0xff1D3557);
              });

            }
          },
          items: const <BottomNavigationBarItem>[
            
            BottomNavigationBarItem(
              icon: Icon(Icons.access_alarm ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.airline_seat_recline_normal),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.call),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.perm_device_information),
              label: '',
            ),

          ],

        ),
      ),
    );
  }
}
