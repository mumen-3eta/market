import 'package:flutter/material.dart';
import 'package:market/helper/nav_helper.dart';
import 'package:market/providers/ads_provider.dart';
import 'package:market/views/screens/main_screen.dart';
import 'package:provider/provider.dart';

class AddNewAd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AdsProvider>(
      builder: (context, provider, child) {
        return Scaffold(
            appBar: AppBar(title: const Text('Add New Ad')),
            body: Form(
                key: provider.adkey,
                child: SingleChildScrollView(
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          border: Border.all(color: Colors.blue),
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        Container(
                          margin: const EdgeInsets.all(20),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4)),
                          child: Column(children: [
                            provider.selectedImage == null
                                ? Container(
                                    height: 300,
                                    width: 300,
                                    margin: const EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                        border: Border.all(),
                                        borderRadius: BorderRadius.circular(4)),
                                    child: InkWell(
                                        onTap: () {
                                          provider.selectImage();
                                        },
                                        child: const Icon(Icons.add)),
                                  )
                                : InkWell(
                                    onTap: () {
                                      provider.selectImage();
                                    },
                                    child: Image.file(
                                      provider.selectedImage!,
                                      fit: BoxFit.cover,
                                      height: 300,
                                    ),
                                  ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              validator: provider.fieldValidator,
                              controller: provider.contentController,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.grey.withOpacity(0.2),
                                  label: const Text('Ad discription'),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(20))),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              validator: provider.fieldValidator,
                              controller: provider.priceController,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.grey.withOpacity(0.2),
                                  label: const Text('price'),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(20))),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  if (provider.adkey.currentState!.validate()) {
                                    provider.publishAd(
                                        provider.contentController.text,
                                        int.parse(
                                            provider.priceController.text));
                                    provider.page = 1;
                                    provider.ads.clear();
                                    provider.getAds();
                                    NavHelper.navigateWithReplacementToWidget(
                                        MainScreen());
                                  }
                                },
                                child: const Text('publish ad'))
                          ]),
                        ),
                      ]),
                    ),
                  ),
                )));
      },
    );
  }
}
