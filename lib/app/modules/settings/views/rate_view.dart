import 'package:flutter/material.dart';

import 'package:get/get.dart';

class RateView extends GetView {
  const RateView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RateView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'RateView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
