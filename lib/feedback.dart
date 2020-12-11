import 'package:covid/Home/homeLayout.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = FirebaseFirestore.instance;
void feedBack(BuildContext context) {
  Navigator.popAndPushNamed(context, HomeLayout.id);
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return FittedBox(
          child: Container(
            padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25), topLeft: Radius.circular(25)),
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  List: [
                    Color(0xFF062D34),
                    Color(0xFF25737B),
                  ]),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/feedback.png',
                  height: MediaQuery.of(context).size.height / 5.5,
                ),
                Text(
                  'Thank You!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.w500),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Your feedback has been submitted.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w400),
                  ),
                )
              ],
            ),
          ),
        );
      });
}

void bugFeedback(String feed, context) {
  feedBack(context);
  _firestore.collection('Feedback').add({'text': feed, 'type': 'Bug Report'});
}

void featureFeedback(String feed, context) {
  feedBack(context);
  _firestore
      .collection('Feedback')
      .add({'text': feed, 'type': 'Feature Request'});
}

void applauseFeedback(String feed, context) {
  feedBack(context);
  _firestore.collection('Feedback').add({'text': feed, 'type': 'Applause'});
}

void onExpanded(bool flag) {
  feedbackTextController.clear();
}

final feedbackTextController = TextEditingController();
Container feedbackCard(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25))),
    padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
    child: Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(10),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25)),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                List: [
                  Color(0xFF062D34),
                  Color(0xFF25737B),
                ]),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 8, bottom: 8.0),
                child: Text(
                  'Hi there,',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, bottom: 2.0),
                child: Text(
                  "We can't wait to hear your thoughts on our app,\nWhat would you like to do?",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w300),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ExpansionTile(
            onExpansionChanged: onExpanded,
            title: Text(
              'Report a Bug',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
            ),
            subtitle: Padding(
              padding: EdgeInsets.only(top: 5),
              child: Text(
                'Let us know so we can build a better user experience for you.',
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 17,
                    fontWeight: FontWeight.w300),
              ),
            ),
            trailing: Icon(Icons.bug_report),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: feedbackTextController,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                          icon: Icon(Icons.send),
                          onPressed: () {
                            Navigator.pop(context);
                            print(feedbackTextController.value.text);
                            bugFeedback(
                                feedbackTextController.value.text, context);
                          }),
                      hintText: 'Explain bug encountered',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13))),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ExpansionTile(
            onExpansionChanged: onExpanded,
            title: Text(
              'Request a Feature',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(
                'Do you have an idea that would make our app better? We would love to know!',
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 17,
                    fontWeight: FontWeight.w300),
              ),
            ),
            trailing: Icon(Icons.lightbulb_outline),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: feedbackTextController,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                          icon: Icon(Icons.send),
                          onPressed: () {
                            Navigator.pop(context);
                            print(feedbackTextController.value.text);
                            featureFeedback(
                                feedbackTextController.value.text, context);
                          }),
                      hintText: 'Enter your ideas!',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13))),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ExpansionTile(
            onExpansionChanged: onExpanded,
            title: Text(
              'Send Applause',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(
                'Let us know what you really liked about our app, maybe we can make it even better?',
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 17,
                    fontWeight: FontWeight.w300),
              ),
            ),
            trailing: Icon(Icons.favorite_border),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: feedbackTextController,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        icon: Icon(Icons.send),
                        onPressed: () {
                          Navigator.pop(context);
                          print(feedbackTextController.value.text);
                          applauseFeedback(
                              feedbackTextController.value.text, context);
                        }),
                    hintText: 'Pour your Love',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
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
