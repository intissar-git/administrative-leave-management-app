# stage_technique

[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)  
[![Repo size](https://img.shields.io/github/repo-size/intissar-git/stage_technique)](https://github.com/intissar-git/stage_technique)

## Description

This repository "stage_technique" contains the code and documentation for the project completed during my technical internship. This README presents the project, explains how to install and use it, and provides contribution guidelines.

## Table of Contents

- [Description](#description)
- [Project Status](#project-status)
- [Installation](#installation)
- [Usage](#usage)
- [Repository Structure](#repository-structure)
- [Tests](#tests)
- [Contributing](#contributing)
- [License](#license)
- [Authors & Contact](#authors--contact)
- [Collaborators](#collaborators)

## Project Status

- Status: Completed
- Main language: Java
- Framework: Spring Boot
- Dependency manager: Maven

## Installation

1. Clone the repository:

```bash
git clone https://github.com/intissar-git/stage_technique.git
cd stage_technique/springJwt
```

2. Prerequisites:
- Java 17+ (JDK)
- Maven 3.8+
- (Optional) Docker or a compatible database server

3. Configuration:
- Edit the database connection variables in `src/main/resources/application.properties` if necessary.

4. Install dependencies and build the project:

```bash
./mvnw clean install
```
or
```bash
mvn clean install
```

## Usage

To run the Spring Boot application:

```bash
./mvnw spring-boot:run
```
or
```bash
mvn spring-boot:run
```

- The database creation script is in `database_project.sql`
- Source code is located in the `src/` directory
- Maven parameters are in `pom.xml`

## Repository Structure

The main content of the project is in the `springJwt` directory:

```
springJwt/
├─ .gitignore
├─ .mvn/                   # Maven configuration
├─ database_project.sql     # Database creation script
├─ mvnw / mvnw.cmd          # Maven wrapper scripts
├─ pom.xml                  # Project configuration and dependencies
└─ src/                     # Java source code (Spring Boot)
```

## Tests

To run Maven tests:

```bash
./mvnw test
# or
mvn test
```

## Contributing

Thank you for your interest! Please follow these simple rules:

1. Fork the repository and create a feature/ or fix/ branch (e.g., `feature/add-auth`).
2. Open a Pull Request describing your changes.
3. Follow Java/Spring style conventions and add tests if possible.

Consider adding a more detailed CONTRIBUTING.md file for review and coding rules.

## License

This repository is distributed under the MIT license — see the LICENSE file at the root.

## Authors & Contact

- Intissar ([intissar-git](https://github.com/intissar-git)) — main author
- Contact: Add an email address or LinkedIn/GitHub link

## Collaborators

Below are the main collaborators on this project:

- [hasna745](https://github.com/hasna745)  
  ![hasna745 avatar](https://avatars.githubusercontent.com/u/129042928?v=4)  
  Contributions: 27

- [intissar-git](https://github.com/intissar-git)  
  ![intissar-git avatar](https://avatars.githubusercontent.com/u/179481534?v=4)  
  Contributions: 20

- [ikramazlani](https://github.com/ikramazlani)  
  ![ikramazlani avatar](https://avatars.githubusercontent.com/u/174724184?v=4)  
  Contributions: 18

---

If needed, I can also:
- Add a .gitignore adapted to Java/Maven/Spring
- Create issue/PR templates and a basic GitHub Actions workflow
- Open a Pull Request instead of pushing directly to main