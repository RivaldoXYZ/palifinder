# Suitmedia Mobile Developer Intern - Flutter Test App

This repository contains a Flutter mobile application built as part of the **Mobile Developer Intern test at Suitmedia**. The app consists of 3 screens and demonstrates basic Flutter concepts including state management using `Provider`, API integration, and responsive UI.

## Features

1. **First Screen**
   - Two input fields: `Name` and `Palindrome`.
   - "Check" button to validate if the entered sentence is a palindrome.
   - "Next" button to navigate to the Second Screen.

2. **Second Screen**
   - Displays a static `Welcome` label.
   - Shows the user's name entered on the First Screen.
   - Displays `Selected User Name` (updates when a user is selected on the Third Screen).
   - "Choose a User" button to navigate to the Third Screen.

3. **Third Screen**
   - List of users fetched from [reqres.in](https://reqres.in/).
   - Displays `email`, `first_name`, `last_name`, and `avatar`.
   - Pull-to-refresh and infinite scroll for loading next pages.
   - Selecting a user updates the `Selected User Name` on the Second Screen.

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/RivaldoXYZ/palifinder
