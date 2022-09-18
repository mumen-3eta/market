import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:market/models/ad_response_model.dart';
import 'package:market/providers/ads_provider.dart';
import 'package:provider/provider.dart';

class AdWidget extends StatelessWidget {
  Items ad;
  AdWidget(this.ad);
  @override
  Widget build(BuildContext context) {
    return Consumer<AdsProvider>(
      builder: (context, provider, child) {
        return Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              border: Border.all(color: Colors.blue),
              borderRadius: BorderRadius.circular(15)),
          child: Column(children: [
            CachedNetworkImage(
              imageUrl: ad.image!,
              imageBuilder: (context, imageProvider) => Container(
                height: 300,
                margin: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              placeholder: (context, url) => const SizedBox(
                  height: 20, width: 20, child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            Row(
              children: [
                Text(ad.details!,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 19,
                    )),
                const Spacer(),
                InkWell(
                    onTap: () {
                      provider.addToFavorite(ad.id!);
                    },
                    child: Icon(
                      Icons.favorite,
                      color: ad.favorited! ? Colors.red : Colors.grey,
                    ))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text('Prise ${ad.price.toString()} \$',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 19,
                )),
            const SizedBox(
              height: 10,
            ),
            Text('Created at ${ad.createdAt!}',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 14,
                )),
          ]),
        );
      },
    );
  }
}
