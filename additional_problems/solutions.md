---
layout: default
title: Additional Exercises (solutions)
tagline:
description: "Solutions for some additional problems for MySQL"
keywords: "mysql, databases"
---

Additional Exercises
=====================

### Solutions

{% highlight sql %}
-- What is the table we created called? What are the column(s)?
-- Words, column is called word

-- How many rows are in this table?
SELECT count(1) FROM words;

-- How many words start with the letter ‘a’? End with an ‘a’? Contain an ‘a’?
SELECT count(1) FROM words WHERE word like 'a%';
SELECT count(1) FROM words WHERE word like '%a';
SELECT count(1) FROM words WHERE word like '%a%';

-- Which vowel is contained in the most words?
SELECT count(1) FROM words WHERE word like '%a%';
SELECT count(1) FROM words WHERE word like '%e%'; -- This one!
SELECT count(1) FROM words WHERE word like '%i%';
SELECT count(1) FROM words WHERE word like '%o%';
SELECT count(1) FROM words WHERE word like '%u%';
SELECT count(1) FROM words WHERE word like '%y%';

-- Run the following query: SELECT word, length(word) FROM words LIMIT 10; What does the length function do?
-- Gets the number of characters in the word.

-- Use the length function to get the distribution of words by length. Does it make sense?
select length(word) as len, count(1) as cnt
from words
group by len;

-- What are the longest words in our dataset? How many characters do they have?
select word
from words
where length(word) = 24; -- 24 characters using previous query

-- What are the 5 letter words that contain a ‘c’ and an ‘x? How about the 4 letter words?
select word
from words
where length(word) = 5
and word like '%c%' and word like '%x%';

select word
from words
where length(word) = 4
and word like '%c%' and word like '%x%';

-- Run the following query: SELECT * FROM words WHERE word LIKE ‘e_t’; What does it do? How is the ‘_’ different than the ‘%’?
Only allows for one character, % allows for multiple characters.

-- Find all the words that contain an ‘a’ as the second letter and an ‘e’ as the fifth letter.
select word
from words
where word like '_a__e%';
{% endhighlight %}