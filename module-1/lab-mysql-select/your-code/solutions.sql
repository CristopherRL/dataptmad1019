---CHALLENGE 1
SELECT 
authors.au_id, authors.au_lname, authors.au_fname, titles.title, publishers.pub_name
FROM titles
JOIN publishers on titles.pub_id = publishers.pub_id
JOIN titleauthor on titles.title_id = titleauthor.title_id
JOIN authors on titleauthor.au_id = authors.au_id
;
-- CHALENGE 2