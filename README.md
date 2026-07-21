# 💜 NuClone — Nubank UI & Clean Architecture

![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?logo=dart&logoColor=white)
![Architecture](https://img.shields.io/badge/Architecture-Clean%20Architecture-6A0DAD)
![License](https://img.shields.io/badge/license-MIT-green)

Um clone da interface do Nubank feito em Flutter, construído para demonstrar, na prática, como aplico padrões de arquitetura e boas práticas de mercado em um projeto real.

Este projeto foi desenvolvido como peça de portfólio técnico, com o objetivo de servir de referência para empresas e recrutadores avaliarem minha capacidade de estruturar um app Flutter seguindo Clean Architecture, separação de responsabilidades e tratamento de erros de forma robusta — os mesmos pilares que sustentam aplicações em produção.

## 📱 Preview

<!--
  Adicione aqui screenshots ou um GIF do app rodando.
  Sugestão: crie uma pasta /docs/screenshots e referencie as imagens assim:

  <p align="center">
    <img src="https://i.ibb.co/nMpGkF38/nubank1.jpg" width="22" />
    <img src="docs/screenshots/pix.png" width="220" />
  </p>
-->

> 🔧 *Screenshots/GIF em breve.*

## 🚀 Tecnologias e Pacotes Utilizados

- **Flutter & Dart**
- **Clean Architecture** (Domain, Data & Presentation)
- **State Management:** `flutter_bloc` (Cubit)
- **Dependency Injection:** `get_it`
- **Functional Error Handling:** `fpdart` (`Either<Failure, Success>`)
- **UI & Experience:** `google_fonts`, `lucide_icons`, `skeletonizer`

## 📐 Estrutura do Projeto

A organização segue a separação clássica de camadas, pensada para escalar sem perder manutenibilidade conforme o projeto cresce:

```text
lib/
├── app/
│   ├── core/              # Temas, injeção de dependência, manipuladores de erro e formatadores
│   └── features/          # Funcionalidades modularizadas (Home, Pix)
│       ├── data/          # Datasources e implementações de repositório
│       ├── domain/        # Entidades e casos de uso (UseCases)
│       └── presentation/  # Cubits, estados, telas e widgets
```

Cada feature é isolada e independente — é possível abrir a pasta de `Pix`, por exemplo, e compreender a funcionalidade por completo sem depender do restante do projeto.

## 🧠 Decisões Técnicas

Algumas escolhas de arquitetura e os motivos por trás delas:

- **`fpdart` (`Either<Failure, Success>`) em vez de try/catch tradicional**: torna o tratamento de erros explícito na assinatura dos métodos, obrigando quem consome o UseCase a lidar com o caso de falha em tempo de compilação, e não apenas em runtime.
- **Cubit em vez de Bloc puro**: para o escopo do projeto, Cubit oferece a mesma previsibilidade de estado com menos boilerplate de eventos, mantendo o código mais enxuto sem abrir mão de testabilidade.
- **`get_it` para injeção de dependência**: desacopla a criação de instâncias das camadas de apresentação, facilitando a substituição de implementações (ex: mocks em testes) sem alterar o código consumidor.
- **Features isoladas por pasta**: cada feature contém suas próprias camadas `data`/`domain`/`presentation`, evitando acoplamento cruzado e permitindo que qualquer parte do app seja entendida (ou removida) isoladamente.

## ✅ Testes

<!--
  Se o projeto já tiver testes, descreva aqui, por exemplo:

  O projeto conta com testes unitários para UseCases e Repositories,
  além de testes de widget para os principais componentes de UI.

  flutter test

  Cobertura atual: XX%
-->

> 🔧 *Seção de testes em construção — cobertura e instruções serão detalhadas aqui.*

## 🛠️ Como Executar o Projeto

1. **Clone o repositório:**
```bash
git clone https://github.com/ramonsantospinto/nuclone.git
```
2. **Instale as dependências:**
```bash
flutter pub get
```
3. **Execute o aplicativo:**
```bash
flutter run
```

## 💬 Sobre o Projeto

Este repositório foi construído com foco em qualidade de código e decisões arquiteturais consistentes — não como um tutorial ou exercício de estudo, mas como demonstração prática de como estruturo aplicações Flutter no dia a dia profissional.

Fico à disposição para discutir decisões técnicas, trade-offs de arquitetura ou qualquer ponto do código.

## 📄 Licença

Distribuído sob a licença MIT. Veja [`LICENSE`](LICENSE) para mais detalhes.

## 📬 Contato

**Ramon Santos Pinto**

- GitHub: [github.com/ramonsantospinto](https://github.com/ramonsantospinto)
- LinkedIn: *https://www.linkedin.com/in/ramon-santos-1464a6108/*
- E-mail: *ramonsantospinto@gmail.com*
