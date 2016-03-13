CREATE TABLE "levels" ("id" serial primary key, "badge_id" integer, "fighter_id" integer, "created_at" timestamp NOT NULL, "updated_at" timestamp NOT NULL) ;
INSERT INTO schema_migrations (version) VALUES (20160222192613);
