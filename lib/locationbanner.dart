import 'package:animationswithsimpleui/boxiconbutton.dart';
import 'package:animationswithsimpleui/locationmodel.dart';
import 'package:animationswithsimpleui/title.dart';
import 'package:animationswithsimpleui/view.dart';
import 'package:flutter/material.dart';


class DestinationBanner extends StatelessWidget {

  final DestinationModel destination;
  final Function(DestinationModel) onSelected;

  const DestinationBanner({
    Key key,
    this.destination,
    this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 24.0,
        right: 16.0,
        bottom: 24.0,
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      if (onSelected != null) {
                        onSelected(destination);
                      }
                    },
                    child: Hero(
                      tag: '${destination.id}-img',
                      child: Image.asset(
                        destination.imgAssetsPath[0],
                        fit: BoxFit.cover,
                        height: 100.0,
                        width: 180.0,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.only(right: 8.0),
                    width: 80.0,
                    child: Hero(
                      tag: '${destination.id}-title',
                      flightShuttleBuilder: (
                          BuildContext flightContext,
                          Animation<double> animation,
                          HeroFlightDirection flightDirection,
                          BuildContext fromHeroContext,
                          BuildContext toHeroContext,
                          ) {
                        return DestinationTitle(
                          title: destination.title,
                          isOverflow: true,
                          viewState: flightDirection == HeroFlightDirection.push
                              ? ViewState.enlarge
                              : ViewState.shrink,
                          smallFontSize: 15.0,
                          largeFontSize: 48.0,
                        );
                      },
                      child: DestinationTitle(
                        title: destination.title,
                        viewState: ViewState.shrunk,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Hero(
            tag: '${destination.id}-btn',
            child: BoxIconButton(
              onPressed: () {},
              icon: Icons.location_on,
              iconColor: Colors.white,
              buttonColor: Colors.white30,
              buttonSize: 60.0,
            ),
          ),
        ],
      ),
    );
  }
}