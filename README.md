# Bookmark Manager

## Specification

* Show a list of bookmarks
* Add new bookmarks
* Delete bookmarks
* Update bookmarks
* Comment on bookmarks
* Tag bookmarks into categories
* Filter bookmarks by tag
* Users are restricted to manage only their own bookmarks

## User Stories

### Show a list of bookmarks
As a browser user
So that I can access a list of favourited websites 
I would like to see a list of bookmarks

### Add new bookmarks
As a user
So I can store bookmark data for later retrieval
I want to add a bookmark to Bookmark Manager

### Delete bookmarks
As a user
So I can change a bookmark in Bookmark Manager
I want to update a bookmark


### Additional - ensure that only valid urls are provided
As a user
So that the bookmarks I save are useful
I want to only save a valid URL

## Domain Model

![image title](/images/dom_mod0.png)

## SQL Database Instruction

### Bookmark manager database
Connect to psql
Create the database using the psql command CREATE DATABASE bookmark_manager;
Connect to the database using the pqsl command \c bookmark_manager;
Run the query we have saved in the file 01_create_bookmarks_table.sql

### Bookmark manager TEST database
Connect to psql
Create the database using the psql command CREATE DATABASE bookmark_manager_test;
Connect to the database using the pqsl command \c bookmark_manager_test;
Run the query we have saved in the file 01_create_bookmarks_table.sql
