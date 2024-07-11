import 'package:flutter_scroll_api_test/screens/domain/entity/friend.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Friend with id null", () {
    const String name = "Carlos";
    const String avatar = "Avatar";
    const String user = 'carlos';
    final Friend friend = Friend(name: name, avatar: avatar, user: user);
    Map<String, dynamic> map = friend.toMap();

    expect(friend.id, null);
    expect(friend.avatar, avatar);
    expect(friend.user, user);
    expect(friend.name, name);

    expect(map['id'], null);
    expect(map['avatar'], avatar);
    expect(map['user'], user);
    expect(map['name'], name);
  });
  test("Friend with id not null", () {
    const int id = 123;
    const String name = "José";
    const String avatar = "maria";
    const String user = 'adroaldo';
    final Friend friend =
        Friend(id: id, name: name, avatar: avatar, user: user);
    Map<String, dynamic> map = friend.toMap();

    expect(friend.id, id);
    expect(friend.avatar, avatar);
    expect(friend.user, user);
    expect(friend.name, name);

    expect(map['id'], id);
    expect(map['avatar'], avatar);
    expect(map['user'], user);
    expect(map['name'], name);
  });
  test("Compare two equals friends", () {
    final Friend friend1 = Friend(
      id: 123,
      name: 'Carlos',
      avatar: 'Avatar',
      user: 'carlos',
    );
    final Friend friend2 = Friend(
      id: 123,
      name: 'Carlos',
      avatar: 'Avatar',
      user: 'carlos',
    );
    expect(friend1 == friend2, isTrue);
  });
}
