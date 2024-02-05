select * from (select  ssp.policyID,ssp.policyName,ssp.contractID,ssp.IsMedicarePolicy,ssp.contractName,ssp.clientID,ssp.clientName,ssc.centerID,ssc.activeasof,ssc.activethru from (select sp.policyID,sp.policyName,sp.contractID,sp.IsMedicarePolicy,sp.contractName,sp.clientID,sc.clientName
from(select pp.policyID,pp.policyName,pc.contractID,pp.IsMedicarePolicy,pc.contractName,pc.clientID from dbo.Policy  pp join dbo.Contract pc on pp.contractID=pc.contractID
where policyName like 'RCS%') sp join dbo.Client sc on sp.clientID = sc.clientID) ssp 
left join dbo.policyCenter ssc on ssp.policyID=ssc.policyid) sssp left join dbo.pharmacy sssc on sssp.centerID = sssc.centerid;
