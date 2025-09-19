import 'package:flutter/material.dart';
import 'package:sncf_next_trains/pages/next_train_pages.dart';

final mainTheme = ThemeData(
  // The overall brightness of the theme. Dark corresponds to a dark background.
  brightness: Brightness.dark,

  // Define the core color scheme.
  colorScheme: const ColorScheme.dark(
    primary: Color(0xFF00FF00),       // A vibrant green for primary active elements (e.g., normal text, flight path).
    onPrimary: Colors.black,          // Text color on primary-colored widgets.
    secondary: Color(0xFFFFA500),     // A distinct amber for warnings or secondary information.
    onSecondary: Colors.black,
    tertiary: Color(0xFFE50000),      // A deep red for critical warnings or failures.
    onTertiary: Colors.white,
    surface: Color(0xFF141414),       // A very dark gray, almost black, for component backgrounds.
    onSurface: Colors.white,          // Default text color on surfaces.
    error: Color(0xFFE50000),         // Red for error states.
    onError: Colors.white,
  ),

  // Set the default scaffold (page) background color.
  scaffoldBackgroundColor: Colors.black,

  // Customize text styles.
  textTheme: const TextTheme(
    displayLarge: TextStyle(color: Color(0xFF00FF00)),
    displayMedium: TextStyle(color: Color(0xFF00FF00)),
    displaySmall: TextStyle(color: Color(0xFF00FF00)),
    headlineLarge: TextStyle(color: Color(0xFF00FF00)),
    headlineMedium: TextStyle(color: Color(0xFF00FF00)),
    headlineSmall: TextStyle(color: Color(0xFF00FF00)),
    titleLarge: TextStyle(color: Color(0xFF00FF00)),
    titleMedium: TextStyle(color: Color(0xFFFFA500)), // Amber for titles.
    titleSmall: TextStyle(color: Color(0xFFE50000)),  // Red for important titles.
    bodyLarge: TextStyle(color: Colors.white),        // Default body text, often white or light gray.
    bodyMedium: TextStyle(color: Color(0xFF00FF00)),
    bodySmall: TextStyle(color: Colors.white),
    labelLarge: TextStyle(color: Color(0xFF00A3FF), fontSize: 18),
    labelMedium: TextStyle(color: Color(0xFF00A3FF)),
    labelSmall: TextStyle(color: Color(0xFF00A3FF)),

  ),

  // Customize button styles.
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF141414), // Dark background for buttons.
      foregroundColor: const Color(0xFF00FF00), // Green text on buttons.
    ),
  ),

  navigationBarTheme: NavigationBarThemeData(
    // The background color of the navigation bar itself.
    backgroundColor: const Color(0xFF141414),

    // Customizes the appearance of the indicators.
    indicatorColor: const Color(0x3300FF00), // A semi-transparent green highlight for the selected item.

    // Customizes the text labels of the navigation items.
    labelTextStyle: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        // The style for the selected item's label.
        return const TextStyle(
          color: Color(0xFF00FF00), // Vibrant green for selected label.
          fontSize: 12,
          fontWeight: FontWeight.bold,
        );
      }
      // The style for unselected item's label.
      return const TextStyle(
        color: Colors.white, // White or light gray for unselected labels.
        fontSize: 12,
      );
    }),

    // Customizes the icons of the navigation items.
    iconTheme: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        // The style for the selected item's icon.
        return const IconThemeData(
          color: Color(0xFF00FF00), // Vibrant green for selected icon.
        );
      }
      // The style for unselected item's icon.
      return const IconThemeData(
        color: Colors.white, // White or light gray for unselected icons.
      );
    }),
  ),

  // Customize icon theme.
  iconTheme: const IconThemeData(
    color: Color(0xFF00FF00), // Green icons.
  ),

  appBarTheme: AppBarTheme(
    // The background color of the app bar. It should be very dark, similar to the ECAM background.
    backgroundColor: const Color(0xFF141414),

    // The color of the text (title) in the app bar.
    foregroundColor: const Color(0xFF00FF00), // Use the primary green for the title text.

    // The color of the icon buttons on the app bar (e.g., the back button).
    iconTheme: const IconThemeData(
      color: Color(0xFF00FF00), // Use the primary green for icons.

    ),

    // The text style for the app bar's title.
    titleTextStyle: const TextStyle(
      color: Color(0xFF00FF00),
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),

    // Removes the shadow below the app bar to give it a flat, clean look.
    elevation: 0,

  ),

  tabBarTheme: TabBarThemeData(
    // The color of the tab bar's indicator, which shows the selected tab.
    indicatorColor: const Color(0xFF00FF00), // Vibrant green.

    // The text style for labels of unselected tabs.
    labelColor: const Color(0xFF00FF00), // Green for selected tab label.

    // The text style for labels of unselected tabs.
    unselectedLabelColor: Colors.white, // White for unselected tab labels.

    // The icon theme for selected tabs.
    labelPadding: const EdgeInsets.symmetric(horizontal: 16.0),

    // The icon theme for selected tabs.
    indicatorSize: TabBarIndicatorSize.tab, // The indicator fills the width of the tab.

    // The color of the tab's indicator.
    indicator: const UnderlineTabIndicator(
      borderSide: BorderSide(
        color: Color(0xFF00FF00), // Vibrant green.
        width: 2.0,
      ),
    ),
  ),
  primaryTextTheme: TextTheme(
    // **Large Headlines** (e.g., system titles) - Use a prominent green.
    displayLarge: TextStyle(fontSize: 57, color: Color(0xFF00FF00), fontWeight: FontWeight.bold),
    displayMedium: TextStyle(fontSize: 45, color: Color(0xFF00FF00), fontWeight: FontWeight.bold),
    displaySmall: TextStyle(fontSize: 36, color: Color(0xFF00FF00), fontWeight: FontWeight.bold),

    // **Main Body Text** - Primary information is in green.
    headlineLarge: TextStyle(fontSize: 32, color: Color(0xFF00FF00)),
    headlineMedium: TextStyle(fontSize: 28, color: Color(0xFF00FF00)),
    headlineSmall: TextStyle(fontSize: 24, color: Color(0xFF00FF00)),

    // **Titles and Subheadings** - Use amber for warnings.
    titleLarge: TextStyle(fontSize: 22, color: Color(0xFFFFA500)),
    titleMedium: TextStyle(fontSize: 16, color: Color(0xFFFFA500)),
    titleSmall: TextStyle(fontSize: 14, color: Color(0xFFFFA500)),

    // **Standard Body Text** - General information and data.
    bodyLarge: TextStyle(fontSize: 25, color: Colors.white),
    bodyMedium: TextStyle(fontSize: 16, color: Colors.white),
    bodySmall: TextStyle(fontSize: 12, color: Colors.white),

    // **Small Labels & Captions** - Use red for critical statuses.
    labelLarge: TextStyle(fontSize: 25, color: Color(0xFFE50000)),
    labelMedium: TextStyle(fontSize: 16, color: Color(0xFFE50000)),
    labelSmall: TextStyle(fontSize: 12, color: Color(0xFFE50000)),
  ),

  dataTableTheme: DataTableThemeData(
    // The color of the data table's heading row.
    dataRowColor: WidgetStateProperty.all(Colors.transparent),

    // The color of the data table's cells.
    dataTextStyle: const TextStyle(
      color: Color(0xFF00FF00), // Vibrant green for data text.
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
    ),

    // The color of the heading cells.
    headingTextStyle: const TextStyle(
      color: Colors.white, // White for heading text.
      fontSize: 14.0,
      fontWeight: FontWeight.bold,
    ),

    // The color of the heading's sorting icon.
    headingRowColor: MaterialStateProperty.all(Colors.transparent),

    // The color of the horizontal dividers.
    dividerThickness: 1.0,

    // The color of the horizontal dividers.
    columnSpacing: 40.0,
  ),
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: mainTheme,
      home: const NextTrainPage(title: 'Prochains trains en gare'),
    );
  }
}


