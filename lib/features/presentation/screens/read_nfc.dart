import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/constants/my_colors.dart';
import '../../core/themes/size.dart';
import '../../utils/custom_button.dart';
import 'contact_screen.dart';

class ReadNFC extends StatefulWidget {
  const ReadNFC({super.key});

  @override
  State<ReadNFC> createState() => _ReadNFCState();
}

class _ReadNFCState extends State<ReadNFC> {
  @override
  void initState() {
    super.initState();
    _tagRead();
    // _writeVCardToTag();
    // _openContactsApp();
  }

  //*********read nfc********************************* */
  ValueNotifier<String> result = ValueNotifier('');

  bool isLoad = false;

  void _tagRead() {
    NfcManager.instance.startSession(
      onDiscovered: (NfcTag tag) async {
        var ndef = Ndef.from(tag);
        if (ndef == null) {
          log('Tag is not NDEF compliant');
          return;
        }

        try {
          // Read tag data
          NdefMessage ndefMessage = await ndef.read();
          log('NDEF Message: $ndefMessage');

          // Process each record
          for (var record in ndefMessage.records) {
            String mimeType = String.fromCharCodes(record.type);
            log('Record MIME type: $mimeType');

            if (mimeType == 'text/plain') {
              // Text type record
              String textData = utf8.decode(record.payload);
              log('Text Record: $textData');
              // Perform actions based on textData
            } else if (mimeType == 'text/uri-list') {
              // URI type record
              String uri = utf8.decode(record.payload);
              log('URI Record: $uri');
              // Perform actions based on URI
              _openContactsApp(); // Open contacts app
            } else {
              log('Unhandled MIME type: $mimeType');
            }
          }

          // Check and log tag data
          log("Tag data: ${tag.data.toString()}");
          result.value = tag.data.toString();

          // Update load state
          isLoad = true;
          log("Tag read: ${result.value}");
        } catch (e) {
          log('Error reading tag: $e');
        } finally {
          NfcManager.instance.stopSession();
        }
      },
    );
  }

  Future<void> _writeVCardToTag() async {
    // Define vCard data
    const vCardData = '''BEGIN:VCARD
VERSION:3.0
FN:John Doe
TEL:1234567890
EMAIL:john.doe@example.com
END:VCARD''';

    // Encode vCard data as bytes
    final vCardBytes = utf8.encode(vCardData);

    // Create an NdefRecord with vCard data
    final record = NdefRecord.createMime('text/vcard', vCardBytes);

    // Create an NdefMessage with the record
    final message = NdefMessage([record]);

    try {
      // Start NFC session
      await NfcManager.instance.startSession(
        onDiscovered: (NfcTag tag) async {
          try {
            // Write the message to the NFC tag // gg
            //

            //await tag._openContactsApp();
            log('vCard successfully written to NFC tag');
          } catch (e) {
            log('Error writing vCard to tag: $e');
          } finally {
            // Stop NFC session
            NfcManager.instance.stopSession();
          }
        },
      );
    } catch (e) {
      log('Error starting NFC session: $e');
    }
  }

  void _openContactsApp() async {
    const uri = 'content://contacts/people/';
    if (await canLaunch(uri)) {
      await launch(uri);
    } else {
      // Contacts app not found or cannot be launched
      throw 'Contacts app cannot be launched';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.secondaryColor,
      body: FutureBuilder<bool>(
        future: NfcManager.instance.isAvailable(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.data == false) {
            return const Center(
                child: Text('NFC is not available on this device.'));
          } else {
            return buildNFCContent();
          }
        },
      ),
    );
  }

  Widget buildNFCContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          flex: 3,
          child: Container(
            margin: const EdgeInsets.all(4),
            constraints: const BoxConstraints.expand(),
            decoration:
                BoxDecoration(border: Border.all(color: MyColors.primaryColor)),
            child: SingleChildScrollView(
              child: ValueListenableBuilder<String>(
                valueListenable: result,
                builder: (context, value, _) {
                  if (isLoad) {
                    value = "Successfully scanned";
                  }

                  return Column(
                    children: [
                      Stack(
                        children: [
                          Image.asset(
                            "assets/images/readytoscan.png",
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            top: 30,
                            left: 20,
                            child: Text(
                              "Hold your phone near the object to scan",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(color: MyColors.primaryColor),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: SizeConfig.screenHeight! * 0.07,
                      ),
                      Text(
                        !isLoad ? "Waiting for Scan..." : value,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: MyColors.primaryColor),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
        // GridView.count(
        //   padding: const EdgeInsets.all(4),
        //   crossAxisCount: 2,
        //   childAspectRatio: 4,
        //   crossAxisSpacing: 2,
        //   mainAxisSpacing: 4,
        //   shrinkWrap: true,
        //   children: [
        //     CustomButton(
        //       //back: MyColors.primaryColor,
        //       bgColor: MyColors.primaryColor,
        //       title: "Tag Read",
        //       textColor: MyColors.secondaryColor,
        //       onPressed: _tagRead,
        //     ),
        //     CustomButton(
        //       bgColor: MyColors.primaryColor,
        //       textColor: MyColors.secondaryColor,
        //       title: "Write vCard to Tag",
        //       onPressed: _writeVCardToTag,
        //     ),
        //   ],
        // ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth! * 0.25),
          child: CustomButton(
            //back: MyColors.primaryColor,
            bgColor: MyColors.primaryColor,
            title: "Tap",
            textColor: MyColors.secondaryColor,
            onPressed: _tagRead,
          ),
        ),

        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 15),
        //   child: Row(
        //     children: [
        //       Expanded(
        //         child: CustomButton(
        //           //back: MyColors.primaryColor,
        //           bgColor: MyColors.primaryColor,
        //           title: "Tag Read",
        //           textColor: MyColors.secondaryColor,
        //           onPressed: _tagRead,
        //         ),
        //       ),
        //       const SizedBox(
        //         width: 5,
        //       ),
        //       Expanded(
        //         child: CustomButton(
        //           bgColor: MyColors.primaryColor,
        //           textColor: MyColors.secondaryColor,
        //           title: "Write vCard to Tag",
        //           onPressed: _writeVCardToTag,
        //         ),
        //       ),
        //     ],
        //   ),
        // ),

        SizedBox(
          height: SizeConfig.screenHeight! * 0.15,
        ),
      ],
    );
  }
}
