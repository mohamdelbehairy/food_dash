import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:food_dash/core/utils/bloc_observer.dart';
import 'package:food_dash/core/utils/api_keys.dart';
import 'package:food_dash/firebase_options.dart';

import 'core/utils/food_dash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  Stripe.publishableKey = ApiKeys.stripPublishableKey;
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const FoodDash());
}
