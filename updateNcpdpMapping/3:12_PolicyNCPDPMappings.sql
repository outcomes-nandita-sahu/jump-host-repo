--query to find the duplicate of ncpdp center and check the 1:1 mapping with policID
SELECT ncpdps_repeated, array_agg("policyID") AS for_policyID
FROM   policy."PolicyNCPDPMappings", unnest(ncpdps) ncpdps_repeated
GROUP  BY ncpdps_repeated
HAVING count(*) > 1
ORDER  BY ncpdps_repeated;

--query to check the ncpdp array is present for these policyIDs 
select * from policy."PolicyNCPDPMappings" where "policyID" in (3523,3817,4541,3899,3175,2465,2164,4023,3665,4148);

--query to delete policyID from "PolicyNCPDPMappings" table
delete from policy."PolicyNCPDPMappings" where "policyID"=3523;
delete from policy."PolicyNCPDPMappings" where "policyID"=3817;
delete from policy."PolicyNCPDPMappings" where "policyID"=4541;
delete from policy."PolicyNCPDPMappings" where "policyID"=3899;
delete from policy."PolicyNCPDPMappings" where "policyID"=3175;
delete from policy."PolicyNCPDPMappings" where "policyID"=2465;
delete from policy."PolicyNCPDPMappings" where "policyID"=2164;
delete from policy."PolicyNCPDPMappings" where "policyID"=4023;
delete from policy."PolicyNCPDPMappings" where "policyID"=3665;
delete from policy."PolicyNCPDPMappings" where "policyID"=4148;

--query to find any of the policyID already present in the "PolicyNCPDPMappings" table.
select * from policy."PolicyNCPDPMappings" where "policyID" in (4571,4572,4573,4574,4575,4576,4577,4578,4579,4580,4581,2356);

--query to insert values in "PolicyNCPDPMappings" table.
INSERT INTO policy."PolicyNCPDPMappings" ("policyID", "policyName", "ncpdps", "createdAt", "createdBy", "clientID") VALUES (4571, (select "policyName" from policy."Policy" where "policyID" = 4571), '{2377984}', NOW(), 'SYSTEM',(SELECT cl."clientID" FROM policy."Policy" p left join policy."Contract" co on  co."contractID" = p."contractID" join policy."Client" cl on co."clientID" = cl."clientID" where p."policyID" = 4571));
INSERT INTO policy."PolicyNCPDPMappings" ("policyID", "policyName", "ncpdps", "createdAt", "createdBy", "clientID") VALUES (4572, (select "policyName" from policy."Policy" where "policyID" = 4572), '{2380424}', NOW(), 'SYSTEM',(SELECT cl."clientID" FROM policy."Policy" p left join policy."Contract" co on  co."contractID" = p."contractID" join policy."Client" cl on co."clientID" = cl."clientID" where p."policyID" = 4572));
INSERT INTO policy."PolicyNCPDPMappings" ("policyID", "policyName", "ncpdps", "createdAt", "createdBy", "clientID") VALUES (4573, (select "policyName" from policy."Policy" where "policyID" = 4573), '{2385311}', NOW(), 'SYSTEM',(SELECT cl."clientID" FROM policy."Policy" p left join policy."Contract" co on  co."contractID" = p."contractID" join policy."Client" cl on co."clientID" = cl."clientID" where p."policyID" = 4573));
INSERT INTO policy."PolicyNCPDPMappings" ("policyID", "policyName", "ncpdps", "createdAt", "createdBy", "clientID") VALUES (4574, (select "policyName" from policy."Policy" where "policyID" = 4574), '{1840380}', NOW(), 'SYSTEM',(SELECT cl."clientID" FROM policy."Policy" p left join policy."Contract" co on  co."contractID" = p."contractID" join policy."Client" cl on co."clientID" = cl."clientID" where p."policyID" = 4574));
INSERT INTO policy."PolicyNCPDPMappings" ("policyID", "policyName", "ncpdps", "createdAt", "createdBy", "clientID") VALUES (4575, (select "policyName" from policy."Policy" where "policyID" = 4575), '{5679824}', NOW(), 'SYSTEM',(SELECT cl."clientID" FROM policy."Policy" p left join policy."Contract" co on  co."contractID" = p."contractID" join policy."Client" cl on co."clientID" = cl."clientID" where p."policyID" = 4575));
INSERT INTO policy."PolicyNCPDPMappings" ("policyID", "policyName", "ncpdps", "createdAt", "createdBy", "clientID") VALUES (4576, (select "policyName" from policy."Policy" where "policyID" = 4576), '{2249236}', NOW(), 'SYSTEM',(SELECT cl."clientID" FROM policy."Policy" p left join policy."Contract" co on  co."contractID" = p."contractID" join policy."Client" cl on co."clientID" = cl."clientID" where p."policyID" = 4576));
INSERT INTO policy."PolicyNCPDPMappings" ("policyID", "policyName", "ncpdps", "createdAt", "createdBy", "clientID") VALUES (4577, (select "policyName" from policy."Policy" where "policyID" = 4577), '{2385501}', NOW(), 'SYSTEM',(SELECT cl."clientID" FROM policy."Policy" p left join policy."Contract" co on  co."contractID" = p."contractID" join policy."Client" cl on co."clientID" = cl."clientID" where p."policyID" = 4577));
INSERT INTO policy."PolicyNCPDPMappings" ("policyID", "policyName", "ncpdps", "createdAt", "createdBy", "clientID") VALUES (4578, (select "policyName" from policy."Policy" where "policyID" = 4578), '{2700703}', NOW(), 'SYSTEM',(SELECT cl."clientID" FROM policy."Policy" p left join policy."Contract" co on  co."contractID" = p."contractID" join policy."Client" cl on co."clientID" = cl."clientID" where p."policyID" = 4578));
INSERT INTO policy."PolicyNCPDPMappings" ("policyID", "policyName", "ncpdps", "createdAt", "createdBy", "clientID") VALUES (4579, (select "policyName" from policy."Policy" where "policyID" = 4579), '{2505456}', NOW(), 'SYSTEM',(SELECT cl."clientID" FROM policy."Policy" p left join policy."Contract" co on  co."contractID" = p."contractID" join policy."Client" cl on co."clientID" = cl."clientID" where p."policyID" = 4579));
INSERT INTO policy."PolicyNCPDPMappings" ("policyID", "policyName", "ncpdps", "createdAt", "createdBy", "clientID") VALUES (4580, (select "policyName" from policy."Policy" where "policyID" = 4580), '{5652981}', NOW(), 'SYSTEM',(SELECT cl."clientID" FROM policy."Policy" p left join policy."Contract" co on  co."contractID" = p."contractID" join policy."Client" cl on co."clientID" = cl."clientID" where p."policyID" = 4580));
INSERT INTO policy."PolicyNCPDPMappings" ("policyID", "policyName", "ncpdps", "createdAt", "createdBy", "clientID") VALUES (4581, (select "policyName" from policy."Policy" where "policyID" = 4581), '{3335785}', NOW(), 'SYSTEM',(SELECT cl."clientID" FROM policy."Policy" p left join policy."Contract" co on  co."contractID" = p."contractID" join policy."Client" cl on co."clientID" = cl."clientID" where p."policyID" = 4581));
INSERT INTO policy."PolicyNCPDPMappings" ("policyID", "policyName", "ncpdps", "createdAt", "createdBy", "clientID") VALUES (2356, (select "policyName" from policy."Policy" where "policyID" = 2356), '{2700296}', NOW(), 'SYSTEM',(SELECT cl."clientID" FROM policy."Policy" p left join policy."Contract" co on  co."contractID" = p."contractID" join policy."Client" cl on co."clientID" = cl."clientID" where p."policyID" = 2356));

SELECT json_agg(json_build_object('policyNCPDPMappingID',"policyNCPDPMappingID",
                                  'policyID',"policyID",
								  'policyName', ("policyName"),
								'ncpdps', ("ncpdps"),
		'createdAt', ("createdAt"),
		'createdBy', ("createdBy"),
		'updatedAt', ("updatedAt"),
		'updatedBy', ("updatedBy"),
    'clientID', ("clientID")
))  from policy."PolicyNCPDPMappings";

--UPDATE policy."PolicyNCPDPMappings" SET ncpdps = array_append(ncpdps, '---') WHERE  "policyID" = ----;

