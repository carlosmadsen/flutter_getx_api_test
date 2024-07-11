import 'package:flutter/widgets.dart';
import 'package:flutter_scroll_api_test/screens/domain/entity/friend.dart';

class ImageService {
  Image getImage(Friend friend) {
    return Image.network(friend.avatar, width: 70, height: 70);
  }
}
