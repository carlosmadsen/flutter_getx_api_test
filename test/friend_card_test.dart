import 'package:flutter_scroll_api_test/components/friend_card.dart';
import 'package:flutter_scroll_api_test/entity/friend.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    "teste de tela do card de friend",
    (tester) async {
      const String name = 'Carlos';
      const String user = 'carlos.madsen';
      const String avatar = 'http://imagem.com/avatar.png';
      final Friend friend = Friend(
        name: name,
        user: user,
        avatar: avatar,
      );

      await tester.pumpWidget(FriendCard(friend: friend));
    },
  );
}
