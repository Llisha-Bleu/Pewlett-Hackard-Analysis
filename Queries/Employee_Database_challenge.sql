--Challenge 7 ASSIGNMENT
-- List of all titles that will be retiring 
SELECT  e.emp_no, e.first_name, e.last_name, t.title, t.from_date, t.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

-- Check the retirement_titles table
SELECT * FROM retirement_titles;

-- Use Dictinct with Orderby to remove duplicate rows - CREATING UNIQUE TITLES TABLE
SELECT DISTINCT ON (rt.emp_no) rt.emp_no, rt.first_name, rt.last_name, rt.title
INTO unique_titles
FROM retirement_titles as rt
ORDER BY rt.emp_no, rt.to_date DESC;

-- Check the unique_titles table
SELECT * FROM unique_titles;

-- COUNT OF RETIRING TITLES
SELECT COUNT (ut.emp_no), ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY count DESC;

-- Check the retiring_titles table
SELECT * FROM retiring_titles;

-- CREATING NEW MENTORSHIP ELIGIBILTY TABLE
SELECT DISTINCT ON (e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date, de.from_date, de.to_date, t.title
INTO mentorship_eligibilty
FROM employees as e
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (de.to_date = '9999-01-01')
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;

-- Check the mentorship_eligibilty table
SELECT * FROM mentorship_eligibilty;