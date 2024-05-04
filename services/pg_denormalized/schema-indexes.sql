CREATE INDEX denormalized1 ON tweets_jsonb USING GIN((data->'entities'->'hashtags'));
CREATE INDEX denormalized2 ON tweets_jsonb USING GIN((data->'extended_tweet'->'entities'->'hashtags'));
CREATE INDEX denormalized3 ON tweets_jsonb USING GIN(to_tsvector('english', COALESCE(data->'extended_tweet'->>'full_text', data->>'text'))) WHERE (data->>'lang'='en');
CREATE INDEX denormalized4 ON tweets_jsonb((data->>'lang'));
