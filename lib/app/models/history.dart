import '../data/images_path.dart';

enum HistoryType { request, send }

class History {
  String image;
  String name;
  String date;
  String status;
  double money;
  HistoryType historyType;
  History(
      {required this.image,
      required this.name,
      required this.date,
      required this.status,
      required this.money,
      required this.historyType});
}

List<History> listOfHistory = [
  History(
      image: CustomAssets.kSmari,
      name: 'Smari',
      date: '25 June, 2022',
      status: 'Income',
      money: 7.09,
      historyType: HistoryType.send),
  History(
      image: CustomAssets.kArsalSamir,
      name: 'Arsal samir',
      date: '25 June, 2022',
      status: 'Income',
      money: 13.23,
      historyType: HistoryType.send),
  History(
      image: CustomAssets.kKelly,
      name: 'Kelly',
      date: '25 June, 2022',
      status: 'Income',
      money: 544.7,
      historyType: HistoryType.send),
  History(
      image: CustomAssets.kSaira,
      name: 'Saira',
      date: '25 June, 2022',
      status: 'Income',
      money: 68.09,
      historyType: HistoryType.send),
  History(
      image: CustomAssets.kSam,
      name: 'Sam',
      date: '25 June, 2022',
      status: 'Income',
      money: 100,
      historyType: HistoryType.send),
  History(
      image: CustomAssets.kKiara,
      name: 'Kiara',
      date: '25 June, 2022',
      status: 'Expenses',
      money: 23.23,
      historyType: HistoryType.request),
  History(
      image: CustomAssets.kSameerElen,
      name: 'Sameer Elen',
      date: '25 June, 2022',
      status: 'Expenses',
      money: 23.23,
      historyType: HistoryType.request),
  History(
      image: CustomAssets.kJoshi,
      name: 'Joshi',
      date: '25 June, 2022',
      status: 'Expenses',
      money: 20.73,
      historyType: HistoryType.request),
  History(
      image: CustomAssets.kKiara2,
      name: 'Kiara',
      date: '25 June, 2022',
      status: 'Expenses',
      money: 33.13,
      historyType: HistoryType.request),
  History(
      image: CustomAssets.kSameerElen,
      name: 'Sameer Elen',
      date: '25 June, 2022',
      status: 'Expenses',
      money: 23.23,
      historyType: HistoryType.request),
  History(
      image: CustomAssets.kSiza,
      name: 'Siza',
      date: '25 June, 2022',
      status: 'Expenses',
      money: 23.23,
      historyType: HistoryType.request),
];
