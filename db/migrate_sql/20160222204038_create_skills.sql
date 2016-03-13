CREATE TABLE "skills" ("id" serial primary key, "name" character varying, "badge_id" integer, "created_at" timestamp NOT NULL, "updated_at" timestamp NOT NULL) ;
CREATE  INDEX  "index_skills_on_badge_id" ON "skills"  ("badge_id");
ALTER TABLE "skills" ADD CONSTRAINT "fk_rails_8ed319e134"
FOREIGN KEY ("badge_id")
  REFERENCES "badges" ("id")
;
INSERT INTO schema_migrations (version) VALUES (20160222204038);
