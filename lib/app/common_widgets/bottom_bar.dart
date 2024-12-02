import 'package:seektest/app/ui/navigation/navigation_cubit.dart';
import 'package:seektest/app/utils/cubits/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:go_router/go_router.dart';

class BottomBarStarWars extends StatelessWidget {
  const BottomBarStarWars({
    super.key,
    required this.logout,
  });
  final VoidCallback logout;
  @override
  Widget build(BuildContext context) {
    void onItemTapped(BuildContext context, int index) {
      BlocProvider.of<NavigationCubit>(context).changeIndex(index);
      switch (index) {
        case 0:
          context.goNamed('task_page');
          break;
        case 1:
          logout();
          break;
      }
    }

    int getCurrentIndex() {
      var currentPath = GoRouterState.of(context).matchedLocation;

      switch (currentPath) {
        case '/task':
          return 0;

        default:
          return 0;
      }
    }

    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, themeState) {
        return Container(
          height: 65,
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18),
              topRight: Radius.circular(18),
            ),
          ),
          child: Theme(
            data: Theme.of(context).copyWith(canvasColor: Colors.white),
            child: BottomNavigationBar(
              onTap: (index) => onItemTapped(context, index),
              backgroundColor: Theme.of(context).primaryColorLight,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Theme.of(context).primaryColor,
              unselectedItemColor: Theme.of(context).primaryColor,
              selectedLabelStyle: TextStyle(color: Theme.of(context).primaryColor),
              unselectedLabelStyle: TextStyle(color: Theme.of(context).primaryColor),
              showSelectedLabels: true,
              showUnselectedLabels: true,
              currentIndex: getCurrentIndex(),
              items: [
                BottomNavigationBarItem(
                  label: translate('home_button_bar'),
                  icon: SizedBox(
                    height: 0.04.sh,
                    width: 0.04.sh,
                    child: Icon(
                      Icons.home,
                      color: themeState == ThemeState.light ? Colors.black : Colors.white,
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  label: translate('logout_button_bar'),
                  icon: GestureDetector(
                    onTap: () {
                      logout();
                    },
                    child: SizedBox(
                      height: 0.04.sh,
                      width: 0.04.sh,
                      child: Icon(
                        Icons.logout,
                        color: themeState == ThemeState.light ? Colors.black : Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
