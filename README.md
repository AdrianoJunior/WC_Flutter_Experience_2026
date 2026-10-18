# WC 2026 — álbum de figurinhas

Aplicativo mobile em Flutter para acompanhar o álbum da Copa do Mundo de 2026: cadastro e consulta de figurinhas, progresso da coleção e autenticação. O repositório reúne o app e as instruções para executar uma cópia local da API; cada pessoa deve configurar e iniciar a própria API.

> **Importante:** os assets visuais já estão incluídos em `wc_2026_mobile/assets/`. O único pacote que precisa ser baixado e extraído para executar o projeto é `wc_2026_api_assets.zip`, que contém as distribuições da API. A pasta extraída da API, o banco de dados local e os segredos de configuração não devem ser versionados.

## Conteúdo do repositório

```text
.
├── wc_2026_mobile/       # Aplicativo Flutter
│   ├── assets/           # Imagens e padrões usados pelo app
│   ├── lib/              # Código Dart
│   ├── android/
│   ├── ios/
│   └── pubspec.yaml
├── wc_2026_api_assets.zip # Pacotes da API por plataforma
└── README.md
```

Antes de começar, extraia de `wc_2026_api_assets.zip` o pacote binário da API para seu sistema operacional e arquitetura e, em seguida, extraia esse pacote em uma pasta à parte. Para Windows, obtenha o pacote Windows x64 na distribuição do projeto. Não é necessário baixar ou extrair outro pacote de assets para o app. Não adicione ao Git a pasta extraída da API, o banco local ou arquivos de configuração.

No app, os assets são declarados no [pubspec.yaml](./wc_2026_mobile/pubspec.yaml). Preserve os diretórios e nomes fornecidos no pacote (`images/`, `patterns/` e variantes de resolução).

## Pré-requisitos

- Flutter SDK compatível com Dart `^3.13.4` (a versão mínima indicada em `wc_2026_mobile/pubspec.yaml`).
- Android Studio e um emulador/dispositivo Android, ou Xcode e um simulador/dispositivo iOS.
- O pacote da API para o seu sistema operacional, extraído localmente.
- Um terminal: PowerShell no Windows ou Terminal no macOS/Linux.

Confira a instalação do Flutter antes de começar:

```sh
flutter doctor
```

## 1. Configure e inicie sua API

A API WC 2026 usa Dart Frog e SQLite embarcado; não requer Docker, servidor de banco de dados ou instalação do Dart SDK. Escolha o pacote compatível com seu sistema e arquitetura: Windows x64, macOS Apple Silicon (arm64) ou Intel (x64), Linux x64 ou ARM64. Extraia o arquivo compactado e execute os comandos dentro da pasta extraída. O download do Windows pode trazer um ZIP dentro de outro ZIP; extraia os dois.

### Windows (PowerShell)

```powershell
Set-Location .\wc_2026_api-1.0.0-windows-x64
Copy-Item .env.example .env
notepad .env
.\bin\server.exe
```

### macOS

```sh
cd wc_2026_api-1.0.0-macos-arm64
cp .env.example .env
```

Para um Mac Intel, use a pasta `wc_2026_api-1.0.0-macos-x64`. Edite `.env` e defina `JWT_SECRET` com um valor aleatório forte e exclusivo. Antes da primeira execução, libere o executável e a biblioteca nativa do SQLite do Gatekeeper e inicie o servidor:

```sh
xattr -d com.apple.quarantine bin/server
xattr -d com.apple.quarantine lib/libsqlite3.dylib
./bin/server
```

### Linux

```sh
cd wc_2026_api-1.0.0-linux-x64
cp .env.example .env
```

Para Linux ARM64, use a pasta `wc_2026_api-1.0.0-linux-arm64`. Edite `.env`, defina `JWT_SECRET` com um valor aleatório forte e exclusivo e inicie o servidor:

```sh
./bin/server
```

No Windows, caso o SmartScreen avise sobre o executável, confira se o pacote veio dos materiais oficiais do projeto antes de permitir a execução.

O servidor atende em `http://localhost:8080`; a documentação interativa fica em <http://localhost:8080/docs>. O banco SQLite é criado automaticamente no primeiro início. Mantenha o terminal do servidor aberto enquanto usa o app. O token de acesso usa JWT HS256 e expira em 24 horas.

> **Segurança:** não compartilhe nem versione o arquivo `.env` ou o banco local. Cada pessoa deve usar seu próprio `JWT_SECRET`.

## 2. Prepare e execute o app

No terminal, a partir da raiz do repositório:

```sh
cd wc_2026_mobile
flutter pub get
dart run build_runner build --delete-conflicting-outputs
```

Com a API em execução, inicie o app. A URL padrão já está configurada para o emulador Android:

```sh
flutter run --dart-define=base_url=http://10.0.2.2:8080
```

Para outros ambientes, informe a URL alcançável a partir do dispositivo/simulador:

```sh
# Simulador iOS no mesmo Mac da API
flutter run --dart-define=base_url=http://localhost:8080

# Dispositivo físico na mesma rede: substitua pelo IP local do computador que roda a API
flutter run --dart-define=base_url=http://192.168.1.10:8080
```

O endereço padrão `10.0.2.2` é o acesso do emulador Android ao computador host. `localhost` dentro de um dispositivo físico aponta para o próprio dispositivo, não para o computador. Para usar um dispositivo físico, a API precisa aceitar conexões da rede local e o firewall deve permitir a porta `8080`.

Para escolher um dispositivo conectado:

```sh
flutter devices
flutter run -d <device-id> --dart-define=base_url=http://10.0.2.2:8080
```

## Figma

O design das telas e componentes está no [arquivo do projeto no Figma](https://www.figma.com/design/0uqQag571YmZbEyOHk57TM/Copa-do-mundo-2026?node-id=0-1&t=dFzwdkZCVPWh591s-1).

## Estrutura do app

```text
wc_2026_mobile/
├── assets/       # Imagens, ícones e padrões visuais
├── lib/
│   ├── config/   # Ambiente e injeção de dependências
│   ├── core/     # Sessão, erros e utilitários
│   ├── data/     # APIs, DTOs e repositórios
│   ├── domain/   # Entidades e regras de negócio
│   ├── routing/  # Navegação
│   └── ui/       # Telas, widgets e ViewModels
├── android/
├── ios/
└── test/
```

O projeto usa Flutter/Dart, Provider, GoRouter, Dio/Retrofit e armazenamento seguro local. A organização segue as camadas de apresentação, domínio e dados, com padrão Repository e ViewModels.
