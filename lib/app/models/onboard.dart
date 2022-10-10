import 'package:splashpay/app/data/images_path.dart';

class OnBoarding {
  String title;
  String image;
  String subTitle;
  OnBoarding({
    required this.title,
    required this.image,
    required this.subTitle,
  });
}

List<OnBoarding> list = [
  OnBoarding(
    title: 'Easiest way to transfer funds',
    image: CustomAssets.kiPhone1,
    subTitle:
        'Online is like never before transfer and recieve funds with a hustle free process. Create a business account with us to recieve payments from your buyers. ',
  ),
  OnBoarding(
    title: 'Manage your multiple cards at one place',
    image: CustomAssets.kIPhone2,
    subTitle:
        'Add your all cards and manage and operate all the cards at one place.',
  ),
  OnBoarding(
    title: 'Most powerfull analytics for tracking',
    image: CustomAssets.kIPhone3,
    subTitle:
        'Track your expenses and income in a very powerful way which help you to enhance your savings.',
  )
];
