import 'package:flutter_scroll_api_test/screens/domain/entity/friend.dart';

class RepoFriendsTest {
  static List<Friend> getFriends() {
    List<Map<String, dynamic>> listMap = [
      {
        "name": "Denise Gutkowski",
        "avatar":
            "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/735.jpg",
        "user": "Cole60",
        "id": "1"
      },
      {
        "name": "Ms. Angelica Halvorson",
        "avatar":
            "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1208.jpg",
        "user": "Vincent.Hills",
        "id": "2"
      },
      {
        "name": "Belinda Lowe",
        "avatar":
            "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/382.jpg",
        "user": "Clovis75",
        "id": "3"
      },
      {
        "name": "Carole Ernser III",
        "avatar":
            "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/720.jpg",
        "user": "Desmond1",
        "id": "4"
      },
      {
        "name": "Domingo Dickens",
        "avatar":
            "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/346.jpg",
        "user": "Larissa_Koch66",
        "id": "5"
      },
      {
        "name": "Jermaine Doyle",
        "avatar":
            "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/832.jpg",
        "user": "Dannie.Collier13",
        "id": "6"
      },
      {
        "name": "Garry Price",
        "avatar":
            "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/577.jpg",
        "user": "Melba18",
        "id": "7"
      },
      {
        "name": "Joanna Denesik",
        "avatar":
            "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/760.jpg",
        "user": "Reyes86",
        "id": "8"
      },
      {
        "name": "Joyce Lakin",
        "avatar":
            "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1161.jpg",
        "user": "Dennis58",
        "id": "9"
      },
      {
        "name": "Josephine Turner",
        "avatar":
            "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/469.jpg",
        "user": "Jennifer_Sauer1",
        "id": "10"
      },
      {
        "name": "Jim MacGyver",
        "avatar":
            "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/488.jpg",
        "user": "Mafalda_Homenick",
        "id": "11"
      },
      {
        "name": "Jaime Langosh",
        "avatar":
            "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/906.jpg",
        "user": "Elsie41",
        "id": "12"
      },
      {
        "name": "Sadie Boyle",
        "avatar":
            "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/470.jpg",
        "user": "Claire.Kuvalis18",
        "id": "13"
      },
      {
        "name": "Randall Hickle",
        "avatar":
            "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/594.jpg",
        "user": "Rogelio4",
        "id": "14"
      },
      {
        "name": "Edna Fisher",
        "avatar":
            "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/944.jpg",
        "user": "Ismael.Buckridge91",
        "id": "15"
      },
      {
        "name": "Alyssa Johnson",
        "avatar":
            "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/484.jpg",
        "user": "Michel.Dooley",
        "id": "16"
      },
      {
        "name": "Aaron Hettinger",
        "avatar":
            "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/304.jpg",
        "user": "Shyann48",
        "id": "17"
      },
      {
        "name": "Carmen DuBuque",
        "avatar":
            "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/52.jpg",
        "user": "Lee.Beier",
        "id": "18"
      },
      {
        "name": "Clyde DuBuque",
        "avatar":
            "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/900.jpg",
        "user": "Lawson_Baumbach",
        "id": "19"
      },
      {
        "name": "Julian Herman",
        "avatar":
            "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/205.jpg",
        "user": "Felton19",
        "id": "20"
      },
      {
        "name": "Pablo Schneider DDS",
        "avatar":
            "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/216.jpg",
        "user": "Hannah.Brown17",
        "id": "21"
      },
      {
        "name": "Nathan Herzog",
        "avatar":
            "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/533.jpg",
        "user": "Myah.Murphy49",
        "id": "22"
      },
      {
        "name": "Belinda Renner",
        "avatar":
            "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/41.jpg",
        "user": "Aaliyah_Howe",
        "id": "23"
      },
      {
        "name": "Jodi Larson III",
        "avatar":
            "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/636.jpg",
        "user": "Omari.Medhurst1",
        "id": "24"
      },
      {
        "name": "Felipe Reilly",
        "avatar":
            "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/860.jpg",
        "user": "John.Hermiston",
        "id": "25"
      },
      {
        "name": "Kevin Shields",
        "avatar":
            "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/751.jpg",
        "user": "Destini_Braun",
        "id": "26"
      },
      {
        "name": "Lester Maggio",
        "avatar":
            "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/809.jpg",
        "user": "Ari47",
        "id": "27"
      }
    ];

    List<Friend> friends = [];
    for (var map in listMap) {
      friends.add(Friend.fromMap(map));
    }
    return friends;
  }
}
