# Sequelize (ORM) - Manual Setup

## Introduction

Welcome to a detailed guide on using Sequelize, a popular Object-Relational Mapping (ORM) library, with MySQL2 and Express in a Node.js application. This guide will take you through the process of setting up Sequelize, defining models, and creating an Express API that interacts with a MySQL database using Sequelize.

## What is Sequelize ORM?

**Sequelize** is an Object-Relational Mapping (ORM) library for Node.js that simplifies database interaction by allowing you to work with databases in an object-oriented manner. It supports multiple database backends, with MySQL being one of the most widely used.

## Why Use Sequelize?

Sequelize offers several benefits when working with databases in Node.js applications:

- Abstraction: It abstracts the underlying database, making it easier to work with databases without writing raw SQL queries.
- Model-View-Controller (MVC): Sequelize helps you implement the MVC architecture by defining models, which correspond to database tables.
- Validation: It provides built-in validation for your data, enhancing data integrity.
- Relationships: Sequelize simplifies the definition and management of relationships between tables.

## Getting Started

### Prerequisites

Before you begin, ensure you have the following prerequisites in place:

- Node.js and npm installed on your system.
- A MySQL database server installed and running.
- Basic knowledge of JavaScript and Express.

### Installation

To create a new Node.js project, navigate to your project folder and run the following commands:

```bash
npm init
npm install sequelize mysql2 express
```

## Setting Up Sequelize with MySQL2 and Express - Manual Setup

Now, let's set up Sequelize with MySQL2 and Express manually.

### 1. Create a Node.js Project

If you haven't already, create a new Node.js project folder and navigate into it.

```bash
mkdir sequelize-mysql-express
cd sequelize-mysql-express
```

### 2. Install Dependencies

Install Sequelize, MySQL2, and Express using npm.

```bash
npm install sequelize mysql2 express
```

### 3. Sequelize Configuration

In your project, in `config` folder. You can define your database connection parameters in `db.js`.

```javascript
// sequelize.js
import { Sequelize } from 'sequelize';

const sequelize = new Sequelize(
    'your-database',
    'your-username',
    'your-password',
    {
        host: 'localhost',
        dialect: 'mysql',
        // Add other options if needed
    }
);

export default sequelize;
```

Make sure to replace `'your-database'`, `'your-username'`, and `'your-password'` with your actual database information.

### 4. Define Models

Create your database models manually in the `models` folder. Define the tables and their relationships in separate JavaScript files. For example, let's create a `User` model:

```javascript
// models/user.js
import { DataTypes } from 'sequelize';
import sequelize from '../sequelize'; // Import the sequelize configuration

const User = sequelize.define('User', {
    id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
    },
    username: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    email: {
        type: DataTypes.STRING,
        allowNull: false,
        unique: true,
    },
});

export default User;
```

### 5. Migration and Database Setup

Manually create database tables using Sequelize migrations. Create migration files in the `migrations` folder to define the structure of your tables and then run the migrations. Here's an example:

```bash
npx sequelize migration:generate --name create_users
```

Edit the generated migration file to define the table structure, and then run the migration:

```bash
npx sequelize db:migrate
```

### 6. Create an Express App

Build your Express application in the project's root folder. Set up routes and controllers to interact with the database.

### 7. API Routes

Create API routes that use your Sequelize models to read, write, update, and delete data from the database.

## Usage

You can now start your Express application and access the API endpoints to interact with your MySQL database using Sequelize ORM. Make sure to handle error handling and validation in your routes for a robust application.
