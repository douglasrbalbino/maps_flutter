// gerenciar imagem

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;

class ImageInput extends StatefulWidget {
  final Function onSelectImage; // quando a imagem éselecionada

  const ImageInput(this.onSelectImage, {Key? key}) //construtor da função
    : super(key: key);

  @override
  State<ImageInput> createState() => _imageInputState();
}

class _imageInputState extends State<ImageInput> {
  File? _storedImage;

  // Construindo o método
  _takePicture() async {
    final ImagePicker picker = ImagePicker();
    XFile imageFile =
        await picker.pickImage(source: ImageSource.camera, maxWidth: 600)
            as XFile;

    setState(() {
      _storedImage = File(imageFile.path);
    });

    final appDir = await syspaths
        .getApplicationDocumentsDirectory(); // diretório onde irá salvar a imagem

    String fileName = path.basename(
      _storedImage!.path,
    ); // pega o nome da imagem para colocar no diretório

    final savedImage = await _storedImage!.copy('${appDir.path}/$fileName');

    // chama a função "callback" queavisa o formulário quando essa imagem for chamada
    widget.onSelectImage(savedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      // preview da imagem
      children: [
        Container(
          width: 180,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          alignment: Alignment.center,
          // condição para a imagem pegar um arquivo de um diretório, caso contrário "Nenhuma Imagem"
          child: _storedImage != null
              ? Image.file(
                  _storedImage!,
                  width: double.infinity,
                  fit: BoxFit.cover,
                )
              : const Text("Nenhuma Imagem"),
        ),
        SizedBox(width: 10),
        Expanded(
          child: TextButton.icon(
            icon: const Icon(Icons.camera),
            label: const Text('Tirar foto'),
            onPressed: _takePicture,
          ),
        ),
      ],
    );
  }
}
