CREATE TABLE "badges" ("id" serial primary key, "name" character varying, "points" integer, "default" boolean, "created_at" timestamp NOT NULL, "updated_at" timestamp NOT NULL) ;
INSERT INTO schema_migrations (version) VALUES (20160222192616);
