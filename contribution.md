# Contribution Guide

Thank you for your interest in contributing to the UDOM Timetable app! This document will guide you through the process of contributing to our project.

## Table of Contents
- [Introduction](#introduction)
- [Getting Started](#getting-started)
- [How to Contribute](#how-to-contribute)
- [Submitting Contributions](#submitting-contributions)
- [Creating User Case Diagrams](#creating-user-case-diagrams)
- [Setting Up Local Database](#setting-up-local-database)
- [Function Requirements](#function-requirements)
- [Non Functional Requirements](#non-functional-requirements)
- [Contact](#contact)

## Introduction

We welcome contributions from everyone. Whether you're fixing a bug, improving the code, or adding new features, your help is greatly appreciated. For major changes, please open an issue first to discuss what you would like to change.

## Getting Started

### Prerequisites

To get started, you will need:
- Flutter installed on your machine. You can find the installation instructions [here](https://flutter.dev/docs/get-started/install).
- Git installed. You can find the installation instructions [here](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git).

### Installation

1. Clone the repository:
    ```bash
    git clone https://github.com/isaka-james/udom-timetable-app.git
    ```
2. Navigate to the project directory:
    ```bash
    cd udom-timetable-app
    ```
3. Install dependencies:
    ```bash
    flutter pub get
    ```
4. Run the app:
    ```bash
    flutter run
    ```

## How to Contribute

### Fork the Repository

1. Fork the repository by clicking the "Fork" button on the top right of the repository page.
2. Clone your fork:
    ```bash
    git clone https://github.com/isaka-james/udom-timetable-app.git
    ```
3. Navigate to your forked project directory:
    ```bash
    cd udom-timetable-app
    ```

### Create Your Feature Branch

1. Create a new branch:
    ```bash
    git checkout -b feature/AmazingFeature
    ```

### Commit Your Changes

1. Make your changes.
2. Commit your changes with a meaningful commit message:
    ```bash
    git commit -m 'Add some AmazingFeature'
    ```

### Push to Your Branch

1. Push your changes to your branch:
    ```bash
    git push origin feature/AmazingFeature
    ```

### Open a Pull Request

1. Go to the original repository on GitHub.
2. Click on the "New Pull Request" button.
3. Select your branch and click on "Create Pull Request".

## Submitting Contributions

- Ensure your code follows the project's coding standards.
- Include clear and detailed commit messages.
- Update documentation as necessary.

## Creating User Case Diagrams

User case diagrams help to visualize the interactions between users and the app. To add your user case diagrams:

1. Save your `.drawio` files and exported images in the `docs/` directory.
2. Update the documentation to include the diagrams:

    **User Case Diagram:**
![usercase](https://github.com/isaka-james/udom-timetable-app/assets/76619967/9a43de40-2ed5-4192-a528-a34f4e2bea57)


    **User Case Diagram File:**
[usercase Design (drawio)](/docs/usercase.drawio)


## Setting Up Local Database

For local database setup:

1. Save your database design files (e.g., images) in the `docs/` directory.
2. Update the documentation to include the database design:

    **Database Design:**
![database](https://github.com/isaka-james/udom-timetable-app/assets/76619967/0b6f681e-890d-4c35-8743-4dfb0e7a42c3)

   
3. Ensure the app code initializes and uses the local database correctly.


### Function Requirements
- The user should see the timetable for the day, and can click the other day to see them.
- The user should be able to be notified about the sessions on the notifications.
- The user should be able to put class session as `Dismissed` or `Lecture in class`. 

### Non Functional Requirements
- The UI should be very modern.
- The loading time should be at minimal it can be.
- The App should have minimal MBs as it can be.
- Use AI in the notifications.
- The App should be easy to use.
- The App should have real time data(from API), so no one can miss class sessions nor exams.
- The currently session should be held differently so it is visible, and the next session should easly seen.


## Contact

For any inquiries, feel free to contact the repository [owner](https://isaka-james.vercel.app/).

