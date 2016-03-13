CREATE TABLE "fights" ("id" serial primary key, "fighter_id" integer, "opponent_id" integer, "created_at" timestamp NOT NULL, "updated_at" timestamp NOT NULL) ;
INSERT INTO schema_migrations (version) VALUES (20160223193535);
