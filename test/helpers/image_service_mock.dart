import 'package:flutter_scroll_api_test/core/util/image_service.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_scroll_api_test/screens/domain/entity/friend.dart';

class ImageServiceMock extends Mock implements ImageService {
  static void whenGetImage(
      ImageService imageService, Friend friend, String avatarAsset) {
    when(() => imageService.getImage(friend))
        .thenAnswer((_) => Image.asset(avatarAsset, width: 70, height: 70));
  }
}
