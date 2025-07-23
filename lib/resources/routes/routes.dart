import 'package:blossoms_kids/features/sessionScreen/views/session_completion_view.dart';

import 'package:get/get.dart';
// import 'package:blossoms_kids/features/authentication/views/auth/login_screen.dart';
// import 'package:blossoms_kids/features/authentication/views/auth/signup_screen.dart';
// import 'package:blossoms_kids/features/authentication/views/auth/splash_screen.dart';
import 'package:blossoms_kids/resources/routes/routesName.dart';


import '../../features/base/views/base_view.dart';
import '../../features/learnScreen/views/learn_screen_view.dart';
import '../../features/learn_item_screen/balloon_blast/views/balloon_blast_screen.dart';
import '../../features/learn_item_screen/emotion/views/emotion_screen.dart';
import '../../features/learn_item_screen/family/views/family_screen.dart';
import '../../features/learn_item_screen/living_skill/views/living_skill_screen.dart';
import '../../features/learn_item_screen/music/views/music_screen.dart';
import '../../features/learn_item_screen/profession/views/profession_screen.dart';
import '../../features/learn_item_screen/psychological/views/psychological_screen.dart';
import '../../features/learn_item_screen/shape_matching/views/shape_matching_screen.dart';
import '../../features/learn_item_screen/social_skill/views/social_skill_screen.dart';
import '../../features/learn_item_screen/study/views/study_screen.dart';
import '../../features/parentScreen/views/parent_screen_view.dart';
import '../../features/practiceScreen/views/practice_screen_view.dart';
import '../../features/sessionScreen/views/session_view.dart';
import '../../features/testScreen/views/test_completion_view.dart';
import '../../features/testScreen/views/test_learning_view.dart';
import '../../features/testScreen/views/test_question_view.dart';
import '../../features/testScreen/views/test_screen.dart';


class AppRoutes {

  static appRoutes () => [
    GetPage(

      name: RoutesName.learnScreen,
      page: () => LearnScreenView(),
    ),

    GetPage(
        name: RoutesName.baseView,
        page: () => BaseView(),
        transitionDuration: Duration(milliseconds: 250),
        transition: Transition.noTransition
    ),

    GetPage(
        name: RoutesName.splashScreen,
        // page: () => SplashScreen(),
      page: () => BaseView(),
    ),

    GetPage(
        name: RoutesName.loginScreen,
        // page: () => LoginScreen(),
      page: () => BaseView(),
    ),

    GetPage(
        name: RoutesName.signupScreen,
      page: () => BaseView(),
        // page: () => SignupScreen(),
    ),


    // GetPage(
    //
    //     name: RoutesName.learnScreen,
    //     page: () => LearnScreenView(),
    // ),

    GetPage(
        name: RoutesName.practiceScreen,
        page: () => PracticeScreenView(),
    ),

    GetPage(
        name: RoutesName.parentScreen,
        page: () => ParentScreenView(),
    ),


    GetPage(
        name: RoutesName.shapeMatching,
        page: () => ShapeMatchingScreen(),
    ),

    GetPage(
        name: RoutesName.balloonBlast,
        page: () => BalloonBlastScreen(),
    ),

    GetPage(
        name: RoutesName.livingSkill,
        page: () => LivingSkillScreen(),
    ),

    GetPage(
        name: RoutesName.family,
        page: () => FamilyScreen(),
    ),

    GetPage(
        name: RoutesName.study,
        page: () => StudyScreen(),
    ),

    GetPage(
        name: RoutesName.emotion,
        page: () => EmotionScreen(),
    ),

    GetPage(
        name: RoutesName.profession,
        page: () => ProfessionScreen(),
    ),

    GetPage(
        name: RoutesName.music,
        page: () => MusicScreen(),
    ),

    GetPage(
        name: RoutesName.psychologicalEducation,
        page: () => PsychologicalScreen(),
    ),

    GetPage(
        name: RoutesName.socialAndCommunicationSkill,
        page: () => SocialSkillScreen(),
    ),

    GetPage(
      name: RoutesName.sessionView,
      page: () => SessionView(),
    ),

    GetPage(
      name: RoutesName.sessionCompletion,
      page: () => SessionCompletionView(),
    ),

    GetPage(
      name: RoutesName.testLearningView,
      page: () => TestLearningView(),
    ),

    GetPage(
      name: RoutesName.testQuestionView,
      page: () => TestQuestionView(),
    ),

    GetPage(
      name: RoutesName.testScreen,
      page: () => TestScreen(),
    ),

    GetPage(
      name: RoutesName.testCompletion,
      page: () => TestCompletionView(),
    ),


  ];
}