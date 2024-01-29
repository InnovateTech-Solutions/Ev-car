import 'package:evcar/src/future/car_show/model/car_model.dart';
import 'package:get/get.dart';

class CarController extends GetxController {
  RxList<bool> buttonPressedList = [true, false, false, false].obs;
  RxList<bool> buttonCarsList = [true, false, false, false, false].obs;

  RxList<CarModel> cars = <CarModel>[].obs; // Update to use RxList
  RxList<CarModel> filteredCars =
      <CarModel>[].obs; // Filtered cars based on title

  List<String> titles = ['all', 'bmw', 'ford', 'mercedes-benz'];

  // Initialize your cars list here
  @override
  void onInit() {
    super.onInit();
    cars.addAll([car1, car2, car3]);
    filterCars(0); // Default: show all cars
  }

  void changeButtonColor(int index) {
    for (int i = 0; i < buttonPressedList.length; i++) {
      buttonPressedList[i] = (i == index);
    }
  }

  void changeColor(int index) {
    for (int i = 0; i < buttonCarsList.length; i++) {
      buttonCarsList[i] = (i == index);
    }
  }

  // Method to filter cars based on selected title
  void filterCars(int titleIndex) {
    if (titles[titleIndex] == 'all') {
      filteredCars.assignAll(cars);
    } else {
      filteredCars
          .assignAll(cars.where((car) => car.modelCar == titles[titleIndex]));
    }
  }

  // Method to change the selected title
  void changeTitle(int titleIndex) {
    changeButtonColor(titleIndex);
    filterCars(titleIndex);
  }
}
