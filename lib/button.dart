import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';  // For picking images
import 'package:camera/camera.dart';  // For camera access
import 'package:google_ml_kit/google_ml_kit.dart';  // For OCR


void main() {
  runApp(MyApp()); // Entry point for the app
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CameraAndOCRScreen(),
    );
  }
}

class CameraAndOCRScreen extends StatefulWidget {
  @override
  _CameraAndOCRScreenState createState() => _CameraAndOCRScreenState();
}

class _CameraAndOCRScreenState extends State<CameraAndOCRScreen> {
  CameraController? _controller; // Make controller nullable
  late Future<void> _initializeControllerFuture;
  final ImagePicker _picker = ImagePicker();
  String _ocrText = "Scan a food product to extract text.";

  // Function to initialize the camera
  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    _controller = CameraController(
      firstCamera,
      ResolutionPreset.high,
    );

    _initializeControllerFuture = _controller!.initialize(); // Use '!' to safely access
  }

  @override
  void initState() {
    super.initState();
    _initializeCamera(); // Initialize the camera when the screen is created
  }

  // Function to take a picture using the camera
  Future<void> _takePicture() async {
    if (_controller == null || !_controller!.value.isInitialized) {
      setState(() {
        _ocrText = "Camera is not initialized.";
      });
      return;
    }

    try {
      await _initializeControllerFuture;

      final XFile? imageFile = await _controller!.takePicture();

      if (imageFile != null) {
        _processImage(imageFile);
      }
    } catch (e) {
      setState(() {
        _ocrText = "Error taking picture: $e";
      });
    }
  }

  // Function to process the image for OCR
  Future<void> _processImage(XFile imageFile) async {
    final inputImage = InputImage.fromFilePath(imageFile.path);

    final textRecognizer = GoogleMlKit.vision.textRecognizer();

    try {
      final RecognizedText recognizedText = await textRecognizer.processImage(inputImage);

      setState(() {
        _ocrText = recognizedText.text.isEmpty
            ? "No text detected."
            : recognizedText.text;
      });
    } catch (e) {
      setState(() {
        _ocrText = "Error during OCR: $e";
      });
    } finally {
      textRecognizer.close();
    }
  }

  // Function to pick an image from gallery or camera
  Future<void> _pickImageFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      _processImage(image);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Camera and OCR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: _takePicture,
            child: Text('Take Picture with Camera'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _pickImageFromGallery,
            child: Text('Pick Image from Gallery'),
          ),
          SizedBox(height: 20),
          Text(
            _ocrText,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
