// ignore_for_file: must_be_immutable

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:waiter_app/constants/constants.dart';
import 'package:waiter_app/database/model/table_model.dart';
import 'package:waiter_app/database/storage/user_secure_storage.dart';
import 'package:waiter_app/logic/controller/search_menu_controller.dart';
import 'package:waiter_app/logic/controller/table_controller.dart';
import 'package:waiter_app/views/pages/order/order_preview_page.dart';
import 'package:waiter_app/views/pages/search/search_page.dart';
import 'package:waiter_app/views/widgets/custom_drawer.dart';
import 'package:get/get.dart';

class TakeOrderPage extends StatefulWidget {
  TakeOrderPage({
    Key? key,
  }) : super(key: key);

  @override
  State<TakeOrderPage> createState() => _TakeOrderPageState();
}

class _TakeOrderPageState extends State<TakeOrderPage> {
  final TextEditingController numberController = TextEditingController();

  final TableController tableController = Get.put(TableController());

  final SearchMenuController searchMenuController =
      Get.put(SearchMenuController());

  final _formKey = GlobalKey<FormState>();

  String? _digitValue = '';

  void _onClick(context, String? value) {
    _digitValue = _digitValue! + value!;
    int.parse(_digitValue!);
    (context as Element).markNeedsBuild();
  }

  int? selectedTable = 0;

  int? selectedTableID;

  void checkOption(int value) {
    setState(() {
      selectedTable;
      // selectedTableID;
    });
  }

  @override
  Widget build(BuildContext context) {
    selectedTableID = tableController.tableID;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Take Order',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColor.primaryColor,
      ),
      drawer: CustomDrawer(
        indexClicked: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GetBuilder<TableController>(
                init: TableController(),
                builder: (bookTable) {
                  return Container(
                    child: bookTable.tableData.isEmpty
                        ? Container()
                        : Container(
                            height: 55,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: const Color(0XFF9acd32),
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      bookTable
                                          .tableData[bookTable.tableIndex].name
                                          .toString(),
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                      // "Table no.  ${bookTable.tableIndex.toString()}",
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            // menuMaxHeight:
                            //         ScreenSize(context).mainHeight / 3,

                            // child: ButtonTheme(
                            //   alignedDropdown: true,
                            //   child: DropdownButtonHideUnderline(
                            //     child: DropdownButton<TableData>(
                            //       isExpanded: true,
                            //       hint: const Text(
                            //         'Select Table',
                            //         style: TextStyle(
                            //             fontWeight: FontWeight.w500,
                            //             fontSize: 16),
                            //       ),
                            //       menuMaxHeight:
                            //           ScreenSize(context).mainHeight / 3,
                            //       value:
                            //           bookTable.tableData[bookTable.tableIndex],
                            //       items: bookTable.tableData
                            //           .map((TableData value) {
                            //         return DropdownMenuItem<TableData>(
                            //           value: value,
                            //           child: Text(
                            //             value.name.toString(),
                            //           ),
                            //         );
                            //       }).toList(),
                            // onChanged: (newValue) {
                            //   selectedTable =
                            //       bookTable.tableData.indexOf(newValue!);
                            //   selectedTableID = newValue.id;
                            //   UserSecureStorage.setTableID(
                            //       selectedTableID);
                            //   bookTable.bookTable();
                            //   searchMenuController.getMenuItemTable();
                            //   (context as Element).markNeedsBuild();
                            // },
                            //     ),
                            //   ),
                            // ),
                          ),
                  );
                }),
            const SizedBox(
              width: 5,
            ),

            GetBuilder<TableController>(
                init: TableController(),
                builder: (bookTable) {
                  return SizedBox(
                    height: 200,
                    child: GridView.custom(
                        padding: const EdgeInsets.only(
                          left: 10,
                          right: 5,
                          top: 10,
                        ),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4, childAspectRatio: 1),
                                childrenDelegate: SliverChildListDelegate,
                        itemCount: bookTable.tableData.length,
                        itemBuilder: (context, value) {
                          return GestureDetector(
                            onTap: () {
                              
                              setState(() {
                                // checkOption(value);
                                // bookTable.tableData.map((TableData value) {
                                //   return value;
                                // }).toList();
                              });

                              // print(object)
                            },
                            child: Container(
                              height: 200,
                              padding: const EdgeInsets.only(
                                left: 10,
                                right: 10,
                              ),
                              margin: const EdgeInsets.only(
                                  bottom: 10, right: 10, left: 5),
                              decoration: BoxDecoration(
                                color: Colors.lightGreen.shade300,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 5.0,
                                    offset: Offset(0, 5),
                                  ),
                                  BoxShadow(
                                    color: Colors.black,
                                    offset: Offset(-3, 0),
                                  ),
                                  BoxShadow(
                                    color: Colors.black,
                                    offset: Offset(3, 0),
                                  ),
                                ],
                                borderRadius:
                                    BorderRadiusDirectional.circular(10),
                              ),
                              child: Container(
                                child: Text(
                                  bookTable.tableData[bookTable.tableIndex].name
                                      .toString(),
                                  style: const TextStyle(
                                    color: Colors.brown,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                            ),
                          );
                        }),
                  );
                }),

            // GetBuilder<SearchMenuController>(
            //     init: SearchMenuController(),
            //     builder: (menuItem) {
            //       return Padding(
            //         padding: const EdgeInsets.symmetric(vertical: 14),
            //         child: Text(
            //           'Order items( ${menuItem.menuData.length} Items)',
            //           style: const TextStyle(
            //             fontSize: 16,
            //             fontWeight: FontWeight.w600,
            //             color: Color(0xff160040),
            //           ),
            //         ),
            //       );
            //     }),
            //ordered items
            GetBuilder<SearchMenuController>(
                init: SearchMenuController(),
                builder: (menuItem) {
                  return Container(
                    height: ScreenSize(context).mainHeight / 9,
                    color: Colors.grey.shade50,
                    child: menuItem.menuData.isEmpty
                        ? Container()
                        : ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: menuItem.menuData.length,
                            itemBuilder: (context, index) {
                              return Container(
                                height: ScreenSize(context).mainHeight / 5.6,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1,
                                      color: Colors.blue.withOpacity(.01)),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15)),
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    children: [
                                      // SizedBox(
                                      //   height: 85,
                                      //   width: 80,
                                      // child: ClipRRect(
                                      //   borderRadius:
                                      //       BorderRadius.circular(10.0),
                                      //   child: Image.network(
                                      //     menuItem.menuData[index].image
                                      //         .toString(),
                                      //     fit: BoxFit.cover,
                                      //     loadingBuilder:
                                      //         (BuildContext context,
                                      //             Widget child,
                                      //             ImageChunkEvent?
                                      //                 loadingProgress) {
                                      //       if (loadingProgress == null) {
                                      //         return child;
                                      //       }
                                      //       return Center(
                                      //         child:
                                      //             CircularProgressIndicator(
                                      //           color: AppColor.primaryColor,
                                      //           value: loadingProgress
                                      //                       .expectedTotalBytes !=
                                      //                   null
                                      //               ? loadingProgress
                                      //                       .cumulativeBytesLoaded /
                                      //                   loadingProgress
                                      //                       .expectedTotalBytes!
                                      //               : null,
                                      //         ),
                                      //       );
                                      //     },
                                      //   ),
                                      // ),
                                      // ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Container(
                                          height:
                                              ScreenSize(context).mainHeight /
                                                  2,
                                          color: Colors.white,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      menuItem
                                                          .menuData[index].name
                                                          .toString(),
                                                      style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 14,
                                                        color:
                                                            Color(0xff160040),
                                                      ),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                    width: 20,
                                                    child: Center(
                                                      child:
                                                          FloatingActionButton(
                                                        heroTag:
                                                            searchMenuController
                                                                .menuData[index]
                                                                .id
                                                                .toString(),
                                                        backgroundColor:
                                                            Colors.white,
                                                        elevation: 0,
                                                        onPressed: () {
                                                          searchMenuController
                                                              .menuItemRemove(
                                                                  index);
                                                        },
                                                        child: const Icon(
                                                          Icons.clear,
                                                          size: 18,
                                                          color: Colors.red,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 4,
                                              ),
                                              //variation
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  menuItem.menuData[index]
                                                              .variationName !=
                                                          ''
                                                      ? Container(
                                                          height: 14,
                                                          width: 62,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: const Color(
                                                                0xffF0F0F0),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                              10,
                                                            ),
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              menuItem
                                                                  .menuData[
                                                                      index]
                                                                  .variationName
                                                                  .toString(),
                                                              style:
                                                                  const TextStyle(
                                                                fontSize: 8,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300,
                                                                color: Color(
                                                                    0xff160040),
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      : Container(),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 3,
                                              ),
                                              //options
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Center(
                                                    child:
                                                        menuItem
                                                                .menuData[index]
                                                                .options!
                                                                .isEmpty
                                                            ? Container()
                                                            : SizedBox(
                                                                height: 14,
                                                                width: ScreenSize(
                                                                            context)
                                                                        .mainWidth /
                                                                    1.8,
                                                                child: ListView
                                                                    .separated(
                                                                  itemCount: menuItem
                                                                      .menuData[
                                                                          index]
                                                                      .options!
                                                                      .length,
                                                                  itemBuilder: (context,
                                                                          itemIndex) =>
                                                                      Container(
                                                                    height: 14,
                                                                    width: 60,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: const Color(
                                                                          0xffF0F0F0),
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .circular(
                                                                        10,
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            const EdgeInsets.symmetric(horizontal: 4),
                                                                        child:
                                                                            Text(
                                                                          menuItem
                                                                              .menuData[index]
                                                                              .options![itemIndex]['name']
                                                                              .toString(),
                                                                          style:
                                                                              const TextStyle(
                                                                            fontSize:
                                                                                8,
                                                                            fontWeight:
                                                                                FontWeight.w300,
                                                                            color:
                                                                                Color(0xff160040),
                                                                          ),
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                          maxLines:
                                                                              1,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  scrollDirection:
                                                                      Axis.horizontal,
                                                                  physics:
                                                                      const ScrollPhysics(),
                                                                  shrinkWrap:
                                                                      true,
                                                                  separatorBuilder:
                                                                      (BuildContext
                                                                              context,
                                                                          int index) {
                                                                    return const SizedBox(
                                                                      width: 3,
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                  ),
                                                  menuItem.menuData[index]
                                                          .options!.isEmpty
                                                      ? Container()
                                                      : const Center(
                                                          child: Text(
                                                            '>',
                                                            style: TextStyle(
                                                              color: AppColor
                                                                  .primaryColor,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 12,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  SizedBox(
                                                    height: 25,
                                                    width: ScreenSize(context)
                                                            .mainWidth /
                                                        4.8,
                                                    child: Text(
                                                      '${menuItem.menuData[index].currencyCode}' +
                                                          menuItem
                                                              .menuData[index]
                                                              .unitPrice
                                                              .toString(),
                                                      style: const TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color:
                                                            Color(0xff160040),
                                                      ),
                                                    ),
                                                  ),
                                                  // Add/Remove Button start
                                                  Container(
                                                    height: 26,
                                                    width: ScreenSize(context)
                                                            .mainWidth /
                                                        4,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      border: Border.all(
                                                        width: 1,
                                                        color: const Color(
                                                          0XFF9acd32,
                                                        ),
                                                      ),
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        SizedBox(
                                                          height: 23,
                                                          width: 28,
                                                          child: Center(
                                                            child:
                                                                FloatingActionButton(
                                                              shape:
                                                                  const RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .all(
                                                                  Radius
                                                                      .circular(
                                                                          5.0),
                                                                ),
                                                              ),
                                                              heroTag: index
                                                                  .toString(),
                                                              backgroundColor:
                                                                  Colors.white,
                                                              elevation: .5,
                                                              onPressed: () {
                                                                searchMenuController
                                                                    .menuItemQtyRemove(
                                                                        index);
                                                              },
                                                              child: const Text(
                                                                '-',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 20,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  color: Color(
                                                                      0xffEE1D48),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 30,
                                                          width: 20,
                                                          child: Center(
                                                            child: Text(
                                                              menuItem
                                                                  .menuData[
                                                                      index]
                                                                  .qty
                                                                  .toString(),
                                                              style:
                                                                  const TextStyle(
                                                                fontSize: 17,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: Color(
                                                                    0xff160040),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 23,
                                                          width: 28,
                                                          child: Center(
                                                            child:
                                                                FloatingActionButton(
                                                              shape:
                                                                  const RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .all(
                                                                  Radius
                                                                      .circular(
                                                                          5.0),
                                                                ),
                                                              ),
                                                              heroTag: index
                                                                  .toString(),
                                                              backgroundColor:
                                                                  Colors.white,
                                                              elevation: .5,
                                                              onPressed: () {
                                                                searchMenuController
                                                                    .menuItemQtyAdd(
                                                                        index);
                                                              },
                                                              child: const Text(
                                                                '+',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 20,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  color: Color(
                                                                      0xffEE1D48),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  // Add/Remove Button end
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return Container(
                                height: 5,
                              );
                            },
                          ),
                  );
                }),
            //Keypad Section
            Flexible(
              child: SizedBox(
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      //1st row
                      Form(
                        key: _formKey,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: ScreenSize(context).mainHeight / 15,
                              width: ScreenSize(context).mainWidth / 1.5,
                              child: TextFormField(
                                controller: numberController
                                  ..text = _digitValue!
                                  ..selection = TextSelection.collapsed(
                                      offset: numberController.text.length),
                                validator: (value) {
                                  return numberController.text = value!;
                                },
                                enabled: false,
                                cursorColor: AppColor.primaryColor,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.only(
                                    top: 0,
                                    left: 15,
                                  ),
                                  hintText: "Enter Menu Number",
                                  hintStyle: const TextStyle(
                                    color: Color(0xff706881),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  fillColor: const Color(0xffF2CDD4),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    borderSide: const BorderSide(
                                      width: 1,
                                      color: AppColor.primaryColor,
                                    ),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    borderSide: const BorderSide(
                                      width: 1,
                                      color: AppColor.primaryColor,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    borderSide: const BorderSide(
                                      width: 1,
                                      color: AppColor.primaryColor,
                                    ),
                                  ),
                                  disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    borderSide: const BorderSide(
                                      width: 1,
                                      color: Color(0XFF9acd32),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            //clear button
                            SizedBox(
                              height: ScreenSize(context).mainHeight / 15,
                              width: ScreenSize(context).mainWidth / 4.8,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  primary: Colors.white, // background
                                  onPrimary: AppColor.primaryColor,
                                  // foreground
                                  side: const BorderSide(
                                    width: 1,
                                    color: Color(0XFF9acd32),
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(5), // <-- Radius
                                  ),
                                ),
                                onPressed: () {
                                  if (_digitValue != null &&
                                      _digitValue.toString().isNotEmpty) {
                                    _digitValue = _digitValue
                                        .toString()
                                        .substring(0,
                                            _digitValue.toString().length - 1);
                                  }
                                  (context as Element).markNeedsBuild();
                                },
                                child: const Center(
                                  child: Icon(
                                    Icons.backspace_outlined,
                                    size: 24,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      //2nd row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: ScreenSize(context).mainHeight / 15,
                            width: ScreenSize(context).mainWidth / 4.8,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                primary: Colors.white, // background
                                onPrimary: AppColor.primaryColor,
                                // foreground
                                side: const BorderSide(
                                  width: 1,
                                  color: Colors.white,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(5), // <-- Radius
                                ),
                              ),
                              onPressed: () {
                                return _onClick(context, '1');
                              },
                              child: const Text(
                                "1",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 32,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: ScreenSize(context).mainHeight / 15,
                            width: ScreenSize(context).mainWidth / 4.8,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                primary: Colors.white, // background
                                onPrimary: AppColor.primaryColor,
                                // foreground
                                side: const BorderSide(
                                  width: 1,
                                  color: Colors.white,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(5), // <-- Radius
                                ),
                              ),
                              onPressed: () {
                                return _onClick(context, '2');
                              },
                              child: const Text(
                                "2",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 32,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: ScreenSize(context).mainHeight / 15,
                            width: ScreenSize(context).mainWidth / 4.8,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                primary: Colors.white, // background
                                onPrimary: AppColor.primaryColor,
                                // foreground
                                side: const BorderSide(
                                  width: 1,
                                  color: Colors.white,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(5), // <-- Radius
                                ),
                              ),
                              onPressed: () {
                                return _onClick(context, '3');
                              },
                              child: const Text(
                                "3",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 32,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: ScreenSize(context).mainHeight / 15,
                            width: ScreenSize(context).mainWidth / 4.8,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                primary: Colors.white, // background
                                onPrimary: AppColor.primaryColor,
                                // foreground
                                side: const BorderSide(
                                  width: 1,
                                  color: AppColor.primaryColor,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(5), // <-- Radius
                                ),
                              ),
                              onPressed: () {
                                Get.to(() => SearchPage());
                              },
                              child: const Text(
                                "Search",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: AppColor.primaryColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      //3rd row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: ScreenSize(context).mainHeight / 15,
                            width: ScreenSize(context).mainWidth / 4.8,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                primary: Colors.white, // background
                                onPrimary: AppColor.primaryColor,
                                // foreground
                                side: const BorderSide(
                                  width: 1,
                                  color: Colors.white,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(5), // <-- Radius
                                ),
                              ),
                              onPressed: () {
                                return _onClick(context, '4');
                              },
                              child: const Text(
                                "4",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 32,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: ScreenSize(context).mainHeight / 15,
                            width: ScreenSize(context).mainWidth / 4.8,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                primary: Colors.white, // background
                                onPrimary: AppColor.primaryColor,
                                // foreground
                                side: const BorderSide(
                                  width: 1,
                                  color: Colors.white,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(5), // <-- Radius
                                ),
                              ),
                              onPressed: () {
                                return _onClick(context, '5');
                              },
                              child: const Text(
                                "5",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 32,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: ScreenSize(context).mainHeight / 15,
                            width: ScreenSize(context).mainWidth / 4.8,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                primary: Colors.white, // background
                                onPrimary: AppColor.primaryColor,
                                // foreground
                                side: const BorderSide(
                                  width: 1,
                                  color: Colors.white,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(5), // <-- Radius
                                ),
                              ),
                              onPressed: () {
                                return _onClick(context, '6');
                              },
                              child: const Text(
                                "6",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 32,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: ScreenSize(context).mainHeight / 15,
                            width: ScreenSize(context).mainWidth / 4.8,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                primary: Colors.white, // background
                                onPrimary: AppColor.primaryColor,
                                // foreground
                                side: const BorderSide(
                                  width: 1,
                                  color: AppColor.primaryColor,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(5), // <-- Radius
                                ),
                              ),
                              onPressed: () {
                                searchMenuController.menuItemsClear();
                              },
                              child: const Text(
                                "Clear",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: AppColor.primaryColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      //4th row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: ScreenSize(context).mainHeight / 15,
                            width: ScreenSize(context).mainWidth / 4.8,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                primary: Colors.white, // background
                                onPrimary: AppColor.primaryColor,
                                // foreground
                                side: const BorderSide(
                                  width: 1,
                                  color: Colors.white,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(5), // <-- Radius
                                ),
                              ),
                              onPressed: () {
                                return _onClick(context, '7');
                              },
                              child: const Text(
                                "7",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 32,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: ScreenSize(context).mainHeight / 15,
                            width: ScreenSize(context).mainWidth / 4.8,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                primary: Colors.white, // background
                                onPrimary: AppColor.primaryColor,
                                // foreground
                                side: const BorderSide(
                                  width: 1,
                                  color: Colors.white,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(5), // <-- Radius
                                ),
                              ),
                              onPressed: () {
                                return _onClick(context, '8');
                              },
                              child: const Text(
                                "8",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 32,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: ScreenSize(context).mainHeight / 15,
                            width: ScreenSize(context).mainWidth / 4.8,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                primary: Colors.white, // background
                                onPrimary: AppColor.primaryColor,
                                // foreground
                                side: const BorderSide(
                                  width: 1,
                                  color: Colors.white,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(5), // <-- Radius
                                ),
                              ),
                              onPressed: () {
                                return _onClick(context, '9');
                              },
                              child: const Text(
                                "9",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 32,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: ScreenSize(context).mainHeight / 15,
                            width: ScreenSize(context).mainWidth / 4.8,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                primary: Colors.white, // background
                                onPrimary: AppColor.primaryColor,
                                // foreground
                                side: const BorderSide(
                                  width: 1,
                                  color: AppColor.primaryColor,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(5), // <-- Radius
                                ),
                              ),
                              onPressed: () {
                                if (selectedTableID != 0) {
                                  if (numberController.text.isNotEmpty) {
                                    searchMenuController.menuItemNumberAdd(
                                        context,
                                        numberController.text.trim(),
                                        selectedTableID);
                                    numberController.clear();
                                  } else {
                                    Fluttertoast.showToast(
                                      msg: "Please enter menu number",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.TOP_RIGHT,
                                    );
                                  }
                                } else {
                                  Fluttertoast.showToast(
                                    msg: "Please select a Table first",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.TOP_RIGHT,
                                  );
                                }
                              },
                              child: const Text(
                                "Add",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: AppColor.primaryColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      //5th row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 82),
                            child: SizedBox(
                              height: ScreenSize(context).mainHeight / 15,
                              width: ScreenSize(context).mainWidth / 4.8,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  primary: Colors.white, // background
                                  onPrimary: AppColor.primaryColor,
                                  // foreground
                                  side: const BorderSide(
                                    width: 1,
                                    color: Colors.white,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(5), // <-- Radius
                                  ),
                                ),
                                onPressed: () {
                                  return _onClick(context, '0');
                                },
                                child: const Text(
                                  "0",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 32,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: ScreenSize(context).mainHeight / 15,
                            width: ScreenSize(context).mainWidth / 4.8,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                primary: AppColor.primaryColor, // background
                                onPrimary: Colors.white,
                                // foreground
                                side: const BorderSide(
                                  width: 1,
                                  color: AppColor.primaryColor,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(5), // <-- Radius
                                ),
                              ),
                              onPressed: () {
                                if (searchMenuController.menuData.isNotEmpty) {
                                  Get.off(OrderPreviewPage());
                                } else {
                                  Get.snackbar("Menu items",
                                      'Please add menu items first',
                                      snackPosition: SnackPosition.TOP,
                                      backgroundColor: AppColor.primaryColor,
                                      colorText: Colors.white);
                                }
                              },
                              child: const Text(
                                "Done",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
