import 'package:intl/intl.dart';

class UtilsServices{

//formatar moeda para real
String priceToCurrency(double price){
  NumberFormat numberFormat =NumberFormat.simpleCurrency(locale: 'pt_BR');
  return numberFormat.format(price);
}

}