import '../data/images_path.dart';

class MoneyRequest {
  String image;
  String name;
  String date;
  double money;
  int id;
  MoneyRequest({
    required this.id,
    required this.image,
    required this.name,
    required this.date,
    required this.money,
  });
}

List<MoneyRequest> listOfMoneyRequest = [
  MoneyRequest(
      image: CustomAssets.kJoshi,
      name: 'Marij yahya',
      date: '25 June, 2022',
      money: 413,
      id: 0),
  MoneyRequest(
      image: CustomAssets.kSam,
      name: 'Sarim',
      date: '25 June, 2022',
      money: 41,
      id: 1),
  MoneyRequest(
      image: CustomAssets.kSara,
      name: 'Sara',
      date: '25 June, 2022',
      money: 13,
      id: 2),
  MoneyRequest(
      image: CustomAssets.kMarij,
      name: 'Marij',
      date: '25 June, 2022',
      money: 43,
      id: 3),
  MoneyRequest(
      image: CustomAssets.kHaris,
      name: 'Haris',
      date: '25 June, 2022',
      money: 100,
      id: 4),
  MoneyRequest(
      image: CustomAssets.kQura,
      name: 'Qura',
      date: '25 June, 2022',
      money: 340,
      id: 5),
];
