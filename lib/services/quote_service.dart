// lib/services/quote_service.dart
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quotely/models/quote.dart';

class QuoteService {
  static final _quotesCollection = FirebaseFirestore.instance.collection(
    'quotes',
  );

  static Future<Quote> fetchQuote() async {
    try {
      // 1. Get the total number of quotes
      final countSnapshot = await _quotesCollection.count().get();
      final totalQuotes = countSnapshot.count ?? 0;

      if (totalQuotes == 0) {
        throw Exception("No quotes found in the database.");
      }

      // 2. Generate a random index
      final randomIndex = Random().nextInt(totalQuotes);

      // 3. Query Firestore by index field
      final querySnapshot = await _quotesCollection
          .where('index', isEqualTo: randomIndex)
          .limit(1)
          .get();

      if (querySnapshot.docs.isEmpty) {
        throw Exception("Failed to fetch a random quote. $randomIndex");
      }

      final quoteData = querySnapshot.docs.first.data();

      return Quote(
        text: quoteData['text'] ?? 'No text available',
        author: quoteData['author'] ?? 'Unknown author',
      );
    } catch (e) {
      // print("Error fetching from Firestore: $e");
      return Quote(
        text: "Could not load a quote. Please try again.",
        author: "System",
      );
    }
  }
}
