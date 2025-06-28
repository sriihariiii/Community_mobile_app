import 'package:flutter/material.dart';

// Screens
import 'screens/home/home_screen.dart';
import 'screens/blog/blog_screen.dart';
import 'screens/audio/audio_screen.dart';
import 'screens/podcast/podcast_screen.dart';
import 'screens/video/video_screen.dart';
import 'screens/courses/course_screen.dart';
import 'screens/events/event_screen.dart';
import 'screens/profile/profile_screen.dart';
import 'screens/creator/creator_screen.dart';
import 'screens/search/search_screen.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/sign_up_screen.dart';
import 'screens/character/character_picker_screen.dart';
import 'screens/blog/tiny_tales_screen.dart';



// Placeholder screens for upcoming features
import 'screens/placeholder/placeholder_screen.dart'; // Make sure this file exists

final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => const HomeScreen(),
  '/home': (context) => const HomeScreen(),
  '/blog': (context) => const BlogScreen(),
  '/audio': (context) => const AudioScreen(),
  '/podcast': (context) => const PodcastScreen(),
  '/video': (context) => const VideoScreen(),
  '/courses': (context) => const CourseScreen(),
  '/events': (context) => const EventScreen(),
  '/profile': (context) => const ProfileScreen(),
  '/creator': (context) => const CreatorScreen(),
  '/search': (context) => const SearchScreen(),
  '/login': (context) => const LoginScreen(),
  '/signup': (context) => const SignUpScreen(),
  '/explore': (context) => const HomeScreen(),
  '/characters': (context) => const CharacterPickerScreen(),
  '/tiny_tales': (context) => const TinyTalesScreen(),

  // Placeholder for future or linked header/drawer items
  '/store': (context) => const PlaceholderScreen(title: 'Lil Store'),
  '/join': (context) => const PlaceholderScreen(title: 'Join the Lil Circle'),
};
