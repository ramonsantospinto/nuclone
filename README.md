# 💜 NuClone — Nubank UI & Clean Architecture

Um clone da interface do Nubank desenvolvido em Flutter, aplicando os mais altos padrões de arquitetura e boas práticas do mercado.

## 🚀 Tecnologias e Pacotes Utilizados

- **Flutter & Dart**
- **Clean Architecture** (Domain, Data & Presentation)
- **State Management:** `flutter_bloc` (Cubit)
- **Dependency Injection:** `get_it`
- **Functional Error Handling:** `fpdart` (`Either<Failure, Success>`)
- **UI & Experience:** `google_fonts`, `lucide_icons`, `skeletonizer`

## 📐 Estrutura do Projeto

```text
lib/
├── app/
│   ├── core/              # Temas, injeção de dependência, manipuladores de erro e formatadores
│   └── features/          # Funcionalidades modularizadas (Home, Pix)
│       ├── data/          # Datasources e implementações de repositório
│       ├── domain/        # Entidades e casos de uso (UseCases)
│       └── presentation/  # Cubits, estados, telas e widgets


```


🛠️ Como Executar o Projeto

Clone o repositório:
git clone https://github.com/seu-usuario/nuclone.git

Instale as dependências:
flutter pub get

Execute o aplicativo:
flutter run
