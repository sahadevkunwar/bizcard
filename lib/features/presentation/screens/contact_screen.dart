import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/drive/v3.dart' as drive;
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

import '../../core/constants/my_colors.dart';
import '../../core/themes/size.dart';
import '../../utils/custom_button.dart';
import 'auth/google_sign_in.dart';

class WriteContactToNfcScreen extends StatefulWidget {
  const WriteContactToNfcScreen({super.key});

  @override
  _WriteContactToNfcScreenState createState() =>
      _WriteContactToNfcScreenState();
}

class _WriteContactToNfcScreenState extends State<WriteContactToNfcScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController phone2Controller = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController websiteController = TextEditingController();
  TextEditingController preController = TextEditingController();

  String? contactUrl;

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    phone2Controller.dispose();
    emailController.dispose();
    companyController.dispose();
    addressController.dispose();
    websiteController.dispose();
    preController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Save Contact to Card')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextFormField(label: "Pref", controller: preController),
                CustomTextFormField(
                    label: "Full Name", controller: nameController),
                CustomTextFormField(
                    label: "Company", controller: companyController),
                CustomTextFormField(
                    label: "Address", controller: addressController),
                CustomTextFormField(label: "+977", controller: phoneController),
                CustomTextFormField(
                    label: "+977", controller: phone2Controller),
                CustomTextFormField(
                    label: "Email", controller: emailController),
                CustomTextFormField(
                    label: "https://", controller: websiteController),
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        title: "Cancel",
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: CustomButton(
                        title: "Write to NFC",
                        onPressed: _writeContacts,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(contactUrl ?? "No data"),
                    ),
                    SizedBox(
                      width: SizeConfig.screenWidth! * 0.02,
                    ),
                    MaterialButton(
                      onPressed: () async {
                        await Clipboard.setData(
                          ClipboardData(
                            text: contactUrl!,
                          ),
                        );
                      },
                      color: MyColors.primaryColor,
                      child: Text(
                        "COPY",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Colors.white,
                            ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _writeContacts() async {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      log("write contact");
      final isSignedIn = await AuthMethods().signInWithGoogle();
      log("success");
      if (!isSignedIn) {
        log("isSignIn$isSignedIn");
        return;
      }
      _generateAndUploadVCard();
    }
  }

  void _generateAndUploadVCard() async {
    try {
      final vCardData = generateVCard(
        name: nameController.text,
        company: companyController.text,
        address: addressController.text,
        phone: phoneController.text,
        phone2: phone2Controller.text,
        email: emailController.text,
        website: websiteController.text,
        pref: preController.text,
      );
      log("try code running");

      final vCardFile = await saveVCardLocally(vCardData);
      log(vCardFile.toString());
      await uploadToGoogleDrive(vCardFile);
      log("try code success");

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: const Text("Contact saved to Google Drive successfully!"),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    } catch (e) {
      print('Error: $e');
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Text("Failed to save contact: $e"),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  String generateVCard({
    required String name,
    required String company,
    required String address,
    required String phone,
    required String phone2,
    required String email,
    required String website,
    required String pref,
  }) {
    return 'BEGIN:VCARD\n'
        'VERSION:3.0\n'
        'FN;PREF:$pref $name\n'
        'ORG:$company\n'
        'ADR:$address\n'
        'TEL:$phone\n'
        'TEL:$phone2\n'
        'EMAIL:$email\n'
        'URL:$website\n'
        'END:VCARD';
  }

  Future<File> saveVCardLocally(String vCardData) async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/contact.vcf');
    return file.writeAsString(vCardData);
  }

  Future<void> uploadToGoogleDrive(File file) async {
    final googleSignIn = GoogleSignIn.standard(
      scopes: [
        drive.DriveApi.driveFileScope,
        "https://www.googleapis.com/auth/drive.file",
        "https://www.googleapis.com/auth/drive",
      ],
    );
    final account = await googleSignIn.signIn();
    if (account == null) {
      throw Exception('User sign-in failed');
    }
    final authHeaders = await account.authHeaders;
    final client = AuthClient(authHeaders);
    final driveApi = drive.DriveApi(client);

    final media = drive.Media(file.openRead(), file.lengthSync());
    final driveFile = drive.File()..name = 'contact.vcf';

    try {
      final uploadedFile =
          await driveApi.files.create(driveFile, uploadMedia: media);
      log("The drive id is :${uploadedFile.id} ");

      // Set the file's permissions to make it publicly viewable
      final permission = drive.Permission()
        ..type = 'anyone'
        ..role = 'reader';
      await driveApi.permissions.create(permission, uploadedFile.id!);
      setState(() {
        contactUrl = "https://drive.google.com/uc?&id=${uploadedFile.id}";
      });
      log("File is now publicly accessible");
    } catch (e) {
      throw Exception('Failed to upload file to Google Drive');
    }
  }
}

class AuthClient extends http.BaseClient {
  final Map<String, String> _headers;
  final http.Client _client = http.Client();

  AuthClient(this._headers);

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers.addAll(_headers);
    return _client.send(request);
  }
}

class CustomTextFormField extends StatelessWidget {
  final String label;
  final TextEditingController controller;

  const CustomTextFormField(
      {super.key, required this.label, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(labelText: label),
      controller: controller,
    );
  }
}
