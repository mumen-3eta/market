import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:market/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class PhoneScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(title: const Text('Add Phone number')),
          body: SingleChildScrollView(
              child: Form(
            key: provider.phonekey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Wellcom',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
                ),
                const SizedBox(height: 20),
                const Text('Enter your phone number to contenue'),
                const SizedBox(height: 10),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                    validator: provider.phoneValidator,
                    controller: provider.phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.withOpacity(0.2),
                        label: const Text('phone number'),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      provider.registerphone();
                    },
                    child: const Text('Register'))
              ],
            ),
          )),
        );
      },
    );
  }
}
