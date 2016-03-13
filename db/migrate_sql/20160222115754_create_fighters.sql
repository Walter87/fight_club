CREATE TABLE "fighters" ("id" serial primary key, "first_name" character varying, "last_name" character varying, "description" text, "created_at" timestamp NOT NULL, "updated_at" timestamp NOT NULL) ;
INSERT INTO schema_migrations (version) VALUES (20160222115754);
