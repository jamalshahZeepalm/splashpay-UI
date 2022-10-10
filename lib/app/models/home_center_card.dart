import 'package:splashpay/app/data/images_path.dart';

class HomeCenterCard {
  String image;
  String name;
  String date;
  String status;
  double money;
  HomeCenterCard({
    required this.image,
    required this.name,
    required this.date,
    required this.status,
    required this.money,
  });
}

List<HomeCenterCard> listOfCenterCard = [
  HomeCenterCard(
      image: CustomAssets.kArsalSamir,
      name: 'Arsal samir',
      date: '25 June, 2022',
      status: 'Income',
      money: 13.23),
  HomeCenterCard(
      image: CustomAssets.kJoshi,
      name: 'Joshi',
      date: '25 June, 2022',
      status: 'Expense',
      money: 20.73),
  HomeCenterCard(
      image: CustomAssets.kArsalSamir,
      name: 'Arsal samir',
      date: '25 June, 2022',
      status: 'Income',
      money: 13.23),
  HomeCenterCard(
      image: CustomAssets.kArsalSamir,
      name: 'Arsal samir',
      date: '25 June, 2022',
      status: 'Income',
      money: 13.23),
  HomeCenterCard(
      image: CustomAssets.kJoshi,
      name: 'Joshi',
      date: '25 June, 2022',
      status: 'Expense',
      money: 20.73),
  HomeCenterCard(
      image: CustomAssets.kArsalSamir,
      name: 'Arsal samir',
      date: '25 June, 2022',
      status: 'Income',
      money: 13.23),
  HomeCenterCard(
      image: CustomAssets.kArsalSamir,
      name: 'Arsal samir',
      date: '25 June, 2022',
      status: 'Income',
      money: 13.23),
  HomeCenterCard(
      image: CustomAssets.kJoshi,
      name: 'Joshi',
      date: '25 June, 2022',
      status: 'Expense',
      money: 20.73),
  HomeCenterCard(
      image: CustomAssets.kArsalSamir,
      name: 'Arsal samir',
      date: '25 June, 2022',
      status: 'Income',
      money: 13.23)
];
