# 💜 NuClone — Nubank UI & Clean Architecture

Um clone da interface do Nubank feito em Flutter, construído para colocar em prática (e mostrar na prática) os padrões de arquitetura e boas práticas que uso no dia a dia como desenvolvedor.

A ideia aqui não foi só replicar a tela por replicar, mas usar uma UI conhecida como pretexto para aplicar Clean Architecture, gerenciamento de estado reativo e tratamento de erros de forma funcional — os mesmos pilares que sustentam apps em produção.

## 🚀 Tecnologias e Pacotes Utilizados

- **Flutter & Dart**
- **Clean Architecture** (Domain, Data & Presentation)
- **State Management:** `flutter_bloc` (Cubit)
- **Dependency Injection:** `get_it`
- **Functional Error Handling:** `fpdart` (`Either<Failure, Success>`)
- **UI & Experience:** `google_fonts`, `lucide_icons`, `skeletonizer`

## 📐 Estrutura do Projeto

A organização segue a separação clássica de camadas, pensada para escalar sem virar bagunça conforme o app cresce:

```text
lib/
├── app/
│   ├── core/              # Temas, injeção de dependência, manipuladores de erro e formatadores
│   └── features/          # Funcionalidades modularizadas (Home, Pix)
│       ├── data/          # Datasources e implementações de repositório
│       ├── domain/        # Entidades e casos de uso (UseCases)
│       └── presentation/  # Cubits, estados, telas e widgets
```

Cada feature é isolada e independente — dá pra abrir a pasta de `Pix`, por exemplo, e entender a funcionalidade inteira sem precisar navegar pelo projeto todo.

## 🛠️ Como Executar o Projeto

Quer rodar localmente? É só seguir os passos abaixo:

1. **Clone o repositório:**
```bash
   git clone https://github.com/seu-usuario/nuclone.git
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

Esse projeto nasceu como um exercício pessoal de arquitetura — uma forma de testar, na prática, conceitos que muita gente só vê na teoria. Se você é dev e está estudando Clean Architecture ou Flutter, sinta-se à vontade para explorar o código, abrir issues ou sugerir melhorias.

Feito com 💜 e bastante café.
