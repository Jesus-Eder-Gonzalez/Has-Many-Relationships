\timing
-- -- 1
-- SELECT * FROM users;

-- -- 2
-- SELECT * FROM posts WHERE author_id = 100;

-- -- 3
-- SELECT posts.id, posts.title, posts.url, posts.content, posts.created_at, 
--   posts.updated_at, posts.author_id, name.first_name, name.last_name
-- FROM posts 
-- INNER JOIN 
-- (
--   SELECT id, first_name, last_name
--   FROM users
--   WHERE id = 200
-- ) AS name ON author_id = name.id;

-- -- 4
-- SELECT posts.id, posts.title, posts.url, posts.content, posts.created_at, 
--   posts.updated_at, posts.author_id, name.username
-- FROM posts 
-- INNER JOIN 
-- (
--   SELECT id, username
--   FROM users
--   WHERE first_name = 'Norene' AND last_name = 'Schmitt'
-- ) AS name ON author_id = name.id;

-- -- 5
-- SELECT username
-- FROM users
-- INNER JOIN 
-- (
--   SELECT author_id
--   FROM posts
--   WHERE created_at > '2015-01-01'::DATE
-- ) AS post_after ON id = author_id;

-- -- 6
-- SELECT posts.title, posts.content, joined_after.username
-- FROM posts 
-- INNER JOIN 
-- (
--   SELECT id, username
--   FROM users
--   WHERE created_at < '2015-01-01'::DATE
-- ) AS joined_after ON author_id = joined_after.id;

-- -- 7
-- SELECT comments.id, comments.body, comments.created_at, comments.updated_at, 
--  comments.commenter_id, comments.post_id, posts.title AS "Post Title"
-- FROM comments 
-- INNER JOIN posts ON post_id = posts.id;

-- -- 8
-- SELECT p.title AS post_title, p.url AS post_url, comments.body AS comment_body
-- FROM comments 
-- INNER JOIN 
-- (
--   SELECT id, title, url
--   FROM posts
--   WHERE created_at < '2015-01-01'::DATE
-- ) AS p ON post_id = p.id;

-- --9
-- SELECT p.title AS post_title, p.url AS post_url, comments.body AS comment_body
-- FROM comments 
-- INNER JOIN 
-- (
--   SELECT id, title, url
--   FROM posts
--   WHERE created_at > '2015-01-01'::DATE
-- ) AS p ON post_id = p.id;

-- -- 10
-- SELECT posts.title AS post_title, posts.url AS post_url, c.body AS comment_body
-- FROM posts 
-- INNER JOIN 
-- (
--   SELECT body, post_id
--   FROM comments
--   WHERE body LIKE '%USB%'
-- ) AS c ON post_id = posts.id;

-- -- 11
-- -- SELECT p.title AS post_title, first_name, last_name, c.body AS comment_body
-- -- FROM users
-- -- INNER JOIN 
-- -- (
-- --   SELECT body, commenter_id
-- --   FROM comments
-- --   WHERE body LIKE '%matrix%'
-- -- ) AS c ON c.commenter_id = users.id
-- -- INNER JOIN 
-- -- (
-- --   SELECT title, author_id
-- --   FROM posts
-- -- ) AS p ON users.id = p.author_id;

-- SELECT comments.body
-- FROM comments, users, posts
-- WHERE body LIKE '%matrix%' AND comments.post_id = posts.id AND posts.author_id = users.id;

-- -- SELECT body
-- -- FROM comments
-- -- WHERE body LIKE '%matrix%';

-- -- 12
-- SELECT users.first_name, users.last_name, comments.body AS comment_body
-- FROM users, comments, posts
-- WHERE comments.body LIKE '%SSL%' AND posts.content LIKE '%dolorum%' AND users.id = comments.commenter_id AND comments.post_id = posts.id;

-- -- 13
-- SELECT users.first_name AS post_author_first_name, users.last_name AS post_author_last_name, posts.title AS post_title,
-- users.username, comments.body AS comment_body
-- FROM users, comments, posts
-- WHERE (comments.body LIKE '%SSL%' OR  comments.body LIKE '%firewall%') AND 
--   posts.content LIKE '%nemo%' AND users.id = comments.commenter_id AND comments.post_id = posts.id;

-- -- AQ 1
-- SELECT COUNT(*)
-- FROM posts,comments
-- WHERE posts.created_at > '2015-07-14'::DATE AND posts.id = comments.post_id;

-- -- AQ 2
-- SELECT users.username, users.first_name, users.last_name
-- FROM users, comments
-- WHERE comments.body LIKE '%programming%' AND comments.commenter_id = users.id;

\timing