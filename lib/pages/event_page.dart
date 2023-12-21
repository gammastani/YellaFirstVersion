
import 'package:flutter/material.dart';
import 'package:yellafirstversion/components/event_item.dart'; // Import EventItem component
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:yellafirstversion/pages/auth_page.dart';
import 'package:yellafirstversion/components/menu_button.dart'; // Import your MenuButton component
import 'package:yellafirstversion/components/app_drawer.dart'; // Import AppDrawer component
import 'package:yellafirstversion/components/custom_scaffold.dart';


class EventPage extends StatefulWidget {
  const EventPage({Key? key}) : super(key: key);

  @override
  _EventPageState createState() => _EventPageState();
}


class _EventPageState extends State<EventPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>(); // Add GlobalKey

  List<Event> events = [
    Event(
      title: "Tilburg Kickboxing Ladies only",
      description: "Vrouwen Kickbox experience bij Tilburg Kickboxing. We nodigen jou uit voor een speciale kickboxles alleen voor dames! Ervaar de kracht en energie van kickboksen in een veilige en ondersteunende omgeving. ",
      price: "€5",
      distance: "1km",
      date: "15/07/2024",
      imageUrl: "https://images-stylist.s3-eu-west-1.amazonaws.com/app/uploads/2019/05/17102616/gettyimages-640140374-crop-1558085217-1092x1092.jpg"    ),
    Event(
      title: "Zwemparadijs De Poorten",
      description: "Baantjeszwemmen of heerlijk relaxen in onze verschillende zwembaden? Zwemparadijs De Poorten heeft het allemaal voor je in petto!",
      price: "€2",
      distance: "500m",
      date: "01/08/2024",
      imageUrl: "https://www.landal.be/-/media/images/mdm/lgn/07_zwembad/lgn_07_203784_4_3_203812.jpg?cx=0.5&cy=0.5&cw=640&ch=480&hash=732E6B044740AACBEC5742A10AB73D7A",
    ),
    // Add more events here
  ];


  @override
  Widget build(BuildContext context) {

    void signUserOut() async{
      await FirebaseAuth.instance.signOut();
      await GoogleSignIn().signOut();
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => AuthPage()),
      );
    }

    return CustomScaffold(
      title: 'Events',
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: events.length,
              itemBuilder: (context, index) {
                return EventItem(event: events[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}