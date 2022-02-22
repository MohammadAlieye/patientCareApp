import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:patient_care_app/alarms123.dart';
import 'api/alarms_api.dart';
import 'model/alarms_model.dart';

class AlarmScreen extends StatefulWidget {
  final String time;
  final String type;
  final String patientName;
  final String severity;
  const AlarmScreen({Key key, this.time, this.type, this.patientName, this.severity})
      : super(key: key);

  @override
  _AlarmScreenState createState() => _AlarmScreenState();
}

class _AlarmScreenState extends State<AlarmScreen> {
  bool _isLoading = true;

  List<AlarmsModel> alarmsList = [];
  Future<void> alarm() async{
    FetchApiForAlamrs().fetchApi().then((value) {
      if (value.statusCode == 200) {
        final welcome = alarmsListFromJson(value.body);
        alarmsList = welcome;
        print('lenght of list  ***************************   ${alarmsList.length}');
        setState(() {});
      } else {
        return null;
      }
    });
  }

  @override
  void initState() {
    alarm();
    setState(() {
      _isLoading = false;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 2,
        title: const Text(
          'Alarms',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: _isLoading
          ? const Center(
              child: SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(),
              ),
            )
          : ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: alarmsList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Alarms123(
                                    name: alarmsList[index].patient.firstName,
                                dateAndTime: alarmsList[index].elapsedTime.text,
                                roomNo: alarmsList[index].room.number,
                                Status: alarmsList[index].status.text,
                                alamrType: alarmsList[index].type.toString(),
                                severity: alarmsList[index].severity.text,

                                  )));
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(19, 19, 14, 0),
                    child: SizedBox(
                      height: 60,
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Container(
                                  width: 21,
                                  height: 21,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF8CECC),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 17,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.time,
                                    style: const TextStyle(fontSize: 13),
                                  ),
                                  Text(
                                    'Type: ${alarmsList[index].type}',
                                    style: const TextStyle(
                                        fontSize: 14, color: Color(0xFFB1B1B1)),
                                  )
                                ],
                              ),
                              const Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    '${alarmsList[index].patient.firstName} (Room 202)',
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                  Text(
                                    '${alarmsList[index].severity}',
                                    style: const TextStyle(
                                        fontSize: 12, color: Colors.red),
                                  )
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 13,
                          ),
                          const Divider(
                            thickness: 2.0,
                            color: Color(0xFFE3E3E3),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
