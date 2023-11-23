// import 'package:zydat_color_panel/component/appBarActionItems.dart';
// import 'package:zydat_color_panel/pages/user_maintanence.dart';
// import 'package:zydat_color_panel/style/colors.dart';
// import 'package:zydat_color_panel/style/style.dart';
// import 'package:flutter/material.dart';
// import 'package:zydat_color_panel/config/responsive.dart';
// import 'package:flutter_svg/svg.dart';

// class BuildMenuItem extends StatefulWidget {
//   const BuildMenuItem({super.key});

//   @override
//   _BuildMenuItemState createState() => _BuildMenuItemState();
// }

// class _BuildMenuItemState extends State<BuildMenuItem> {
//   int _selectedTabIndex = 0;
//   final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
//   @override
  
//   Widget build(
//     BuildContext context,
//     VoidCallback onTap,
//     int index,
//     String? title,
//     String icon,
//   ) {
//     Color primaryColor = Theme.of(context).primaryColor;
//     bool isSelected = _selectedTabIndex == index;
//     double reducedVerticalPadding = 0.35;
//     double extremelyReducedMarginVertical = 0.10;
//     return MouseRegion(
//         cursor: SystemMouseCursors.contextMenu,
//         child: InkWell(
//           onTap: () {
//             _drawerKey.currentState!.closeDrawer();
//             onTap();
//           },
//           borderRadius: BorderRadius.circular(5.0),
//           splashColor: primaryColor.withOpacity(0.1),
//           highlightColor: primaryColor.withOpacity(0.05),
//           child: AnimatedContainer(
//             duration: const Duration(milliseconds: 250),
//             curve: Curves.easeInOut,
//             margin:
//                 EdgeInsets.symmetric(vertical: extremelyReducedMarginVertical),
//             padding: EdgeInsets.symmetric(
//               horizontal: 10.0,
//               vertical: reducedVerticalPadding,
//             ),
//             decoration: BoxDecoration(
//               color: isSelected ? primaryColor : Colors.transparent,
//               boxShadow: isSelected
//                   ? [
//                       BoxShadow(
//                         color: primaryColor.withOpacity(0.5),
//                         spreadRadius: 1,
//                         blurRadius: 2,
//                         offset: const Offset(0, 1),
//                       ),
//                     ]
//                   : null,
//             ),
//             child: ListTile(
//               contentPadding: EdgeInsets.zero,
//               title: title != null && title.isNotEmpty
//                   ? PrimaryText(
//                       text: title,
//                       size: 16,
//                       fontWeight: FontWeight.w500,
//                       color: isSelected ? Colors.white : Colors.black87,
//                     )
//                   : null,
//               minLeadingWidth: 50,
//               leading: SizedBox(
//                   width: 40,
//                   child: IconButton(
//                     icon: !isSelected
//                         ? SvgPicture.asset(icon, color: AppColors.iconGray)
//                         : SvgPicture.asset(icon, color: AppColors.primaryBg),
//                     onPressed: () {
//                       onTap();
//                     },
//                   )),
//               horizontalTitleGap: 2.0,
//             ),
//           ),
//         ));
//   }
// }
