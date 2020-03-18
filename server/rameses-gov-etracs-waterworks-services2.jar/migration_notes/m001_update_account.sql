UPDATE waterworks_account wa, waterworks_stubout_node sn, waterworks_stubout so  
SET  
	 wa.stuboutid = sn.stuboutid,
   wa.subareaid = so.subareaid,
	 wa.seqno = sn.indexno 
WHERE wa.stuboutnodeid = sn.objid 
AND sn.stuboutid = so.objid 