# Application de Gestion des Congés Administratifs

<div align="center">

![Spring Boot](https://img.shields.io/badge/Backend-Spring%20Boot-brightgreen?style=for-the-badge)
![Spring Security](https://img.shields.io/badge/Security-Spring%20Security%20%2B%20JWT-green?style=for-the-badge)
![MySQL](https://img.shields.io/badge/Database-MySQL-blue?style=for-the-badge)
![JavaScript](https://img.shields.io/badge/Frontend-JavaScript%20%2B%20Tailwind%20CSS-yellow?style=for-the-badge)
![Java](https://img.shields.io/badge/Java-17%2B-orange?style=for-the-badge)
![License](https://img.shields.io/badge/License-MIT-purple?style=for-the-badge)

**Plateforme web moderne de dématérialisation de la gestion des congés administratifs**

[Démarrer](#-installation-et-lancement) • [Architecture](#-architecture-technique) • [Documentation](#-documentation) • [Contribuer](#-contribution)

</div>

---

## 📖 Table des matières

- [À propos](#-à-propos)
- [Contexte du projet](#-contexte-du-projet)
- [Fonctionnalités](#-fonctionnalités)
- [Workflow de validation](#-workflow-de-validation)
- [Architecture technique](#-architecture-technique)
- [Structure du projet](#-structure-du-projet)
- [Prérequis](#-prérequis)
- [Installation et lancement](#-installation-et-lancement)
- [Configuration](#-configuration)
- [Utilisation](#-utilisation)
- [Règles métier](#-règles-métier)
- [API REST](#-api-rest)
- [Tests](#-tests)
- [Troubleshooting](#-troubleshooting)
- [Documentation complète](#-documentation-complète)
- [Contribution](#-contribution)
- [Licence](#-licence)
- [Auteurs](#-auteurs)

---

## 📌 À propos

**Application Web de Gestion des Congés Administratifs (AGCA)** est une solution full-stack moderne développée dans le cadre d'un projet technique. Elle vise à **digitaliser et centraliser** la gestion des demandes de congés administratifs en remplaçant les processus manuels par une plateforme web sécurisée et traçable.

### Caractéristiques principales

✅ **Authentification sécurisée** avec JWT  
✅ **Gestion du cycle de vie complet** des demandes (soumission → validation → archivage)  
✅ **Workflow hiérarchique** multi-niveaux  
✅ **Génération automatique de PV** (Procès-verbaux)  
✅ **Notifications par email** à chaque étape  
✅ **Interface responsive** adaptée à tous les appareils  
✅ **Audit complet** de toutes les actions  
✅ **Gestion de calendrier** (jours fériés, nationaux et religieux)

---

## 🎯 Contexte du projet

Ce projet a été réalisé dans le cadre d'un **stage technique** de DUT Génie Informatique à l'**Agence du Bassin Hydraulique de l'Oum Er-Rbia (ABHOER)** à Béni Mellal.

| Détail | Information |
|--------|-------------|
| **Période** | 04/04/2025 → 04/06/2025 |
| **Établissement** | EST Béni Mellal |
| **Commanditaire** | ABHOER (Agence du Bassin Hydraulique) |
| **Domaine** | Dématérialisation administrative |
| **Stratégie** | Maroc Digital 2025 |

> Ce projet répond aux recommandations de la DGME sur la dématérialisation des processus administratifs.

---

## 🚀 Fonctionnalités

### 👨‍💼 Employé

- ✅ Authentification sécurisée (JWT)
- ✅ Consultation du **solde de congés** (22 jours/an)
- ✅ Soumission d'une demande de congé (dates, motif, remplaçant)
- ✅ Modification / suppression d'une demande en attente
- ✅ Téléversement de documents justificatifs
- ✅ Consultation de l'historique personnel
- ✅ Suivi en temps réel du statut
- ✅ Visualisation du calendrier des jours fériés
- ✅ Statistiques personnelles (solde, approuvées, refusées)

### 👨‍💼 Chef de Service (N+1)

- ✅ Validation de premier niveau des demandes
- ✅ Vérification de la charge de travail
- ✅ Acceptation ou refus avec justification
- ✅ Consultation de la liste des employés
- ✅ Statistiques de son service

### 👨‍💼 Chef de Département/Division (N+2)

- ✅ Validation intermédiaire
- ✅ Consultation des services rattachés
- ✅ Transmission aux RH
- ✅ Statistiques par service
- ✅ Export Excel des données

### 🏢 Ressources Humaines (RH)

- ✅ **Validation finale** des demandes
- ✅ Gestion des soldes (année en cours + report)
- ✅ **Génération automatique du PV**
- ✅ Gestion des jours fériés
- ✅ Gestion des employés (CRUD)
- ✅ Statistiques RH globales
- ✅ Export Excel complet

### 🛡️ Administrateur

- ✅ Gestion complète des comptes utilisateurs
- ✅ Définition des rôles et permissions
- ✅ Gestion des départements et services
- ✅ Configuration du calendrier
- ✅ Tableau de bord avec statistiques
- ✅ Accès à l'historique complet
- ✅ Gestion du profil utilisateur

---

## �� Workflow de validation

```
┌─────────────┐
│   Employé   │ Soumet la demande
└──────┬──────┘
       │ Statut: EN_ATTENTE
       ▼
┌──────────────────────┐
│ Chef de Service (N+1)│ Validation de 1er niveau
└──────┬───────────────┘
       │ Approuvé ✓ / Refusé ✗
       ▼
┌──────────────────────┐
│Chef de Département   │ Validation intermédiaire
└──────┬───────────────┘
       │ Approuvé ✓ / Refusé ✗
       ▼
┌──────────────────────┐
│  Ressources Humaines │ Validation finale
└──────┬───────────────┘
       │ Approuvé ✓ / Refusé ✗
       │ + Génération du PV
       ▼
┌──────────────────────┐
│   Décision Finale    │ APPROVED / REJECTED
└──────────────────────┘
```

**Notifications email** envoyées à chaque étape du workflow.

---

## 🏗️ Architecture technique

### Stack Technique

| Couche | Technologies |
|--------|--------------|
| **Backend API** | Spring Boot 3.x, Spring Security, JWT |
| **ORM** | Spring Data JPA, Hibernate |
| **Frontend** | JavaScript (ES6+), HTML5, CSS3 |
| **Styles** | Tailwind CSS |
| **Base de données** | MySQL 8.x |
| **Architecture** | Single Page Application (SPA) + REST API |
| **Authentification** | JWT Tokens |
| **Gestion de dépendances** | Maven |
| **Tests API** | Postman, JUnit 5 |
| **IDE** | IntelliJ IDEA / VS Code |
| **Versioning** | Git + GitHub |

### Diagrammes d'Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                    Client (Frontend)                         │
│         HTML/CSS/JavaScript + Tailwind CSS                   │
└──────────────────────┬──────────────────────────────────────┘
                       │ HTTP/HTTPS
                       │ JSON
                       ▼
┌─────────────────────────────────────────────��───────────────┐
│              REST API (Spring Boot)                          │
│  ┌─────────────────────────────────────────────────────┐   │
│  │  Controllers → Services → Repositories              │   │
│  │  JWT Security → Authentication → Authorization     │   │
│  └─────────────────────────────────────────────────────┘   │
└──────────────────────┬──────────────────────────────────────┘
                       │
                       ▼
┌─────────────────────────────────────────────────────────────┐
│            MySQL Database (MySQL 8.x)                        │
│  Tables: Users, Demandes, Departments, Services, etc.       │
└─────────────────────────────────────────────────────────────┘
```

---

## 📁 Structure du projet

```
administrative-leave-management-app/
│
├── 📂 backend/                      # API REST (Spring Boot)
│   ├── src/main/java/
│   │   └── com/abhoer/
│   │       ├── controllers/         # Contrôleurs REST
│   │       ├── services/            # Logique métier
│   │       ├── repositories/        # Accès données (JPA)
│   │       ├── entities/            # Modèles JPA
│   │       ├── security/            # JWT, authentification
│   │       ├── exceptions/          # Gestion d'erreurs
│   │       └── utils/               # Utilitaires
│   │
│   ├── src/main/resources/
│   │   ├── application.properties   # Configuration
│   │   ├── application-dev.properties
│   │   ├── application-prod.properties
│   │   └── data.sql                 # Données initiales
│   │
│   ├── pom.xml                      # Dépendances Maven
│   └── mvnw / mvnw.cmd              # Maven Wrapper
│
├── 📂 frontend/                     # Application Web
│   ├── index.html                   # Page d'accueil
│   ├── 📂 pages/                    # Pages HTML
│   │   ├── login.html
│   │   ├── dashboard.html
│   │   ├── demandes.html
│   │   └── ...
│   │
│   ├── 📂 assets/                   # Ressources statiques
│   │   ├── img/                     # Images
│   │   ├── icons/                   # Icônes
│   │   └── fonts/                   # Polices
│   │
│   ├── 📂 js/                       # JavaScript
│   │   ├── config.js                # Configuration API
│   │   ├── api.js                   # Appels API
│   │   ├── auth.js                  # Authentification
│   │   ├── utils.js                 # Fonctions utiles
│   │   └── ...
│   │
│   ├── 📂 css/                      # Styles
│   │   ├── tailwind.css
│   │   ├── custom.css
│   │   └── responsive.css
│   │
│   └── tailwind.config.js           # Config Tailwind
│
├── 📂 docs/                         # Documentation
│   ├── RAPPORT_STAGE.pdf            # Rapport technique
│   ├── API.md                       # Documentation API
│   ├── USER_GUIDE.md                # Guide utilisateur
│   ├── INSTALLATION.md              # Guide d'installation
│   │
│   ├── 📂 diagrams/                 # Diagrammes UML
│   │   ├── cas-utilisation/
│   │   ├── classe/
│   │   ├── sequence/
│   │   └── architecture/
│   │
│   ├── 📂 postman/                  # Collections Postman
│   │   └── AGCA-API.postman_collection.json
│   │
│   └── 📂 screenshots/              # Captures d'écran
│       ├── 01-login.png
│       ├── 02-dashboard.png
│       └── ...
│
├── .gitignore                       # Fichiers à ignorer
├── .env.example                     # Variables d'environnement
├── LICENSE                          # Licence MIT
├── CONTRIBUTING.md                  # Guide de contribution
└── README.md                        # Ce fichier
```

---

## ⚙️ Prérequis

Avant de commencer, assurez-vous d'avoir installé :

### Backend
- **Java Development Kit (JDK) 17+** → [Télécharger](https://www.oracle.com/java/technologies/downloads/)
- **Maven 3.8+** → [Télécharger](https://maven.apache.org/download.cgi)
- **Git** → [Télécharger](https://git-scm.com/)

### Base de données
- **MySQL 8.0+** → [Télécharger](https://www.mysql.com/downloads/)
- **OR XAMPP** (Apache + MySQL + phpMyAdmin) → [Télécharger](https://www.apachefriends.org/)

### Frontend
- **Navigateur moderne** (Chrome, Firefox, Safari, Edge)
- **VS Code / IntelliJ IDEA** (optionnel)

### Outils optionnels
- **Postman** → [Télécharger](https://www.postman.com/downloads/) (pour tester l'API)
- **Git GUI** → [GitHub Desktop](https://desktop.github.com/)

---

## 🛠️ Installation et lancement

### 1. Cloner le dépôt

```bash
git clone https://github.com/intissar-git/administrative-leave-management-app.git
cd administrative-leave-management-app
```

### 2. Backend (Spring Boot)

#### a) Créer la base de données

**Avec XAMPP :**

1. Démarrez XAMPP (Apache + MySQL)
2. Ouvrez phpMyAdmin : `http://localhost/phpmyadmin`
3. Créez une nouvelle base de données :

```sql
CREATE DATABASE gestion_conges_db 
CHARACTER SET utf8mb4 
COLLATE utf8mb4_unicode_ci;
```

**Avec MySQL CLI :**

```bash
mysql -u root -p

CREATE DATABASE gestion_conges_db 
CHARACTER SET utf8mb4 
COLLATE utf8mb4_unicode_ci;

EXIT;
```

#### b) Configurer `application.properties`

Éditer `backend/src/main/resources/application.properties` :

```properties
# ========== Base de données MySQL ==========
spring.datasource.url=jdbc:mysql://localhost:3306/gestion_conges_db?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true
spring.datasource.username=root
spring.datasource.password=
spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver

# ========== JPA / Hibernate ==========
spring.jpa.database-platform=org.hibernate.dialect.MySQL8Dialect
spring.jpa.hibernate.ddl-auto=update
spring.jpa.show-sql=false
spring.jpa.properties.hibernate.format_sql=true

# ========== Serveur ==========
server.port=8080
server.servlet.context-path=/api

# ========== JWT ==========
jwt.secret=YOUR_SUPER_SECRET_KEY_MUST_BE_AT_LEAST_32_CHARACTERS_LONG
jwt.expiration=86400000

# ========== Logging ==========
logging.level.root=INFO
logging.level.com.abhoer=DEBUG
```

**⚠️ Note :** Pour la production, définissez les variables d'environnement au lieu de hardcoder les valeurs.

#### c) Compiler et démarrer le backend

```bash
cd backend

# Nettoyer les builds précédents et installer les dépendances
mvn clean install

# Démarrer l'application
mvn spring-boot:run
```

Le backend sera accessible sur :
```
👉 http://localhost:8080/api
```

#### d) Vérifier l'état du backend

```bash
curl http://localhost:8080/api/health
```

### 3. Frontend (JavaScript + Tailwind CSS)

#### a) Naviguer vers le dossier frontend

```bash
cd ../frontend
```

#### b) Configurer l'URL de l'API

Éditer `js/config.js` et assurez-vous que :

```javascript
const API_URL = "http://localhost:8080/api";
```

#### c) Servir l'application

**Option 1 : Avec Live Server (VS Code)**

1. Installez l'extension "Live Server" dans VS Code
2. Clic-droit sur `index.html` → "Open with Live Server"
3. Le navigateur s'ouvrira à `http://localhost:5500`

**Option 2 : Avec Python (Python 3)**

```bash
python -m http.server 5500
```

**Option 3 : Avec Node.js**

```bash
npx serve .
```

Le frontend sera accessible sur :
```
👉 http://localhost:5500 (ou l'adresse affichée)
```

---

## 🔧 Configuration

### Variables d'environnement

Créez un fichier `.env` à la racine du projet :

```env
# Backend Configuration
SPRING_DATASOURCE_URL=jdbc:mysql://localhost:3306/gestion_conges_db
SPRING_DATASOURCE_USERNAME=root
SPRING_DATASOURCE_PASSWORD=

JWT_SECRET=YOUR_SUPER_SECRET_KEY_MUST_BE_AT_LEAST_32_CHARACTERS_LONG
JWT_EXPIRATION=86400000

# Frontend Configuration
API_URL=http://localhost:8080/api
APP_NAME=AGCA - Gestion des Congés
APP_VERSION=1.0.0
```

### Profils Spring

#### Développement (`application-dev.properties`)
```properties
spring.jpa.hibernate.ddl-auto=update
spring.jpa.show-sql=true
logging.level.com.abhoer=DEBUG
```

#### Production (`application-prod.properties`)
```properties
spring.jpa.hibernate.ddl-auto=validate
spring.jpa.show-sql=false
logging.level.root=WARN
server.ssl.enabled=true
```

Lancer avec un profil spécifique :
```bash
mvn spring-boot:run -Dspring-boot.run.arguments="--spring.profiles.active=prod"
```

---

## 🖥️ Utilisation

### Démarrage complet de l'application

1. **Démarrer MySQL/XAMPP**
   ```bash
   # Sur Windows, XAMPP Control Panel
   # Sur Linux/Mac
   mysql.server start
   ```

2. **Lancer le backend**
   ```bash
   cd backend
   mvn spring-boot:run
   ```

3. **Lancer le frontend**
   ```bash
   # Dans un nouvel onglet terminal
   cd frontend
   python -m http.server 5500
   # Ou avec Live Server
   ```

4. **Ouvrir le navigateur**
   ```
   http://localhost:5500
   ```

### Comptes de test

| Rôle | Email | Mot de passe |
|------|-------|-------------|
| Admin | admin@abhoer.ma | admin123 |
| RH | rh@abhoer.ma | rh123 |
| Chef Département | chef.dept@abhoer.ma | chef123 |
| Chef Service | chef.service@abhoer.ma | service123 |
| Employé | employe@abhoer.ma | emp123 |

⚠️ **Changez ces mots de passe avant toute utilisation en production !**

---

## 📏 Règles métier

| Règle | Détail |
|-------|--------|
| **Solde annuel** | 22 jours ouvrables par employé |
| **Calcul des jours** | Exclusion weekends (sam/dim) + jours fériés |
| **Niveaux de validation** | 3 niveaux (Service → Département → RH) |
| **Justification obligatoire** | Requise en cas de refus |
| **Remplaçant obligatoire** | Requis pour chaque demande |
| **Notifications** | Email à chaque étape |
| **Archivage** | Conservation historique 3 ans |
| **Report de solde** | Possible de l'année précédente |
| **PV automatique** | Généré après validation RH |
| **Sécurité** | HTTPS en prod + mots de passe en BCrypt |

---

## 🔌 API REST

### Documentation complète

Voir [docs/API.md](./docs/API.md)

### Endpoints principaux

#### Authentication
```http
POST /api/auth/register
POST /api/auth/login
POST /api/auth/refresh-token
POST /api/auth/logout
```

#### Demandes de congés
```http
GET    /api/demandes                  # Lister les demandes
GET    /api/demandes/{id}             # Détails d'une demande
POST   /api/demandes                  # Créer une demande
PUT    /api/demandes/{id}             # Modifier une demande
DELETE /api/demandes/{id}             # Supprimer une demande
POST   /api/demandes/{id}/validate    # Valider une demande
POST   /api/demandes/{id}/reject      # Rejeter une demande
```

#### Employés
```http
GET  /api/employees                   # Lister les employés
GET  /api/employees/{id}              # Détails d'un employé
POST /api/employees                   # Créer un employé
PUT  /api/employees/{id}              # Modifier un employé
```

#### Calendrier
```http
GET    /api/calendar/holidays         # Lister les jours fériés
POST   /api/calendar/holidays         # Ajouter un jour férié
DELETE /api/calendar/holidays/{id}    # Supprimer un jour férié
```

### Exemple de requête

```bash
# Authentification
curl -X POST http://localhost:8080/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{"email":"employe@abhoer.ma","password":"emp123"}'

# Réponse (contient le JWT token)
{
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
  "user": {
    "id": 1,
    "email": "employe@abhoer.ma",
    "role": "EMPLOYEE"
  }
}

# Créer une demande (avec authentification)
curl -X POST http://localhost:8080/api/demandes \
  -H "Authorization: Bearer YOUR_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "startDate": "2025-06-15",
    "endDate": "2025-06-20",
    "reason": "Congé annuel",
    "replacementId": 5
  }'
```

### Importer la collection Postman

1. Ouvrez Postman
2. Allez sur `File → Import`
3. Sélectionnez `docs/postman/AGCA-API.postman_collection.json`
4. Testez les endpoints

---

## 🧪 Tests

### Tests unitaires

```bash
cd backend

# Lancer tous les tests
mvn test

# Lancer un test spécifique
mvn test -Dtest=AuthServiceTest

# Avec rapport de couverture
mvn clean test jacoco:report
```

### Tests d'intégration

```bash
mvn verify
```

### Tests manuels (Postman)

1. Importez la collection : `docs/postman/AGCA-API.postman_collection.json`
2. Configurez la variable `{{base_url}}` : `http://localhost:8080/api`
3. Exécutez les requêtes de test

---

## 🔍 Troubleshooting

### Backend ne démarre pas

**Erreur : `Port 8080 already in use`**
```bash
# Trouver le processus utilisant le port
lsof -i :8080

# Tuer le processus
kill -9 <PID>
```

**Erreur : `Cannot connect to database`**
1. Vérifier que MySQL est démarré
2. Vérifier les credentials dans `application.properties`
3. Vérifier que la base de données existe :
   ```sql
   SHOW DATABASES;
   ```

### Frontend ne charge pas les données

**Erreur : `CORS error` ou `Cannot reach API`**

Assurez-vous que :
1. Le backend est en cours d'exécution
2. L'URL de l'API est correcte dans `frontend/js/config.js`
3. Ajouter CORS au backend (`application.properties`) :
   ```properties
   server.error.include-message=always
   ```

**Erreur : `401 Unauthorized`**

1. Vérifier le token JWT dans `localStorage`
2. Vérifier que le token n'a pas expiré
3. Se reconnecter

### Base de données

**Erreur : `table doesn't exist`**

Hibernate devrait créer les tables automatiquement avec `ddl-auto=update`. Si ce n'est pas le cas :
```sql
-- Réinitialiser la base (attention : supprime les données)
DROP DATABASE gestion_conges_db;
CREATE DATABASE gestion_conges_db 
CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```

---

## 📚 Documentation complète

- 📄 **[Rapport de Stage](./docs/RAPPORT_STAGE.pdf)** — Documentation complète du projet
- 🔌 **[API REST](./docs/API.md)** — Documentation API détaillée
- 👤 **[Guide Utilisateur](./docs/USER_GUIDE.md)** — Guide d'utilisation pour les utilisateurs finaux
- 🛠️ **[Installation Détaillée](./docs/INSTALLATION.md)** — Guide d'installation complet
- 📐 **[Diagrammes UML](./docs/diagrams/)** — Architecture et conception
  - Cas d'utilisation
  - Diagrammes de classe
  - Diagrammes de séquence
- 📮 **[Collection Postman](./docs/postman/AGCA-API.postman_collection.json)** — Tests API prêts à l'emploi

---

## 🔐 Sécurité

### Bonnes pratiques implémentées

✅ **JWT Authentication** — Tokens sécurisés et expiration configurable  
✅ **Password Hashing** — Utilisation de BCrypt (10+ rounds)  
✅ **Role-Based Access Control (RBAC)** — Autorisations par rôle  
✅ **SQL Injection Prevention** — Utilisation de paramètres liés (JPA)  
✅ **CORS Configuration** — Restriction des origines autorisées  
✅ **Input Validation** — Validation côté client et serveur  
✅ **HTTPS Ready** — Configuration SSL/TLS en production  

### Recommandations production

1. Changez la clé secrète JWT (`jwt.secret`)
2. Utilisez des variables d'environnement pour les credentials
3. Activez HTTPS/SSL
4. Configurez un firewall
5. Utilisez un certificat SSL valide
6. Limitez le taux de requêtes (rate limiting)

---

## 📊 Statistiques du projet

- **Backend** : ~7,4% Java
- **Frontend** : ~1,5% JavaScript + 91,1% HTML/CSS
- **Base de données** : Schema MySQL optimisé
- **API Endpoints** : 50+ endpoints REST
- **Couverture de tests** : En cours

---

## 🤝 Contribution

Les contributions sont bienvenues ! Veuillez consulter [CONTRIBUTING.md](./CONTRIBUTING.md) pour les directives détaillées.

### Processus de contribution

1. **Fork** le dépôt
2. Créez une branche feature (`git checkout -b feature/amazing-feature`)
3. Commitez vos changements (`git commit -m 'Add amazing feature'`)
4. Poussez vers la branche (`git push origin feature/amazing-feature`)
5. Ouvrez une **Pull Request** descriptive

### Standards de code

- **Java** : Google Java Style Guide
- **JavaScript** : JavaScript Standard Style
- **Commits** : Format conventionnel
- **Tests** : Requise pour toute nouvelle fonctionnalité

---

## 📄 Licence

Ce projet est distribué sous la **Licence MIT**. Voir le fichier [LICENSE](./LICENSE) pour plus de détails.

```
MIT License

Copyright (c) 2025 AGCA Contributors

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software...
```

---

## 👥 Auteurs

### Auteurs principaux

| Avatar | Nom | Rôle | GitHub |
|--------|-----|------|--------|
| ![Intissar](https://avatars.githubusercontent.com/u/179481534?v=4&s=48) | **Intissar FARHOUN** | Lead Developer | [@intissar-git](https://github.com/intissar-git) |
| ![Ikram](https://avatars.githubusercontent.com/u/174724184?v=4&s=48) | **Ikram AZLANI** | Developer | [@ikramazlani](https://github.com/ikramazlani) |
| ![Souaad](https://avatars.githubusercontent.com/u/129042928?v=4&s=48) | **Souaad AMRAOUI** | Developer | [@hasna745](https://github.com/hasna745) |

### Formation
- **Filière** : Génie Informatique — DUT
- **Établissement** : École Supérieure de Technologie (ESTBM) — Béni Mellal
- **Année académique** : 2024-2025

### Encadrants

| Rôle | Nom | Lieu |
|------|-----|------|
| **Encadrante professionnelle** | Mme. Hajar BOULAIZ | ABHOER |
| **Encadrant académique** | M. Mohammed OUTANOUT | EST Béni Mellal |

---

## 🙏 Remerciements

Nous tenons à remercier chaleureusement :

- **L'Agence du Bassin Hydraulique de l'Oum Er-Rbia (ABHOER)** pour son accueil, son financement et sa confiance envers ce projet
- **Mme. Hajar BOULAIZ** pour son accompagnement constant, ses conseils avisés et sa patience
- **M. Mohammed OUTANOUT** pour sa rigueur, ses orientations méthodologiques et ses enseignements
- **Nos familles et amis** pour leur soutien indéfectible et leur encouragement
- **L'équipe pédagogique de l'EST Béni Mellal** pour la qualité de la formation reçue

---

## 📞 Support & Contact

- 📧 **Email** : [intissar-git@github.com](mailto:intissar-git@github.com)
- 🐛 **Issues** : [GitHub Issues](https://github.com/intissar-git/administrative-leave-management-app/issues)
- 💬 **Discussions** : [GitHub Discussions](https://github.com/intissar-git/administrative-leave-management-app/discussions)

---

<div align="center">

**Fait avec ❤️ par [Intissar FARHOUN](https://github.com/intissar-git), [Ikram AZLANI](https://github.com/ikramazlani) et [Souaad AMRAOUI](https://github.com/hasna745)**

[⬆ Retour au sommet](#application-de-gestion-des-congés-administratifs)

</div>
