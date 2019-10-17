use xz_laptop;

ALTER TABLE xz_laptop ADD attention BOOL;

UPDATE xz_laptop SET attention = 1;
