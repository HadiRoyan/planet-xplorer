import 'package:flutter/material.dart';

class ImageAssetBuilder extends StatefulWidget {
  const ImageAssetBuilder({this.imageUrlFromAssets, super.key});

  final String? imageUrlFromAssets;

  @override
  State<ImageAssetBuilder> createState() => _ImageAssetBuilderState();
}

class _ImageAssetBuilderState extends State<ImageAssetBuilder> {
  bool _isLoading = true;
  bool _imageNotFound = false;
  bool _hasError = false;

  ImageProvider? _imageProvider;

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  void _loadImage() {
    if (widget.imageUrlFromAssets == null) {
      setState(() {
        _isLoading = false;
        _imageNotFound = true;
      });
      return;
    }

    _imageProvider = AssetImage(widget.imageUrlFromAssets!);
    final imageStream = _imageProvider!.resolve(ImageConfiguration.empty);

    imageStream.addListener(ImageStreamListener(
      (info, synchronousCall) {
        if (mounted) {
          setState(() {
            _isLoading = false;
            _hasError = false;
            _imageNotFound = false;
          });
        }
      },
      onError: (dynamic exception, StackTrace? stackTrace) {
        // ignore: avoid_print
        print('$exception\n');
        if (exception.toString().contains('Asset not found')) {
          setState(() {
            _isLoading = false;
            _imageNotFound = true;
          });
        } else {
          if (mounted) {
            setState(() {
              _isLoading = false;
              _hasError = true;
            });
          }
        }
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    // print('${widget.imageUrlFromAssets}: ['
    //     'is loading=$_isLoading, '
    //     'is image not found=$_imageNotFound, '
    //     'has error=$_hasError'
    //     ']');
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      );
    }

    if (_imageNotFound) {
      return Container(
        color: Colors.grey[800],
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.image_not_supported_outlined,
                color: Colors.white70,
                size: 40,
              ),
              SizedBox(height: 8),
              Text(
                'Image not found',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      );
    }

    if (_hasError) {
      return Container(
        color: Colors.grey[800],
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                color: Colors.white70,
                size: 40,
              ),
              SizedBox(height: 8),
              Text(
                'Error loading image',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Image.asset(
      widget.imageUrlFromAssets!,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          color: Colors.grey[800],
          child: const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.error_outline,
                  color: Colors.white70,
                  size: 40,
                ),
                SizedBox(height: 8),
                Text(
                  'Error loading image',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
