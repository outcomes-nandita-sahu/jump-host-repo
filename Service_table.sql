-- Table: service.Service

-- DROP TABLE IF EXISTS service."Service";

CREATE TABLE IF NOT EXISTS service."Service"
(
    "serviceID" integer NOT NULL DEFAULT nextval('service."Service_serviceID_seq"'::regclass),
    "serviceName" character varying(255) COLLATE pg_catalog."default",
    "serviceDisplayName" character varying(255) COLLATE pg_catalog."default",
    "globalServiceVersion" integer NOT NULL,
    "validFrom" timestamp with time zone,
    "validTill" timestamp with time zone,
    "isPublished" integer NOT NULL,
    "serviceTypeID" integer,
    "createdAt" timestamp with time zone DEFAULT now(),
    "createdBy" character varying(255) COLLATE pg_catalog."default",
    "updatedAt" timestamp with time zone DEFAULT now(),
    "updatedBy" character varying(255) COLLATE pg_catalog."default",
    "legacyTIPDetailID" integer,
    "serviceType" character varying(255) COLLATE pg_catalog."default",
    status service."enum_Service_status" GENERATED ALWAYS AS (
CASE
    WHEN (("validFrom" IS NULL) AND ("validTill" IS NULL) AND ("isPublished" = 0)) THEN 'DRAFT'::service."enum_Service_status"
    WHEN (("validFrom" IS NOT NULL) AND service.ispastdate("validFrom") AND (("validTill" IS NULL) OR (service.isfuturedate("validTill") AND ("validFrom" < "validTill"))) AND ("isPublished" = 1)) THEN 'ACTIVE'::service."enum_Service_status"
    WHEN (("validFrom" IS NOT NULL) AND service.isfuturedate("validFrom") AND (("validTill" IS NULL) OR (service.isfuturedate("validTill") AND ("validFrom" < "validTill"))) AND ("isPublished" = 1)) THEN 'SCHEDULED'::service."enum_Service_status"
    WHEN (("validFrom" IS NOT NULL) AND ("validFrom" < "validTill") AND service.ispastdate("validTill")) THEN 'INACTIVE'::service."enum_Service_status"
    ELSE NULL::service."enum_Service_status"
END) STORED,
    CONSTRAINT "Service_pkey" PRIMARY KEY ("serviceID", "globalServiceVersion"),
    CONSTRAINT "Service_serviceTypeID_fkey" FOREIGN KEY ("serviceTypeID")
        REFERENCES service."ServiceType" ("serviceTypeID") MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS service."Service"
    OWNER to pcdb_admin;

REVOKE ALL ON TABLE service."Service" FROM pcdb_dml;

GRANT ALL ON TABLE service."Service" TO pcdb_admin;

GRANT DELETE, UPDATE, INSERT, SELECT ON TABLE service."Service" TO pcdb_dml;
-- Index: Service_serviceID_serviceName_legacyTIPDetailID

-- DROP INDEX IF EXISTS service."Service_serviceID_serviceName_legacyTIPDetailID";

CREATE INDEX IF NOT EXISTS "Service_serviceID_serviceName_legacyTIPDetailID"
    ON service."Service" USING btree
    ("serviceID" ASC NULLS LAST, "serviceName" COLLATE pg_catalog."default" ASC NULLS LAST, "legacyTIPDetailID" ASC NULLS LAST)
    TABLESPACE pg_default;
