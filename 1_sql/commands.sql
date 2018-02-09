-- Comparing JSON vs JSONB
ALTER TABLE dbpedia
  ALTER COLUMN dbpedia_content
  SET DATA TYPE jsonb
  USING dbpedia_content::jsonb;

EXPLAIN ANALYZE
SELECT * FROM dbpedia
WHERE dbpedia_content->>'cinematography' = 'Tak_Fujimoto';

-- Create an index on dbpedia_content->>'cinematography'
DROP INDEX IF EXISTS dbpedia_content_cinematography;
CREATE INDEX dbpedia_content_cinematography ON dbpedia USING gin ((dbpedia_content->'cinematography'));

-- Querying the JSONB
EXPLAIN ANALYZE
SELECT * FROM dbpedia
WHERE dbpedia_content->>'cinematography' = 'Tak_Fujimoto';
--WHERE dbpedia_content->'cinematography' ? 'Tak_Fujimoto';

-- EXPLAIN
EXPLAIN
SELECT * FROM dbpedia
WHERE dbpedia_content->>'cinematography' = 'Tak_Fujimoto';

-- EXPLAIN
EXPLAIN (analyze on buffers on)
SELECT * FROM dbpedia
WHERE dbpedia_content->>'cinematography' = 'Tak_Fujimoto';

-- PostgreSQL functions over columns
SELECT unnest(string_to_array(genres, '|')) as genre, title from movie