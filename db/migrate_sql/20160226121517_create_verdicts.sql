CREATE TABLE "verdicts" ("id" serial primary key, "winner_id" integer, "loser_id" integer, "created_at" timestamp NOT NULL, "updated_at" timestamp NOT NULL) ;
INSERT INTO schema_migrations (version) VALUES (20160226121517);
