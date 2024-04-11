import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:help_app/view/book%20appointment/report_issue.dart';
import '../../constants/color_constants.dart';
import '../home/home_main.dart';
import '../home/home_page.dart';

class SuccesPage extends StatefulWidget {
  String? transactionId;
  SuccesPage({super.key, this.transactionId});

  @override
  State<SuccesPage> createState() => _SuccesPageState();
}

class _SuccesPageState extends State<SuccesPage> {
  TextEditingController textcontroller = TextEditingController();

  //verify transaction id
  String id = '';
  bool isCorrect = false;

  void verifyTID(id) {
    try {
      setState(() {
        id = textcontroller.value.text;
        if (id == '') {
          print("empty... id not found");
        } else if (id == widget.transactionId) {
          print("Transaction ID correct");
          isCorrect = true;
        } else {
          print("Error ID do not match any records..");
        }
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    verifyTID(id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: primaryColor,
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: const Icon(
                  Icons.arrow_back,
                  color: primaryColor,
                ),
              ),
            ),
          ],
        ),
        centerTitle: true,
        title: const Text(
          "Checkout Complete",
          style: TextStyle(
            color: primaryColor,
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 210,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  overflow: TextOverflow.visible,
                  "Transaction ID: ",
                  style: TextStyle(
                    fontSize: 13,
                    color: primaryColor,
                  ),
                ),
                Text(
                  overflow: TextOverflow.visible,
                  "${widget.transactionId}",
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Center(
                child: Icon(
                  Icons.check_circle,
                  size: 80,
                  color: Colors.green,
                ),
              ),
            ),
            const Text(
              "Payment succesfully made",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Text(
              textAlign: TextAlign.center,
              softWrap: true,
              overflow: TextOverflow.visible,
              "The professional will contact you with your appointment date and time",
              style: TextStyle(
                color: Colors.black54,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: MaterialButton(
                height: 50,
                minWidth: double.infinity,
                onPressed: () {
                  Get.to(
                    () => const HomePage(
                      address: '',
                    ),
                  );
                },
                color: Colors.green,
                child: const Text(
                  "Home",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Get.to(() => const ReportIssuePage());
              },
              child: const Text(
                "Report an issue",
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 15,
                ),
              ),
            ),
            /*const SizedBox(height: 20),
            const Text("Verify Transaction ID"),
            isCorrect
                ? const Text(
                    "CORRECT",
                    style: TextStyle(color: Colors.green),
                  )
                : const Text(
                    "WRONG",
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextFormField(
                onChanged: (v) {
                  setState(() {
                    verifyTID(id);
                  });
                },
                controller: textcontroller,
                decoration: const InputDecoration(),
              ),
            ),
          */
          ],
        ),
      ),
    );
  }
}
