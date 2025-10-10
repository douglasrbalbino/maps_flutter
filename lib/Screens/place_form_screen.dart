import 'package:flutter/material.dart';
import 'package:maps_application/Widgets/image_input.dart';

class PlaceFormScreen extends StatefulWidget {
  const PlaceFormScreen({Key? key}) : super(key: key);

  @override
  State<PlaceFormScreen> createState() => _PlaceFormScreenState();
}

class _PlaceFormScreenState extends State<PlaceFormScreen> {
  final _titleController = TextEditingController();

  void _submitForm() {} // metodo do botão

  // File _pickedImage;
  // LatLng _pickedPosition;

  // void _selectImage(File pickedImage) {
  //   setState(() {
  //     _pickedImage = pickedImage;
  //   });
  // }

  // void _selectPosition(LatLng position) {
  //   setState(() {
  //     _pickedPosition = position;
  //   });
  // }

  // bool _isValidForm() {
  //   return _titleController.text.isNotEmpty &&
  //       _pickedImage != null &&
  //       _pickedPosition != null;
  // }

  // void _submitForm() {
  //   if (!_isValidForm()) return;

  //   Provider.of<GreatPlaces>(
  //     context,
  //     listen: false,
  //   ).addPlace(_titleController.text, _pickedImage, _pickedPosition);
  //   Navigator.of(context).pop();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Adicionar Imagem')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            //ocupa o espaço todo da tela ou que o elemento tiver para ocupar
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: _titleController,
                      decoration: InputDecoration(labelText: 'Título'),
                    ),

                    const SizedBox(height: 10),
                    const ImageInput(),
                  ],
                ),
              ),
            ),
          ),

          ElevatedButton.icon(
            icon: const Icon(Icons.add),
            label: const Text('Adicionar'),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: Theme.of(context).colorScheme.secondary,
              elevation: 0,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            onPressed: _submitForm,
          ),
        ],
      ),
    );
  }
}
