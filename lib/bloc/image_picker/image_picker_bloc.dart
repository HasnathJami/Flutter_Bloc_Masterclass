import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_masterclass/bloc/image_picker/image_picker_events.dart';
import 'package:flutter_bloc_masterclass/bloc/image_picker/image_picker_states.dart';
import 'package:flutter_bloc_masterclass/utils/image_picker_utils.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerStates> {
  final ImagePickerUtils imagePickerUtils;

  ImagePickerBloc(this.imagePickerUtils) : super(const ImagePickerStates()) {
    on<CameraCapture>(_cameraCapture);
    on<GalleryImagePicker>(_galleryImagePicker);
  }

  void _cameraCapture(CameraCapture events,
      Emitter<ImagePickerStates> states) async {
    XFile? file = await imagePickerUtils.cameraCapture();
    emit(state.copyWith(file: file));
  }

  void _galleryImagePicker(GalleryImagePicker events,
      Emitter<ImagePickerStates> states) async {
    XFile? file = await imagePickerUtils.pickImageFromGallery();
    emit(state.copyWith(file: file));
  }
}
