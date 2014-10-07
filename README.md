MySQL Class
===========

I'll be teaching a [MySQL class for Coalition 4 Queens](http://www.c4q.nyc/introtomysql/) and am using this repo to organize my notes and files. Feel free to follow along and let me know if you have any questions or suggestions.

## Session I

- Overview of MySQL and relational databases. What are they? How are they used? What are the alternatives?
- Provide a quick overview of the normal forms and what they mean. What impact does it have when they’re violated and go over what well designed databases have.
- Introduce the dataset we will be working with. This will mostly likely be a dataset I’ll pull from some of my side projects that will hopefully be relevant. Currently, I’m thinking of using a database containing some fantasy football data that I’ve scraped.
- Make sure everyone has MySQL installed or can get it installed.
- Introduce the SELECT query and aggregate functions.

## Session II

- Refresh everyone's memory on the SELECT statement and do a few exercises
- Introduce the IN and LIKE clauses
- Introduce GROUP BY
- Introduce table joins

## Session III

- Introduce table sub selects
- Go over the random nuanced stuff we missed while speeding through the first two sessions
- Talk about table design and indices

## Session IV

- Develop some complicated and slow queries and introduce the idea of INDICES so everyone is aware of why they are useful.
- Go over table creation and have the students come up with some interesting aggregate tables.
- Provide a quick overview of how to diagnose a query for performance and how to test a query to make sure it was written correctly.
- Discuss the various system tables (information_schema schema) and the various system commands that can be used to get a better understanding of MySQL