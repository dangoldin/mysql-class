---
layout: default
title: Additional Exercises
tagline:
description: "Some additional problems for MySQL"
keywords: "mysql, databases"
---

Additional Exercises
=====================

### Exercises

- What columns are present in the players table?
- How many rows are in the players table?
- How many players have the letter 'Z' in their name?
- How many players have 'man' in their name?
- How many players have 'man' in their last name?
- How many players are there for each position in our dataset?
- How many players are there for each team in our dataset?
- Who are the RBs that play for the NYG or the NYJ in our dataset?
- Tricky One: What teams don't have a WR in our dataset?
- Which team has the highest total projected points scored? The lowest?
- Which team has the highest total rushing and receiving yards? The lowest?
- Which team has the highest total projected points in week 15? In week 5?

### Introducing the words data set

To set this up, you will need to download this [file]({{ site.baseurl }}/additional_problems/words.txt) and load it into your database using the following commands:

{% highlight sql %}
-- Create the new table
create table words (
  word varchar(30) NOT NULL
);

-- Load the words from file
-- (replace $$PATH$$ with the location of the file)
LOAD DATA INFILE "$$PATH$$"
INTO TABLE words
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n';

{% endhighlight %}

- What is the table we created called? What are the column(s)?
- How many rows are in this table?
- How many words start with the letter 'a'? End with an 'a'? Contain an 'a'?
- Which vowel is contained in the most words?
- Run the following query: **SELECT word, length(word) FROM words LIMIT 10;** What does the length function do?
- Use the length function to get the distribution of words by length. Does it make sense?
- What are the longest words in our dataset? How many characters do they have?
- What are the 5 letter words that contain a 'c' and an 'x? How about the 4 letter words?
- Run the following query: **SELECT * FROM words WHERE word LIKE 'e_t';** What does it do? How is the '_' different than the '%'?
- Find all the words that contain an 'a' as the second letter and an 'e' as the fifth letter.