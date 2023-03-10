import 'package:flutter/material.dart';
import 'package:sale_hunter/modules/sign_in/sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerContent extends StatefulWidget {
  Function onMenuPressed;

  State<StatefulWidget> createState() {
    return null;
  }
}

class HiddenDrawerController {
  HiddenDrawerController({this.items, @required DrawerContent initialPage}) {
    this.page = initialPage;
  }

  List<DrawerItem> items;
  Function open;
  Function close;
  DrawerContent page;
}

class DrawerItem extends StatelessWidget {
  DrawerItem({this.onPressed, this.icon, this.text});

  Function onPressed;
  final Widget icon;
  final Widget text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(6.0),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Material(
          color: Colors.transparent,
          child: GestureDetector(
            onTap: onPressed,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 0, right: 8),
                    child: icon,
                  ),
                  text
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HiddenDrawer extends StatefulWidget {
  HiddenDrawer({this.header, this.decoration, this.controller});

  BoxDecoration decoration;
  Widget header;
  HiddenDrawerController controller;

  @override
  _HiddenDrawerState createState() => _HiddenDrawerState();
}

class _HiddenDrawerState extends State<HiddenDrawer>
    with TickerProviderStateMixin {
  bool isMenuOpen = false;
  bool isMenudragging = false;
  Animation<double> animation, scaleAnimation;
  Animation<BorderRadius> radiusAnimation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(microseconds: 300));
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(animationController)
      ..addListener(() {
        setState(() {});
      });
    scaleAnimation =
        Tween<double>(begin: 1.0, end: 0.86).animate(animationController);
    radiusAnimation = BorderRadiusTween(
            begin: BorderRadius.circular(0.0), end: BorderRadius.circular(32))
        .animate(
            CurvedAnimation(parent: animationController, curve: Curves.ease));
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  drawerItems() {
    return widget.controller.items.map((DrawerItem item) {
      if (item.onPressed == null) {
        item.onPressed = () {
          widget.controller.close();
        };
      }
      return item;
    }).toList();
  }

  menuPress() {
    isMenuOpen ? closeDrawer() : openDrawer();
  }

  closeDrawer() {
    animationController.reverse();
    setState(() {
      isMenuOpen = false;
    });
  }

  openDrawer() {
    animationController.forward();
    setState(() {
      isMenuOpen = true;
    });
  }

  animations() {
    if (isMenudragging) {
      var opened = false;
      setState(() {
        isMenudragging = false;
      });
      if (animationController.value >= 0.4) {
        animationController.forward();
        opened = true;
      } else {
        animationController.reverse();
      }
      setState(() {
        isMenuOpen = opened;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    widget.controller.page.onMenuPressed = menuPress;
    widget.controller.close = closeDrawer;
    widget.controller.open = openDrawer;
    return Listener(
      onPointerDown: (PointerDownEvent event) {
        if (isMenuOpen &&
            event.position.dx / MediaQuery.of(context).size.width >= 0.22) {
          closeDrawer();
        } else {
          setState(() {
            isMenudragging = (!isMenudragging && event.position.dx <= 6.0);
          });
        }
      },
      onPointerMove: (PointerMoveEvent event) {
        if (isMenudragging) {
          animationController.value =
              event.position.dx / MediaQuery.of(context).size.width;
        }
      },
      onPointerUp: (PointerUpEvent event) {
        animations();
      },
      onPointerCancel: (PointerCancelEvent event) {
        animations();
      },

      //decoration list of items in side menue
      child: Stack(
        children: <Widget>[
          Container(
            decoration: widget.decoration,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 50.0),
              child: ListView(
                children: <Widget>[
                  Container(
                    child: widget.header,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: drawerItems(

                      ),)
                ],
              ),
            ),
          ),
          Transform.scale(
            scale: scaleAnimation.value,
            child: Transform.translate(
                offset: Offset(
                    MediaQuery.of(context).size.width * 0.22 * animation.value,
                    0.0),
                child: AbsorbPointer(
                  absorbing: isMenuOpen,
                  child: Stack(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          ///shadow of menubar
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: animation.value * 16),
                        child: ClipRRect(
                          borderRadius: radiusAnimation.value,
                          child: Container(
                            color: Colors.white,
                            child: widget.controller.page,
                          ),
                        ),
                      )
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }
}

///SignOut Implement
// SharedPreferences preferences = await SharedPreferences.getInstance();
// await preferences.clear();
// Navigator.of(context).pushAndRemoveUntil(
// MaterialPageRoute(builder: (context) => Sign_In_Screen()),(route)=>false);