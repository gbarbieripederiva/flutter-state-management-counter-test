import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterController extends GetxController {
  var counter = 0.obs;

  decrement() => counter--;
  increment() => counter++;
}

class CounterWithGetX extends StatelessWidget {
  const CounterWithGetX({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CounterController());
    return Row(
      children: [
        DecrementButton(),
        DisplayCounter(),
        IncrementButton(),
      ],
    );
  }
}

class DecrementButton extends StatelessWidget {
  final CounterController controller = Get.find();
  DecrementButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(onPressed: controller.decrement, child: const Text("-"));
}

class IncrementButton extends StatelessWidget {
  final CounterController controller = Get.find();
  IncrementButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(onPressed: controller.increment, child: const Text("+"));
}

class DisplayCounter extends StatelessWidget {
  final CounterController controller = Get.find();
  DisplayCounter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Obx(() => Text(controller.counter.toString()));
}
