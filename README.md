# Projeto POC: Aplicativo de Localização de Pontos de Interesse

Descrição:
Desenvolva um aplicativo que permita ao usuário visualizar e adicionar pontos de interesse (POIs) em um mapa.
O aplicativo deve utilizar geolocalização para identificar a localização atual do usuário e exibir um mapa interativo com a opção de adicionar e visualizar os POIs.
O gerenciamento de estado deve ser feito usando GetX ou Riverpod.

Funcionalidades:
Exibir Localização Atual:

O aplicativo deve detectar e exibir a localização atual do usuário em um mapa usando o Google Maps.
A localização deve ser gerenciada através de GetX ou Riverpod para refletir mudanças em tempo real.
Adicionar Pontos de Interesse:

O usuário deve poder clicar em um ponto no mapa ou em um botão para adicionar um POI.
Cada POI deve ter um título, descrição e categoria (por exemplo, "Restaurante", "Parque", "Loja").
O estado dos POIs deve ser gerenciado com GetX ou Riverpod, garantindo que qualquer mudança seja refletida automaticamente na interface.
Visualizar Pontos de Interesse:

Todos os POIs adicionados devem ser marcados no mapa com ícones personalizados, dependendo da categoria.
O usuário deve poder clicar em um POI para ver mais detalhes, como título e descrição.
O gerenciamento de estado deve assegurar que a lista de POIs esteja sempre atualizada.
Navegação até o POI:

Os POIs devem ser armazenados localmente (SQLite),
de modo que eles permaneçam disponíveis mesmo após o fechamento do aplicativo.
Utilize GetX ou Riverpod para gerenciar o estado de carregamento e armazenamento dos dados.

Desenvolvido em Flutter versão 3.19.6
