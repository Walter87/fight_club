ALTER TABLE "fighters" ADD "avatar_file_name" character varying;
ALTER TABLE "fighters" ADD "avatar_content_type" character varying;
ALTER TABLE "fighters" ADD "avatar_file_size" integer;
ALTER TABLE "fighters" ADD "avatar_updated_at" timestamp;
INSERT INTO schema_migrations (version) VALUES (20160222122219);
