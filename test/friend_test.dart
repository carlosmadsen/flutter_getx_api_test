import 'package:flutter_scroll_api_test/entity/friend.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Friend toMap", () {
    test("Friend model toMap id null", () {
      const String name = 'Carlos';
      const String user = 'carlos.madsen';
      const String avatar = 'http://imagem.com/avatar.png';
      final Friend friend = Friend(
        name: name,
        user: user,
        avatar: avatar,
      );
      Map<String, dynamic> map = friend.toMap();

      //teste
      expect(map["id"], null);
      expect(map["name"], name);
      expect(map["user"], user);
      expect(map["avatar"], avatar);
    });

    test("Friend model toMap id not null", () {
      const int id = 1510;
      const String name = 'Carlos';
      const String user = 'carlos.madsen';
      const String avatar = 'http://imagem.com/avatar.png';
      final Friend friend = Friend(
        id: id,
        name: name,
        user: user,
        avatar: avatar,
      );
      Map<String, dynamic> map = friend.toMap();

      //teste
      expect(map["id"], id);
      expect(map["name"], name);
      expect(map["user"], user);
      expect(map["avatar"], avatar);
    });
  });
}
