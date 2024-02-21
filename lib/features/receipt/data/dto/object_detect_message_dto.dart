import 'dart:typed_data';

import 'package:flutter/services.dart';

class ObjectDetectMessageDto {
  final Uint8List photo;
  late Uint8List model;
  late Uint8List labels;

  ObjectDetectMessageDto({required this.photo});

  factory ObjectDetectMessageDto.fromBytes(Uint8List bytes) {
    int photoEndIndex = bytes.indexOf(0);
    final photo = bytes.sublist(0, photoEndIndex);
    int modelEndIndex = bytes.indexOf(0, photoEndIndex + 1);
    final model = bytes.sublist(photoEndIndex + 1, modelEndIndex);
    final labels = bytes.sublist(modelEndIndex + 1);

    return ObjectDetectMessageDto(photo: photo)
      ..model = model
      ..labels = labels;
  }

  Future<void> loadFromAssets({
    required String modelPath,
    required String labelsPath,
  }) async {
    final modelBytes = await rootBundle.load(modelPath);
    model = modelBytes.buffer.asUint8List();
    final labelsBytes = await rootBundle.load(labelsPath);
    labels = labelsBytes.buffer.asUint8List();
  }

  Uint8List toBytes() {
    BytesBuilder bytesBuilder = BytesBuilder();
    bytesBuilder.add(photo);
    bytesBuilder.add([0]);
    bytesBuilder.add(model);
    bytesBuilder.add([0]);
    bytesBuilder.add(labels);
    return bytesBuilder.toBytes();
  }
}
