DROP TABLE IF EXISTS articles;

CREATE TABLE articles (
  id SERIAL PRIMARY KEY,
  title       VARCHAR(100),
  url         VARCHAR(200),
  description VARCHAR(500)
);
