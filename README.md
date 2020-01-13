# Bookmark_manager
  As a user , I want to be able to list all of my bookmarks

  ![Domain Model](images/domain_model.JPG)

  Database setup:
  Connect to PSQL
  create database using PSQL - CREATE DATABASE "bookmark_manager";
  connect to database \c bookmark_manager;
  create table using PSQL - CREATE TABLE bookmarks(id SERIAL PRIMARY KEY, url VARCHAR(60));