class CarModel {
  String? nameCar;
  List<String>? feature;
  String? price;
  String? modelCar;
  String? pic;

  CarModel({
    this.pic,
    this.nameCar,
    this.feature,
    this.price,
    this.modelCar,
  });
}

CarModel car1 = CarModel(
    pic:
        'https://th.bing.com/th/id/R.3d42467dd58be884f11e9a138473c05a?rik=rLiDr1QcCDBoeQ&pid=ImgRaw&r=0',
    nameCar: 'm3',
    feature: ['sport', 'super charge'],
    price: '13,000',
    modelCar: 'bmw');

CarModel car2 = CarModel(
    pic:
        'https://th.bing.com/th/id/OIP.VHVzm7c3PVzrBijSZmAqAgHaFj?rs=1&pid=ImgDetMain',
    nameCar: 'panorama',
    feature: ['AMG', 'super charge'],
    price: '35,000',
    modelCar: 'mercedes-benz');

CarModel car3 = CarModel(
    pic:
        'https://th.bing.com/th/id/OIP.T0DWW5IGFM61g0fk6CkzcQAAAA?rs=1&pid=ImgDetMain',
    nameCar: 'F-150',
    feature: ['4*4', 'turbo'],
    price: '40,000',
    modelCar: 'ford');
