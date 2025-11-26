import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/payment_screen.dart';
import 'screens/receipt_screen.dart';
import 'screens/scan_screen.dart';
import 'screens/ai_recognition_screen.dart';
import 'screens/stock_prediction_screen.dart';
import 'screens/price_recommendation_screen.dart';
import 'screens/customer_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kasir Cerdas',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/home': (context) => HomeScreen(
          role: ModalRoute.of(context)!.settings.arguments as String,
        ),
        '/payment': (context) {
          final total = ModalRoute.of(context)!.settings.arguments as double;
          return PaymentScreen(total: total);
        },
        '/receipt': (context) => const ReceiptScreen(),
        '/scan': (context) => const ScanScreen(),
        '/ai_recognition': (context) => const AIRecognitionScreen(),
        '/stock_prediction': (context) => const StockPredictionScreen(),
        '/price_recommendation': (context) => const PriceRecommendationScreen(),
        '/customer_detail': (context) {
          final customer =
              ModalRoute.of(context)!.settings.arguments
                  as Map<String, dynamic>;
          return CustomerDetailScreen(customer: customer);
        },
      },
    );
  }
}
