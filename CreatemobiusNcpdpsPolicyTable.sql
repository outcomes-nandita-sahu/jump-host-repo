CREATE SEQUENCE IF NOT EXISTS policy."PolicyNCPDPMappings_policyNCPDPMappingID_seq";
CREATE TABLE IF NOT EXISTS policy."PolicyNCPDPMappings"
(
    "policyNCPDPMappingID" integer NOT NULL DEFAULT nextval('policy."PolicyNCPDPMappings_policyNCPDPMappingID_seq"'::regclass),
    "policyID" integer NOT NULL,
    "policyName" character varying(100) COLLATE pg_catalog."default" NOT NULL,
    "ncpdps" text[],
    "createdAt" timestamp with time zone NOT NULL,
    "createdBy" character varying(100) COLLATE pg_catalog."default",
    "updatedAt" timestamp with time zone,
    "updatedBy" character varying(100) COLLATE pg_catalog."default",
    CONSTRAINT "PolicyNCPDPMappings_pkey" PRIMARY KEY ("policyNCPDPMappingID")
)
TABLESPACE pg_default;

ALTER TABLE policy."PolicyNCPDPMappings" OWNER to pcdb_admin;

GRANT ALL ON TABLE policy."PolicyNCPDPMappings" TO pcdb_admin;

GRANT DELETE, UPDATE, INSERT, SELECT ON TABLE policy."PolicyNCPDPMappings" TO pcdb_dml;



CREATE OR REPLACE FUNCTION policy.notify_mobius_policy_insert()
RETURNS TRIGGER AS $$
BEGIN
    -- Send a notification using pg_notify when a new record is inserted
    PERFORM pg_notify( CAST('mobius_policy_insert' AS text), row_to_json(NEW)::text);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS mobius_policy_insert_trigger
   ON "policy"."PolicyNCPDPMappings";
CREATE TRIGGER mobius_policy_insert_trigger
AFTER INSERT
ON policy."PolicyNCPDPMappings"
FOR EACH ROW
EXECUTE PROCEDURE policy.notify_mobius_policy_insert();

CREATE OR REPLACE FUNCTION policy.notify_mobius_policy_update()
RETURNS TRIGGER AS $$
BEGIN
    -- Send a notification using pg_notify when a new record is inserted
    PERFORM pg_notify( CAST('mobius_policy_update' AS text), row_to_json(NEW)::text);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS mobius_policy_update_trigger
   ON "policy"."PolicyNCPDPMappings";
CREATE TRIGGER mobius_policy_update_trigger
AFTER UPDATE
ON policy."PolicyNCPDPMappings"
FOR EACH ROW
EXECUTE PROCEDURE policy.notify_mobius_policy_update();
