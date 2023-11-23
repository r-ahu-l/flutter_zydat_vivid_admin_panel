import 'package:flutter/material.dart';
import 'package:zydat_color_panel/component/header.dart';
import 'package:zydat_color_panel/component/info_card.dart';
import 'package:zydat_color_panel/component/text_field.dart';
import 'package:zydat_color_panel/config/responsive.dart';
import 'package:zydat_color_panel/config/size_config.dart';
import 'package:zydat_color_panel/pages/company_details.dart';
import 'package:zydat_color_panel/style/colors.dart';
import 'package:zydat_color_panel/style/style.dart';
import 'package:collection/collection.dart';

class UserMaintanence extends StatefulWidget {
  const UserMaintanence({super.key});

  @override
  _UserMaintanenceState createState() => _UserMaintanenceState();
}

class _UserMaintanenceState extends State<UserMaintanence> {
  bool isSideMenuVisible = true;
  String dropdownvalue = 'Role 1';
  var items = [
    'Role 1',
    'Role 2',
    'Role 3',
    'Role 4',
    'Role 5',
  ];
  String planValue = 'Plan 1';
  var plans = [
    'Plan 1',
    'Plan 2',
    'Plan 3',
    'Plan 4',
    'Plan 5',
  ];
  List<Map<String, dynamic>> dataList = [
    {
      'name': 'LB',
      'email': 'lindsay_boehl@fitnyc_edu',
      'role': 'Super Admin',
      'status': 'Active',
      'actions': [
        IconButton(
          icon: const Icon(Icons.edit),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.check_circle),
          onPressed: () {
            // Handle circle_tick action
          },
        ),
        IconButton(
          icon: const Icon(Icons.email),
          onPressed: () {
            // Handle email action
          },
        ),
      ],
    },
    {
      'name': 'Srinivasa K',
      'email': 'srinivas@zydat.com',
      'role': 'Super Admin',
      'status': 'Active',
      'actions': [
        IconButton(
          icon: const Icon(Icons.edit),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.check_circle),
          onPressed: () {
            // Handle circle_tick action
          },
        ),
        IconButton(
          icon: const Icon(Icons.email),
          onPressed: () {
            // Handle email action
          },
        ),
      ],
    },
    {
      'name': 'Lindsay',
      'email': 'lindsay@zydat.com',
      'role': 'Super Admin',
      'status': 'Active',
      'actions': [
        IconButton(
          icon: const Icon(Icons.edit),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.check_circle),
          onPressed: () {
            // Handle circle_tick action
          },
        ),
        IconButton(
          icon: const Icon(Icons.email),
          onPressed: () {
            // Handle email action
          },
        ),
      ],
    },
    {
      'name': 'Matt Forman',
      'email': 'matt80forman@gmail.com',
      'role': 'Super Admin',
      'status': 'Active',
      'actions': [
        IconButton(
          icon: const Icon(Icons.edit),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.check_circle),
          onPressed: () {
            // Handle circle_tick action
          },
        ),
        IconButton(
          icon: const Icon(Icons.email),
          onPressed: () {
            // Handle email action
          },
        ),
      ],
    },
    {
      'name': 'Matt',
      'email': 'matt@zydat.com',
      'role': 'Super Admin',
      'status': 'Active',
      'actions': [
        IconButton(
          icon: const Icon(Icons.edit),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.check_circle),
          onPressed: () {
            // Handle circle_tick action
          },
        ),
        IconButton(
          icon: const Icon(Icons.email),
          onPressed: () {
            // Handle email action
          },
        ),
      ],
    },
  ];

  void toggleSideMenuVisibility() {
    setState(() {
      isSideMenuVisible = !isSideMenuVisible;
    });
  }

  void _showAddCompanyDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: PrimaryText(
            text: 'Add Company',
            size: Responsive.isDesktop(context) ? 18 : 14,
            color: AppColors.black,
            fontWeight: FontWeight.w600,
          ),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTextField("Company Name", context),
              PrimaryText(
                text: 'Select Plan',
                color: AppColors.iconGray,
                size: Responsive.isMobile(context) ? 11 : 14,
                fontWeight: FontWeight.w600,
              ),
              const SizedBox(
                height: 5,
              ),
              DecoratedBox(
                  decoration: BoxDecoration(
                    color: const Color(0XFFFFFFFF),
                    border: Border.all(color: Colors.black38, width: 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 10),
                      child: DropdownButton(
                        value: planValue,
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
                        items: plans.map((String plans) {
                          return DropdownMenuItem(
                            value: plans,
                            child: Text(plans),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            planValue = newValue!;
                          });
                        },
                      ))),
              const SizedBox(
                height: 18,
              ),
              buildTextField("No. of Admins", context),
              buildTextField("No. of Users", context),
              buildTextField("No. of Viewers", context),
              buildTextField("Start Date", context),
              buildTextField("End Date", context),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _showAddAdminDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: PrimaryText(
            text: 'Add New User',
            size: Responsive.isDesktop(context) ? 18 : 14,
            color: AppColors.black,
            fontWeight: FontWeight.w600,
          ),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTextField("Name", context),
              buildTextField("E-mail", context),
              PrimaryText(
                text: 'Select Role',
                color: AppColors.iconGray,
                size: Responsive.isMobile(context) ? 11 : 14,
                fontWeight: FontWeight.w600,
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                // margin: const EdgeInsets.symmetric(horizontal: 20),
                child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: const Color(0XFFFFFFFF),
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
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Close'),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: Responsive.isDesktop(context) && isSideMenuVisible
                    ? 10
                    : 18,
                child: SafeArea(
                  child: SingleChildScrollView(
                      padding: const EdgeInsets.fromLTRB(30, 15, 30, 30),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Header(
                              'Vivid Admins',
                              isBtnAvailable: true,
                              name: 'Admin',
                              openAlertDialog: () =>
                                  _showAddAdminDialog(context),
                            ),
                            Row(children: <Widget>[
                              Expanded(
                                  child: SingleChildScrollView(
                                scrollDirection:
                                    MediaQuery.of(context).size.width < 768
                                        ? Axis.horizontal
                                        : Axis.vertical,
                                child: DataTable(
                                  decoration: const BoxDecoration(),
                                  headingRowColor:
                                      MaterialStateProperty.all<Color>(
                                          AppColors.tableHeaderBg),
                                  dataRowColor:
                                      MaterialStateProperty.all<Color>(
                                          const Color(0XFFFFFFFF)),
                                  headingRowHeight: 40,
                                  dataRowMaxHeight: 60,
                                  columns: const [
                                    DataColumn(
                                        label: Center(
                                      child: PrimaryText(
                                          text: 'Name',
                                          size: 18,
                                          align: TextAlign.center,
                                          fontWeight: FontWeight.w700),
                                    )),
                                    DataColumn(
                                      label: PrimaryText(
                                          text: 'Email',
                                          size: 18,
                                          align: TextAlign.center,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    DataColumn(
                                      label: PrimaryText(
                                          text: 'Role',
                                          size: 18,
                                          align: TextAlign.center,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    DataColumn(
                                      label: PrimaryText(
                                          text: 'Status',
                                          size: 18,
                                          align: TextAlign.center,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    DataColumn(
                                      label: PrimaryText(
                                          text: 'Action',
                                          size: 18,
                                          align: TextAlign.center,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                  rows: dataList
                                      .mapIndexed(
                                        (index, data) =>
                                            DataRow(key: UniqueKey(), cells: [
                                          DataCell(
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8.0),
                                              child: PrimaryText(
                                                text: data['name'],
                                                color: AppColors.secondary,
                                                fontWeight: FontWeight.w700,
                                                size: 16,
                                              ),
                                            ),
                                          ),
                                          DataCell(
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8.0),
                                              child: PrimaryText(
                                                text: data['email'],
                                                color: AppColors.secondary,
                                                size: 16,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                          DataCell(
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8.0),
                                              child: Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      vertical: 8.0,
                                                      horizontal: 8.0),
                                                  color: Colors.red,
                                                  child: PrimaryText(
                                                    text: data['role'],
                                                    color: AppColors.primaryBg,
                                                    size: 16,
                                                    fontWeight: FontWeight.w700,
                                                  )),
                                            ),
                                          ),
                                          DataCell(
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8.0),
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 8.0,
                                                        horizontal: 8.0),
                                                color: data['status'] ==
                                                        'Active'
                                                    ? Colors
                                                        .green // Active button background color
                                                    : Colors.red,
                                                child: PrimaryText(
                                                  text: data['status'],
                                                  color: AppColors.primaryBg,
                                                  size: 16,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                          ),
                                          DataCell(
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                data['status'] == 'Active'
                                                    ? const Icon(
                                                        Icons.check_circle,
                                                        color: Colors
                                                            .green, // Active icon color
                                                        size: 24,
                                                      )
                                                    : const Icon(
                                                        Icons.block,
                                                        color: Colors
                                                            .red, // Blocked icon color
                                                        size: 24,
                                                      ),
                                                IconButton(
                                                  icon: const Icon(Icons.edit),
                                                  color: Colors
                                                      .blue, // Edit icon color
                                                  onPressed: () {
                                                    // Handle edit action
                                                  },
                                                ),
                                                IconButton(
                                                  icon: const Icon(Icons.email),
                                                  color: Colors
                                                      .orange, // Email icon color
                                                  onPressed: () {
                                                    // Handle email action
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ]),
                                      )
                                      .toList(),
                                ),
                              ))
                            ]),
                            SizedBox(
                              height: SizeConfig.blockSizeVertical! * 4,
                            ),
                            Header(
                              'Companies',
                              isBtnAvailable: true,
                              name: 'Company',
                              openAlertDialog: () =>
                                  _showAddCompanyDialog(context),
                            ),
                            Row(children: <Widget>[
                              Expanded(
                                  child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: DataTable(
                                  decoration: const BoxDecoration(),
                                  headingRowColor:
                                      MaterialStateProperty.all<Color>(
                                          AppColors.tableHeaderBg),
                                  dataRowColor:
                                      MaterialStateProperty.all<Color>(
                                          const Color(0XFFFFFFFF)),
                                  headingRowHeight: 40,
                                  dataRowMaxHeight: 60,
                                  columnSpacing:
                                      MediaQuery.of(context).size.width * 0.06,
                                  columns: const [
                                    DataColumn(
                                      label: PrimaryText(
                                        text: 'Brand Icon',
                                        size: 18,
                                        align: TextAlign.center,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    DataColumn(
                                        label: Center(
                                      child: PrimaryText(
                                          text: 'Name',
                                          size: 18,
                                          align: TextAlign.center,
                                          fontWeight: FontWeight.w700),
                                    )),
                                    DataColumn(
                                      label: PrimaryText(
                                        text: 'No. of Admins',
                                        size: 18,
                                        align: TextAlign.center,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    DataColumn(
                                      label: PrimaryText(
                                          text: 'No. of Users',
                                          size: 18,
                                          align: TextAlign.center,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    DataColumn(
                                      label: PrimaryText(
                                          text: 'No. of Viewer',
                                          size: 18,
                                          align: TextAlign.center,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    DataColumn(
                                      label: PrimaryText(
                                          text: 'No. of Total',
                                          size: 18,
                                          align: TextAlign.center,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    DataColumn(
                                      label: PrimaryText(
                                          text: 'Plan',
                                          size: 18,
                                          align: TextAlign.center,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    DataColumn(
                                      label: PrimaryText(
                                          text: 'Renewal Date',
                                          size: 18,
                                          align: TextAlign.center,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    DataColumn(
                                      label: PrimaryText(
                                          text: 'Status',
                                          size: 18,
                                          align: TextAlign.center,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    DataColumn(
                                      label: PrimaryText(
                                          text: 'Action',
                                          size: 18,
                                          align: TextAlign.center,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                  rows: dataList
                                      .mapIndexed(
                                        (index, data) =>
                                            DataRow(key: UniqueKey(), cells: [
                                          DataCell(
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8.0),
                                              child: GestureDetector(
                                                onTap: () {
                                                  // Navigate to UserMaintenance class
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          CompanyDetails(),
                                                    ),
                                                  );
                                                },
                                                child: Image.asset(
                                                  'assets/black_img.jpg',
                                                  width: 100,
                                                ),
                                              ),
                                            ),
                                          ),
                                          DataCell(
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8.0),
                                              child: PrimaryText(
                                                text: data['name'],
                                                color: AppColors.secondary,
                                                fontWeight: FontWeight.w700,
                                                size: 16,
                                              ),
                                            ),
                                          ),
                                          DataCell(
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8.0),
                                              child: PrimaryText(
                                                text: data['name'],
                                                color: AppColors.secondary,
                                                fontWeight: FontWeight.w700,
                                                size: 16,
                                              ),
                                            ),
                                          ),
                                          DataCell(
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8.0),
                                              child: PrimaryText(
                                                text: data['name'],
                                                color: AppColors.secondary,
                                                fontWeight: FontWeight.w700,
                                                size: 16,
                                              ),
                                            ),
                                          ),
                                          DataCell(
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8.0),
                                              child: PrimaryText(
                                                text: data['name'],
                                                color: AppColors.secondary,
                                                fontWeight: FontWeight.w700,
                                                size: 16,
                                              ),
                                            ),
                                          ),
                                          DataCell(
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8.0),
                                              child: PrimaryText(
                                                text: data['email'],
                                                color: AppColors.secondary,
                                                size: 16,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                          DataCell(
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8.0),
                                              child: Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      vertical: 8.0,
                                                      horizontal: 8.0),
                                                  color: Colors.red,
                                                  child: PrimaryText(
                                                    text: data['role'],
                                                    color: AppColors.primaryBg,
                                                    size: 16,
                                                    fontWeight: FontWeight.w700,
                                                  )),
                                            ),
                                          ),
                                          DataCell(
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8.0),
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 8.0,
                                                        horizontal: 8.0),
                                                color: data['status'] ==
                                                        'Active'
                                                    ? Colors
                                                        .green // Active button background color
                                                    : Colors.red,
                                                child: PrimaryText(
                                                  text: data['status'],
                                                  color: AppColors.primaryBg,
                                                  size: 16,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                          ),
                                          DataCell(
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8.0),
                                              child: PrimaryText(
                                                text: data['name'],
                                                color: AppColors.secondary,
                                                fontWeight: FontWeight.w700,
                                                size: 16,
                                              ),
                                            ),
                                          ),
                                          DataCell(
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                data['status'] == 'Active'
                                                    ? const Icon(
                                                        Icons.check_circle,
                                                        color: Colors
                                                            .green, // Active icon color
                                                        size: 24,
                                                      )
                                                    : const Icon(
                                                        Icons.block,
                                                        color: Colors
                                                            .red, // Blocked icon color
                                                        size: 24,
                                                      ),
                                                IconButton(
                                                  icon: const Icon(Icons.edit),
                                                  color: Colors
                                                      .blue, // Edit icon color
                                                  onPressed: () {
                                                    // Handle edit action
                                                  },
                                                ),
                                                IconButton(
                                                  icon: const Icon(Icons.email),
                                                  color: Colors
                                                      .orange, // Email icon color
                                                  onPressed: () {
                                                    // Handle email action
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ]),
                                      )
                                      .toList(),
                                ),
                              ))
                            ]),
                          ])),
                ))
          ],
        ),
      ),
    );
  }
}
