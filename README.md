# Flutter: Estudo de carga de API com GETX e apresentação em ListView.

Para rodar esse projeto você pode criar um mockapi em https://mockapi.io/ com o endpoint "friends" com a seguinte estrutura: 

| Atributo | Tipo | Função geradora |
| ------ | ------ | ------ |
| id |  Object ID | - |
| name | Faker.js | name.fullName |
| avatar |  Faker.js | image.avatar |
| user |  Faker.js | internet.userName |

Edite o arquivo ".env" colocando o url da api no atributo "apiBaseUrl" e o endpoint no atributo "endPointFriends".

Por exemplo, se a url completa for "https://66720d10e083e62ee43de76e.mockapi.io/friends/" você deve preencher da seguinte forma: 

```env
apiBaseUrl=https://66720d10e083e62ee43de76e.mockapi.io/
endPointFriends=friends
```
