--query to find the duplicate of ncpdp center and check the 1:1 mapping with policID
SELECT ncpdps_repeated, array_agg("policyID") AS for_policyID
FROM   policy."PolicyNCPDPMappings", unnest(ncpdps) ncpdps_repeated
GROUP  BY ncpdps_repeated
HAVING count(*) > 1
ORDER  BY ncpdps_repeated;

--query to check the ncpdp array is present for these policyIDs 
select * from policy."PolicyNCPDPMappings" where "policyID" in (2983,3073,4038);

--query to delete policyID from "PolicyNCPDPMappings" table
delete from policy."PolicyNCPDPMappings" where "policyID"=2983;
delete from policy."PolicyNCPDPMappings" where "policyID"=3073;
delete from policy."PolicyNCPDPMappings" where "policyID"=4038;


--query to find any of the policyID already present in the "PolicyNCPDPMappings" table.
select * from policy."PolicyNCPDPMappings" where "policyID" in (4591,4592,4593);

--query to insert values in "PolicyNCPDPMappings" table.
INSERT INTO policy."PolicyNCPDPMappings" ("policyID", "policyName", "ncpdps", "createdAt", "createdBy", "clientID") VALUES (4591, (select "policyName" from policy."Policy" where "policyID" = 4591), '{5643538}', NOW(), 'SYSTEM',(SELECT cl."clientID" FROM policy."Policy" p left join policy."Contract" co on  co."contractID" = p."contractID" join policy."Client" cl on co."clientID" = cl."clientID" where p."policyID" = 4591));
INSERT INTO policy."PolicyNCPDPMappings" ("policyID", "policyName", "ncpdps", "createdAt", "createdBy", "clientID") VALUES (4592, (select "policyName" from policy."Policy" where "policyID" = 4592), '{5819884}', NOW(), 'SYSTEM',(SELECT cl."clientID" FROM policy."Policy" p left join policy."Contract" co on  co."contractID" = p."contractID" join policy."Client" cl on co."clientID" = cl."clientID" where p."policyID" = 4592));
INSERT INTO policy."PolicyNCPDPMappings" ("policyID", "policyName", "ncpdps", "createdAt", "createdBy", "clientID") VALUES (4593, (select "policyName" from policy."Policy" where "policyID" = 4593), '{6008026}', NOW(), 'SYSTEM',(SELECT cl."clientID" FROM policy."Policy" p left join policy."Contract" co on  co."contractID" = p."contractID" join policy."Client" cl on co."clientID" = cl."clientID" where p."policyID" = 4593));


--UPDATE policy."PolicyNCPDPMappings" SET ncpdps = array_append(ncpdps, '---') WHERE  "policyID" = ----;

