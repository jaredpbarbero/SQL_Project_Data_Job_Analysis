CREATE TABLE job_applied (
    job_id INT,
    application_sent_date DATE,
    custom_resume BOOLEAN,
    resume_file_name VARCHAR(255),
    cover_letter_sent BOOLEAN,
    cover_letter_file_name VARCHAR(255),
    status VARCHAR(50)
);

SELECT *
FROM job_applied;

INSERT INTO job_applied (
    job_id,
    application_sent_date,
    custom_resume,
    resume_file_name,
    cover_letter_sent,
    cover_letter_file_name,
    status
)
VALUES(
    1,
    '2024-02-01',
    TRUE,
    'resume_01.pdf',
    TRUE,
    'cover_letter_01.pdf',
    'submitted'),
    (
        2,
    '2024-02-02',
    FALSE,
    'resume_02.pdf',
    FALSE,
    'cover_letter_02.pdf',
    'not submitted')
    ,
    (
           3,
    '2024-02-03',
    TRUE,
    'resume_03.pdf',
    FALSE,
    'cover_letter_03.pdf',
    'submitted'
    );

SELECT *
FROM job_applied;

ALTER TABLE job_applied
ADD contact VARCHAR(50);

SELECT *
FROM job_applied;

UPDATE job_applied
SET contact = 'Erlich Bachman'
WHERE job_id = 1;

UPDATE job_applied
SET contact = 'Leila Pila'
WHERE job_id = 2;

UPDATE job_applied
SET contact = 'Trixie Pixie'
WHERE job_id = 3;

SELECT *
FROM job_applied;

ALTER TABLE job_applied
RENAME COLUMN contact TO contact_name

ALTER TABLE job_applied
ALTER COLUMN contact_name TYPE text;

ALTER TABLE job_applied
DROP COLUMN contact_name;

DROP TABLE job_applied;

CREATE TABLE data_science_jobs (
    job_id INT,
    job_title TEXT,
    company_name TEXT,
    post_date DATE
);
INSERT INTO data_science_jobs(
    job_id,
    job_title,
    company_name,
    post_date
)
VALUES(
    1,
    'Data Scientist',
    'Tech Innovations',
    'January 1, 2023'
),
(
    2,
    'Machine Learning Engineer',
    'Data Driven Co',
    'January 15, 2023'
),
(
    3,
    'AI Specialist',
    'Future Tech',
    'February 1, 2023'
);

SELECT *
FROM data_science_jobs;

ALTER TABLE data_science_jobs
ADD remote BOOLEAN;

ALTER TABLE data_science_jobs
RENAME COLUMN post_date TO posted_on;

ALTER TABLE data_science_jobs
ALTER COLUMN remote SET DEFAULT FALSE;

INSERT INTO data_science_jobs(
    job_id,
    job_title,
    company_name,
    posted_on
)
VALUES(
    4,
    'Data Scientist',
    'Google',
    'February 5, 2023'
);

ALTER TABLE data_science_jobs
DROP COLUMN company_name;

SELECT *
FROM data_science_jobs;

UPDATE data_science_jobs
SET remote = TRUE
WHERE job_id = 2;

SELECT *
FROM data_science_jobs;

DROP TABLE data_science_jobs;