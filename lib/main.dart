
import 'package:animationswithsimpleui/detailspage.dart';
import 'package:animationswithsimpleui/fadepage.dart';
import 'package:animationswithsimpleui/header.dart';
import 'package:animationswithsimpleui/locationbanner.dart';
import 'package:animationswithsimpleui/locationmodel.dart';
import 'package:animationswithsimpleui/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LOCATIONS',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  AnimationController _animationController;
  bool returnFromDetailPage = false;
  ValueNotifier<bool> stateNotifier;

  @override
  void initState() {
    super.initState();
    _initAnimationController();
  }

  void _initAnimationController() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    )..addListener(() {
      setState(() {});
    });

    stateNotifier = ValueNotifier(returnFromDetailPage)
      ..addListener(() {
        if (stateNotifier.value) {
          _animationController.reverse(from: 1.0);
          stateNotifier.value = false;
        }
      });
  }

  @override
  void dispose() {
    _animationController.dispose();
    stateNotifier.dispose();
    super.dispose();
  }

  List<Widget> _buildDestinationBanners() {
    return travelDestinations.map((destination) {
      return DestinationBanner(
        destination: destination,
        onSelected: onSelected,
      );
    }).toList();
  }

  void onSelected(DestinationModel destination) async {
    _animationController.forward(from: 0.0);
    stateNotifier.value = await Navigator.of(context).push(
      FadePageRoute(
          fullscreenDialog: true,
          builder: (context) {
            return DetailPage(
              destinationList: travelDestinations,
              selectedIndex: travelDestinations.indexOf(destination),
            );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        elevation: 0.0,
        leading: IconButton(
          icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow,
            progress: _animationController,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Hero(
            tag: 'CapeTown',
            flightShuttleBuilder: (
                BuildContext flightContext,
                Animation<double> animation,
                HeroFlightDirection flightDirection,
                BuildContext fromHeroContext,
                BuildContext toHeroContext,
                ) {
              return Header(
                viewState: flightDirection == HeroFlightDirection.push
                    ? ViewState.shrink
                    : ViewState.enlarge,
                smallFontSize: 20.0,
                largeFontSize: 32.0,
                smallIconSize: 24.0,
                largeIconSize: 0.0,
              );
            },
            child: Header(
              viewState: ViewState.enlarged,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 12.0,
              horizontal: 24.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.keyboard_arrow_down),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    'Most Visited',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,

                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: _buildDestinationBanners(),
          )
        ],
      ),
    );
  }
}