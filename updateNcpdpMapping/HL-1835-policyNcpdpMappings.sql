--query to find the duplicate of ncpdp center and check the 1:1 mapping with policID
SELECT ncpdps_repeated, array_agg("policyID") AS for_policyID
FROM   policy."PolicyNCPDPMappings", unnest(ncpdps) ncpdps_repeated
GROUP  BY ncpdps_repeated
HAVING count(*) > 1
ORDER  BY ncpdps_repeated;

--query to check the ncpdp array is present for these policyIDs 
select * from policy."PolicyNCPDPMappings" where "policyID" in (3670,3671,3638);

--query to delete policyID from "PolicyNCPDPMappings" table
delete from policy."PolicyNCPDPMappings" where "policyID"=3670;
delete from policy."PolicyNCPDPMappings" where "policyID"=3671;
delete from policy."PolicyNCPDPMappings" where "policyID"=3638;