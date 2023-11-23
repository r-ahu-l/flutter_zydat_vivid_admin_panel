import 'package:zydat_color_panel/component/appBarActionItems.dart';
import 'package:zydat_color_panel/pages/user_maintanence.dart';
import 'package:zydat_color_panel/style/colors.dart';
import 'package:zydat_color_panel/style/style.dart';
import 'package:flutter/material.dart';
import 'package:zydat_color_panel/config/responsive.dart';
import 'package:flutter_svg/svg.dart';

class MainPage extends StatefulWidget {
  String initialWidget;
  final String name;

  MainPage({super.key, required this.initialWidget, required this.name});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late Widget _currentWidget;
  String dropdownvalue = 'Zydat USA';
  int _selectedTabIndex = 0;
  bool _showSubTabs = true;
  bool isSideMenuVisible = true;
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  var items = [
    'Zydat USA',
    'Zydat India',
    'Vivid',
    'Vivid India',
  ];

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
  }

  void updateInitialWidget(String widgetName) {
    setState(() {
      widget.initialWidget = widgetName;
    });
  }

  Widget _buildMenuItem({
    String? title,
    required String icon,
    required int index,
    required VoidCallback onTap,
  }) {
    bool isSelected = _selectedTabIndex == index;
    Color primaryColor = Theme.of(context).primaryColor;
    double reducedVerticalPadding = 0.35;
    double extremelyReducedMarginVertical = 0.10;

    return MouseRegion(
        cursor: SystemMouseCursors.contextMenu,
        child: InkWell(
          onTap: () {
            _drawerKey.currentState!.closeDrawer();
            onTap();
          },
          borderRadius: BorderRadius.circular(5.0),
          splashColor: primaryColor.withOpacity(0.1),
          highlightColor: primaryColor.withOpacity(0.05),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            margin:
                EdgeInsets.symmetric(vertical: extremelyReducedMarginVertical),
            padding: EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: reducedVerticalPadding,
            ),
            decoration: BoxDecoration(
              color: isSelected ? primaryColor : Colors.transparent,
              boxShadow: isSelected
                  ? [
                      BoxShadow(
                        color: primaryColor.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: const Offset(0, 1),
                      ),
                    ]
                  : null,
            ),
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              title: title != null && title.isNotEmpty
                  ? PrimaryText(
                      text: title,
                      size: 16,
                      fontWeight: FontWeight.w500,
                      color: isSelected ? Colors.white : Colors.black87,
                    )
                  : null,
              minLeadingWidth: 50,
              leading: SizedBox(
                  width: 40,
                  child: IconButton(
                    icon: !isSelected
                        ? SvgPicture.asset(icon, color: AppColors.iconGray)
                        : SvgPicture.asset(icon, color: AppColors.primaryBg),
                    onPressed: () {
                      onTap();
                    },
                  )),
              horizontalTitleGap: 2.0,
            ),
          ),
        ));
  }

  @override
  void initState() {
    super.initState();

    switch (widget.initialWidget) {
      case 'user-maintanence':
        _currentWidget = const UserMaintanence();
        break;
      default:
        _currentWidget = const UserMaintanence();
    }

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  void toggleSideMenuVisibility() {
    setState(() {
      isSideMenuVisible = !isSideMenuVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      drawer: !Responsive.isDesktop(context) ? buildDrawer() : null,
      appBar: !Responsive.isDesktop(context)
          ? AppBar(
              elevation: 0,
              backgroundColor: AppColors.white,
              leading: IconButton(
                  onPressed: () {
                    _drawerKey.currentState!.openDrawer();
                  },
                  icon: const Icon(Icons.menu, color: AppColors.black)),
              actions: const [
                AppBarActionItems(),
              ],
            )
          : const PreferredSize(
              preferredSize: Size.zero,
              child: SizedBox(),
            ),
      body: Container(
          width: double.infinity,
          child: Row(
            children: [
              Responsive.isDesktop(context) && isSideMenuVisible
                  ? Expanded(
                      flex: 2,
                      child: Container(
                          height: double.infinity,
                          color: AppColors.secondaryBg,
                          child: Column(children: [
                            Container(
                              height: 80,
                              alignment: Alignment.topCenter,
                              width: double.infinity,
                              padding: const EdgeInsets.only(top: 20),
                              child: SizedBox(
                                child: Image.asset('assets/zydat_logo.png'),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: const Color(0XFFF7EEE5),
                                    border: Border.all(
                                        color: Colors.black38, width: 1),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15, right: 10),
                                      child: DropdownButton(
                                        value: dropdownvalue,
                                        icon: const Padding(
                                            padding: EdgeInsets.only(left: 20),
                                            child: Icon(Icons.arrow_drop_down)),
                                        iconEnabledColor: AppColors.primary,
                                        style: const TextStyle(
                                            color: AppColors.primary,
                                            fontSize: 16,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w600),
                                        dropdownColor: const Color(0XFFF7EEE5),
                                        underline: Container(),
                                        isExpanded: true,
                                        items: items.map((String items) {
                                          return DropdownMenuItem(
                                            value: items,
                                            child: Text(items),
                                          );
                                        }).toList(),
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            dropdownvalue = newValue!;
                                          });
                                        },
                                      ))),
                            ),
                            const Divider(),
                            Expanded(
                                child: ListView(
                              padding: EdgeInsets.zero,
                              children: [
                                _buildMenuItem(
                                  title: 'User Maintanence',
                                  icon: 'assets/pie-chart.svg',
                                  index: 0,
                                  onTap: () {
                                    setState(() {
                                      _currentWidget = const UserMaintanence();
                                      _selectedTabIndex = 0;
                                    });
                                  },
                                ),
                              ],
                            )),
                            const Divider(),
                            _buildMenuItem(
                              title: 'Logout',
                              icon: 'assets/pie-chart.svg',
                              index: 5,
                              onTap: () {
                                setState(() async {
                                  Navigator.pushNamed(context, 'login');
                                });
                              },
                            ),
                            const Divider(),
                            Container(
                              padding: const EdgeInsets.fromLTRB(
                                  15.0, 0, 15.0, 15.0),
                              child: Column(
                                children: [
                                  Container(
                                    height: 60,
                                    alignment: Alignment.topCenter,
                                    width: double.infinity,
                                    child: SizedBox(
                                      child:
                                          Image.asset('assets/zydat_logo.png'),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Center(
                                    child: Text(
                                      'Powered by Zydat Inc.',
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ])))
                  : !Responsive.isDesktop(context)
                      ? const PreferredSize(
                          preferredSize: Size.zero,
                          child: SizedBox(),
                        )
                      : Container(
                          width: 70,
                          color: AppColors.secondaryBg,
                          padding: EdgeInsets.zero,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 60,
                                  alignment: Alignment.topCenter,
                                  width: double.infinity,
                                  padding: const EdgeInsets.only(top: 20),
                                  child: SizedBox(
                                    child: Image.asset(
                                        'assets/zydat_logo_alone.png'),
                                  ),
                                ),
                                const Divider(),
                                Expanded(
                                    child: Center(
                                        child: ListView(
                                  padding: EdgeInsets.zero,
                                  children: [
                                    _buildMenuItem(
                                      title: '',
                                      icon: 'assets/pie-chart.svg',
                                      index: 0,
                                      onTap: () {
                                        setState(() {
                                          _currentWidget =
                                              const UserMaintanence();
                                          _selectedTabIndex = 0;
                                        });
                                      },
                                    ),
                                  ],
                                ))),
                              ])),
              Expanded(
                flex: 10,
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            const SizedBox(
                              width: 20,
                            ),
                            !Responsive.isDesktop(context)
                                ? const PreferredSize(
                                    preferredSize: Size.zero,
                                    child: SizedBox(),
                                  )
                                : IconButton(
                                    onPressed: toggleSideMenuVisibility,
                                    icon: const Icon(Icons.menu,
                                        color: AppColors.black)),
                          ],
                        ),
                        Expanded(
                          flex: 14,
                          child: _currentWidget,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }

  Widget buildDrawer() {
    return Drawer(
        child: Container(
            height: double.infinity,
            width: 250,
            color: AppColors.secondaryBg,
            child: Column(children: [
              Container(
                height: 80,
                alignment: Alignment.topCenter,
                width: double.infinity,
                padding: const EdgeInsets.only(top: 20),
                child: SizedBox(
                  child: Image.asset('assets/zydat_logo.png'),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: const Color(0XFFF7EEE5),
                      border: Border.all(color: Colors.black38, width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                        padding: const EdgeInsets.only(left: 15, right: 10),
                        child: DropdownButton(
                          value: dropdownvalue,
                          icon: const Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Icon(Icons.arrow_drop_down)),
                          iconEnabledColor: AppColors.primary,
                          style: const TextStyle(
                              color: AppColors.primary,
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600),
                          dropdownColor: const Color(0XFFF7EEE5),
                          underline: Container(),
                          isExpanded: true,
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownvalue = newValue!;
                            });
                          },
                        ))),
              ),
              const Divider(),
              Expanded(
                  child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  _buildMenuItem(
                    title: 'User Maintanence',
                    icon: 'assets/pie-chart.svg',
                    index: 0,
                    onTap: () {
                      setState(() {
                        _currentWidget = const UserMaintanence();
                        _selectedTabIndex = 0;
                      });
                    },
                  ),
                ],
              )),
              const Divider(),
              _buildMenuItem(
                title: 'Logout',
                icon: 'assets/pie-chart.svg',
                index: 5,
                onTap: () {
                  setState(() async {
                    Navigator.pushNamed(context, 'login');
                  });
                },
              ),
              const Divider(),
              Container(
                padding: const EdgeInsets.fromLTRB(15.0, 0, 15.0, 15.0),
                child: Column(
                  children: [
                    Container(
                      height: 60,
                      alignment: Alignment.topCenter,
                      width: double.infinity,
                      child: SizedBox(
                        child: Image.asset('assets/zydat_logo.png'),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Text(
                        'Powered by Zydat Inc.',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ])));
  }
}
