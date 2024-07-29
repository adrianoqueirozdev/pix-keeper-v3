# Pix Keeper

`Pix Keeper` é um aplicativo simples desenvolvido em Flutter projetado para gerenciar chaves Pix, oferecendo recursos como criação, atualização e exclusão de chaves, além de autenticação e mais.
## Estrutura do Projeto

O projeto é organizado de acordo com os princípios da `Clean Architecture`, que promove a separação de responsabilidades e a facilidade de manutenção. Abaixo está uma descrição da estrutura do projeto e o propósito de cada diretório.

### lib/

#### `lib/app.dart`
Este é o ponto de entrada principal do aplicativo Flutter. Ele configura o GetMaterialApp e aplica o tema e a rota inicial.

#### `lib/app_controller.dart`
Contém o controlador principal da aplicação, responsável por gerenciar estados globais como o tema atual (modo claro ou escuro) e etc.

#### `lib/config/`
Arquivos de configuração e definições para o aplicativo.

- `dependency_injection.dart`: Configura a injeção de dependência para o app.
- `firebase_config.dart`: Configura as definições do Firebase.
- `logger_config.dart`: Configura o logger para o aplicativo.
- `routes.dart`: Define as rotas do aplicativo.

#### `lib/core/`
Contém as camadas de domínio e dados centrais da aplicação.

- `data/`: Contém modelos, serviços de rede e implementações de repositórios.
  - `models/`: Define os modelos de dados usados em toda a aplicação.
    - `info_bank_app_model.dart`
    - `participants_pix_model.dart`
    - `pix_key_model.dart`
    - `...`
  - `network/`: Contém definições de serviços de API.
    - `pix_keeper_api.dart`
    - `...`
  - `repositories/`: Implementa padrões de repositório para acesso a dados.
    - `authentication_repository_impl.dart`
    - `participants_pix_repository_impl.dart`
    - `pix_keys_repository_impl.dart`
    - `...`
- `domain/`: Contém a lógica de negócios principal, casos de uso e interfaces de repositórios.
  - `common/`: Entidades de domínio compartilhadas ou objetos de valor.
    - `no_params.dart`
    - `...`
  - `repositories/`: Define as interfaces dos repositórios.
    - `authentication_repository.dart`
    - `participants_pix_repository.dart`
    - `pix_keys_repository.dart`
    - `...`
  - `usecases/`: Define os casos de uso para a aplicação, encapsulando a lógica de negócios.
    - `check_authentication_status.dart`
    - `copy_and_open_bank.dart`
    - `create_pix_key.dart`
    - `...`
- `presentation/`: Gerencia a camada de apresentação, incluindo BLoCs e tema da interface.
  - `blocs/`: Gerencia o estado usando o padrão BLoC.
    - `participants_pix/`
    - `pix_key/`
    - `pix_keys_deleted/`
    - `...`
  - `factories/`: Contém fábricas para criação de instâncias de BLoC.
  - `theme/`: Define o tema da aplicação.
    - `app_theme.dart`
    - `...`
- `utils/`: Classes utilitárias e ajudantes.
  - `user_manager.dart`
  - `...`

#### `lib/presentation/`
Contém a camada de interface do usuário da aplicação.

- `home/`: Define a página inicial e seus componentes.
  - `home_page.dart`
  - `home_page_controller.dart`
  - `widgets/`
    - `pix_key_item.dart`
    - `...`
- `login/`: Gerencia a página de login e sua lógica.
  - `login_page.dart`
  - `login_page_controller.dart`
- `pix_key_details/`: Exibe os detalhes de uma chave Pix.
  - `pix_key_details_page.dart`
  - `pix_key_details_controller.dart`
  - `widgets/`
    - `...`
- `pix_key_form/`: Lida com operações do formulário de chave Pix.
  - `pix_key_form_page.dart`
  - `pix_key_form_page_controller.dart`
  - `widgets/`
    - `...`
- `profile/`: Exibe o perfil do usuário.
  - `profile_page.dart`
  - `profile_page_controller.dart`
  - `widgets/`
    - `user_profile_info.dart`
    - `...`
- `splash/`: Exibe a tela de splash.
  - `splash_page.dart`
  - `splash_page_controller.dart`
- `trash_can/`: Gerencia a visualização da lixeira para chaves Pix deletadas.
  - `trash_can_page.dart`
  - `trash_can_page_controller.dart`
  - `widgets/`
    - `trash_can_pix_keys_list.dart`
    - `...`

#### `lib/shared/`
Contém recursos e widgets compartilhados usados em toda a aplicação.

- `constants/`: Define constantes de aplicação.
  - `app_constants.dart`
  - `app_fonts.dart`
  - `app_images.dart`
  - `app_routes.dart`
  - `environments.dart`
  - `firebase_collections.dart`
  - `...`
- `controllers/`: Controladores compartilhados.
  - `copy_controller.dart`
- `utils/`: Funções utilitárias compartilhadas.
  - `bank_apps.dart`
  - `format_pix_key_copy_all.dart`
  - `get_unmask_value.dart`
  - `pix_key_types.dart`
  - `validate_uuid.dart`
  - `validation_pix_key_form.dart`
  - `...`
- `widgets/`: Widgets compartilhados.
  - `bank_icon_button.dart`
  - `banks_list.dart`
  - `base_widget.dart`
  - `content_item.dart`
  - `custom_icon_button.dart`
  - `empty_state.dart`
  - `load_data_error.dart`
  - `modal_bottom_sheet_base.dart`
  - `pix_keys_list_skeleton.dart`
  - `profile_avatar.dart`
  - `shimmer_item.dart`
  - `...`

```text
├── lib
│   ├── app.dart
│   ├── app_controller.dart
│   ├── config
│   │   ├── dependency_injection.dart
│   │   ├── firebase_config.dart
│   │   ├── logger_config.dart
│   │   └── routes.dart
│   ├── core
│   │   ├── data
│   │   │   ├── models
│   │   │   │   ├── info_bank_app_model.dart
│   │   │   │   ├── info_bank_app_model.g.dart
│   │   │   │   ├── participants_pix_model.dart
│   │   │   │   ├── participants_pix_model.g.dart
│   │   │   │   ├── pix_key_model.dart
│   │   │   │   ├── pix_key_model.g.dart
│   │   │   │   ├── pix_key_type.dart
│   │   │   │   ├── pix_key_type_option_model.dart
│   │   │   │   └── pix_key_type_option_model.g.dart
│   │   │   ├── network
│   │   │   │   └── pix_keeper_api.dart
│   │   │   └── repositories
│   │   │       ├── authentication_repository_impl.dart
│   │   │       ├── participants_pix_repository_impl.dart
│   │   │       └── pix_keys_repository_impl.dart
│   │   ├── domain
│   │   │   ├── common
│   │   │   │   └── no_params.dart
│   │   │   ├── repositories
│   │   │   │   ├── authentication_repository.dart
│   │   │   │   ├── base_repository.dart
│   │   │   │   ├── participants_pix_repository.dart
│   │   │   │   └── pix_keys_repository.dart
│   │   │   └── usecases
│   │   │       ├── check_authentication_status.dart
│   │   │       ├── copy_and_open_bank.dart
│   │   │       ├── copy_pix_key.dart
│   │   │       ├── copy_text.dart
│   │   │       ├── create_pix_key.dart
│   │   │       ├── delete_all_pix_keys.dart
│   │   │       ├── delete_pix_key.dart
│   │   │       ├── get_all_participants_pix.dart
│   │   │       ├── get_all_pix_keys.dart
│   │   │       ├── get_all_pix_keys_deleted.dart
│   │   │       ├── logout_user.dart
│   │   │       ├── open_app.dart
│   │   │       ├── restore_pix_key.dart
│   │   │       ├── sign_in_with_google.dart
│   │   │       ├── update_pix_key.dart
│   │   │       └── use_case.dart
│   │   ├── presentation
│   │   │   ├── blocs
│   │   │   │   ├── participants_pix
│   │   │   │   │   ├── participants_pix_bloc.dart
│   │   │   │   │   ├── participants_pix_events.dart
│   │   │   │   │   └── participants_pix_state.dart
│   │   │   │   ├── pix_key
│   │   │   │   │   ├── pix_key_bloc.dart
│   │   │   │   │   ├── pix_key_events.dart
│   │   │   │   │   └── pix_key_state.dart
│   │   │   │   └── pix_keys_deleted
│   │   │   │       ├── pix_keys_deleted_bloc.dart
│   │   │   │       ├── pix_keys_deleted_events.dart
│   │   │   │       └── pix_keys_deleted_state.dart
│   │   │   ├── factories
│   │   │   │   ├── participants_pix_bloc_factory.dart
│   │   │   │   ├── pix_key_bloc_factory.dart
│   │   │   │   └── pix_keys_deleted_bloc_factory.dart
│   │   │   └── theme
│   │   │       └── app_theme.dart
│   │   └── utils
│   │       ├── new_pix_key_params.dart
│   │       └── user_manager.dart
│   ├── main.dart
│   ├── presentation
│   │   ├── home
│   │   │   ├── home_page.dart
│   │   │   ├── home_page_controller.dart
│   │   │   └── widgets
│   │   │       ├── add_copied_pix_key.dart
│   │   │       ├── pix_key_item.dart
│   │   │       └── pix_keys_list.dart
│   │   ├── login
│   │   │   ├── login_page.dart
│   │   │   └── login_page_controller.dart
│   │   ├── pix_key_details
│   │   │   ├── pix_key_details_controller.dart
│   │   │   ├── pix_key_details_page.dart
│   │   │   └── widgets
│   │   │       ├── delete_pix_key_confirm.dart
│   │   │       ├── pix_key_qr_code.dart
│   │   │       └── title_detail.dart
│   │   ├── pix_key_form
│   │   │   ├── pix_key_form_page.dart
│   │   │   ├── pix_key_form_page_controller.dart
│   │   │   └── widgets
│   │   │       ├── custom_text_field.dart
│   │   │       ├── select_institution.dart
│   │   │       └── select_pix_key_type.dart
│   │   ├── profile
│   │   │   ├── profile_page.dart
│   │   │   ├── profile_page_controller.dart
│   │   │   └── widgets
│   │   │       └── user_profile_info.dart
│   │   ├── splash
│   │   │   ├── splash_page.dart
│   │   │   └── splash_page_controller.dart
│   │   └── trash_can
│   │       ├── trash_can_page.dart
│   │       ├── trash_can_page_controller.dart
│   │       └── widgets
│   │           ├── empty_the_trash_can.dart
│   │           └── trash_can_pix_keys_list.dart
│   └── shared
│       ├── constants
│       │   ├── app_constants.dart
│       │   ├── app_fonts.dart
│       │   ├── app_images.dart
│       │   ├── app_routes.dart
│       │   ├── environment_variable_names.dart
│       │   ├── environments.dart
│       │   └── firebase_collections.dart
│       ├── controllers
│       │   └── copy_controller.dart
│       ├── utils
│       │   ├── bank_apps.dart
│       │   ├── extensions
│       │   │   ├── snack_bar_extension.dart
│       │   │   └── string_extensions.dart
│       │   ├── format_mask.dart
│       │   ├── format_pix_key_copy_all.dart
│       │   ├── get_unmask_value.dart
│       │   ├── pix_key_types.dart
│       │   └── validation_pix_key_form.dart
│       └── widgets
│           ├── bank_icon_button.dart
│           ├── banks_list.dart
│           ├── base_widget.dart
│           ├── bottom_sheet_group_button.dart
│           ├── content_item.dart
│           ├── custom_icon_button.dart
│           ├── empty_state.dart
│           ├── load_data_error.dart
│           ├── modal_bottom_sheet_base.dart
│           ├── pix_keys_list_skeleton.dart
│           ├── profile_avatar.dart
│           └── shimmer_item.dart
```

## Princípios da Clean Architecture

Este projeto segue os princípios da `Clean Architecture`, que divide a aplicação em camadas distintas com responsabilidades claras:

- **Camada de Apresentação**: Gerencia a interface do usuário e a interação do usuário. Utiliza o padrão BLoC para gerenciamento de estado.
- **Camada de Domínio**: Contém a lógica de negócios, casos de uso e interfaces de repositórios.
- **Camada de Dados**: Responsável por buscar dados, modelos e implementações de repositórios.

### Benefícios da Clean Architecture

- **Separação de Responsabilidades**: Cada camada tem uma responsabilidade distinta, facilitando a gestão e manutenção do código.
- **Testabilidade**: Cada camada pode ser testada independentemente.
- **Flexibilidade**: É mais fácil alterar ou estender partes da aplicação sem afetar outras camadas.

## Começando

### Pré-requisitos

- Flutter SDK - `v3.22.3`
- Dart SDK - `v3.4.4`
- Android Studio
- Firebase CLI
- Git
- Visual Studio Code

### Instalação

Clone o repositório:

```sh
git clone https://github.com/adrianoqueirozdev/pix_keeper.git
```

Navegue até o diretório do projeto:

```sh
cd pix_keeper
```

Instale as dependências:

```sh
flutter pub get
```

Configure o Firebase:

```sh
flutterfire configure
```

Crie o arquivo `env.json` na raiz da aplicação e adicione as credenciais do Firebase e etc...:
```sh
{ 
  "APP_NAME": "Pix Keeper",
  "APP_VERSION": "1.0.0+1",
  "FIREBASE_API_KEY": "YOUR_API_KEY",
  "FIREBASE_APP_ID": "YOUR_APP_ID",
  "FIREBASE_MESSAGING_SENDER_ID": "YOUR_SENDER_ID",
  "FIREBASE_PROJECT_ID": "YOUR_PROJECT_ID",
  "FIREBASE_STORAGE_BUCKET": "YOUR_BUCKET",
  "BRASIL_API_BASE_URL": "https://brasilapi.com.br/api/pix/v1/"
}
```

### Configurar as chaves de depuração no firebase (somente android)

Entre na pasta do android
```sh
cd android
```

Gere as chaves
```sh
./gradlew signingReport
```
Copie as chaves e configure no no projeto android no Firebase.

### Executando o Aplicativo

Execute o aplicativo em um dispositivo conectado ou emulador:

```sh
flutter run --dart-define-from-file=env.json
```

