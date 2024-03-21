--query to find the duplicate of ncpdp center and check the 1:1 mapping with policID
SELECT ncpdps_repeated, array_agg("policyID") AS for_policyID
FROM   policy."PolicyNCPDPMappings", unnest(ncpdps) ncpdps_repeated
GROUP  BY ncpdps_repeated
HAVING count(*) > 1
ORDER  BY ncpdps_repeated;

--query to check the ncpdp array is present for these policyIDs 
select * from policy."PolicyNCPDPMappings" where "policyID" in (2187,3646,2503,3550,3672,3214,2887,3337,3458,4042,2902,2903);

--query to delete policyID from "PolicyNCPDPMappings" table
delete from policy."PolicyNCPDPMappings" where "policyID"=2187;
delete from policy."PolicyNCPDPMappings" where "policyID"=3646;
delete from policy."PolicyNCPDPMappings" where "policyID"=2503;
delete from policy."PolicyNCPDPMappings" where "policyID"=3550;
delete from policy."PolicyNCPDPMappings" where "policyID"=3672;
delete from policy."PolicyNCPDPMappings" where "policyID"=3214;
delete from policy."PolicyNCPDPMappings" where "policyID"=2887;
delete from policy."PolicyNCPDPMappings" where "policyID"=3337;
delete from policy."PolicyNCPDPMappings" where "policyID"=3458;
delete from policy."PolicyNCPDPMappings" where "policyID"=4042;
delete from policy."PolicyNCPDPMappings" where "policyID"=2902;
delete from policy."PolicyNCPDPMappings" where "policyID"=2903;


--query to find any of the policyID already present in the "PolicyNCPDPMappings" table.
select * from policy."PolicyNCPDPMappings" where "policyID" in (4587,4588,4589,4590);

--query to insert values in "PolicyNCPDPMappings" table.
INSERT INTO policy."PolicyNCPDPMappings" ("policyID", "policyName", "ncpdps", "createdAt", "createdBy", "clientID") VALUES (4587, (select "policyName" from policy."Policy" where "policyID" = 4587), '{4021325}', NOW(), 'SYSTEM',(SELECT cl."clientID" FROM policy."Policy" p left join policy."Contract" co on  co."contractID" = p."contractID" join policy."Client" cl on co."clientID" = cl."clientID" where p."policyID" = 4587));
INSERT INTO policy."PolicyNCPDPMappings" ("policyID", "policyName", "ncpdps", "createdAt", "createdBy", "clientID") VALUES (4588, (select "policyName" from policy."Policy" where "policyID" = 4588), '{2388191}', NOW(), 'SYSTEM',(SELECT cl."clientID" FROM policy."Policy" p left join policy."Contract" co on  co."contractID" = p."contractID" join policy."Client" cl on co."clientID" = cl."clientID" where p."policyID" = 4588));
INSERT INTO policy."PolicyNCPDPMappings" ("policyID", "policyName", "ncpdps", "createdAt", "createdBy", "clientID") VALUES (4589, (select "policyName" from policy."Policy" where "policyID" = 4589), '{5681057}', NOW(), 'SYSTEM',(SELECT cl."clientID" FROM policy."Policy" p left join policy."Contract" co on  co."contractID" = p."contractID" join policy."Client" cl on co."clientID" = cl."clientID" where p."policyID" = 4589));
INSERT INTO policy."PolicyNCPDPMappings" ("policyID", "policyName", "ncpdps", "createdAt", "createdBy", "clientID") VALUES (4590, (select "policyName" from policy."Policy" where "policyID" = 4590), '{0628478}', NOW(), 'SYSTEM',(SELECT cl."clientID" FROM policy."Policy" p left join policy."Contract" co on  co."contractID" = p."contractID" join policy."Client" cl on co."clientID" = cl."clientID" where p."policyID" = 4590));


--UPDATE policy."PolicyNCPDPMappings" SET ncpdps = array_append(ncpdps, '---') WHERE  "policyID" = ----;

