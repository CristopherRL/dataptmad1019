---Challenge 1 - Who Have Published What At Where?
SELECT 
authors.au_id as AUTHOR_ID,
authors.au_lname AS LAST_NAME,
authors.au_fname AS FIRST_NAME,
titles.title AS TITLE,
publishers.pub_name AS PUBLISHER
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
authors.au_id as AUTHOR_ID, authors.au_lname AS LAST_NAME,
authors.au_fname AS FIRST_NAME, publishers.pub_name AS PUBLISHER,
COUNT (titles.title) AS TITLE
FROM titles
JOIN publishers on titles.pub_id = publishers.pub_id
JOIN titleauthor on titles.title_id = titleauthor.title_id
JOIN authors on titleauthor.au_id = authors.au_id
;

