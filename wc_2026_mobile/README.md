# WC 2026 Mobile

![Flutter](https://img.shields.io/badge/Flutter-3.13.4-02569B?logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-%5E3.13.4-0175C2?logo=dart&logoColor=white)
![Plataforma](https://img.shields.io/badge/Plataforma-iOS%20%7C%20Android-4E4E4E?logo=apple&logoColor=white)
![Arquitetura](https://img.shields.io/badge/Arquitetura-MVVM%20%2B%20Repository-00A67E)
![Figma](https://img.shields.io/badge/Figma-UI%2FUX%20Design-F24E1E?logo=figma&logoColor=white)
![Status](https://img.shields.io/badge/Status-Finalizado%20%7C%20Portf%C3%B3lio-2E7D32)

Aplicativo mobile em Flutter para acompanhar, cadastrar e gerir figurinhas do álbum da Copa do Mundo 2026, com foco em experiência visual moderna e fluxo de uso otimizado para colecionadores.

Este repositório representa um projeto concluído como exercício de curso de 1 semana, criado com foco em portfólio e demonstração de habilidades em Flutter, arquitetura de app mobile e desenvolvimento de interfaces.

O projeto está finalizado no momento e não será mais evoluído ativamente neste repositório, mas mantém uma base funcional e bem estruturada para referência, estudo e apresentação profissional.

---

## 🎨 UI/UX Design

O design system e os protótipos das telas foram desenvolvidos no Figma:

👉 [Acessar projeto no Figma](https://www.figma.com/design/0uqQag571YmZbEyOHk57TM/Copa-do-mundo-2026?node-id=0-1&t=dFzwdkZCVPWh591s-1)

---

## 🚀 Visão geral

A estrutura do app foi planejada para atender ao fluxo típico de um colecionador:

- autenticação completa com welcome, login e cadastro
- sessão persistente do usuário via armazenamento seguro
- home com progresso percentual do álbum e figurinhas recentes
- navegação por abas para início, álbum, trocas e mais
- cadastro interativo de figurinha com teclado numérico e alfabético
- busca e filtros por status, país, time e número
- detalhamento da figurinha para acompanhamento e atualização de quantidade

A organização do projeto separa responsabilidades entre interface, domínio, dados e roteamento, tornando a base mais escalável e fácil de evoluir.

---

## 🛠️ Stack tecnológico

- Framework: Flutter 3.13.4+
- Linguagem: Dart 3.13.4+
- Roteamento: go_router
- Gerenciamento de estado e injeção: provider
- Networking: dio + retrofit
- Persistência segura: flutter_secure_storage
- UI: Material Design, google_fonts e flutter_svg
- Arquitetura: MVVM + Repository + ViewModels

---

## 📂 Estrutura do projeto

```text
wc_2026_mobile/
├── lib/
│   ├── config/       # Bindings, dependências e ambiente
│   ├── core/         # Utilitários globais, sessão e erros
│   ├── data/         # Repositórios, clientes de API e DTOs
│   ├── domain/       # Entidades e regras de negócio
│   ├── routing/      # Configuração do GoRouter
│   ├── ui/           # Telas, widgets e ViewModels
│   ├── generated/    # Assets gerados
│   └── main.dart     # Ponto de entrada da aplicação
├── assets/           # Imagens, SVGs e padrões visuais
├── android/
├── ios/
├── test/
├── analysis_options.yaml
├── pubspec.yaml
├── README.md
└── .gitignore
```

### Organização por camadas

- `lib/ui/`: camada de apresentação com telas, widgets e bindings
- `lib/data/`: repositórios, serviços de API e modelos externos
- `lib/domain/`: modelos e regras do domínio
- `lib/core/`: sessão, logging, utilitários e resultados
- `lib/routing/`: navegação da aplicação
- `lib/config/`: injeção de dependências e ambiente

---

## 🔄 Fluxo principal de navegação

A navegação principal foi organizada em rotas públicas e privadas:

- splash
- welcome
- login
- cadastro
- home
- álbum
- trocas
- perfil/mais
- detalhe e registro de figurinha

O sistema também usa `StatefulShellRoute` para manter a navegação em abas e permitir uma experiência mais fluida durante o uso diário do app.

---

## ✅ Funcionalidades atuais

### Autenticação

A aplicação possui fluxo de boas-vindas, splash, login e cadastro. A sessão é restaurada e mantida com persistência local segura.

### Home

A tela inicial apresenta:

- progresso geral do álbum
- figurinhas coladas recentemente
- contagem de repetidas
- ações rápidas para adicionar figurinha e trocar com amigos

### Álbum

A tela de álbum oferece:

- busca por figurinha, país ou número
- filtros por status: total, faltando e repetidas
- organização por seleções e seções
- navegação para o detalhe de cada figurinha

### Cadastro de figurinha

A funcionalidade de registro usa um teclado visual para inserir o código da figurinha, com suporte a letras e números e pré-visualização em tempo real do item encontrado.

### Detalhe da figurinha

A tela de detalhe permite visualizar a figurinha e evoluir o estado de uso com feedback imediato ao usuário.

---

## 📋 Pré-requisitos

Antes de rodar o projeto, confirme que o ambiente do Flutter está corretamente configurado:

- Flutter SDK 3.13.4 ou superior
- Dart SDK 3.13.4 ou superior
- Android Studio ou Xcode conforme o alvo desejado
- emulador ou dispositivo físico conectado

---

## ⚡ Como rodar o projeto

Na raiz do repositório, execute:

```bash
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
flutter run
```

Se quiser rodar em um dispositivo específico:

```bash
flutter devices
flutter run -d <device-id>
```

---

## 🎯 Próximos passos sugeridos

- integração com o ecossistema backend e API restante do projeto
- sincronização das figurinhas repetidas e faltantes
- módulo de trocas com amigos e QR Code
- testes unitários e de widgets
- suporte a múltiplos idiomas
- refinamento da experiência de onboarding e perfil do usuário

---

## 📝 Observação

Este projeto foi desenvolvido como parte de um curso de 1 semana e foi concluído com foco em portfólio. Ele apresenta uma base sólida para um aplicativo mobile de coleção de figurinhas, com arquitetura organizada, navegação funcional e componentes visuais já implementados.

Atualmente, o projeto não está em desenvolvimento ativo e serve como referência de estudo, apresentação de habilidades e material para futuras evoluções.
