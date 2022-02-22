import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:patient_care_app/uttils/constants.dart';

class Alarms123 extends StatefulWidget {
  final String name ;
  final String dateAndTime;
  final String roomNo;
  final String Status;
  final String alamrType;
  final String severity;
  const Alarms123({Key key, this.name, this.dateAndTime, this.roomNo, this.Status, this.alamrType, this.severity}) : super(key: key);

  @override
  _Alarms123State createState() => _Alarms123State();
}

class _Alarms123State extends State<Alarms123> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Alarms123',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(23),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Alarm Details',
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 19,
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: Colors.white,
              elevation: 10,
              child: Container(
                width: double.infinity,
                height: 55,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Image.asset('assets/images/ob1.png'),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Name',
                            style: TextStyle(
                                color: Color(0xffB1B1B1), fontSize: 13),
                          ),
                          Text(
                           widget.name,
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: Colors.white,
              elevation: 10,
              child: Container(
                width: double.infinity,
                height: 55,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Image.asset('assets/images/ob1.png'),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Date/Time',
                            style: TextStyle(
                                color: Color(0xffB1B1B1), fontSize: 13),
                          ),
                          Text(
                            widget.dateAndTime,
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: Colors.white,
              elevation: 10,
              child: Container(
                width: double.infinity,
                height: 55,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Image.asset('assets/images/ob1.png'),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Room No.',
                            style: TextStyle(
                                color: Color(0xffB1B1B1), fontSize: 13),
                          ),
                          Text(
                           widget.roomNo,
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: Colors.white,
              elevation: 10,
              child: Container(
                width: double.infinity,
                height: 55,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Image.asset('assets/images/ob1.png'),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Status',
                            style: TextStyle(
                                color: Color(0xffB1B1B1), fontSize: 13),
                          ),
                          Text(
                            widget.Status,
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: Colors.white,
              elevation: 10,
              child: Container(
                width: double.infinity,
                height: 55,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Image.asset('assets/images/ob1.png'),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Alarm Type',
                            style: TextStyle(
                                color: Color(0xffB1B1B1), fontSize: 13),
                          ),
                          Text(
                            widget.alamrType,
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: Colors.white,
              elevation: 10,
              child: Container(
                width: double.infinity,
                height: 55,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Image.asset('assets/images/ob1.png'),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Severity',
                            style: TextStyle(
                                color: Color(0xffB1B1B1), fontSize: 13),
                          ),
                          Text(
                            widget.severity,
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 30,),
            Container (
              width: 312,
              height: 55,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFF459D50), Color(0xFF1D572E)]),
              ),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'OWN the Alarm',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Button(
              text: 'CLOSE the Alarm',
              onpressed: null,
            ),
          ],
        ),
      ),
    );
  }
}
