💸 Expense Tracker App
A simple Flutter expense tracking app built with the Provider state management package.

📱 Features

View a list of expenses
Add new expenses
Edit existing expenses
Delete expenses
Automatically calculates total spendings


🛠️ Tech Stack

Flutter — UI framework
Dart — Programming language
Provider — State management (ChangeNotifier, Consumer, MultiProvider)


📁 Project Structure
lib/
├── main.dart                  # App entry point with MultiProvider setup
├── providers/
│   └── expense_provider.dart  # ExpenseProvider with ChangeNotifier
└── screens/
    └── homescreen.dart        # Main UI screen

🚀 Getting Started
Prerequisites

Flutter SDK installed
A connected device or emulator

Installation

Clone the repository

bash   git clone <your-repo-url>
   cd expense_tracker_provider

Install dependencies

bash   flutter pub get

Run the app

bash   flutter run

📦 Dependencies
yamldependencies:
  flutter:
    sdk: flutter
  provider: ^6.1.2

🧠 State Management
This app uses the Provider package for state management.
ConceptUsageChangeNotifierExtended by Expenseprovider to notify listeners on data changesMultiProviderWraps the app in main.dart to provide multiple providersConsumerListens to Expenseprovider and rebuilds the UI on changesProvider.of(..., listen: false)Used inside button callbacks to call provider methods without rebuilding

✏️ ExpenseProvider Methods
MethodDescriptionget expensesReturns the full list of expensesget totalExpenseReturns the sum of all expense amountsaddExpense(title, amount)Adds a new expense to the listeditExpense(id, title, amount)Updates an existing expense by IDremoveExpense(id)Deletes an expense by ID

👤 Author
Joshua