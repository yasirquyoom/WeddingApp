import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ReportView extends GetView {
  const ReportView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ReportView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ReportView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
