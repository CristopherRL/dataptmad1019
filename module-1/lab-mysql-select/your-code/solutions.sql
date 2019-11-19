SELECT * from titles;

SELECT * from publishers;

SELECT * from titleauthor;

SELECT * from authors;


---Challenge 1 - Who Have Published What At Where?
SELECT 
authors.au_id as "AUTHOR ID",
authors.au_lname AS "LAST NAME",
authors.au_fname AS "FIRST NAME",
titles.title AS "TITLE",
publishers.pub_name AS "PUBLISHER"
FROM titles
JOIN publishers on titles.pub_id = publishers.pub_id
JOIN titleauthor on titles.title_id = titleauthor.title_id
JOIN authors on titleauthor.au_id = authors.au_id
;
-- CHECKING
--- rows in this query
SELECT 
count(authors.au_id)
FROM titles
JOIN publishers on titles.pub_id = publishers.pub_id
JOIN titleauthor on titles.title_id = titleauthor.title_id
JOIN authors on titleauthor.au_id = authors.au_id;
--- rows in table titleauthor
SELECT 
count(*)
FROM titleauthor

--  ######################################################################################
-- Challenge 2 - Who Have Published How Many At Where?
--how many titles each author has published at each publisher
SELECT 
-- *
authors.au_id as "AUTHOR ID",
authors.au_lname AS "LAST NAME",
authors.au_fname AS "FIRST NAME",
---titles.title AS "TITLE",
publishers.pub_name AS "PUBLISHER",
COUNT (titles.title_id) as "TITLE COUNT"
FROM titles
JOIN publishers on titles.pub_id = publishers.pub_id
JOIN titleauthor on titles.title_id = titleauthor.title_id
JOIN authors on titleauthor.au_id = authors.au_id
GROUP BY "AUTHOR ID", publishers.pub_name
ORDER by "AUTHOR ID" DESC,"TITLE COUNT" DESC
;
-- CHECKING
--  sum up the TITLE COUNT column
SELECT 
SUM ("TITLE COUNT")
FROM 
(
SELECT 
-- *
authors.au_id as "AUTHOR ID",
authors.au_lname AS "LAST NAME",
authors.au_fname AS "FIRST NAME",
publishers.pub_name AS "PUBLISHER",
COUNT (titles.title_id) as "TITLE COUNT"
FROM titles
JOIN publishers on titles.pub_id = publishers.pub_id
JOIN titleauthor on titles.title_id = titleauthor.title_id
JOIN authors on titleauthor.au_id = authors.au_id
GROUP BY "AUTHOR ID", publishers.pub_id
ORDER by "AUTHOR ID" DESC,"TITLE COUNT" DESC
)
;
--number of records in Table titleauthor
SELECT 
COUNT ("TITLE COUNT")
FROM titles
JOIN publishers on titles.pub_id = publishers.pub_id
JOIN titleauthor on titles.title_id = titleauthor.title_id
JOIN authors on titleauthor.au_id = authors.au_id

--  ######################################################################################
-- Challenge 3 - Best Selling Authors
SELECT
--*
authors.au_id as "AUTHOR ID",
authors.au_lname AS "LAST NAME",
authors.au_fname AS "FIRST NAME",
COUNT (titles.title) as "TITLE COUNT",
---titles.title AS "TITLE",
--publishers.pub_name AS "PUBLISHER",
SUM (ytd_sales) as "TOTAL"
FROM titles
JOIN publishers on titles.pub_id = publishers.pub_id
JOIN titleauthor on titles.title_id = titleauthor.title_id
JOIN authors on titleauthor.au_id = authors.au_id
GROUP BY "AUTHOR ID" --, publishers.pub_name
ORDER by "TOTAL" DESC
LIMIT 3
;

--  ######################################################################################
-- Challenge 3 - Best Selling Authors Ranking (new way)
--Who are the top 3 authors who have sold the highest number of titles? Write a query to find out.
SELECT SUM(qty)
from sales -- THERE ARE 493 BOOKS SALED
;


SELECT
--*
authors.au_id as "AUTHOR ID",
authors.au_lname AS "LAST NAME",
authors.au_fname AS "FIRST NAME",
COUNT (sales.qty) as "TOTAL"
FROM titles
JOIN sales on titles.title_id = sales.title_id
JOIN titleauthor on titleauthor.title_id = titles.title_id
JOIN authors on authors.au_id = titleauthor.au_id
GROUP BY "AUTHOR ID"
ORDER by "TOTAL" DESC
LIMIT 3
;

--  ######################################################################################
-- Challenge 4 - Best Selling Authors Ranking
SELECT
--*
authors.au_id as "AUTHOR ID",
authors.au_lname AS "LAST NAME",
authors.au_fname AS "FIRST NAME",
COUNT (sales.qty) as "TOTAL"
FROM authors
left JOIN titleauthor on titleauthor.au_id = authors.au_id
left JOIN titles on titleauthor.title_id = titles.title_id
left JOIN sales on titles.title_id = sales.title_id
GROUP BY "AUTHOR ID"
ORDER by "TOTAL" DESC
;


