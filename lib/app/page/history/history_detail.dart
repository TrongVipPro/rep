import 'package:app_api/app/model/bill.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HistoryDetail extends StatelessWidget {
  final List<BillDetailModel> bill;

  const HistoryDetail({super.key, required this.bill});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: bill.length,
        itemBuilder: (context, index) {
          var data = bill[index];
          return Container(
            padding: EdgeInsets.only(top: 8),
            margin: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            decoration: BoxDecoration(
                // color: Colors.amber,
                border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                Image.network(
                  // data.imageUrl,
                  "https://cdn-icons-png.flaticon.com/512/1440/1440523.png",
                  width: 200,
                  height: 200,
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  color: Color.fromARGB(255, 245, 244, 242),
                  child: Column(
                    children: [
                      Text(
                        "Tên sản phẩm",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w800),
                      ),
                      Text(
                        data.productName,
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        NumberFormat('Giá : #,##0 vnd').format(data.price),
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.normal,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                )
                // Text(data.total.toString()),
              ],
            ),
          );
        },
      ),
    );
  }
}
