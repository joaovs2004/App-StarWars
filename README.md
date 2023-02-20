# Terceiro teste da Escribo

Objetivo: Desenvolver um aplicativo de listagem de filmes e personagens de Star Wars.

Deve contemplar as seguintes funcionalidades:
- Um menu onde seja possível ao usuário editar seu avatar.
    - O aplicativo deve guardar as configurações de avatar selecionadas
pelo usuário e reexibir sempre que a tela de avatar for acessada ou
quando o aplicativo for reiniciado.
- Exibir duas listas: uma com os filmes e outra com os personagens de Star
Wars.
- Cada item da lista deve ter um botão que adiciona o item para a lista de
favoritos.
- Deve ser possível exibir a lista de favoritos do usuário, com destaques em
verde para personagens favoritos e em vermelho para filmes favoritos.
- Os dados deverão ser requisitados dessa API: https://swapi.dev/documentation
    - As entradas e saídas esperadas da API estão detalhados nas seguintes
páginas:
        - https://swapi.dev/documentation#people
        - https://swapi.dev/documentation#films
- As funcionalidades de favoritos e edição de estado do avatar devem ser salvas em
um banco de dados local.
- Deve ter um botão que exibe uma webview onde o usuário pode acessar o site
https://www.starwars.com/community dentro do aplicativo
- Quando se está na página de edição de avatar ou na página de visualização do
website, apertar novamente os botões de avatar ou de website faz com que o
aplicativo volte à exibição das listas de filmes, personagens e favoritos.

## Pré-requisitos

- [Flutter](https://docs.flutter.dev/get-started/install)

## Como rodar

Para rodar em um android real, baixe o apk no link: https://github.com/joaovs2004/Teste03-Escribo/releases/tag/v1.0.0 , instale e é só abrir.

Caso queria rodar no Pc com um emulador de android

```bash
# Primeiramente clone o projeto com
$ git clone https://github.com/joaovs2004/App-StarWars
# Entre na pasta do projeto
$ cd App-StarWars/
# Instale as dependencias com
$ flutter pub get
```

Abra a pasta do projeto na IDE e rode o codigo com seu emulador

## Screenshots do Projeto

### Página Principal

<table>
  <tr>
    <td>Página de filmes</td>
    <td>Página de Personagens</td>
  </tr>
  <tr>
    <td><img src="https://i.postimg.cc/YSC83hTJ/filmes.png" width=270 height=480></td>
    <td><img src="https://i.postimg.cc/hvsfpPk5/personagens.png" width=270 height=480></td>
  </tr>
  <tr>
    <td>Página de favoritos</td>
  </tr>
  <tr>
    <td><img src="https://i.postimg.cc/HsfCFCTZ/favoritos.png" width=270 height=480></td>
  </tr>
 </table>

### Página com a WebView
![Webview](https://i.postimg.cc/ZKvG8D6r/webview.png)

### Página de Edição do Avatar
![Avatar](https://i.postimg.cc/1R8mdBpz/avatar.png)
