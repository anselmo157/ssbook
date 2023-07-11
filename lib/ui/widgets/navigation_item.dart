import 'package:flutter/material.dart';

class NavigationItem extends StatelessWidget {]
  final String label;
  final Icons icon;

  const NavigationItem({
    required this.label,
    required this.icon,
    super.key,
  });
  
  @override
  Widget build(BuildContext context) {
     return BottomNavigationBarItem(
     label: label,
     icon: Icon(
             icon,
             size: 24,
           ),
     );
  }


}
