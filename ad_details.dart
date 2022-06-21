import 'package:administrator/presentation/widgets/ad_edit_form.dart';
import 'package:administrator/presentation/widgets/ad_template/ad_template_cubit.dart';
import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../ad_template/ad_previews/ad_preview_view.dart';
import '../custom_modal_dialog.dart';
import 'ad_details_box.dart';
import 'ad_duration_box.dart';
import 'ad_locations_box.dart';
import 'models/advertisement.dart';

class AdDetails extends StatefulWidget {
  AdDetails({Key? key, required this.id}) : super(key: key);
  final String id;
  @override
  State<AdDetails> createState() => _AdDetailsState();
}

_statusColor(status) {
  switch (status) {
    case 'archived':
      return Colors.red;
    case 'draft':
      return Colors.blue;
    case 'active':
      return Colors.green;
    case 'rejected':
      return Colors.red;
    case 'paused':
      return Colors.grey;
    case 'review':
      return Colors.grey;
    case 'scheduled':
      return Colors.grey;
    default:
  }
}

class _AdDetailsState extends State<AdDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        elevation: 1,
        toolbarHeight: 104,
        backgroundColor: Colors.white,
        leading: BackButton(
          color: Colors.black87,
          onPressed: () => context.beamToNamed('/ads'),
        ),
      ),
      body: FutureBuilder(
        future: context.read<AdTemplateCubit>().getAdvertisementById(context, widget.id),
        // initialData: InitialData,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState.name == 'done') {
            Advertisement ad = snapshot.data;
            return Container(
              color: Colors.grey.shade100,
              height: MediaQuery.of(context).size.height - 104,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * .10, vertical: 30),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('${ad.name}', style: Theme.of(context).textTheme.labelMedium),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AdPreview(adTypeKey: ad.adTypeKey!, contentUrls: [
                              if (ad.content != null) ad.content![0].originalUrl!,
                              if (ad.content != null && ad.content!.length > 1 && ad.content?[1] != null) ad.content![1].originalUrl!
                            ]),
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  DetailsBox(ad: ad),
                                  DurationBox(ad: ad),
                                  LocationsBox(ad: ad),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                          flex: 2,
                                          child: Container(
                                              margin: EdgeInsets.only(right: 10),
                                              padding: EdgeInsets.all(24),
                                              decoration: BoxDecoration(
                                                color: Colors.red.shade100.withOpacity(0.6),
                                                borderRadius: BorderRadius.circular(20),
                                              ),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text('Total Plays',
                                                          style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 21)),
                                                      Tooltip(
                                                          decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(8),
                                                              color: Colors.black.withOpacity(0.85)),
                                                          verticalOffset: 10,
                                                          padding: EdgeInsets.all(10),
                                                          message: 'Total ad plays from all events',
                                                          child: Icon(Icons.info, color: Colors.black))
                                                    ],
                                                  ),
                                                  Text('${ad.adPlaysTotal}',
                                                      style: Theme.of(context).textTheme.headline4!.copyWith(fontSize: 56)),
                                                ],
                                              ))),
                                      Expanded(
                                          flex: 2,
                                          child: Container(
                                              padding: EdgeInsets.all(24),
                                              decoration: BoxDecoration(
                                                color: Colors.grey.shade200,
                                                borderRadius: BorderRadius.circular(20),
                                              ),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text('Impressions',
                                                          style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 21)),
                                                      Tooltip(
                                                          decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(8),
                                                              color: Colors.black.withOpacity(0.85)),
                                                          verticalOffset: 10,
                                                          padding: EdgeInsets.all(10),
                                                          message:
                                                              'Impressions are calculated by \nestimation of people at the \nevent from ticketing data',
                                                          child: Icon(Icons.info, color: Colors.black))
                                                    ],
                                                  ),
                                                  Text('${ad.adPlayImpressionsTotal}',
                                                      style: Theme.of(context).textTheme.headline4!.copyWith(fontSize: 56)),
                                                ],
                                              ))),
                                    ],
                                  ),
                                ],
                              ),
                            )),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  width: 178,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: _statusColor(ad.status),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Text('${ad.status}'.toUpperCase(),
                                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: Colors.white)),
                                ),
                                SizedBox(height: 20),
                                TextButton.icon(
                                  icon: Icon(Icons.edit, size: 16),
                                  onPressed: () async {
                                    await CustomModalDialog(context, true, AdvertisementEditForm(advertisement: ad));
                                  },
                                  label: Text('Edit'.toUpperCase()),
                                  style: TextButton.styleFrom(
                                    minimumSize: Size(178, 40),
                                    textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                                    primary: Colors.white,
                                    backgroundColor: Colors.grey,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                if (ad.status != 'archived' && ad.status != 'paused' && ad.status != 'draft')
                                  TextButton.icon(
                                    icon: Icon(Icons.pause, size: 16),
                                    onPressed: () => context.read<AdTemplateCubit>().updateAd(context, ad.id!, ad.name, 'paused'),
                                    label: Text('Pause Ad'.toUpperCase()),
                                    style: TextButton.styleFrom(
                                      minimumSize: Size(178, 40),
                                      textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                                      primary: Colors.white,
                                      backgroundColor: Colors.black,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                    ),
                                  ),
                                if (ad.status == 'paused' || ad.status == 'archived' || ad.status == 'draft')
                                  TextButton(
                                    onPressed: () => context.read<AdTemplateCubit>().updateAd(context, ad.id!, ad.name, 'active'),
                                    child: Text('Activate'.toUpperCase()),
                                    style: TextButton.styleFrom(
                                      minimumSize: Size(178, 40),
                                      textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                                      primary: Colors.white,
                                      backgroundColor: Colors.green,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                    ),
                                  ),
                                if (ad.status != 'archived') SizedBox(height: 10),
                                if (ad.status != 'archived')
                                  TextButton.icon(
                                    icon: Icon(Icons.delete, size: 16),
                                    onPressed: () => context.read<AdTemplateCubit>().updateAd(context, ad.id!, ad.name, 'archived'),
                                    label: Text('Archive'.toUpperCase()),
                                    style: TextButton.styleFrom(
                                      minimumSize: Size(178, 40),
                                      textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                                      primary: Colors.white,
                                      backgroundColor: Colors.red,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                    ),
                                  ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          return Center(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 20),
              Text('Retrieving Ad Info', style: Theme.of(context).textTheme.bodyText2)
            ],
          ));
        },
      ),
    );
  }
}
