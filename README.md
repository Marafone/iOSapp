# Marafone iOS App

**Author**: Tomasz Jarzabek  
**Date**: January 2025  

## Project Goal

The goal of the Marafone app is to create an interactive and educational tool for card game enthusiasts of Marafone. The app aims to both support gameplay and teach new players the rules and strategies of the game.

## Features

The Marafone app includes the following key features:

- **Integration with Web Interface**:  
  The app allows users to access online features through a built-in WebView browser, supporting login functionality via integration with the Keychain system.

- **User Data Management**:  
  Login credentials (username and password) are securely stored in the Keychain system and can be automatically entered in the login interface.

- **Quiz**:  
  Users can test their knowledge of the Marafone game through an interactive quiz containing questions about game rules, card values, gameplay mechanics, and scoring.

- **Tutorial**:  
  The app features an educational module that explains the basic rules of the game, card values, gameplay mechanics, the role of the trump suit (referred to as "Briscola"), and scoring rules.

- **Settings**:  
  The settings screen allows users to manage their data, access the tutorial and quiz, and customize their app experience.

## Implementation

The project leverages Swift and the SwiftUI framework to achieve its goals. The app's core components include:

1. **WebView**:  
   A component built using the WebKit framework, enabling interaction with the online interface.

2. **KeychainManager**:  
   A class responsible for securely storing and retrieving user data.

3. **QuizView and TutorialView**:  
   Views that implement the quiz and the interactive tutorial, respectively.

4. **SettingsView**:  
   A view that allows users to manage app settings and access additional features.

## Summary

The Marafone app combines educational and functional features, offering an interactive experience for both new players and seasoned enthusiasts of the game. With integration into the Keychain system and features like the quiz and tutorial, the app supports learning and strategy development in the game of Marafone.
