-- Создание базы данных shopIT
CREATE DATABASE IF NOT EXISTS shopIT;

-- Использование базы данных shopIT
USE shopIT;

-- Создание таблицы Computers
CREATE TABLE IF NOT EXISTS Computers (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    type VARCHAR(50),
    brand VARCHAR(50),
    price INTEGER
);