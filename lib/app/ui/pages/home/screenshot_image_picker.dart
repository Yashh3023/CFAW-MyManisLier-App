import 'dart:io';
import 'package:mymanislier/app/utils/helpers/exporter.dart';

class ImagePickerWidget extends StatefulWidget {
  final Function(List<File>) onImagesSelected;

  const ImagePickerWidget({
    super.key,
    required this.onImagesSelected,
  });

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  final List<File> _selectedImages = [];
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImages() async {
    try {
      final List<XFile> images = await _picker.pickMultiImage(
        imageQuality: 70,
      );

      if (images.isNotEmpty) {
        setState(() {
          _selectedImages.addAll(images.map((image) => File(image.path)));
        });
        widget.onImagesSelected(_selectedImages);
      }
    } catch (e) {
      debugPrint('Error picking images: $e');
    }
  }

  void _removeImage(int index) {
    setState(() {
      _selectedImages.removeAt(index);
    });
    widget.onImagesSelected(_selectedImages);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: _pickImages,
          child: Container(
            width: double.infinity,
            height: 147.h,
            decoration: BoxDecoration(
              color: Get.theme.customColors.greyBg,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: CustomPaint(
              painter: DashedBorderPainter(),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      radius: 23.r,
                      backgroundColor: Get.theme.customColors.black,
                      child: CustomImageView(
                        imagePath: AssetConstants.icUpload,
                      ),
                    ),
                    Gap(5.h),
                    Text(
                      AppStrings.T.lbl_upload_screenshots,
                      style: Get.theme.textTheme.labelSmall!.copyWith(
                        color: Get.theme.customColors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Gap(16.h),
        Text(
          AppStrings.T.lbl_image_suport_message,
          style: Get.theme.textTheme.labelSmall!.copyWith(
            color: Get.theme.customColors.greyTextColor,
          ),
        ),
        if (_selectedImages.isNotEmpty) ...[
          Gap(25.h),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _selectedImages.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                    left: 8.w,
                    right: 8.w,
                    top: 10.h,
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12.r),
                        child: Image.file(
                          _selectedImages[index],
                          fit: BoxFit.cover,
                          width: 75.w,
                          height: 79.h,
                        ),
                      ),
                      Positioned(
                        top: -20.h,
                        right: -20.w,
                        child: IconButton(
                          onPressed: () => _removeImage(index),
                          icon: Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: Get.theme.customColors.red,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.close,
                              color: Get.theme.customColors.white,
                              size: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ],
    );
  }
}
