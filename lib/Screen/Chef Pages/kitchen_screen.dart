import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:hips/Widgets/adaptive_button.dart';
import 'package:intl/intl.dart';

class KitchenScreen extends StatefulWidget {
  static const routeName = '/kitchen';
  @override
  _KitchenScreenState createState() => _KitchenScreenState();
}

class _KitchenScreenState extends State<KitchenScreen> {
  DateTime _selectedDate;
  DateTime _startDate = DateTime.now();
  DateTime _endDate;
  void _startDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate:  DateTime(DateTime.now().month+1))
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }


  void _endDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate:  DateTime(DateTime.now().month+1))
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _endDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book your kitchen slot'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('Starting Date'),
          Container(
            height: 70,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(_selectedDate == null
                      ? 'No date selected'
                      : 'Picked Date: ${DateFormat('dd/MMM/yy').format(_selectedDate)}'),
                ),
                AdaptiveFlatButton(_startDatePicker, 'Choose Date')
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 70,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(_endDate == null
                      ? 'No date selected'
                      : 'Picked Date: ${DateFormat('dd/MMM/yy').format(_endDate)}'),
                ),
                AdaptiveFlatButton(_endDatePicker, 'Choose Date')
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          RaisedButton(onPressed: null, child: Text('Book Now!'))
        ],
      ),
    );
  }
}
