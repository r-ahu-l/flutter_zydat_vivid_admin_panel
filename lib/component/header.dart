import 'package:zydat_color_panel/config/responsive.dart';
import 'package:flutter/material.dart';
import 'package:zydat_color_panel/style/colors.dart';
import 'package:zydat_color_panel/style/style.dart';

class Header extends StatefulWidget {
  final headerTitle;
  bool? isBtnAvailable;
  String? name;
  VoidCallback? openAlertDialog;
  Header(this.headerTitle,
      {super.key, this.isBtnAvailable, this.name, this.openAlertDialog});

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  bool isSideMenuVisible = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: Responsive.isDesktop(context)
          ? buildDesktopHeader()
          : Responsive.isMobile(context)
              ? buildMobileHeader()
              : buildTabletHeader(),
    );
  }

  Widget buildDesktopHeader() {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
          child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PrimaryText(
                            text: widget.headerTitle,
                            size: 30,
                            fontWeight: FontWeight.w800),
                      ]),
                ),
                const Spacer(
                  flex: 1,
                ),
                // SizedBox(
                //     width: 400,
                //     child: TextField(
                //       decoration: InputDecoration(
                //           filled: true,
                //           fillColor: AppColors.white,
                //           contentPadding:
                //               const EdgeInsets.only(left: 40.0, right: 5),
                //           enabledBorder: OutlineInputBorder(
                //             borderRadius: BorderRadius.circular(30),
                //             borderSide:
                //                 const BorderSide(color: AppColors.white),
                //           ),
                //           focusedBorder: OutlineInputBorder(
                //             borderRadius: BorderRadius.circular(30),
                //             borderSide:
                //                 const BorderSide(color: AppColors.white),
                //           ),
                //           prefixIcon:
                //               const Icon(Icons.search, color: AppColors.black),
                //           hintText: 'Search',
                //           hintStyle: const TextStyle(
                //               color: AppColors.secondary, fontSize: 14)),
                //     )),
                widget.isBtnAvailable!
                    ? const SizedBox(
                        width: 10,
                      )
                    : const SizedBox.shrink(),
                widget.isBtnAvailable!
                    ? SizedBox(
                        height: 50,
                        width: 150,
                        child: ElevatedButton(
                          onPressed: widget.openAlertDialog,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: PrimaryText(
                            text: 'Add ${widget.name}',
                            size: 12,
                            color: AppColors.primaryBg,
                            fontWeight: FontWeight.w600,
                          ),
                        ))
                    : const SizedBox.shrink(),
              ]))
    ]);
  }

  Widget buildTabletHeader() {
    return Row(mainAxisSize: MainAxisSize.min, children: [
      SizedBox(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PrimaryText(
                  text: widget.headerTitle,
                  size: 18,
                  fontWeight: FontWeight.w800),
            ]),
      ),
      const Spacer(
        flex: 1,
      ),
      // Expanded(
      //   flex: 1,
      //   child: TextField(
      //     decoration: InputDecoration(
      //         filled: true,
      //         fillColor: AppColors.white,
      //         contentPadding: const EdgeInsets.only(left: 40.0, right: 5),
      //         enabledBorder: OutlineInputBorder(
      //           borderRadius: BorderRadius.circular(30),
      //           borderSide: const BorderSide(color: AppColors.white),
      //         ),
      //         focusedBorder: OutlineInputBorder(
      //           borderRadius: BorderRadius.circular(30),
      //           borderSide: const BorderSide(color: AppColors.white),
      //         ),
      //         prefixIcon: const Icon(Icons.search, color: AppColors.black),
      //         hintText: 'Search',
      //         hintStyle:
      //             const TextStyle(color: AppColors.secondary, fontSize: 14)),
      //   ),
      // ),
      widget.isBtnAvailable!
          ? const SizedBox(
              width: 10,
            )
          : const SizedBox.shrink(),
      widget.isBtnAvailable!
          ? SizedBox(
              height: 35,
              width: 100,
              child: ElevatedButton(
                onPressed: widget.openAlertDialog,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 4),
                ),
                child: PrimaryText(
                  text: 'Add ${widget.name}',
                  size: 10,
                  color: AppColors.primaryBg,
                  fontWeight: FontWeight.w600,
                ),
              ))
          : const SizedBox.shrink(),
    ]);
  }

  Widget buildMobileHeader() {
    return Column(children: [
      Row(mainAxisSize: MainAxisSize.min, children: [
        SizedBox(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PrimaryText(
                    text: widget.headerTitle,
                    size: 18,
                    fontWeight: FontWeight.w800),
              ]),
        ),
        const Spacer(
          flex: 1,
        ),
        widget.isBtnAvailable!
            ? SizedBox(
                height: 35,
                width: 100,
                child: ElevatedButton(
                  onPressed: widget.openAlertDialog,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 4),
                  ),
                  child: PrimaryText(
                    text: 'Add ${widget.name}',
                    size: 10,
                    color: AppColors.primaryBg,
                    fontWeight: FontWeight.w600,
                  ),
                ))
            : const SizedBox.shrink(),
      ]),
      const SizedBox(
        height: 20,
      ),
      widget.isBtnAvailable!
          ? const SizedBox(
              width: 10,
            )
          : const SizedBox.shrink(),
      // TextField(
      //   decoration: InputDecoration(
      //       filled: true,
      //       fillColor: AppColors.white,
      //       contentPadding: const EdgeInsets.only(left: 40.0, right: 5),
      //       enabledBorder: OutlineInputBorder(
      //         borderRadius: BorderRadius.circular(30),
      //         borderSide: const BorderSide(color: AppColors.white),
      //       ),
      //       focusedBorder: OutlineInputBorder(
      //         borderRadius: BorderRadius.circular(30),
      //         borderSide: const BorderSide(color: AppColors.white),
      //       ),
      //       prefixIcon: const Icon(Icons.search, color: AppColors.black),
      //       hintText: 'Search',
      //       hintStyle:
      //           const TextStyle(color: AppColors.secondary, fontSize: 14)),
      // ),
    ]);
  }
}
