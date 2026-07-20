# 💜 NuClone — Nubank UI & Clean Architecture

Um clone da interface do Nubank feito em Flutter, construído para demonstrar, na prática, como aplico padrões de arquitetura e boas práticas de mercado em um projeto real.

Este projeto foi desenvolvido como peça de portfólio técnico, com o objetivo de servir de referência para empresas e recrutadores avaliarem minha capacidade de estruturar um app Flutter seguindo Clean Architecture, separação de responsabilidades e tratamento de erros de forma robusta — os mesmos pilares que sustentam aplicações em produção.

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

**Ramon Santos Pinto**
[github.com/ramonsantospinto](https://github.com/ramonsantospinto)
