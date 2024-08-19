import 'package:x_clone_flutter/src/features/tweet/models/tweet_data.dart';

final List<TweetData> tweets = [
  const TweetData(
    displayName: 'John Doe',
    username: '@johndoe',
    body: '''
Flutter's hot reload is a game changer! Instantly see the results of your code changes. 🔥🚀
''',
    image: 'assets/default_image.png',
    time: '08:45 AM',
    date: 'Jul 10, 2023',
    likesCount: 523,
    repliesCount: 18,
  ),
  const TweetData(
    displayName: 'Jane Smith',
    username: '@janesmith',
    body: '''
Exploring Riverpod for state management in Flutter. Loving the flexibility and performance! 💪
''',
    //image: 'assets/riverpod.png',
    time: '09:30 AM',
    date: 'Jul 11, 2023',
    likesCount: 789,
    repliesCount: 25,
  ),
  const TweetData(
    displayName: 'Dev Guru',
    username: '@devguru',
    body: '''
Remember: Composition over inheritance! Keep your Flutter widgets simple and reusable. 🎯
''',
    //image: 'assets/code.png',
    time: '10:00 AM',
    date: 'Jul 12, 2023',
    likesCount: 432,
    repliesCount: 14,
  ),
  const TweetData(
    displayName: 'Metin Ilgar Mutlu',
    username: '@ilgar',
    body: '''
Did you know?

When you call `MediaQuery.of(context)` inside a build method, the widget will rebuild when *any* of the MediaQuery properties change.

But there's a better way that lets you depend only on the properties you care about (and minimize unnecessary rebuilds). 👇
''',
    image: 'assets/default_image.png',
    time: '10:21 AM',
    date: 'Jun 20, 2023',
    likesCount: 997,
    repliesCount: 12,
  ),
  const TweetData(
    displayName: 'Tech Enthusiast',
    username: '@techenthusiast',
    body: '''
Flutter now has support for Web! Build beautiful UIs for desktop, mobile, and web with a single codebase. 🌍💻
''',
    //image: 'assets/web.png',
    time: '11:15 AM',
    date: 'Jul 13, 2023',
    likesCount: 658,
    repliesCount: 20,
  ),
  const TweetData(
    displayName: 'Code Master',
    username: '@codemaster',
    body: '''
Don’t forget to wrap your widgets with `SafeArea` to avoid notches and status bars in Flutter. 📱
''',
    //image: 'assets/safe_area.png',
    time: '12:30 PM',
    date: 'Jul 14, 2023',
    likesCount: 844,
    repliesCount: 30,
  ),
  const TweetData(
    displayName: 'Flutter Dev',
    username: '@flutterdev',
    body: '''
StatefulWidgets are great, but did you know you can achieve a lot with StatelessWidgets + Riverpod? 💡
''',
    //image: 'assets/stateless.png',
    time: '01:00 PM',
    date: 'Jul 15, 2023',
    likesCount: 921,
    repliesCount: 22,
  ),
  const TweetData(
    displayName: 'Mobile Dev',
    username: '@mobiledev',
    body: '''
Flutter's custom paint feature is powerful. You can create any design you imagine with just a few lines of code! 🎨
''',
    //image: 'assets/custom_paint.png',
    time: '02:45 PM',
    date: 'Jul 16, 2023',
    likesCount: 776,
    repliesCount: 16,
  ),
  const TweetData(
    displayName: 'Design Pro',
    username: '@designpro',
    body: '''
For responsive layouts in Flutter, Flex and Expanded are your best friends! 📐
''',
    image: 'assets/default_image.png',
    time: '03:20 PM',
    date: 'Jul 17, 2023',
    likesCount: 681,
    repliesCount: 19,
  ),
  const TweetData(
    displayName: 'App Builder',
    username: '@appbuilder',
    body: '''
Use `AnimatedSwitcher` to add smooth transitions when swapping out widgets in Flutter. 🌀
''',
    //image: 'assets/animated_switcher.png',
    time: '04:00 PM',
    date: 'Jul 18, 2023',
    likesCount: 888,
    repliesCount: 24,
  ),
];
