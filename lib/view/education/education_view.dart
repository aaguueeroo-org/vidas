import 'package:flutter/material.dart';
import 'package:vidas/view/education/widgets/enroll_dialog.dart';
import 'package:vidas/view/education/widgets/education_info.dart';
import 'package:vidas/view/education/widgets/education_list.dart';


class EducationView extends StatelessWidget {
  const EducationView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: const [
          // IconButton(
          //   // height: 10,
          //   onPressed: () => controller.showOptionsDialog(context),
          //   icon: Icon(
          //     Icons.settings_outlined,
          //     size: width / 12,
          //   ),
          //   color: Theme.of(context).colorScheme.onSecondary,
          // ),
        ],
      ),
      body: Container(
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 10),
            EducationInfo(),
            SizedBox(height: 20),
            EnrollButton(),
            // const SizedBox(
            //   height: 150,
            //   child: LogContainer(),
            // ),
            SizedBox(height: 20),
            Expanded(child: EducationList()),
            SizedBox(height: 30),
            // ElevatedButton(
            //   onPressed: () => controller.showActionsDialog(context),
            //   child: const Text('Actions'),
            // ),
            // const LogsAndButtons(),
          ],
        ),
      ),
    );
  }
}
