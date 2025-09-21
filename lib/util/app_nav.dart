import 'package:community_app/util/exports.dart';


final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void nextPop(context, page) {
  Navigator.pop(
    context,
    PageTransition(
      type: PageTransitionType.fade,
      child: page,
    ),
  );
}
void nextScreen(context, page) {
  Navigator.push(
    context,
    PageTransition(
      type: PageTransitionType.fade,
      child: page,
    ),
  );
}
void handleBottomNav(BuildContext context, Widget widget) {
  showModalBottomSheet(
    context: context,
    isDismissible: false,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
      top: Radius.circular(32.r),
    )),
    builder: (BuildContext context) {
      return widget;
    },
  );
}