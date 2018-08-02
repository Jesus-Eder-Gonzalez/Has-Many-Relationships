CREATE USER has_many_user;
CREATE DATABASE has_many_blogs WITH OWNER has_many_user;

DROP TABLE IF EXISTS users;

CREATE TABLE users 
(
  id SERIAL NOT NULL PRIMARY KEY,
  username character varying(90) NOT NULL,
  first_name character varying(90) NULL,
  last_name character varying(90) NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT now(),
  updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now()
);

DROP TABLE IF EXISTS posts;

CREATE TABLE posts 
(
  id SERIAL NOT NULL PRIMARY KEY,
  title character varying(180) NULL,
  url character varying(510) NULL,
  content text NULL,
  created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
  updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
  author_id INTEGER REFERENCES users(id)
);

DROP TABLE IF EXISTS comments;

CREATE TABLE comments 
(
  id SERIAL NOT NULL PRIMARY KEY,
  body character varying(510) NULL,
  created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
  updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
  commenter_id INTEGER REFERENCES users(id),
  post_id INTEGER REFERENCES posts(id)
);


CREATE INDEX author_idx ON posts(author_id);
CREATE INDEX user_idx ON users(id);
CREATE INDEX commenter_idx ON comments(commenter_id);
CREATE INDEX post_idx ON post(id);
CREATE INDEX post_parent_idx ON comments(post_id);