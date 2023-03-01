import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_course/core/cache_helper.dart';
import 'package:online_course/screens/save_text/view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/helper_methods.dart';
import 'core/my_observer.dart';
import 'screens/babies/view.dart';
import 'screens/books/view.dart';
import 'screens/brand_collages/view.dart';
import 'screens/brand_photos/view.dart';
import 'screens/brand_products/view.dart';
import 'screens/brand_profile/view.dart';
import 'screens/calaculator/view.dart';
import 'screens/cars/view.dart';
import 'screens/categories_list/view.dart';
import 'screens/counter/view.dart';
import 'screens/dialogs/view.dart';
import 'screens/login/view.dart';
import 'screens/months/view.dart';
import 'screens/movies/view.dart';
import 'screens/my_cart/view.dart';
import 'screens/my_map/view.dart';
import 'screens/my_orders/view.dart';
import 'screens/on_boarding/view.dart';
import 'screens/posts/view.dart';
import 'screens/register/view.dart';
import 'screens/search/view.dart';
import 'screens/splash/view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  Bloc.observer = MyObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        shadowColor: Colors.green,
        primaryColor: Colors.red,
        primarySwatch: Colors.red,
        appBarTheme: const AppBarTheme(
          toolbarHeight: 70,
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
              color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      home: MyMapView(),
    );
  }
}

// Everything in flutter is a widget
// Widgets two types
/*
1. StateLessWidget
2. StatefulWidget
 */
/*
//  Widgets
1.  MaterialApp
2.  Scaffold
3.  AppBar
4.  Drawer
5.  FloatingActionButton
6.  Text
7.  Column
8.  Row
9.  Icon
10. ElevatedButton
11. OutlinedButton
12. SingleChildScrollView
13. InkWell
14. GestureDetector
15. Image.network
16. PageView
17. SizedBox
18. Image.asset
19. Padding
20. Spacer
21. ListView.builder
22. ListTile
23. CircleAvatar
24. Divider
25. IconButton
26. Transform.translate - rotate - scale
27. Container - transform - decoration - gradients colors
    - decoration image - border - radius - margin vs padding
28. Center
29. Stack
30. Positioned
31. Align
32. Expanded
33. DefaultTabController (TabBar -tab - TabBarView)
- make model class and pass it to the item with data
34. StatefulWidget
- make controller with all the logic
35.Text.rich
36.TextFormField
37.Card
38.ClipRRect
39.ClipOval
40.Switch
41.SwitchListTile
42.CloseButton
43.BackButton
44.TextButton
45.MaterialButton
46.CircularProgressIndicator
47.LinearProgressIndicator
48.BottomNavigationBar
49.BottomAppBar
50.Slider
51.RangeSlider
52.Chip
53.ActionChip
54.ChoiceChip
55.FilterChip
56.InputChip
57.AbsorbPointer
58.FlutterLogo
59.Checkbox
60.CheckboxListTile
61.DropdownButton
62.DecoratedBox
63.Wrap
64.SafeArea
65. GridView.builder
66. BlocProvider
67. BlocBuilder
68. Builder
69. StatefulBuilder
 */

/*
dialogs
1. AlertDialog
2. SimpleDialog
3. AboutDialog
4. CupertinoAlertDialog
5. showDatePicker
6. showDatePicker
7. showTimePicker
8. showDateRangePicker



 */

/*
Packages
1. shared_preferences
2. animate_do
3. lottie
4. curved_navigation_bar
5. video_player
6. intl
7. flutter_bloc
 */
