// import 'dart:developer';
// import 'dart:io';
//
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:googleapis_auth/auth.dart';
// import 'package:googleapis/storage/v1.dart' as storage;
// import 'package:googleapis/speech/v1.dart' as speech;
// import 'package:googleapis_auth/auth_io.dart';
// import 'package:path/path.dart' as path;
//
//
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: HomePage(),
//     );
//   }
//
// }
//
//
// class HomePage extends StatefulWidget {
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   String audioContent = "Audio content...";
//   //String bucketName = 'audio_to_text2';
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       appBar: AppBar(title: const Text("Test App"),),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             ElevatedButton(onPressed: pickFile, child: const Text("Upload Audio")),
//             Text(audioContent)
//           ],
//         ),
//       )
//
//     );
//   }
//
//   void pickFile() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       allowMultiple: false,
//       type: FileType.custom,
//        allowedExtensions: ['mp3'],
//     );
//
//     if (result != null) {
//       List<File> selectedFiles =
//       result.paths.map((path) => File(path!)).toList();
//
//       var file = selectedFiles[0];
//
//       uploadFileToBucket(file, 'audio_to_text2').then((url) async {
//         print(url);
//         String transcript = await fetchTranscribe(url);
//         print(transcript);
//         setState(() {
//           audioContent = transcript;
//         });
//       }).onError((err, stack){
//         log(err.toString());
//       });
//
//     }
//   }
//
//
//
//   Future<String> uploadFileToBucket(File file, String bucketName) async {
//     AuthClient authClient = await createAuthClient();
//     var storageApi = storage.StorageApi(authClient);
//     var fileBytes = file.readAsBytesSync();
//     var media = storage.Media(Stream.value(fileBytes), file.lengthSync());
//
//     String destinationFileName = "audio_file_${DateTime.now()}_${path.extension(file.path)}";
//
//     try {
//       var response = await storageApi.objects.insert(
//         storage.Object()..name = destinationFileName,
//         bucketName,
//         uploadMedia: media,
//       );
//
//       return "gs://$bucketName/${response.name}";
//
//     } finally {
//       authClient.close();
//     }
//   }
//
//
//   Future<String> fetchTranscribe(String url) async {
//     AuthClient authClient = await createAuthClient();
//     var speechClient = speech.SpeechApi(authClient);
//
//     var config = speech.RecognitionConfig(
//       audioChannelCount: 2,
//       encoding: 'MP3',
//       sampleRateHertz: 16000,
//       languageCode: 'en-US',
//     );
//
//     var recognitionAudio = speech.RecognitionAudio(uri: url);
//
//     var request = speech.LongRunningRecognizeRequest(
//       config: config,
//       audio: recognitionAudio,
//     );
//
//     var operation = await speechClient.speech.longrunningrecognize(request);
//
//     Map<String, dynamic>? response;
//
//     while(true) {
//       var process = await speechClient.operations.get(operation.name!);
//       if (process.done ?? false) {
//         response = process.response;
//         break;
//       } else {
//         await Future.delayed(const Duration(seconds: 5));
//       }
//     }
//
//     String fullTranscription = '';
//
//     if (response != null && response.containsKey('results')) {
//       List<dynamic> results = response['results'] as List<dynamic>;
//       for (var result in results) {
//         if (result is Map<String, dynamic> && result.containsKey('alternatives')) {
//           List<dynamic> alternatives = result['alternatives'] as List<dynamic>;
//
//           for (var alternative in alternatives) {
//             if (alternative is Map<String, dynamic> && alternative.containsKey('transcript')) {
//               fullTranscription += alternative['transcript'] + ' ';
//             }
//           }
//         }
//       }
//     }
//
//     return fullTranscription.trim();
//   }
//
//   Future<AuthClient> createAuthClient() async {
//     final serviceAccountCredentials = ServiceAccountCredentials.fromJson(await rootBundle.loadString('assets/pmr-medical-app-603befcf9bb7.json'));
//     const List<String> scopes = [speech.SpeechApi.cloudPlatformScope, storage.StorageApi.devstorageFullControlScope ];
//     AuthClient authClient = await clientViaServiceAccount(serviceAccountCredentials, scopes);
//     return authClient;
//   }
// }
//
//
