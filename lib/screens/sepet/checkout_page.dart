import 'package:flutter/material.dart';
import 'package:flutter_paypal_checkout/flutter_paypal_checkout.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../home_screen.dart';

class CheckoutPage extends StatefulWidget {
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _fullNameController;
  late TextEditingController _phoneController;
  late String _selectedCity;
  late String _selectedDistrict;
  late String _paymentMethod;
  bool _orderPlaced = false;

  List<String> cities = ['Malatya', 'Ankara', 'İstanbul'];
  List<String> malatyaDistricts = ['Merkez', 'Yeşilyurt', 'Akkent'];
  List<String> ankaraDistricts = ['Çankaya', 'Kızılay', 'Çayyolu'];
  List<String> istanbulDistricts = ['Beşiktaş', 'Kadıköy', 'Şişli'];

  @override
  void initState() {
    super.initState();
    _fullNameController = TextEditingController();
    _phoneController = TextEditingController();
    _selectedCity = cities[0];
    _selectedDistrict = malatyaDistricts[0];
    _paymentMethod = 'Kapıda Ödeme';
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _placeOrder() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _orderPlaced = true;
      });

      Future.delayed(Duration(seconds: 2), () {
        // Sipariş tamamlandıktan 2 saniye sonra anasayfaya yönlendirme
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
      });

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _orderPlaced
            ? _buildOrderPlaced()
            : _buildOrderForm(),
      ),
    );
  }

  Widget _buildOrderForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DropdownButtonFormField<String>(
            value: _selectedCity,
            onChanged: (value) {
              setState(() {
                _selectedCity = value!;
              });
            },
            items: cities.map((city) {
              return DropdownMenuItem(
                value: city,
                child: Text(city),
              );
            }).toList(),
            decoration: InputDecoration(labelText: 'Şehir'),
          ),
          SizedBox(height: 16),
          DropdownButtonFormField<String>(
            value: _selectedDistrict,
            onChanged: (value) {
              setState(() {
                _selectedDistrict = value!;
              });
            },
            items: _getDistricts().map((district) {
              return DropdownMenuItem(
                value: district,
                child: Text(district),
              );
            }).toList(),
            decoration: InputDecoration(labelText: 'İlçe'),
          ),
          SizedBox(height: 16),
          TextFormField(
            controller: _fullNameController,
            decoration: InputDecoration(labelText: 'Ad Soyad'),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Lütfen adınızı soyadınızı girin.';
              }
              return null;
            },
          ),
          SizedBox(height: 16),
          TextFormField(
            controller: _phoneController,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(labelText: 'Telefon Numarası'),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Lütfen telefon numaranızı girin.';
              }
              return null;
            },
          ),
          SizedBox(height: 16),
          DropdownButtonFormField<String>(
            value: _paymentMethod,
            onChanged: (value) {
              setState(() {
                _paymentMethod = value!;
              });
            },
            items: ['Kapıda Ödeme', 'Kredi Kartı'].map((method) {
              return DropdownMenuItem(
                value: method,
                child: Text(method),
              );
            }).toList(),
            decoration: InputDecoration(labelText: 'Ödeme Yöntemi'),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: _placeOrder,
            child: Text('Siparişi Tamamla'),
          ),
        ],
      ),
    );
  }

  List<String> _getDistricts() {
    switch (_selectedCity) {
      case 'Malatya':
        return malatyaDistricts;
      case 'Ankara':
        return ankaraDistricts;
      case 'İstanbul':
        return istanbulDistricts;
      default:
        return [];
    }
  }

  Widget _buildOrderPlaced() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Sipariş Tamamlandı!',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          CircularProgressIndicator(),
          SizedBox(height: 16),
          Text('Ana sayfaya yönlendiriliyorsunuz...'),
        ],
      ),
    );
  }
}


