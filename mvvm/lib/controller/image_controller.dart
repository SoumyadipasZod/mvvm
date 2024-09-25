import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../configure/injection.config.dart';
import '../model/image_model.dart';
import '../repository/image_repository/image_repo.dart';
import '../utils/dispose_safe_notifier.dart';
import '../utils/utils.dart';



class ImageListProvider extends DisposeSafeChangeNotifier{
  // final imageRepo = ImageRepo();
  ImageRepo? _imageRepoImpl = getIt<ImageRepo>();
  // List<UserModel> userData = [];
  List<Hits> imagesData = [];
  Future<void> getImages({
    required bool isReset,
    required String query,
    required int page ,
    required int per_page
    }) async{
    EasyLoading.show(
        status: "Loading", indicator: const CircularProgressIndicator());
    try {
      await _imageRepoImpl!.getImages(
      q: query,
      page: page,
      per_page: per_page
      ).then((value){
        log("Value.data : ${value.data}");

        ImageModel imageModel=value.data;
        if (imageModel.hits != null) {
          if (imageModel.hits!.isNotEmpty) {
            if (isReset == true) {
              imagesData.clear();
            }
            imagesData.addAll(imageModel.hits!);
            Utils.printInLog("imageslength : ${imagesData.length}");
            notifyListeners();
          }
        }else{
          Utils.printInLog("No data");
          imagesData = [];
        }
        EasyLoading.dismiss();

    });
    } catch (e) {
      Utils.printInLog("No data");
      EasyLoading.dismiss();
    }
    
  }
}