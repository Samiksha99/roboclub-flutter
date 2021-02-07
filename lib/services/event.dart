import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:roboclub_flutter/models/event.dart';

import 'dart:async';

final Firestore _firestore = Firestore.instance;

class EventService {

  Future<bool> postEvent(
  {
    String eventName,
    String details,
    String duration,
    String place,
    String posterURL,
    String time,
    String date,}) async {

    Map<String, dynamic> data = {
      "eventName": eventName,
      "details": details,
      "date": date,
      "time": time,
      "posterURL": posterURL,
      "duration": duration,
      "place": place,
    };

    await _firestore.collection("/events").add(data).then((value) {

      print(value);
    });
    return true;
  }

  Future<List<Event>> fetchEvents() async {
    List<Event> list = [];

    await _firestore.collection("/events").getDocuments().then((value) {
      value.documents.forEach((element) {
        list.add(Event.fromMap(element.data));
      });
    });
    return list;
  }
}
