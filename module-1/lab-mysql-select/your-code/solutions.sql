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
SELECT 
-- *
authors.au_id as "AUTHOR ID",
authors.au_lname AS "LAST NAME",
authors.au_fname AS "FIRST NAME",
---titles.title AS "TITLE",
publishers.pub_name AS "PUBLISHER",
COUNT (titles.title) as "TITLE COUNT"
FROM titles
JOIN publishers on titles.pub_id = publishers.pub_id
JOIN titleauthor on titles.title_id = titleauthor.title_id
JOIN authors on titleauthor.au_id = authors.au_id
GROUP BY "AUTHOR ID", publishers.pub_name
ORDER by "AUTHOR ID" DESC,"TITLE COUNT" DESC
;

--  ######################################################################################
-- Challenge 3 - Best Selling Authors
SELECT
--*
authors.au_id as "AUTHOR ID",
authors.au_lname AS "LAST NAME",
authors.au_fname AS "FIRST NAME",
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
