import 'package:splashpay/app/data/images_path.dart';

class Notifications {
  String svgIcon;
  String title;
  String boldText;
  String date;
  Notifications({
    required this.svgIcon,
    required this.title,
    required this.boldText,
    required this.date,
  });
}

List<Notifications> listOfNotification = [
  Notifications(
    svgIcon: CustomAssets.kTicketDiscount,
    title: '15% discount offer on each on your card at',
    date: 'Today',
    boldText: ' Biogen pharma.',
  ),
  Notifications(
    svgIcon: CustomAssets.kNotifcations,
    title: 'Some important instructions from slashpay to make your account .',
    date: 'Today',
    boldText: ' more secure',
  ),
  Notifications(
    svgIcon: CustomAssets.kLampCharge,
    title: 'We are testing buy now and pay later feature on our app become ',
    date: 'Today',
    boldText: ' a beta tester.',
  ),
  Notifications(
    svgIcon: CustomAssets.kMoneySend,
    title: 'Payment of 10 recieved from shopee as',
    date: 'Today',
    boldText: ' a cashback.',
  ),
];
