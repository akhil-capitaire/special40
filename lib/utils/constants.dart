import '../models/onboard_model.dart';

const String appName = 'Special 40';
const Duration splashDuration = Duration(seconds: 1);
double baseFontSize = 12;
const double commonRadiusSize = 12;
const double commonPaddingSize = 12;
final onboardScreens = [
  OnboardModel(
    id: 1,
    text: 'Welcome to Special 40 where learning meets innovation!',
    subtext:
        'Empowering your journey through cutting-edge IT education and expertise',
    image: 'assets/images/onboard/onboard1.png',
  ),
  OnboardModel(
    id: 2,
    text: 'Begin your learning journey and unlock a world of knowledge',
    subtext:
        'Explore our comprehensive courses designed to transform your skills and career',
    image: 'assets/images/onboard/onboard2.png',
  ),
  OnboardModel(
    id: 3,
    text: 'Dive into a seamless learning experience with Special 40',
    subtext:
        'Experience interactive learning with expert-led courses and progress tracking',
    image: 'assets/images/onboard/onboard3.png',
  ),
  OnboardModel(
    id: 4,
    text: 'Join a community of learners and embark on a learning adventure',
    subtext:
        'Connect with like-minded individuals Join us to learn, grow, and thrive together!',
    image: 'assets/images/onboard/onboard4.png',
  ),
  OnboardModel(
    id: 5,
    text: 'Join Special 40 to Kick Start Your Lesson',
    subtext: 'Join and Learn from our Top Instructors!',
    image: 'assets/images/onboard/onboard5.png',
  ),
];
