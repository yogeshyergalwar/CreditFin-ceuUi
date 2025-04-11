import 'dart:ui';

class CardModel {
  final String cardType;
  final String balance;
  final String cardNumber;
  final String expiryDate;
  final Color cardColor;

  CardModel({
    required this.cardType,
    required this.balance,
    required this.cardNumber,
    required this.expiryDate,
    required this.cardColor,
  });
}
