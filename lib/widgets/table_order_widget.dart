import 'dart:developer';

import 'package:dashboard/shared/constants/colors_app.dart';
import 'package:dashboard/shared/models/order_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:material_table_view/material_table_view.dart';

final List<String> _columnNames = [
  'رقم الطلب',
  'السعر الاجمالي',
  'المسافة',
  'وقت التحضير',
  'رقم المتجر',
  'رقم العميل',
  'جوال العميل',
  'الحالة',
  'تاريخ انشاء الطلب',
];

class TableOrdersWidget extends StatelessWidget {
  const TableOrdersWidget({
    super.key,
    required this.orders,
    this.idSelect,
    this.onChanged,
  });
  final List<OrdersModel> orders;
  final String? idSelect;
  final Function(OrdersModel?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TableView.builder(
        columns: List.generate(_columnNames.length, (index) {
          final List<double> widths = [
            220,
            130,
            125,
            90,
            70,
            150,
            125,
            125,
            125,
            // 130,
            // 100,
            // 150,
          ];
          return TableColumn(width: widths[index]);
        }),
        addAutomaticKeepAlives: true,
        bodyContainerBuilder: (context, bodyContainer) => bodyContainer,
        placeholderBuilder: (context, contentBuilder) =>
            contentBuilder(context, (context, index) => const Text("No data")),
        rowPrototype: const Text("----"),
        headerHeight: 50,
        rowHeight: 50,
        rowHeightBuilder: (index, _) => 80,
        rowCount: orders.length,
        shrinkWrapVertical: false,
        shrinkWrapHorizontal: false,
        style: TableViewStyle(
          dividers: TableViewDividersStyle(
            horizontal: TableViewHorizontalDividersStyle(
              header: TableViewHorizontalDividerStyle(color: Colors.grey),
            ),
          ),
          scrollPadding: EdgeInsets.all(16),
          minScrollableWidthRatio: 1,

          scrollbars: TableViewScrollbarsStyle(
            vertical: TableViewScrollbarStyle(
              enabled: TableViewScrollbarEnabled.always,
              thumbColor: WidgetStateProperty.all(ColorsApp.systemGreen),
              trackColor: WidgetStateProperty.all(ColorsApp.systemGreen),
              trackBorderColor: WidgetStateProperty.all(ColorsApp.systemGreen),
            ),
            horizontal: TableViewScrollbarStyle(
              enabled: TableViewScrollbarEnabled.always,
              thumbColor: WidgetStateProperty.all(ColorsApp.systemGreen),
              trackColor: WidgetStateProperty.all(ColorsApp.systemGreen),
              trackBorderColor: WidgetStateProperty.all(ColorsApp.systemGreen),
            ),
          ),
        ),

        headerBuilder: (context, contentBuilder) {
          return contentBuilder(context, (context, columnIndex) {
            final isFirst = columnIndex == 0;
            final isLast = columnIndex == _columnNames.length - 1;

            final border = Border(
              top: BorderSide(color: ColorsApp.systemGreen),
              left: BorderSide(color: ColorsApp.systemGreen),
              right: isFirst || isLast
                  ? BorderSide(color: ColorsApp.systemGreen)
                  : BorderSide.none,
            );

            return Container(
              alignment: Alignment.center,
              // decoration: BoxDecoration(
              //   color: ColorsApp.systemGreen,
              //   border: border,
              // ),
              child: Text(
                _columnNames[columnIndex],
                style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
            );
          });
        },
        rowBuilder: (context, rowIndex, contentBuilder) {
          final order = orders[rowIndex];

          return InkWell(
            onTap: () {
              if (onChanged != null) {
                onChanged!(order);
              }
            },
            child: contentBuilder(context, (context, columnIndex) {
              return buildCellOrder(
                index: columnIndex,
                order: order,
                orderSelectID: idSelect,
              );
            }),
          );
        },
      ),
    );
  }

  Widget buildCellOrder({
    required int index,
    required OrdersModel order,
    String? orderSelectID,
  }) {
    final border = Border.all(color: ColorsApp.systemGreen);
    const cellPadding = EdgeInsets.symmetric(horizontal: 16);
    const cellStyle = TextStyle(fontSize: 12, fontWeight: FontWeight.w900);

    switch (index) {
      case 0:
        return Container(
          alignment: Alignment.center,
          // decoration: BoxDecoration(border: border),
          child: Text(
            order.id,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w900,
              color: ColorsApp.systemFontGrey,
            ),
          ),
        );
      case 1:
        return Container(
          alignment: Alignment.center,
          // decoration: BoxDecoration(border: border),
          child: Padding(
            padding: cellPadding,
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Text(order.total.toString(), style: cellStyle),
                ),
                Expanded(
                  child: Text(
                    "ريال",
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w900,
                      color: ColorsApp.systemGreen,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      case 2:
        return Container(
          alignment: Alignment.center,
          // decoration: BoxDecoration(border: border),
          child: Text('${order.distance} M', style: cellStyle),
        );
      case 3:
        return Container(
          alignment: Alignment.center,
          // decoration: BoxDecoration(border: border),
          child: Text(order.preparationTime.toString(), style: cellStyle),
        );
      case 4:
        return Container(
          alignment: Alignment.center,
          // decoration: BoxDecoration(border: border),
          child: Text(order.store.id.toString(), style: cellStyle),
        );
      case 5:
        return Container(
          alignment: Alignment.center,
          // decoration: BoxDecoration(border: border),
          child: Padding(
            padding: cellPadding,
            child: Text(order.user.id.toString(), style: cellStyle),
          ),
        );
      case 6:
        return Container(
          alignment: Alignment.center,
          // decoration: BoxDecoration(border: border),
          child: Text(order.user.mobile, style: cellStyle),
        );
      case 7:
        return Container(
          alignment: Alignment.center,
          // decoration: BoxDecoration(border: border),
          child: StatusCard(status: order.status),
        );

      case 8:
        return Container(
          alignment: Alignment.center,
          // decoration: BoxDecoration(border: border),
          child: Text(
            convertDataToText(dateString: order.createdAt),
            style: cellStyle,
          ),
        );
      default:
        return Container(
          alignment: Alignment.center,
          // decoration: BoxDecoration(border: border),
          child: Text(order.id, style: cellStyle),
        );
    }
  }
}

///
///
///
///
///
///

convertDataToText({required String dateString}) {
  // Parse the ISO 8601 string into a DateTime object
  DateTime parsedDate = DateTime.parse(dateString);

  // Format the date
  String formattedDate = DateFormat('MMMM d, y').format(parsedDate);

  return formattedDate;
}

class StatusCard extends StatelessWidget {
  const StatusCard({super.key, required this.status});
  final String status;

  @override
  Widget build(BuildContext context) {
    Color statusColor = Colors.red;
    String titleStatus = "nono";
    List<Color> statusColors = [
      Color(0xFFD7F0EA), // تم التوصيل
      Color(0xFFE7DDFD), // تحت الإجراء
      Color(0xFFFFD6D6), // ملغي
      Color(0xFFFFE8C9), // في الانتظار
      Color(0xFFF1D9FD), // في الطريق
      Color(0xFFEBDDE1), // بانتظار الدفع
      Color(0xFFFFE0B0), // بانتظار السائق
      Color(0xFFDDEBFD), // تم الاستلام
      Color(0xFFD7F0EA), // تم الدفع
      Color(0xFFDDEBFD), // تم الشحن
      Color(0xFFF1D9FD), // في الطريق (مكرر)
      Color(0xFFEBDDE1), // بانتظار الدفع (مكرر)
      Color(0xFFFFE0B0), // بانتظار السائق (مكرر)
      Color(0xFFDDEBFD), // تم الاستلام (مكرر)
      Color(0xFFD7F0EA), // تم الدفع (مكرر)
    ];
    switch (status) {
      case "pending":
        statusColor = statusColors[0];

        titleStatus = "انظتار القبول";
        break;
      case "accepted":
        statusColor = statusColors[1];

        titleStatus = "تم القبول";
        break;
      case "waiting_paid":
        statusColor = statusColors[2];

        titleStatus = "في انتظار الدفع";
        break;
      case "paid":
        statusColor = statusColors[3];

        titleStatus = "تم الدفع";
        break;
      case "processing":
        statusColor = statusColors[4];

        titleStatus = "تجت المعالجة";
        break;
      case "pending_driver":
        statusColor = statusColors[5];

        titleStatus = "في انتظار السائق";
        break;
      case "receiving":
        statusColor = statusColors[6];

        titleStatus = "تم استلامه من السائق";
        break;
      case "shipped":
        statusColor = statusColors[7];

        titleStatus = "يتم توصيله";
        break;
      case "delivered":
        statusColor = statusColors[8];

        titleStatus = "تم توصيله";
        break;
      case "cancelled":
        statusColor = statusColors[9];

        titleStatus = "تم الغائه";
        break;

      default:
        statusColor = statusColors[10];
        titleStatus = "لم يتم تحديد";
        break;
    }
    return Container(
      height: 50,
      width: 120,

      decoration: BoxDecoration(
        color: statusColor,
        borderRadius: BorderRadius.circular(4),
      ),
      margin: EdgeInsets.all(8),
      alignment: Alignment.center,
      child: Text(
        titleStatus,
        style: TextStyle(fontSize: 10, fontWeight: FontWeight.w900),
      ),
    );
  }
}
