import 'package:flutter/material.dart';

class EventItem extends StatefulWidget {
  final Event event;
  EventItem({required this.event});
  @override
  _EventItemState createState() => _EventItemState();
}

class _EventItemState extends State<EventItem> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: Image.network(widget.event.imageUrl, width: 50, height: 50), // Event image
            title: Text(widget.event.title),
            subtitle: Text("${widget.event.distance}, ${widget.event.date}"),
            trailing: IconButton(
              icon: Icon(isExpanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
            ),
          ),
          if (isExpanded)
            Container(
              color: Colors.grey[200], // Color for expanded part
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.event.description,
                      style: TextStyle(fontSize: 16)),
                  SizedBox(height: 10,width:100),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFFF5E50), // Highlighted color for price
                      borderRadius: BorderRadius.circular(4), // Rounded corners for the price container

                    ),
                    padding: EdgeInsets.all(8),
                    child: Text(
                      "Price: ${widget.event.price}",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
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

class Event {
  final String title;
  final String description;
  final String price;
  final String distance;
  final String date;
  final String imageUrl;

  Event({
    required this.title,
    required this.description,
    required this.price,
    required this.distance,
    required this.date,
    required this.imageUrl,
  });
}