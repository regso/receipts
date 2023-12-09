import 'package:dio/dio.dart';
import 'package:receipts/config/constants.dart';
import 'package:receipts/config/localization.dart';
import 'package:receipts/features/receipt/data/dto/remote_ingredient_dto.dart';
import 'package:receipts/features/receipt/data/dto/remote_measure_unit_dto.dart';
import 'package:receipts/features/receipt/data/dto/remote_receipt_ingredient_dto.dart';
import 'package:receipts/features/receipt/data/dto/remote_receipt_dto.dart';
import 'package:receipts/features/receipt/data/models/ingredient_model.dart';
import 'package:receipts/features/receipt/data/models/receipt_model.dart';

class RemoteReceiptDataSource {
  final Dio dio;

  RemoteReceiptDataSource({required this.dio});

  Future<List<ReceiptModel>> findReceipts() async {
    final Response response = await dio.get(Constants.apiGetReceiptUrl);
    final List<dynamic> receiptsDecodedJson = response.data as List<dynamic>;

    return receiptsDecodedJson
        .map(
          (data) => ReceiptModel.fromRemoteReceiptDto(
            RemoteReceiptDto.fromJson(data),
          ),
        )
        .toList();
  }

  Future<List<IngredientModel>> findIngredientsByReceiptId(
    int receiptId,
  ) async {
    final receiptIngredientDtoList =
        await _findReceiptIngredientDtoListByReceiptId(
      receiptId,
    );
    final ingredientDtoMap = await _getRemoteIngredientDtoMap();
    final measureUnitDtoMap = await _getMeasureUnitDtoMap();

    return receiptIngredientDtoList.map(
      (RemoteReceiptIngredientDto dto) {
        final ingredientDto = ingredientDtoMap[dto.ingredientIdDto.id]!;
        final measureUnitDto =
            measureUnitDtoMap[ingredientDto.measureUnitIdModel.id]!;
        return IngredientModel(
          id: ingredientDto.id,
          title: ingredientDto.name,
          amount: dto.count,
          measure: Localization.getMorph(
            dto.count,
            [measureUnitDto.one, measureUnitDto.few, measureUnitDto.many],
          ),
        );
      },
    ).toList();
  }

  Future<Map<int, RemoteIngredientDto>> _getRemoteIngredientDtoMap() async {
    final response = await dio.get(Constants.apiGetIngredientUrl);
    final decodedJsonList = response.data as List<dynamic>;
    final ingredientDtoItr =
        decodedJsonList.map((data) => RemoteIngredientDto.fromJson(data));
    return {for (RemoteIngredientDto dto in ingredientDtoItr) dto.id: dto};
  }

  Future<Map<int, RemoteMeasureUnitDto>> _getMeasureUnitDtoMap() async {
    final Response response = await dio.get(Constants.apiGetMeasureUnitUrl);
    final List<dynamic> unitsDecodedJson = response.data as List<dynamic>;
    final Iterable<RemoteMeasureUnitDto> unitsDto =
        unitsDecodedJson.map((data) {
      return RemoteMeasureUnitDto.fromJson(data);
    });
    return {for (RemoteMeasureUnitDto dto in unitsDto) dto.id: dto};
  }

  Future<List<RemoteReceiptIngredientDto>>
      _findReceiptIngredientDtoListByReceiptId(
    int receiptId,
  ) async {
    final Response response = await dio.get(
      Constants.apiGetReceiptIngredientUrl,
    );
    final List<dynamic> receiptIngredientDecodedJson =
        response.data as List<dynamic>;
    return receiptIngredientDecodedJson
        .map((data) {
          return RemoteReceiptIngredientDto.fromJson(data);
        })
        .where((model) => model.receiptIdDto.id == receiptId)
        .toList();
  }
}
