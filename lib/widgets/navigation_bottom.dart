import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavigation({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      selectedItemColor: const Color(0xFFdfa49b),
      unselectedItemColor: const Color(0xFF847b6d),
      backgroundColor: const Color(0xFFA3AB98),
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home, color: Color(0xFF5a3938)),
          label: 'Inicio',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person, color: Color(0xFF5a3938)),
          label: 'Perfil',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings, color: Color(0xFF5a3938)),
          label: 'Configuración',
        ),
      ],
    );
  }
}
