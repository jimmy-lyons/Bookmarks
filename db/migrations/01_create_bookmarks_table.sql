CREATE TABLE bookmarks(id SERIAL PRIMARY KEY, url VARCHAR(60));

INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com/');

INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com/');
INSERT INTO bookmarks (url) VALUES ('http://www.askjeeves.com/');
INSERT INTO bookmarks (url) VALUES ('http://www.twitter.com/');
INSERT INTO bookmarks (url) VALUES ('http://www.google.com/');

DELETE FROM bookmarks WHERE url = 'http://www.askjeeves.com/';

UPDATE bookmarks SET url = 'http://www.destroyallsoftware.com/' WHERE url = 'http://www.twitter.com/';