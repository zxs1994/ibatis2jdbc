-- SQLMap 全量扫描与转换测试 SQL
-- test start: 2026-05-16 20:21:11
-- test end: 2026-05-16 20:21:11
-- scan root: classpath(java.class.path)
-- file count: 45
-- source count: 45
-- statementId count: 1409
-- tested statementId count: 1409
-- pass: 1407
-- fail: 2

-- per-xml conversion summary
-- source: phonemessage_sqlmap.xml
-- statement count: 3
-- pass: 3
-- fail: 0
-- elapsed(ms): 5

-- source: datainit_sqlmap.xml
-- statement count: 33
-- pass: 33
-- fail: 0
-- elapsed(ms): 11

-- source: asset_sqlmap.xml
-- statement count: 57
-- pass: 57
-- fail: 0
-- elapsed(ms): 16

-- source: bbs_sqlmap.xml
-- statement count: 5
-- pass: 5
-- fail: 0
-- elapsed(ms): 2

-- source: role_sqlmap.xml
-- statement count: 13
-- pass: 13
-- fail: 0
-- elapsed(ms): 3

-- source: riskAssessment_sqlmap.xml
-- statement count: 2
-- pass: 2
-- fail: 0
-- elapsed(ms): 0

-- source: member_sqlmap.xml
-- statement count: 5
-- pass: 5
-- fail: 0
-- elapsed(ms): 1

-- source: formatLog_sqlmap.xml
-- statement count: 3
-- pass: 3
-- fail: 0
-- elapsed(ms): 0

-- source: aml_sqlmap.xml
-- statement count: 11
-- pass: 11
-- fail: 0
-- elapsed(ms): 2

-- source: authinfoinit_sqlmap.xml
-- statement count: 20
-- pass: 20
-- fail: 0
-- elapsed(ms): 4

-- source: promo_sqlmap.xml
-- statement count: 20
-- pass: 20
-- fail: 0
-- elapsed(ms): 4

-- source: signOffSerial_sqlmap.xml
-- statement count: 9
-- pass: 9
-- fail: 0
-- elapsed(ms): 2

-- source: org_sqlmap.xml
-- statement count: 94
-- pass: 94
-- fail: 0
-- elapsed(ms): 23

-- source: welfare_sqlmap.xml
-- statement count: 130
-- pass: 130
-- fail: 0
-- elapsed(ms): 33

-- source: report_sqlmap.xml
-- statement count: 31
-- pass: 31
-- fail: 0
-- elapsed(ms): 3

-- source: msgShielded_sqlmap.xml
-- statement count: 2
-- pass: 2
-- fail: 0
-- elapsed(ms): 0

-- source: propagandize_sqlmap.xml
-- statement count: 2
-- pass: 2
-- fail: 0
-- elapsed(ms): 0

-- source: operdemand_sqlmap.xml
-- statement count: 1
-- pass: 1
-- fail: 0
-- elapsed(ms): 0

-- source: evection_sqlmap.xml
-- statement count: 7
-- pass: 6
-- fail: 1
-- elapsed(ms): 2

-- source: contract_sqlmap.xml
-- statement count: 61
-- pass: 61
-- fail: 0
-- elapsed(ms): 13

-- source: defaultgroup_sqlmap.xml
-- statement count: 5
-- pass: 5
-- fail: 0
-- elapsed(ms): 0

-- source: fullpolling_sqlmap.xml
-- statement count: 34
-- pass: 34
-- fail: 0
-- elapsed(ms): 4

-- source: productcontract_sqlmap.xml
-- statement count: 32
-- pass: 32
-- fail: 0
-- elapsed(ms): 4

-- source: post_sqlmap.xml
-- statement count: 26
-- pass: 26
-- fail: 0
-- elapsed(ms): 3

-- source: meeting_sqlmap.xml
-- statement count: 45
-- pass: 45
-- fail: 0
-- elapsed(ms): 9

-- source: formField_sqlmap.xml
-- statement count: 13
-- pass: 13
-- fail: 0
-- elapsed(ms): 1

-- source: seal_sqlmap.xml
-- statement count: 20
-- pass: 20
-- fail: 0
-- elapsed(ms): 2

-- source: affair_sqlmap.xml
-- statement count: 42
-- pass: 42
-- fail: 0
-- elapsed(ms): 6

-- source: phone_sqlmap.xml
-- statement count: 52
-- pass: 52
-- fail: 0
-- elapsed(ms): 6

-- source: common_sqlmap.xml
-- statement count: 147
-- pass: 147
-- fail: 0
-- elapsed(ms): 22

-- source: laborunion_sqlmap.xml
-- statement count: 13
-- pass: 13
-- fail: 0
-- elapsed(ms): 10

-- source: productinfo_sqlmap.xml
-- statement count: 52
-- pass: 52
-- fail: 0
-- elapsed(ms): 7

-- source: forminfosearch_sqlmap.xml
-- statement count: 4
-- pass: 4
-- fail: 0
-- elapsed(ms): 0

-- source: file_sqlmap.xml
-- statement count: 22
-- pass: 22
-- fail: 0
-- elapsed(ms): 2

-- source: flowdata_sqlmap.xml
-- statement count: 9
-- pass: 9
-- fail: 0
-- elapsed(ms): 1

-- source: flowSend_sqlmap.xml
-- statement count: 11
-- pass: 11
-- fail: 0
-- elapsed(ms): 1

-- source: correspondence_sqlmap.xml
-- statement count: 8
-- pass: 8
-- fail: 0
-- elapsed(ms): 2

-- source: person_sqlmap.xml
-- statement count: 13
-- pass: 13
-- fail: 0
-- elapsed(ms): 1

-- source: vote_sqlmap.xml
-- statement count: 4
-- pass: 4
-- fail: 0
-- elapsed(ms): 0

-- source: archiving_sqlmap.xml
-- statement count: 7
-- pass: 7
-- fail: 0
-- elapsed(ms): 0

-- source: flow_sqlmap.xml
-- statement count: 7
-- pass: 7
-- fail: 0
-- elapsed(ms): 0

-- source: outsourcemanager_sqlmap.xml
-- statement count: 76
-- pass: 75
-- fail: 1
-- elapsed(ms): 8

-- source: opinion_sqlmap.xml
-- statement count: 8
-- pass: 8
-- fail: 0
-- elapsed(ms): 0

-- source: hr_sqlmap.xml
-- statement count: 232
-- pass: 232
-- fail: 0
-- elapsed(ms): 26

-- source: managenote_sqlmap.xml
-- statement count: 18
-- pass: 18
-- fail: 0
-- elapsed(ms): 1

-- statementId: nodeState.update
-- lookupStatementId: nodeState.update
-- source: phonemessage_sqlmap.xml
-- type: update
-- params: "VALUE_001"
update vm_phonemessage f set f.fillstate =1 where f.id in ( VALUE_001);

-- statementId: getMasterid.select
-- lookupStatementId: getMasterid.select
-- source: phonemessage_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id from vm_phonemessage where id in ( select wf_supernode_control.master_id from wf_supernode_control where id in(VALUE_001));

-- statementId: getNodeToken.select
-- lookupStatementId: getNodeToken.select
-- source: phonemessage_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select sc.id id,TO_CHAR(INVOKE_TIME / (1000 * 60 * 60 * 24) + TO_DATE('1970-01-01 08:00:00', 'yyyy-MM-dd HH24:mi:ss'), 'yyyy-MM-dd HH24:mi:ss') time from (select sc.*, xmltype(nvl(sc.data_id,'<data/>')).extract('/data/init/nodecode/text()').getStringVal() nodecode from (select wscd.return_code, WSC.id id,WSC.PROCESS_ID PROCESS_ID,WSCD.DATA_ID DATA_ID,WSCD.INVOKE_TIME invoke_time from WF_SUPERNODE_CONTROL wsc inner join WF_SUPERNODE_CONTROL_DETAIL wscd on wsc.id=WSCD.CONTROL_ID) sc where sc.process_id in (select d.process_id from col_summary d where d.FORM_RECORDID in (select ph.id from vm_phonemessageson phs join vm_phonemessage ph on phs.formmain_id = ph.id where phs.reson is null and to_number(to_date(to_char(sysdate, 'yyyy-MM-dd HH24:mi:ss'), 'yyyy-MM-dd HH24:mi:ss') - to_date(to_char(ph.nodetime, 'yyyy-MM-dd HH24:mi:ss'), 'yyyy-MM-dd HH24:mi:ss')) * 24 >='VALUE_001') and d.templete_id in (select id from CTP_TEMPLATE tp where tp.templete_number = 'IRC_PhoneRemind_T001')) and sc.return_code = 0 and sc.data_id like chr(60)||'data%') sc where existsnode(xmltype(nvl(sc.data_id, '<data/>')), '/data/init[nodecode="逾期提交判断"]') = 1 order by sc.invoke_time desc;

-- statementId: getMemberInfoByMemIdOrOrg.select
-- lookupStatementId: getMemberInfoByMemIdOrOrg.select
-- source: datainit_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select distinct o.id as memberId,o.org_department_id departId from org_member o where (VALUE_001) and o.is_enable = 1 and o.is_deleted = 0 and is_admin = 0 and is_internal != '0' and type != '2';

-- statementId: getDeptManagerInfoByMemIdOrOrg.select
-- lookupStatementId: getDeptManagerInfoByMemIdOrOrg.select
-- source: datainit_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select distinct o.id as memberId,o.org_department_id departId from org_member o where (VALUE_001) and o.is_enable = 1 and o.is_deleted = 0 and is_admin = 0 and is_internal != '0' and type != '2' and o.id in (select f.source_id from org_relationship f where f.objective0_id in (select id from org_unit where type = 'Department' and is_enable = 1) and f.type = 'Member_Role' and f.objective1_id in (select id from org_role r where r.code='DepManager') );

-- statementId: complianceTip.insert
-- lookupStatementId: complianceTip.insert
-- source: datainit_sqlmap.xml
-- type: insert
-- params: {
--   "formmainid": 1001,
--   "signdep": "VALUE_001",
--   "signmembered": "VALUE_001",
--   "signmember": "VALUE_001"
-- }
insert into imy_complicTipSon values(util_common.getAbsID, 1001, 'VALUE_001', 'VALUE_001', 'VALUE_001');

-- statementId: complianceTipCap4.insert
-- lookupStatementId: complianceTipCap4.insert
-- source: datainit_sqlmap.xml
-- type: insert
-- params: {
--   "formmainid": 1001,
--   "signdep": "VALUE_001",
--   "signmembered": "VALUE_001",
--   "signmember": "VALUE_001"
-- }
insert into imy_complicTipSon_cap4 values(util_common.getAbsID, 1001, 'VALUE_001', 'VALUE_001', 'VALUE_001');

-- statementId: complianceTipFlow.insert
-- lookupStatementId: complianceTipFlow.insert
-- source: datainit_sqlmap.xml
-- type: insert
-- params: {
--   "formmainid": 1001,
--   "signdep": "VALUE_001",
--   "signmembered": "VALUE_001",
--   "signmember": "VALUE_001"
-- }
insert into imy_complicTipSon_flow values(util_common.getAbsID, 1001, 'VALUE_001', 'VALUE_001', 'VALUE_001');

-- statementId: deleteWhiteRecordComp.delete
-- lookupStatementId: deleteWhiteRecordComp.delete
-- source: datainit_sqlmap.xml
-- type: delete
-- params: "VALUE_001"
delete imy_complicTipSon s where s.formmainId = 'VALUE_001';

-- statementId: deleteWhiteRecordCompCap4.delete
-- lookupStatementId: deleteWhiteRecordCompCap4.delete
-- source: datainit_sqlmap.xml
-- type: delete
-- params: "VALUE_001"
delete imy_complicTipSon_cap4 s where s.formmainId = 'VALUE_001';

-- statementId: deleteWhiteRecordCompFlow.delete
-- lookupStatementId: deleteWhiteRecordCompFlow.delete
-- source: datainit_sqlmap.xml
-- type: delete
-- params: "VALUE_001"
delete imy_complicTipSon s where s.formmainId = 'VALUE_001' and signdep is null;

-- statementId: deleteWhiteRecordCompFlowCap4.delete
-- lookupStatementId: deleteWhiteRecordCompFlowCap4.delete
-- source: datainit_sqlmap.xml
-- type: delete
-- params: "VALUE_001"
delete imy_complicTipSon_cap4 s where s.formmainId = 'VALUE_001' and signdep is null;

-- statementId: queryCompTableSonRecord.select
-- lookupStatementId: queryCompTableSonRecord.select
-- source: datainit_sqlmap.xml
-- type: select
-- params: {
--   "formmainId": 1001
-- }
select * from imy_complicTipSon where formmain_id = 1001;

-- statementId: complianceTrain.selelct
-- lookupStatementId: complianceTrain.selelct
-- source: datainit_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id, state, start_member_id, start_date, approve_member_id, approve_date, finishedflag, ratifyflag, ratify_member_id, ratify_date, sort, modify_member_id, modify_date, traincode, senduserno, senddate, jointranmembe, jointrandepar, jointrancompa, removetranmembe, trainsubject, traincontent, note, attacheid, senddepart from imy_compcptrain i where i.id= 'VALUE_001';

-- statementId: complianceTrainCap4.selelct
-- lookupStatementId: complianceTrainCap4.selelct
-- source: datainit_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id, state, start_member_id, start_date, approve_member_id, approve_date, finishedflag, ratifyflag, ratify_member_id, ratify_date, sort, modify_member_id, modify_date, traincode, senduserno, senddate, jointranmembe, jointrandepar, jointrancompa, removetranmembe, trainsubject, traincontent, note, attacheid, senddepart from imy_compcptrain_cap4 i where i.id= 'VALUE_001';

-- statementId: complianceTrainFlow.selelct
-- lookupStatementId: complianceTrainFlow.selelct
-- source: datainit_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id, state, start_member_id, start_date, approve_member_id, approve_date, finishedflag, ratifyflag, ratify_member_id, ratify_date, sort, modify_member_id, modify_date, traincode, senduserno, senddate, jointranmembe, jointrandepar, jointrancompa, removetranmembe, trainsubject, traincontent, note, attacheid, senddepart from imy_compcptrain_flow i where i.id= 'VALUE_001';

-- statementId: complianceTrainFlowCap4.selelct
-- lookupStatementId: complianceTrainFlowCap4.selelct
-- source: datainit_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id, state, start_member_id, start_date, approve_member_id, approve_date, finishedflag, ratifyflag, ratify_member_id, ratify_date, sort, modify_member_id, modify_date, traincode, senduserno, senddate, jointranmembe, jointrandepar, jointrancompa, removetranmembe, trainsubject, traincontent, note, attacheid, senddepart from imy_compcptrain_flow_cap4 i where i.id= 'VALUE_001';

-- statementId: complianceTrainNoFinish.selelct
-- lookupStatementId: complianceTrainNoFinish.selelct
-- source: datainit_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id, finishedflag, traincode, senduserno, senddate, jointranmembe, jointrandepar, trainsubject, traincontent, note, attacheid, senddepart, isfinishstudy, contactdepart, attachmark from wf_compcptrain w where w.traincode = 'VALUE_001';

-- statementId: complianceTrainNoFinishCap4.selelct
-- lookupStatementId: complianceTrainNoFinishCap4.selelct
-- source: datainit_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id, finishedflag, traincode, senduserno, senddate, jointranmembe, jointrandepar, trainsubject, traincontent, note, attacheid, senddepart, isfinishstudy, contactdepart, attachmark from wf_compcptrain_cap4 w where w.traincode = 'VALUE_001';

-- statementId: deleteWhiteRecordTrain.delete
-- lookupStatementId: deleteWhiteRecordTrain.delete
-- source: datainit_sqlmap.xml
-- type: delete
-- params: {
--   "formmainId": 1001
-- }
delete imy_compcptrainson s where s.formmain_id = 1001;

-- statementId: deleteWhiteRecordTrainCap4.delete
-- lookupStatementId: deleteWhiteRecordTrainCap4.delete
-- source: datainit_sqlmap.xml
-- type: delete
-- params: {
--   "formmainId": 1001
-- }
delete imy_compcptrainson_cap4 s where s.formmain_id = 1001;

-- statementId: deleteWhiteRecordTrainFlowCap4.delete
-- lookupStatementId: deleteWhiteRecordTrainFlowCap4.delete
-- source: datainit_sqlmap.xml
-- type: delete
-- params: {
--   "formmainId": 1001
-- }
delete imy_compcptrainson_cap4 s where s.formmain_id = 1001 and jointrandepar is null;

-- statementId: complianceTrain.insert
-- lookupStatementId: complianceTrain.insert
-- source: datainit_sqlmap.xml
-- type: insert
-- params: {
--   "formmain_id": 1001,
--   "jointrandepar": "VALUE_001",
--   "jointranmembe": "VALUE_001",
--   "jointranmembed": "VALUE_001"
-- }
insert into imy_compcptrainson values(util_common.getAbsID, 1001, 'VALUE_001', 'VALUE_001', 'VALUE_001');

-- statementId: complianceTrainCap4.insert
-- lookupStatementId: complianceTrainCap4.insert
-- source: datainit_sqlmap.xml
-- type: insert
-- params: {
--   "formmainid": 1001,
--   "signdep": "VALUE_001",
--   "signmember": "VALUE_001",
--   "signmembered": "VALUE_001"
-- }
insert into imy_compcptrainson_cap4 values(util_common.getAbsID, 1001, 'VALUE_001', 'VALUE_001', 'VALUE_001');

-- statementId: complianceTrainFlow.insert
-- lookupStatementId: complianceTrainFlow.insert
-- source: datainit_sqlmap.xml
-- type: insert
-- params: {
--   "formmain_id": 1001,
--   "jointrandepar": "VALUE_001",
--   "jointranmembe": "VALUE_001",
--   "jointranmembed": "VALUE_001"
-- }
insert into imy_compcptrainson_flow values(util_common.getAbsID, 1001, 'VALUE_001', 'VALUE_001', 'VALUE_001');

-- statementId: complianceTipByFinish.select
-- lookupStatementId: complianceTipByFinish.select
-- source: datainit_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select w.notemember from wf_complictip w where w.compliancecode = 'VALUE_001' and w.finishedflag = 1;

-- statementId: complianceTipByFinishCap4.select
-- lookupStatementId: complianceTipByFinishCap4.select
-- source: datainit_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select w.notemember from wf_complictip_cap4 w where w.compliancecode = 'VALUE_001' and w.finishedflag = 1;

-- statementId: complianceTrainFinish.select
-- lookupStatementId: complianceTrainFinish.select
-- source: datainit_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select w.jointranmembe from wf_compcptrain w where w.traincode = 'VALUE_001' and w.finishedflag = 1;

-- statementId: complianceTrainFinishCap4.select
-- lookupStatementId: complianceTrainFinishCap4.select
-- source: datainit_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select w.jointranmembe from wf_compcptrain_cap4 w where w.traincode = 'VALUE_001' and w.finishedflag = 1;

-- statementId: selectTipsFormIdByFlowCode.select
-- lookupStatementId: selectTipsFormIdByFlowCode.select
-- source: datainit_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id from imy_complictip where compliancecode = 'VALUE_001';

-- statementId: selectTrainFormIdByFlowCode.select
-- lookupStatementId: selectTrainFormIdByFlowCode.select
-- source: datainit_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id from imy_compcptrain where trainCode = 'VALUE_001';

-- statementId: selectTrainSonByMainId.select
-- lookupStatementId: selectTrainSonByMainId.select
-- source: datainit_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id,joinTrandepar,jointranmembe,jointranedmembe from imy_compcptrainson_flow where formmain_id = 'VALUE_001' and joinTrandepar is not null;

-- statementId: selectTipsSonByMainId.select
-- lookupStatementId: selectTipsSonByMainId.select
-- source: datainit_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id,signdep,signedmember,signmember from imy_complictipson_flow where formmain_id = 'VALUE_001' and signdep is not null;

-- statementId: copyComplianceTrainFlowToInfoTable.insert
-- lookupStatementId: copyComplianceTrainFlowToInfoTable.insert
-- source: datainit_sqlmap.xml
-- type: insert
-- params: {
--   "newId": 1001,
--   "id": 1001
-- }
insert into imy_compcptrain( id, STATE ,START_MEMBER_ID ,START_DATE , APPROVE_MEMBER_ID ,APPROVE_DATE,FINISHEDFLAG ,RATIFYFLAG ,RATIFY_MEMBER_ID ,RATIFY_DATE , SORT ,MODIFY_MEMBER_ID ,MODIFY_DATE , traincode, senduserno, senddate, jointranmembe, jointrandepar, jointrancompa, removetranmembe, trainsubject, traincontent, note, attacheid, senddepart ) select 1001, STATE ,START_MEMBER_ID ,START_DATE , APPROVE_MEMBER_ID ,APPROVE_DATE,FINISHEDFLAG ,RATIFYFLAG ,RATIFY_MEMBER_ID ,RATIFY_DATE , SORT ,MODIFY_MEMBER_ID ,MODIFY_DATE , traincode, senduserno, senddate, jointranmembe, jointrandepar, jointrancompa, removetranmembe, trainsubject, traincontent, note, attacheid, senddepart from imy_compcptrain_flow where id = 1001;

-- statementId: copyComplianceTipsFlowToInfoTable.insert
-- lookupStatementId: copyComplianceTipsFlowToInfoTable.insert
-- source: datainit_sqlmap.xml
-- type: insert
-- params: {
--   "newId": 1001,
--   "id": 1001
-- }
insert into imy_complictip( id, STATE ,START_MEMBER_ID ,START_DATE , APPROVE_MEMBER_ID ,APPROVE_DATE,FINISHEDFLAG ,RATIFYFLAG ,RATIFY_MEMBER_ID ,RATIFY_DATE , SORT ,MODIFY_MEMBER_ID ,MODIFY_DATE , compliancecode, senduserno, notetitle, notecontent, attacheid, compliancetype, senddepartment, notemember, notedepart, notecompa, noteremovemember ) select 1001, STATE ,START_MEMBER_ID ,START_DATE , APPROVE_MEMBER_ID ,APPROVE_DATE,FINISHEDFLAG ,RATIFYFLAG ,RATIFY_MEMBER_ID ,RATIFY_DATE , SORT ,MODIFY_MEMBER_ID ,MODIFY_DATE , compliancecode, senduserno, notetitle, notecontent, attacheid, compliancetype, senddepartment, notemember, notedepart, notecompa, noteremovemember from imy_complictip_flow where id = 1001;

-- statementId: getFlowExpendDefByCode.select
-- lookupStatementId: getFlowExpendDefByCode.select
-- source: datainit_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select fieldchinessname as "fieldChineseName",fieldName as "fieldName" from VM_FLOWCONFIGURATION where templateNo = 'VALUE_001';

-- statementId: assetInfo.select
-- lookupStatementId: assetInfo.select
-- source: asset_sqlmap.xml
-- type: select
-- params: {
--   "dateTime": "2026-05-14"
-- }
select id,to_char(start_date,'YYYY-MM-DD HH24:MI:SS') as createTime ,start_member_id as createMember, field0001 as assetNo, field0002 as assetCategory, field0003 as assetsName, field0004 as assetModel, 'OA' as assetSource, field0006 as assetState, to_char(field0007,'YYYY-MM-DD HH24:MI:SS') as purchaseDate, field0008 as purchaseAmount, field0018 as assetPriceNotDuty, field0019/100 as dutyRate, field0020 as dutyAmount, to_char(field0009,'YYYY-MM-DD HH24:MI:SS') as depreciationDate, field0010 as isMature, to_char(field0011,'YYYY-MM-DD HH24:MI:SS') as warrantyPeriod, field0012 as usePeople, field0013 as usePeopleId, field0014 as useDepartment, field0015 as designatedArea, to_char(field0016,'YYYY-MM-DD HH24:MI:SS') as registerTime, to_char(field0017,'YYYY-MM-DD HH24:MI:SS') as upTime, '' as relevanceSignNo, '' as relevanceSignTitle, field0070 as relevanceContractNo, field0065 as relevanceContractTitle, field0022 as remark, '' as relevanceProjectTitle, '' as relevanceProjectNo, '' as relevanceBidTitle, '' as relevanceBidNo, '' as keeper, '' as relevanceContractURL, field0055 as kmID from formmain_0123 where start_date >= to_date('2026-05-14','YYYY-MM-DD HH24:MI:SS') and field0001 is not null;

-- statementId: assetInfoByCode.select
-- lookupStatementId: assetInfoByCode.select
-- source: asset_sqlmap.xml
-- type: select
-- params: {
--   "code": [
--     "EVENT_A",
--     "EVENT_B"
--   ],
--   "region": "VALUE_001"
-- }
select f.id, f.field0001 assetCode, f.field0002 assetType, f.field0003 assetName, f.field0004 assetModel, f.field0006 assetStatus, to_char(f.field0007,'yyyymmdd' ) buyDate, util_user.getMemberNameByLoginName(util_user.getLoginNameByMemId(f.field0012)) applyUser, f.field0012 applyUserId, f.field0071 as assetSpot, f.field0073 assetMark from formmain_0123 f where 1 = 1 and f.field0001 in ('EVENT_A','EVENT_B') and f.field0015 = 'VALUE_001';

-- statementId: assetColInfo.select
-- lookupStatementId: assetColInfo.select
-- source: asset_sqlmap.xml
-- type: select
-- params: {
--   "type": "VALUE_001",
--   "id": 1001,
--   "formmain_id": 1001
-- }
select accountId,id, applyUserId, applyUser, buyDate, assetCode, assetType, assetName, assetModel, assetMark from vm_assetcolinfo where type = 'VALUE_001' and id = 1001 and formmain_id = 1001;

-- statementId: assetColAttachInfo.select
-- lookupStatementId: assetColAttachInfo.select
-- source: asset_sqlmap.xml
-- type: select
-- params: {
--   "tableName": "NAME_001",
--   "mainId": 1001
-- }
select markurl as fieldid, to_char(markdate,'yyyy-mm-dd') as createdate from vm_assetcolinfo where type = 'NAME_001' and formmain_id = 1001;

-- statementId: assetColAttachInfo.select.count
-- lookupStatementId: assetColAttachInfo.select.count
-- source: asset_sqlmap.xml
-- type: select
-- params: {
--   "tableName": "NAME_001",
--   "mainId": 1001
-- }
select count(*) from vm_assetcolinfo where type = 'NAME_001' and formmain_id = 1001;

-- statementId: assetTypeCode.select
-- lookupStatementId: assetTypeCode.select
-- source: asset_sqlmap.xml
-- type: select
-- params: {
--   "typeId": 1001,
--   "accountId": 1
-- }
SELECT id, field0003 as typeCode, field0004 as showValue, field0005 as currentValue, field0006 as accountCode, field0007 as historyCode FROM formmain_0595 WHERE field0002 = 1001 AND field0001 = 1;

-- statementId: assetTypeCode.update
-- lookupStatementId: assetTypeCode.update
-- source: asset_sqlmap.xml
-- type: update
-- params: {
--   "currentValue": "VALUE_001",
--   "showValue": "VALUE_001",
--   "historyCode": "CODE_001",
--   "typeId": 1001,
--   "accountId": 1
-- }
update formmain_0595 set field0005 = 'VALUE_001', field0004 = 'VALUE_001',field0007 = 'CODE_001' where field0002 = 1001 AND field0001 = 1;

-- statementId: assetPosition.select
-- lookupStatementId: assetPosition.select
-- source: asset_sqlmap.xml
-- type: select
-- params: {
--   "code": [
--     "EVENT_A",
--     "EVENT_B"
--   ]
-- }
select id,positioncode,positionname,positionmark from vm_assetPosition where 1 = 1 AND positioncode in ('EVENT_A','EVENT_B');

-- statementId: assetPositionMax.select
-- lookupStatementId: assetPositionMax.select
-- source: asset_sqlmap.xml
-- type: select
-- params: {}
select max(t.positioncode) from vm_assetPosition t;

-- statementId: assetPosition.update
-- lookupStatementId: assetPosition.update
-- source: asset_sqlmap.xml
-- type: update
-- params: "VALUE_001"
update vm_assetPosition set positionstatus = util_common.getEnumIdByShow(4275550571744871391,'失效') where positioncode = 'VALUE_001';

-- statementId: assetCheck.select
-- lookupStatementId: assetCheck.select
-- source: asset_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select creater, batchmanager, to_char(batchdate,'yyyy-mm-dd') as batchdate, batchno, batchregion, batchstatus, batchnote,isCheckAll from vm_assetcheckbatch where util_common.getenumshowbyid(batchstatus) = 'VALUE_001';

-- statementId: assetCheck.update
-- lookupStatementId: assetCheck.update
-- source: asset_sqlmap.xml
-- type: update
-- params: {
--   "status": 1,
--   "batchno": "VALUE_001"
-- }
update vm_assetcheckBatch set batchstatus = 1 where batchno = 'VALUE_001';

-- statementId: assetCheckData.select
-- lookupStatementId: assetCheckData.select
-- source: asset_sqlmap.xml
-- type: select
-- params: {
--   "batchNo": "VALUE_001",
--   "assetCode": "CODE_001"
-- }
select * from vm_assetcheckresult where 1=1 and batchNo = 'VALUE_001' and assetcode = 'CODE_001';

-- statementId: assetCheckData.update
-- lookupStatementId: assetCheckData.update
-- source: asset_sqlmap.xml
-- type: update
-- params: {
--   "isInStock": "VALUE_001",
--   "positionChange": "VALUE_001",
--   "inventoryPosition": "VALUE_001",
--   "batchNo": "VALUE_001",
--   "assetCode": "CODE_001"
-- }
update vm_assetcheckresult set , isInStock = 'VALUE_001' , positionChange = 'VALUE_001' , inventoryPosition = 'VALUE_001' where batchno = 'VALUE_001' and assetcode = 'CODE_001';

-- statementId: assetCheckData.insert
-- lookupStatementId: assetCheckData.insert
-- source: asset_sqlmap.xml
-- type: insert
-- params: {
--   "id": 1001,
--   "batchNo": "VALUE_001",
--   "assetCode": "CODE_001",
--   "assetName": "NAME_001",
--   "assetType": "VALUE_001",
--   "inventoryPosition": "VALUE_001",
--   "depositPosition": "VALUE_001",
--   "inventoryRegion": "VALUE_001",
--   "positionChange": "VALUE_001",
--   "isInStock": "VALUE_001",
--   "belongInventoryRange": "VALUE_001",
--   "impDate": "2026-05-14",
--   "inventoryManager": "VALUE_001",
--   "buyTime": "2026-05-14 10:00:00",
--   "inventoryNote": "VALUE_001",
--   "assetStatus": 1,
--   "assetSysResult": "VALUE_001",
--   "asstModel": "VALUE_001",
--   "systemFlg": "VALUE_001",
--   "assetSysLocation": "VALUE_001"
-- }
insert into vm_assetcheckresult(id,batchno,assetcode,assetname, assettype, inventoryposition, depositposition,inventoryregion, positionchange,isinstock,belonginventoryrange,impdate,inventorymanager,buytime,inventorynote,assetstatus, assetSysResult, asstModel, systemFlg, assetSysLocation ) values (1001,'VALUE_001','CODE_001','NAME_001','VALUE_001','VALUE_001','VALUE_001','VALUE_001','VALUE_001', 'VALUE_001','VALUE_001','2026-05-14','VALUE_001','2026-05-14 10:00:00','VALUE_001',1, 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001' );

-- statementId: assetCheckData.delete
-- lookupStatementId: assetCheckData.delete
-- source: asset_sqlmap.xml
-- type: delete
-- params: "VALUE_001"
delete vm_assetcheckresult where batchno = 'VALUE_001';

-- statementId: setCheckGeneration.insert
-- lookupStatementId: setCheckGeneration.insert
-- source: asset_sqlmap.xml
-- type: insert
-- params: "VALUE_001"
insert into vm_assetcheckresult(id,batchno,assetcode,assetname, assettype,depositposition,inventoryregion,impdate,positionchange,isinstock,belonginventoryrange,inventorymanager,buytime,assetstatus) select util_common.getID() ,f2.batchno,f1.assetsCode,f1.assetsName,f1.assetModel,f1.assetSpot,f2.batchregion,to_char(f2.batchdate,'yyyy-mm-dd') ,util_common.getEnumIdByRefName('位置变化','否') ,util_common.getEnumIdByRefName('盘点是否在库','不在库'),util_common.getEnumIdByRefName('属于盘点范围','是') ,f2.batchmanager,to_char(f1.buyTime,'yyyy-mm-dd'),f1.assetstatus from vm_assetdocument f1,vm_assetcheckbatch f2 where f2.batchstatus = util_common.getEnumIdByRefName('盘点状态','盘点中') and nvl(f1.Region,1) = nvl(f2.batchregion,nvl(f1.Region,1)) and f2.batchno = 'VALUE_001' and f1.assetstatus != util_common.getEnumIdByRefName('资产状态','已处置');

-- statementId: assetNote.update
-- lookupStatementId: assetNote.update
-- source: asset_sqlmap.xml
-- type: update
-- params: {
--   "definingLabels": "VALUE_001",
--   "asstCode": "CODE_001"
-- }
update vm_assetdocument set definingLabels = 'VALUE_001' where assetsCode = 'CODE_001';

-- statementId: flowConfiguration.select
-- lookupStatementId: flowConfiguration.select
-- source: asset_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select vm.templateNo,vm.fieldChinessName,vm.isNull,vm.fieldName from vm_flowConfiguration vm where vm.templateNo = 'VALUE_001';

-- statementId: queryResultByFlowFormId.select
-- lookupStatementId: queryResultByFlowFormId.select
-- source: asset_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id, formmain_id sort, assettype, assetname, assetPrice, count, use, applysituation, notaxprice, tax, taxprice, defectsperiod, userPeriod from vm_wfcomputerassetpurchase where formmain_id = 'VALUE_001';

-- statementId: assetPurchaseModel.insert
-- lookupStatementId: assetPurchaseModel.insert
-- source: asset_sqlmap.xml
-- type: insert
-- params: {
--   "id": 1001,
--   "formmain_id": 1001,
--   "sort": 1,
--   "assetType": "VALUE_001",
--   "assetName": "NAME_001",
--   "assetPrice": "VALUE_001",
--   "assetModel": "VALUE_001",
--   "productSerialNumber": "VALUE_001",
--   "userPeriod": "VALUE_001",
--   "hidDisk1Type": 1001,
--   "hidDisk1Size": 1001,
--   "hidDisk2Type": 1001,
--   "hidDisk2Size": 1001,
--   "memoryType": "VALUE_001",
--   "memorySize": "VALUE_001",
--   "memoryCount": 1
-- }
insert into vm_wfcomassetpurchasedetail (id, formmain_id, sort, assettype, assetname, assetPrice, assetmodel, productserialNumber, defectsperiod, userPeriod, hidDisk1type, hidDisk1Size, hidDisk2type, hidDisk2Size, memoryType, memorySize, memoryCount ) values( 1001, 1001, 1, util_common.getEnumIdByRefName('资产分类','VALUE_001'), util_common.getEnumIdByRefName('资产分类','NAME_001') , 'VALUE_001', 'VALUE_001', 'VALUE_001', null, 'VALUE_001', util_common.getEnumIdByRefName('电脑硬盘类型',1001), 1001, util_common.getEnumIdByRefName('电脑硬盘类型',1001), 1001, util_common.getEnumIdByRefName('内存类型','VALUE_001'), util_common.getEnumIdByRefName('电脑内存尺寸','VALUE_001'), 1 );

-- statementId: assetPurchaseModel.select
-- lookupStatementId: assetPurchaseModel.select
-- source: asset_sqlmap.xml
-- type: select
-- params: {
--   "assetType": "VALUE_001",
--   "assetName": "NAME_001"
-- }
select propertyPrice from vm_defaultPropertyInfo where propertyType = (select ID from ctp_enum_item where SHOWVALUE = 'VALUE_001') and propertyName = (select ID from ctp_enum_item where SHOWVALUE = 'NAME_001');

-- statementId: assetPurchase.delete
-- lookupStatementId: assetPurchase.delete
-- source: asset_sqlmap.xml
-- type: delete
-- params: "VALUE_001"
delete from vm_wfcomassetpurchasedetail where formmain_id = 'VALUE_001';

-- statementId: accessoriesmemory.select
-- lookupStatementId: accessoriesmemory.select
-- source: asset_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id, formmain_id, memorySort, memoryAccessoriesType, memoryType, memorySize, memoryPrice, memoryState, memoryCount from wf_accessoriesmemoryson where formmain_id = 'VALUE_001';

-- statementId: accessoriesharddisk.select
-- lookupStatementId: accessoriesharddisk.select
-- source: asset_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id, formmain_id, hardDiskSort, hardDiskAccessoriesType, hardDiskType, hardDiskSize, hardDiskPrice, hardDiskState, hardDiskSequence, hardDiskCount from wf_accessoriesharddiskson where formmain_id = 'VALUE_001';

-- statementId: memoryInfo.insert
-- lookupStatementId: memoryInfo.insert
-- source: asset_sqlmap.xml
-- type: insert
-- params: {
--   "id": 1001,
--   "formmain_id": 1001,
--   "memorySort": 1,
--   "memoryAccessoriesType": "VALUE_001",
--   "memoryType": "VALUE_001",
--   "memorySize": "VALUE_001",
--   "memoryPrice": "VALUE_001",
--   "memoryState": 1
-- }
insert into wf_oaaccessoriesmemoryson (id, formmain_id, memorySort, memoryAccessoriesType, memoryType, memorySize, memoryPrice, memoryState )values( 1001, 1001, 1, 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 1 );

-- statementId: hardDiskInfo.insert
-- lookupStatementId: hardDiskInfo.insert
-- source: asset_sqlmap.xml
-- type: insert
-- params: {
--   "id": 1001,
--   "formmain_id": 1001,
--   "hardDiskSort": 1,
--   "hardDiskAccessoriesType": "VALUE_001",
--   "hardDiskType": "VALUE_001",
--   "hardDiskSize": "VALUE_001",
--   "hardDiskPrice": "VALUE_001",
--   "hardDiskState": 1
-- }
insert into wf_oaaccessoriesharddiskson (id, formmain_id, hardDiskSort, hardDiskAccessoriesType, hardDiskType, hardDiskSize, hardDiskPrice, hardDiskState )values( 1001, 1001, 1, 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 1 );

-- statementId: memoryNullRecord.delte
-- lookupStatementId: memoryNullRecord.delte
-- source: asset_sqlmap.xml
-- type: delete
-- params: "VALUE_001"
delete wf_oaaccessoriesmemoryson where formmain_id = 'VALUE_001';

-- statementId: hardDiskNullRecord.delte
-- lookupStatementId: hardDiskNullRecord.delte
-- source: asset_sqlmap.xml
-- type: delete
-- params: "VALUE_001"
delete wf_oaaccessoriesharddiskson where formmain_id = 'VALUE_001';

-- statementId: getAllAssetDocument.select
-- lookupStatementId: getAllAssetDocument.select
-- source: asset_sqlmap.xml
-- type: select
-- params: {
--   "accountId": 1,
--   "startDate": "2026-05-14",
--   "endDate": "2026-05-14"
-- }
select id, START_DATE, assetsCode as "assetsCode", assetCategory as "assetCategory", assetsName as "assetsName", assetModel as "assetModel", assetstatus as "assetstatus", buyTime as "buyTime", amount as "amount", dealType as "dealType", useYears as "useYears", assetSpot as "assetSpot", assetMark as "assetMark", region as "region", definingLabels as "definingLabels", useDepart as "useDepart", useMember as "useMember", isPay as "isPay", payDate as "payDate", payNo as "payNo", financeCardState as "financeCardState", financeCardCreateDate as "financeCardCreateDate", lastCheckingDate as "lastCheckingDate", lastCheckingState as "lastCheckingState", lastFinanceState as "lastFinanceState", financePageUrl as "financePageUrl", notaxamount as "noTaxAmount", recordDate as "recordDate" from vm_assetdocument where 1=1 and accountId = 1 and START_DATE >= '2026-05-14' and START_DATE <= '2026-05-14';

-- statementId: getAllAssetDocumentByPayDate.select
-- lookupStatementId: getAllAssetDocumentByPayDate.select
-- source: asset_sqlmap.xml
-- type: select
-- params: {
--   "accountId": 1,
--   "startDate": "2026-05-14",
--   "endDate": "2026-05-14"
-- }
select id, START_DATE, assetsCode as "assetsCode", assetCategory as "assetCategory", assetsName as "assetsName", assetModel as "assetModel", assetstatus as "assetstatus", buyTime as "buyTime", amount as "amount", dealType as "dealType", useYears as "useYears", assetSpot as "assetSpot", assetMark as "assetMark", region as "region", definingLabels as "definingLabels", useDepart as "useDepart", useMember as "useMember", isPay as "isPay", payDate as "payDate", payNo as "payNo", financeCardState as "financeCardState", financeCardCreateDate as "financeCardCreateDate", lastCheckingDate as "lastCheckingDate", lastCheckingState as "lastCheckingState", lastFinanceState as "lastFinanceState", financePageUrl as "financePageUrl", notaxamount as "noTaxAmount", recordDate as "recordDate" from vm_assetdocument where accountId = 1 and ((payDate is not null and payDate >= '2026-05-14' and payDate <= '2026-05-14') or (payDate is null and START_DATE >= '2026-05-14' and START_DATE <= '2026-05-14') );

-- statementId: getDisposedOAAssets.select
-- lookupStatementId: getDisposedOAAssets.select
-- source: asset_sqlmap.xml
-- type: select
-- params: {
--   "accountId": 1,
--   "endDate": "2026-05-14",
--   "startDate": "2026-05-14"
-- }
select id, assetsCode as "assetsCode", assetCategory as "assetCategory", assetsName as "assetsName", assetModel as "assetModel", assetstatus as "assetstatus", buyTime as "buyTime", amount as "amount", dealType as "dealType", useYears as "useYears", assetSpot as "assetSpot", assetMark as "assetMark", region as "region", definingLabels as "definingLabels", useDepart as "useDepart", useMember as "useMember", isPay as "isPay", payDate as "payDate", payNo as "payNo", financeCardState as "financeCardState", financeCardCreateDate as "financeCardCreateDate", lastCheckingDate as "lastCheckingDate", lastCheckingState as "lastCheckingState", lastFinanceState as "lastFinanceState", financePageUrl as "financePageUrl", notaxamount as "noTaxAmount", recordDate as "recordDate" from vm_assetdocument where accountId = 1 and id in (select formmain_id from vm_assetdispose where disposeDate <= '2026-05-14' and disposeDate >= '2026-05-14') and assetstatus = '-5190900076558529642' and (lastFinanceState is null or lastFinanceState != '完全清理完毕（0399）');

-- statementId: assetInfoUseAndPrice.select
-- lookupStatementId: assetInfoUseAndPrice.select
-- source: asset_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select distinct to_char(neatValue) "neatValue", to_char(useTermCount) "useTermCount", to_char(tempDeprTermCount) "tempDeprTermCount", assetsCode "assetsCode" from vm_assetdocument va left join vm_assetdispositionson vad on va.id = vad.formmain_id where vad.dispositionDate is null OR vad.dispositionDate >= SYSDATE - INTERVAL '3' MONTH;

-- statementId: easAssetInfoUpdateToOa.update
-- lookupStatementId: easAssetInfoUpdateToOa.update
-- source: asset_sqlmap.xml
-- type: update
-- params: {
--   "neatValue": "VALUE_001",
--   "useTermCount": 1,
--   "tempDeprTermCount": 1,
--   "remainingUsefulLife": "VALUE_001",
--   "assetCode": "CODE_001"
-- }
update vm_assetdocument set neatValue = 'VALUE_001', useTermCount = 1, tempDeprTermCount = 1, RemainingUsefulLife = 'VALUE_001' where assetsCode = 'CODE_001';

-- statementId: updateAssetDocument.update
-- lookupStatementId: updateAssetDocument.update
-- source: asset_sqlmap.xml
-- type: update
-- params: {
--   "isPay": "VALUE_001",
--   "payDate": "2026-05-14",
--   "payNo": "VALUE_001",
--   "payUrl": "VALUE_001",
--   "price": "VALUE_001",
--   "assetsCode": "CODE_001"
-- }
update vm_assetdocument set isPay = 'VALUE_001', payDate = '2026-05-14', payNo = 'VALUE_001', financePageUrl = 'VALUE_001', notaxamount = 'VALUE_001' where assetsCode = 'CODE_001';

-- statementId: updateAssetDocumentCardInfo.update
-- lookupStatementId: updateAssetDocumentCardInfo.update
-- source: asset_sqlmap.xml
-- type: update
-- params: {
--   "financeCardState": 1,
--   "financeCardCreateDate": "2026-05-14",
--   "assetsCode": "CODE_001"
-- }
update vm_assetdocument set financeCardState = 1, financeCardCreateDate = '2026-05-14' where assetsCode = 'CODE_001';

-- statementId: updateAssetDocumentFinanceStatus.update
-- lookupStatementId: updateAssetDocumentFinanceStatus.update
-- source: asset_sqlmap.xml
-- type: update
-- params: {
--   "lastCheckingDate": "2026-05-14",
--   "lastCheckingState": 1,
--   "lastFinanceState": 1,
--   "assetsCode": "CODE_001"
-- }
update vm_assetdocument set lastCheckingDate = '2026-05-14', lastCheckingState = 1, lastFinanceState = 1 where assetsCode = 'CODE_001';

-- statementId: insertAssetCheckDailyLog.insert
-- lookupStatementId: insertAssetCheckDailyLog.insert
-- source: asset_sqlmap.xml
-- type: insert
-- params: {
--   "id": 1001,
--   "writer": "VALUE_001",
--   "writeDept": "VALUE_001",
--   "checkNo": "VALUE_001",
--   "checkDate": "2026-05-14",
--   "startDate": "2026-05-14",
--   "endDate": "2026-05-14",
--   "assectCode": "CODE_001",
--   "assetCategory": "VALUE_001",
--   "assetsName": "NAME_001",
--   "assetstatus": 1,
--   "buyDate": "2026-05-14",
--   "assetUser": "VALUE_001",
--   "checkState": 1,
--   "financeAssetStatus": 1
-- }
insert into vm_assetcheckrecord( id, state, start_member_id, start_date, approve_member_id, approve_date, finishedflag, ratifyflag, ratify_member_id, ratify_date, sort, modify_member_id, modify_date, writer, writeDept, checkNo, checkDate, startDate, endDate, assectCode, assetCategory, assetsName, assetstatus, buyDate, assetUser, checkState, financeAssetStatus ) values ( 1001,1,-6760911671874597139,sysdate,0,sysdate,0,0,0,null,0,-6760911671874597139,sysdate, 'VALUE_001', 'VALUE_001', 'VALUE_001', '2026-05-14', '2026-05-14', '2026-05-14', 'CODE_001', 'VALUE_001', 'NAME_001', 1, '2026-05-14', 'VALUE_001', 1, 1 );

-- statementId: insertAssetCheckResult.insert
-- lookupStatementId: insertAssetCheckResult.insert
-- source: asset_sqlmap.xml
-- type: insert
-- params: {
--   "id": 1001,
--   "creator": "VALUE_001",
--   "createDate": "2026-05-14",
--   "checkStart": "VALUE_001",
--   "checkEnd": "VALUE_001",
--   "checkNo": "VALUE_001",
--   "oaExist": "VALUE_001",
--   "financeExist": "VALUE_001",
--   "oaDealed": "VALUE_001",
--   "financeDealed": "VALUE_001",
--   "checkSame": "VALUE_001",
--   "totalRecord": "VALUE_001",
--   "checkAccount": 1
-- }
insert into vm_assetcheck_checkResult( id, state, start_member_id, start_date, approve_member_id, approve_date, finishedflag, ratifyflag, ratify_member_id, ratify_date, sort, modify_member_id, modify_date, creator, createDate, checkStart, checkEnd, checkNo, oaExist, financeExist, oaDealed, financeDealed, checkSame, totalRecord, checkAccount ) values ( 1001,1,-6760911671874597139,sysdate,0,sysdate,0,0,0,null,0,-6760911671874597139,sysdate, 'VALUE_001', '2026-05-14', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 1 );

-- statementId: getPrefixByAccountId.select
-- lookupStatementId: getPrefixByAccountId.select
-- source: asset_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select field0006 from FORMMAIN_0595 where field0001 = 'VALUE_001' group by field0006;

-- statementId: getAssetIgnoreConfig.select
-- lookupStatementId: getAssetIgnoreConfig.select
-- source: asset_sqlmap.xml
-- type: select
-- params: {}
select oaAssetCode as "oaAssetCode", financeAssetCode as "financeAssetCode", ifIgnore as "ifIgnore" from vm_assetcheck_ignoreConfig where ifIgnore = '-286897663746683514';

-- statementId: getAssetParamByAccountId.select
-- lookupStatementId: getAssetParamByAccountId.select
-- source: asset_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select writer as "writer", writeDept as "writeDept", writeDate as "writeDate", accountId as "accountId", userName as "userName", passwordBase64 as "passwordBase64", slnName as "slnName", dcName as "dcName", language as "language", dbType as "dbType", keeper as "keeper", companyNumber as "companyNumber", deprMethod as "deprMethod", assetBalanceAmout as "assetBalanceAmout", currency as "currency", sourceType as "sourceType", unit as "unit", remark as "remark", assetPrefix as "assetPrefix", clearMode as "clearMode" from vm_KingdeeAssetParam where accountId = 'VALUE_001';

-- statementId: getAssetSeqConfigList.select
-- lookupStatementId: getAssetSeqConfigList.select
-- source: asset_sqlmap.xml
-- type: select
-- params: {}
select accountPrefix||'-'||typeCode as "oaCode", kingdeeCode as "kdCode" from vm_AssetSeqCodeConfig;

-- statementId: getAssetInfoByCode.select
-- lookupStatementId: getAssetInfoByCode.select
-- source: asset_sqlmap.xml
-- type: select
-- params: {
--   "assetsCode": "CODE_001"
-- }
select id as "id", assetsCode as "assetsCode", assetCategory as "assetCategory", assetsName as "assetsName", assetModel as "assetModel", assetstatus as "assetstatus", buyTime as "buyTime", amount as "amount", dealType as "dealType", useYears as "useYears", assetMark as "assetMark", definingLabels as "definingLabels", useDepart as "useDepart", useMember as "useMember", isPay as "isPay", payDate as "payDate", payNo as "payNo", financeCardState as "financeCardState", financeCardCreateDate as "financeCardCreateDate", lastCheckingDate as "lastCheckingDate", lastCheckingState as "lastCheckingState", lastFinanceState as "lastFinanceState", financePageUrl as "financePageUrl", sn as "sn", recordDate as "recordDate", assetUse as "assetUse", remake as "remake", hiddisk1Size as "hiddisk1Size", hiddisk1type as "hiddisk1type", hiddisk2Size as "hiddisk2Size", hiddisk2type as "hiddisk2type", memoryType as "memoryType", memoryCount as "memoryCount", memorySize as "memorySize", taxPrice as "taxPrice", tax as "tax", notaxamount as "notaxamount", contractCode as "contractCode", contractTitle as "contractTitle", quot as "quot", assetSpot as "assetSpot", Region as "Region", enumStoryLocation as "enumStoryLocation", enumSpecStoryLocation as "enumSpecStoryLocation", accountId as "accountId" from vm_assetdocument where assetsCode = 'CODE_001';

-- statementId: enumInfoByReferId.select
-- lookupStatementId: enumInfoByReferId.select
-- source: asset_sqlmap.xml
-- type: select
-- params: {
--   "refId": 1001,
--   "levelNum": "VALUE_001"
-- }
select to_char(id)value, showvalue name from ctp_enum_item where ref_enumid = 1001 and level_num = 'VALUE_001' and state = 1;

-- statementId: insertApplyPartsSonRecord.insert
-- lookupStatementId: insertApplyPartsSonRecord.insert
-- source: asset_sqlmap.xml
-- type: insert
-- params: {
--   "seq": "VALUE_001",
--   "assetsCode": "CODE_001",
--   "applyDate": "2026-05-14",
--   "partsType": "VALUE_001",
--   "partsSize": "VALUE_001",
--   "partsPrice": "VALUE_001",
--   "flowURL": "VALUE_001",
--   "reason": "VALUE_001"
-- }
insert into vm_applypartsdetail( id, sort, formmain_id, applyDate, /*申请日期*/ partsType, /*配件类型*/ partsSize, /*配件规格*/ partsPrice, /*配件价格*/ flowURL, /*url_相关流程*/ reason /*申请原因*/ ) values ( util_common.getAbsID, 'VALUE_001', (select id from vm_assetdocument where assetsCode = 'CODE_001' ), '2026-05-14', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001' );

-- statementId: updateAssetInfo.update
-- lookupStatementId: updateAssetInfo.update
-- source: asset_sqlmap.xml
-- type: update
-- params: {
--   "adminUserId": 1001,
--   "adminDeptId": 1001,
--   "applyUserId": 1001,
--   "assetsCode": "CODE_001"
-- }
update vm_assetreturndocument set adminUserId = 1001, adminDeptId = 1001,applyUserId = 1001 where assetsCode = 'CODE_001';

-- statementId: insertAssetSonInfo.insert
-- lookupStatementId: insertAssetSonInfo.insert
-- source: asset_sqlmap.xml
-- type: insert
-- params: {
--   "assetsCode": "CODE_001",
--   "adminDeptId": 1001,
--   "returnRemark": "VALUE_001",
--   "flowId": 1001,
--   "adminUserId": 1001,
--   "applyDeptId": 1001,
--   "applyUserId": 1001,
--   "subject": "TITLE_001",
--   "applyDate": "2026-05-14",
--   "flowUrl": "VALUE_001"
-- }
insert into vm_assetdocumentson( id, formmain_id, transferAcceptDept , /*转移调配接受部门 */ transferRemark , /*转移调配备注 */ transferSign, /*转移调配流程标识 */ transferAcceptUser, /*转移调配接收人 */ transferDevolveDept, /*转移调配移交部门 */ transferDevolveUser, /*转移调配移交人 */ transferFlow, /*转移调配流程 */ transferDate, /*转移调配日期 */ flowUrl /*url_相关流程穿透 */ ) values ( util_common.getAbsID, (select id from vm_assetdocument where assetsCode = 'CODE_001' ), 1001, 'VALUE_001', 1001, 1001, 1001, 1001, 'TITLE_001', '2026-05-14', 'VALUE_001' );

-- statementId: getApplyPartsAffairId.select
-- lookupStatementId: getApplyPartsAffairId.select
-- source: asset_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id from ctp_affair where form_Recordid = (select id from vm_applyparts where serialNo = 'VALUE_001' ) and node_policy = 'newCol';

-- statementId: getAssetPartsSort.select
-- lookupStatementId: getAssetPartsSort.select
-- source: asset_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select count(1) from vm_applypartsdetail where formmain_id = (select id from vm_assetdocument where assetsCode = 'VALUE_001' );

-- statementId: deleteBlankAssetPartRecord.delete
-- lookupStatementId: deleteBlankAssetPartRecord.delete
-- source: asset_sqlmap.xml
-- type: delete
-- params: "VALUE_001"
delete from vm_applypartsdetail where applydate is null;

-- statementId: staffYearBatchPushByFormId.select
-- lookupStatementId: staffYearBatchPushByFormId.select
-- source: asset_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select 'Asset_Year_Batch_T01' flowType, id, batchNo, util_user.getMemCodeByMemId(sendUserNo) sendUserNo, to_char(writeDate, 'yyyy-mm-dd') writeDate, pushState, pushDate, pushMembers, pushDeparts, pushAccounts, removeMembers, title, content from vm_cap4_staffYearAssetPush where id = 'VALUE_001';

-- statementId: findNeedSendStaffYearBatch.select
-- lookupStatementId: findNeedSendStaffYearBatch.select
-- source: asset_sqlmap.xml
-- type: select
-- params: {
--   "pushAccounts": 7,
--   "pushDeparts": "RAW_VALUE",
--   "pushMembers": "RAW_VALUE",
--   "removeMembers": "RAW_VALUE",
--   "batchNo": "VALUE_001"
-- }
select distinct to_char(id) id, to_char(org_department_id) org_department_id from org_member where ( 1=0 or org_account_id in (7) or org_department_id in (RAW_VALUE) or id in (RAW_VALUE) ) AND id not in (RAW_VALUE) and is_admin=0 and is_internal=1 and type <> 2 and is_virtual=0 and is_deleted=0 and state = 1 and id not in (select staff from vm_cap4_staffYearAssetACK where batchNo = 'VALUE_001' and staff is not null);

-- statementId: asstYearBatch.insert
-- lookupStatementId: asstYearBatch.insert
-- source: asset_sqlmap.xml
-- type: insert
-- params: {
--   "formId": 1001,
--   "memberId": 1001
-- }
insert into vm_cap4_staffYearAssetPushSon ( id, formmain_id, memberName, isFinish ) values ( util_common.getAbsID, 1001, 1001, '-1089048568118490234' );

-- statementId: asstYearBatch.delete
-- lookupStatementId: asstYearBatch.delete
-- source: asset_sqlmap.xml
-- type: insert
-- params: {}
delete from vm_cap4_staffYearAssetPushSon where memberName is null;

-- statementId: yearBatchAssetDoc.insert
-- lookupStatementId: yearBatchAssetDoc.insert
-- source: asset_sqlmap.xml
-- type: insert
-- params: {
--   "batchNo": "VALUE_001",
--   "asstBatchMethod": "VALUE_001",
--   "title": "TITLE_001",
--   "memberId": 1001
-- }
insert into vm_cap4_assetBatchDoc ( id, state, start_member_id, start_date, approve_member_id, approve_date, finishedflag, ratifyflag, ratify_member_id, ratify_date, sort, modify_member_id, modify_date, batchNo, batchDate, batchMember, batchDepart, batchMethod, batchTitle, assetType, assetCode, assetName, assetModel, buyDate, assetState ) select util_common.getAbsID, 1, -6760911671874597139, sysdate, 0, sysdate, 0, 0, 0, null, 0, -6760911671874597139, sysdate, 'VALUE_001', sysdate, v2.useMember, v2.useDepart, 'VALUE_001', 'TITLE_001', v2.assetCategory, v2.assetsCode, v2.assetsName, v2.assetModel, v2.buyTime, v2.assetstatus from vm_assetdocument v2 where v2.assetstatus != -5190900076558529642 and v2.assetstatus != 1350324503683943655 and v2.useMember = 1001;

-- statementId: assetBatchDetailContent.insert
-- lookupStatementId: assetBatchDetailContent.insert
-- source: asset_sqlmap.xml
-- type: insert
-- params: {}
insert into ctp_content_all (ID, CREATE_ID, CREATE_DATE, MODIFY_ID, MODIFY_DATE, MODULE_TYPE, MODULE_ID, MODULE_TEMPLATE_ID, CONTENT_TYPE, CONTENT, CONTENT_DATA_ID, CONTENT_TEMPLATE_ID, TITLE, SORT, HAS_HTML_SIGNATRUE, VOUCHER_ID) SELECT UTIL_COMMON.getAbsID, '1598169197901989123', sysdate, '1598169197901989123', sysdate, '42', '-5572289964263519421', '-2505388640116324887', '20', null, '-5572289964263519421', '-4944952729521666831', null, '0', '0', 'CAP4资产盘点详情' from vm_cap4_assetBatchDoc vm where id not in(select content_data_id from ctp_content_all c where c.content_template_id = -4944952729521666831 and content_data_id is not null);

-- statementId: getBulletinId.select
-- lookupStatementId: getBulletinId.select
-- source: bbs_sqlmap.xml
-- type: select
-- params: {
--   "name": "NAME_001",
--   "accountId": 1
-- }
select id from bul_type where type_name = 'NAME_001' and accountid = 1;

-- statementId: bulletin.update
-- lookupStatementId: bulletin.update
-- source: bbs_sqlmap.xml
-- type: update
-- params: {
--   "createDate": "2026-05-14",
--   "updateDate": "2026-05-14",
--   "publishDate": "2026-05-14",
--   "id": 1001
-- }
update bul_data set create_date = '2026-05-14', update_date = '2026-05-14', publish_date = '2026-05-14' where id = 1001;

-- statementId: getBbsByName.select
-- lookupStatementId: getBbsByName.select
-- source: bbs_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id from ( select * from BBS_ARTICLE ORDER BY ISSUE_TIME desc) where ROWNUM=1 and article_name='VALUE_001';

-- statementId: getBulsSection.select
-- lookupStatementId: getBulsSection.select
-- source: bbs_sqlmap.xml
-- type: select
-- params: {}
select ARGUMENTS from VM_BUL_SECTION;

-- statementId: culturalConstruction.select
-- lookupStatementId: culturalConstruction.select
-- source: bbs_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id,body_type fileType,to_char(content) fileId from BUL_BODY c where c.body_type != 'HTML' and id = 'VALUE_001' union all select id,body_type fileType,to_char(content) fileId from news_body c where c.body_type != 'HTML' and id = 'VALUE_001';

-- statementId: findRoleById.select
-- lookupStatementId: findRoleById.select
-- source: role_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select * from vm_f_deptrole where id = 'VALUE_001';

-- statementId: findRoleByRoleAndDeptId.select
-- lookupStatementId: findRoleByRoleAndDeptId.select
-- source: role_sqlmap.xml
-- type: select
-- params: {
--   "roleId": 1001,
--   "deptId": 1001
-- }
select * from vm_f_deptrole where role_id = 1001 and department_id = 1001;

-- statementId: cleanRoleBackupTable.delete
-- lookupStatementId: cleanRoleBackupTable.delete
-- source: role_sqlmap.xml
-- type: delete
-- params: {}
delete from vm_f_deptrole_backup;

-- statementId: backRoleTable.insert
-- lookupStatementId: backRoleTable.insert
-- source: role_sqlmap.xml
-- type: insert
-- params: {}
insert into vm_f_deptrole_backup ( id , state , start_member_id , start_date , approve_member_id , approve_date , finishedflag , ratifyflag , ratify_member_id , ratify_date , sort , modify_member_id , modify_date , role_id , role_name , role_code , department_id , account_id , role_member , maintainer_id , memo , rolecreatedate , rolecreator , fullorpart , appointdate ) select id , state , start_member_id , start_date , approve_member_id , approve_date , finishedflag , ratifyflag , ratify_member_id , ratify_date , sort , modify_member_id , modify_date , role_id , role_name , role_code , department_id , account_id , role_member , maintainer_id , memo , rolecreatedate , rolecreator , fullorpart , appointdate from vm_f_deptrole;

-- statementId: cleanRoleTable.delete
-- lookupStatementId: cleanRoleTable.delete
-- source: role_sqlmap.xml
-- type: delete
-- params: {}
delete from vm_f_deptrole;

-- statementId: insertRoleTable.insert
-- lookupStatementId: insertRoleTable.insert
-- source: role_sqlmap.xml
-- type: insert
-- params: {}
insert into vm_f_deptrole(id,state,start_member_id,start_date,approve_member_id,approve_date,finishedflag,ratifyflag,ratify_member_id,ratify_date,sort,modify_member_id,modify_date ,role_id,role_name,role_code,department_id,account_id,role_member,maintainer_id ,memo,rolecreatedate,rolecreator ) select util_common.getAbsID() as id,1 as state,util_user.getMemIdByLoginName('flowbot') as start_member_id, create_time as start_date, 0 as approve_member_id,create_time as approve_date,0 as finishedflag,0 as ratifyflag,0 as ratify_member_id,null as ratify_date, 0 as sort,util_user.getMemIdByLoginName('flowbot') as modify_member_id,create_time as modify_date, id as role_id,name as role_name,code as role_code,department_id,org_account_id as account_id,role_member,null as maintainer_id , null as memo,create_time as rolecreatedate,util_user.getMemIdByLoginName('flowbot') as rolecreator from ( select role_member,r.* from ( select u.id as department_id, r.* from org_role r,org_unit u where r.org_account_id=u.org_account_id and r.bond=2 and r.is_deleted=0 and r.is_enable=1 and u.type='Department' and u.is_internal=1 and u.is_deleted=0 and u.is_enable=1 ) r left join ( select objective1_id role_id,objective0_id as department_id,listagg (rl.source_id, ',') WITHIN group (order by rl.source_id) as role_member from org_relationship rl where rl.type='Member_Role' and rl.objective1_id in (select id from org_role r where r.bond=2 and r.is_deleted=0 and r.is_enable=1) group by objective1_id,objective0_id ) rl on r.id=rl.role_id and r.department_id = rl.department_id where code not in ('DepAdmin','DepAsisDirector','DepFirstManager','DepLeader','DepManager','ViceDepManager','DepartmentGovdocRec','DepartmentGovdocSend') order by code,org_account_id );

-- statementId: updateRoleTable.insert
-- lookupStatementId: updateRoleTable.insert
-- source: role_sqlmap.xml
-- type: update
-- params: {}
update vm_f_deptrole r1 set r1.memo = (select rb.memo from vm_f_deptrole_backup rb where r1.role_id = rb.role_id and r1.department_id = rb.department_id), r1.maintainer_id = (select rb.maintainer_id from vm_f_deptrole_backup rb where r1.role_id = rb.role_id and r1.department_id = rb.department_id), r1.fullorpart = (select rb.fullorpart from vm_f_deptrole_backup rb where r1.role_id = rb.role_id and r1.department_id = rb.department_id), r1.appointdate = (select rb.appointdate from vm_f_deptrole_backup rb where r1.role_id = rb.role_id and r1.department_id = rb.department_id) where exists (select 1 from vm_f_deptrole_backup rb where r1.role_id = rb.role_id and r1.department_id = rb.department_id);

-- statementId: addDeptRoleContentAll.insert
-- lookupStatementId: addDeptRoleContentAll.insert
-- source: role_sqlmap.xml
-- type: insert
-- params: {}
insert into ctp_content_all (ID, CREATE_ID, CREATE_DATE, MODIFY_ID, MODIFY_DATE, MODULE_TYPE, MODULE_ID, MODULE_TEMPLATE_ID, CONTENT_TYPE, CONTENT, CONTENT_DATA_ID, CONTENT_TEMPLATE_ID, TITLE, SORT) select util_common.getAbsID, '-6760911671874597139', sysdate, '-6760911671874597139', sysdate, 37, dr.id, '-4372158112483553886', '20', '', dr.id, '-4245563439863804009', '部门角色人员维护', '0' from vm_f_deptrole dr where not exists ( select 1 from ctp_content_all cca where cca.content_data_id = dr.id );

-- statementId: deptRoleMember.updtae
-- lookupStatementId: deptRoleMember.updtae
-- source: role_sqlmap.xml
-- type: update
-- params: "VALUE_001"
update vm_f_deptrole r set role_member = null where r.id = 'VALUE_001';

-- statementId: memberByCode.selet
-- lookupStatementId: memberByCode.selet
-- source: role_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select role_member from vm_f_deptrole r where r.id = 'VALUE_001';

-- statementId: deptRoleMember.update
-- lookupStatementId: deptRoleMember.update
-- source: role_sqlmap.xml
-- type: update
-- params: {
--   "role_member": "VALUE_001",
--   "fullOrPart": "VALUE_001",
--   "id": 1001
-- }
update vm_f_deptrole r set role_member = 'VALUE_001',modify_date = sysdate,appointDate = sysdate, fullOrPart = 'VALUE_001' where r.id = 1001;

-- statementId: selectAllRegularStaff.select
-- lookupStatementId: selectAllRegularStaff.select
-- source: role_sqlmap.xml
-- type: select
-- params: {}
select role_member from vm_f_deptrole where role_id = -8712678903386519288 and role_member is not null;

-- statementId: getBaseMemberInfoByMemberId.select
-- lookupStatementId: getBaseMemberInfoByMemberId.select
-- source: role_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select memberId as "memberId", memberState as "memberState", professionLife as "professionLife" from vm_basememberinfo where memberId = 'VALUE_001';

-- statementId: getRiskAssessCheckFlow.select
-- lookupStatementId: getRiskAssessCheckFlow.select
-- source: riskAssessment_sqlmap.xml
-- type: select
-- params: {
--   "id": 1001
-- }
select main.riskSendSerialNumber as "riskSendSerialNumber", main.sendUser as "sendUser", main.sendDepart as "sendDepart", main.sendDate as "sendDate", main.departs as "departs", main.sendAccount as "sendAccount", main.subjectMatter as "subjectMatter", main.id as "riskAssessSendFlowKey", main.flowName as "riskAssessSendFlowName", sub.regularDepartCode as "regularDepartCode", sub.riskNote as "riskNote" from vm_wf_RISK_assess_send_flow main right join vm_wf_RISK_assess_send_son sub on main.id = sub.formmain_id where main.id = 1001;

-- statementId: getHandledRiskAssess.select
-- lookupStatementId: getHandledRiskAssess.select
-- source: riskAssessment_sqlmap.xml
-- type: select
-- params: {
--   "id": 1001
-- }
select sendUser as "sendUser", sentDepart as "sentDepart", sendDate as "sendDate", sentDepartUnion as "sentDepartUnion", riskSerialNumber as "riskSerialNumber", riskSendSerialNumber as "riskSendSerialNumber", executor as "executor", riskAssessSummary as "riskAssessSummary", subjectMatter as "subjectMatter", regularDepart as "regularDepart", flowId as "flowId", riskAssessSendFlowKey as "riskAssessSendFlowKey", riskAssessSendFlowName as "riskAssessSendFlowName", riskAssessFlowName as "riskAssessFlowName", riskNote as "riskNote", regularDepartCode as "regularDepartCode" from vm_wf_risk_assess_flow where riskAssessSendFlowKey = 1001;

-- statementId: memberInfo.select
-- lookupStatementId: memberInfo.select
-- source: member_sqlmap.xml
-- type: select
-- params: {
--   "name": "NAME_001",
--   "loginname": "NAME_001"
-- }
select r.id ,case when r.state=2 then r.name||'(已离职)' else r.name end name from org_member r left join org_principal l on r.id = l.member_id where ( r.name like '%'||'NAME_001'||'%' or l.login_name like '%'||'NAME_001'||'%') and r.is_deleted = 0 and r.is_admin = 0 order by r.name;

-- statementId: selectPeople.select
-- lookupStatementId: selectPeople.select
-- source: member_sqlmap.xml
-- type: select
-- params: {
--   "loginname": "NAME_001",
--   "name": "NAME_001"
-- }
select case when r.state=2 then r.name||'(已离职)' else r.name end username, case when r.is_internal is null then 0 else r.is_internal end is_internal, r.org_account_id, r.org_department_id, case when t.name is null then ' ' else t.name end deptname, r.id, r.sort_id, r.org_post_id, case when p.name is null then ' ' else p.name end postname, r.org_level_id, case when r.ext_attr_1 is null then ' ' else r.ext_attr_1 end tel, case when r.ext_attr_2 is null then a.login_name||'@fullgoal.com.cn' else r.ext_attr_2 end mail from org_member r left join org_principal a on r.id=a.member_id left join org_unit t on r.org_department_id = t.id left join org_post p on r.org_post_id = p.id where (a.login_name like '%'||'NAME_001'||'%' or r.name like '%'||'NAME_001'||'%') and r.is_deleted = 0 and r.is_admin = 0;

-- statementId: findAllPostInfo.select
-- lookupStatementId: findAllPostInfo.select
-- source: member_sqlmap.xml
-- type: select
-- params: {}
select s1.memberId, s1.departId, s1.postId, s2.accId from (select distinct t.source_id memberId, to_char(wm_concat(t.objective0_id) over(partition by t.source_id order by t.objective0_id rows between unbounded following and unbounded following)) departId, to_char(wm_concat(t.objective1_id) over(partition by t.source_id order by t.objective0_id rows between unbounded following and unbounded following)) postId from org_relationship t where t.objective5_id = 'Second') s1, (select distinct t.source_id memberId, to_char(wm_concat(t.objective0_id) over(partition by t.source_id order by t.objective0_id rows between unbounded following and unbounded following)) departId, to_char(wm_concat(t.org_account_id) over(partition by t.source_id order by t.objective0_id rows between unbounded following and unbounded following)) accId from org_relationship t where t.objective5_id = 'Second') s2 where s1.memberId = s2.memberId and s1.departId = s2.departId;

-- statementId: findAllMemberInfo.select
-- lookupStatementId: findAllMemberInfo.select
-- source: member_sqlmap.xml
-- type: select
-- params: {}
select id,o.is_internal,name ,code from org_member o where o.is_enable=1 and o.is_deleted=0;

-- statementId: getAllPrincipal.select
-- lookupStatementId: getAllPrincipal.select
-- source: member_sqlmap.xml
-- type: select
-- params: {}
select member_id,login_name from org_principal t;

-- statementId: formLog.need.select
-- lookupStatementId: formLog.need.select
-- source: formatLog_sqlmap.xml
-- type: select
-- params: {
--   "formId": 1001
-- }
select f.id as id, f.form_id as formId, f.operate_type as operateType, f.description as description from form_log f where Form_type = '2' and operate_type in ('92','99') and f.description not like '[F]%' and f.description not like '[UF]%' and form_id = 1001;

-- statementId: formLog.update
-- lookupStatementId: formLog.update
-- source: formatLog_sqlmap.xml
-- type: update
-- params: {
--   "formatStr": "VALUE_001",
--   "id": 1001
-- }
update form_log v set v.description = 'VALUE_001' where v.id = 1001;

-- statementId: formLogInsert.insert
-- lookupStatementId: formLogInsert.insert
-- source: formatLog_sqlmap.xml
-- type: insert
-- params: {
--   "form_id": 1001,
--   "record_id": 1001,
--   "form_type": "VALUE_001",
--   "operator": "VALUE_001",
--   "operate_type": "VALUE_001",
--   "creator": "VALUE_001",
--   "description": "VALUE_001"
-- }
insert into form_log values(util_common.getID,1001,1001,'VALUE_001','VALUE_001','VALUE_001',sysdate,'VALUE_001',sysdate,'VALUE_001');

-- statementId: AMLTaskSendById.select
-- lookupStatementId: AMLTaskSendById.select
-- source: aml_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select distinct util_user.getMemCodeByMemId(f1.sendUserId) sendUserNo, f1.id as sendFlowFormId, f1.serialNum || t1.column_value flowId, 'FXQ_RWSJ_T001' flowType, f1.sendDepartId, to_char(f1.sendDate, 'yyyy-mm-dd') sendDate, to_char(f1.latestFeedbackTime, 'yyyy-mm-dd') latestFeedbackTime, taskName, FlowName sendFlowName, f1.serialNum sendFlowSerialNum, t1.column_value feedbackMember, util_user.getDeptIdByMemId(t1.column_value) feedbackDepart, nvl(relevanceFlow, ' ') relevanceFlow, nvl(attachmentId, ' ') attachmentId from vm_wf_aml_task_send f1 left join (select * from vm_wf_aml_task_send_detail, TABLE(UTIL_COMMON.SPLIT(feedbackMembers, ','))) t1 on f1.id = t1.formmain_id where f1.id = 'VALUE_001';

-- statementId: collectDetail.insert
-- lookupStatementId: collectDetail.insert
-- source: aml_sqlmap.xml
-- type: insert
-- params: "VALUE_001"
insert into vm_wf_aml_task_collect_detail ( id, formmain_id, feedbackSubject, feedbackAskFor ) select util_common.getAbsID, f2.id, des.feedbackSubject, des.feedbackAskFor from (select f1.id, f1.serialNum, t1.column_value feedbackMember, t1.feedbackSubject, t1.feedbackAskFor from vm_wf_aml_task_send f1 left join (select * from vm_wf_aml_task_send_detail, TABLE(UTIL_COMMON.SPLIT(feedbackMembers, ','))) t1 on f1.id = t1.formmain_id) des left join vm_wf_aml_task_collect f2 on des.feedbackMember = f2.feedbackMember and des.serialNum = sendFlowSerialNum where f2.id is not null and des.id = 'VALUE_001';

-- statementId: findAttachmentList.select
-- lookupStatementId: findAttachmentList.select
-- source: aml_sqlmap.xml
-- type: select
-- params: {
--   "flowId": 1001,
--   "referID": 1001
-- }
select ID, ATT_REFERENCE, SUB_REFERENCE, CATEGORY, TYPE, FILENAME, FILE_URL, MIME_TYPE, CREATEDATE, ATTACHMENT_SIZE, to_char(DESCRIPTION) DESCRIPTION, GENESIS_ID, SORT from ctp_attachment v1 where v1.att_reference= 1001 and v1.sub_reference=1001;

-- statementId: AMIattachment.insert
-- lookupStatementId: AMIattachment.insert
-- source: aml_sqlmap.xml
-- type: insert
-- params: {
--   "SUB_REFERENCE": "VALUE_001",
--   "CATEGORY": "VALUE_001",
--   "TYPE": "VALUE_001",
--   "FILENAME": "NAME_001",
--   "FILE_URL": "VALUE_001",
--   "MIME_TYPE": "VALUE_001",
--   "CREATEDATE": "2026-05-14",
--   "ATTACHMENT_SIZE": "VALUE_001",
--   "GENESIS_ID": 1001,
--   "SORT": 1,
--   "DESCRIPTION": "VALUE_001",
--   "flowId": 1001
-- }
insert into ctp_attachment ( ID, ATT_REFERENCE, SUB_REFERENCE, CATEGORY, TYPE, FILENAME, FILE_URL, MIME_TYPE, CREATEDATE, ATTACHMENT_SIZE, GENESIS_ID, SORT, DESCRIPTION ) select util_common.getAbsID, f2.id, 'VALUE_001', 'VALUE_001', 'VALUE_001', 'NAME_001', 'VALUE_001', 'VALUE_001', '2026-05-14', 'VALUE_001', 1001, 1, 'VALUE_001' from vm_wf_aml_task_collect f1 left join col_summary f2 on f1.id = f2.form_recordid where f1.sendFlowSerialNum = 1001;

-- statementId: amiCollectBlankRecord.delete
-- lookupStatementId: amiCollectBlankRecord.delete
-- source: aml_sqlmap.xml
-- type: delete
-- params: "VALUE_001"
delete vm_wf_aml_task_collect_detail f where f.feedbackSubject is null and f.formmain_id in( select id from vm_wf_aml_task_collect f1 where f1.sendFlowSerialNum = 'VALUE_001' );

-- statementId: amiPerformanceSendFlow.select
-- lookupStatementId: amiPerformanceSendFlow.select
-- source: aml_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select distinct util_user.getMemCodeByMemId(vf1.sendUserId) sendUserNo, vf1.id as sendFlowId, vf1.serialNum || vf2.memberUnderAssessment flowId, 'FXQ_KHZBZD_T001' flowType, vf1.sendDepartId, to_char(vf1.sendDate, 'yyyy-mm-dd') sendDate, annual, nvl(associatedFlow, ' ') associatedFlow, util_user.getDeptIdByMemId(memberUnderAssessment) departUnderAssessment, memberUnderAssessment, flowName sendFlowName from vm_wf_ami_Inspect_APPLY vf1 left join vm_wf_ami_Inspect_APPLY_son vf2 on vf1.id = vf2.formmain_id where vf1.id = 'VALUE_001';

-- statementId: amiPerformanceConfirmSon.insert
-- lookupStatementId: amiPerformanceConfirmSon.insert
-- source: aml_sqlmap.xml
-- type: insert
-- params: "VALUE_001"
insert into vm_wf_ami_Inspect_confirm_son ( id, formmain_id, content, indexWeight, indexCode, attachment ) select util_common.getAbsID, f.id, f2.content, f2.indexWeight, f2.indexCode, f2.attachment from vm_wf_ami_Inspect_confirm f left join vm_wf_ami_Inspect_APPLY_son f2 on f.memberUnderAssessment = f2.memberUnderAssessment and f2.formmain_id = f.sendFlowId where f2.formmain_id = 'VALUE_001';

-- statementId: performanceAssess.delete
-- lookupStatementId: performanceAssess.delete
-- source: aml_sqlmap.xml
-- type: delete
-- params: {}
delete from vm_wf_ami_Inspect_confirm_son f where f.content is null;

-- statementId: performanceResultFlow.select
-- lookupStatementId: performanceResultFlow.select
-- source: aml_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select distinct util_user.getMemCodeByMemId(vf1.sendUserId) sendUserNo, vf1.id as sendFlowId, vf1.serialNum || vf2.memberUnderAssessment flowId, 'FXQ_KHZBQR_T0001' flowType, vf1.sendDepartId, to_char(vf1.sendDate, 'yyyy-mm-dd') sendDate, annual, nvl(associatedFlow, ' ') associatedFlow, util_user.getDeptIdByMemId(memberUnderAssessment) departUnderAssessment, memberUnderAssessment, flowName sendFlowName from vm_wf_ami_result_APPLY vf1 left join vm_wf_ami_result_APPLY_son vf2 on vf1.id = vf2.formmain_id where vf1.id = 'VALUE_001';

-- statementId: performanceResult.insert
-- lookupStatementId: performanceResult.insert
-- source: aml_sqlmap.xml
-- type: insert
-- params: "VALUE_001"
insert into vm_wf_ami_result_confirm_son ( id, formmain_id, content, indexWeight, indexCode, attachment, evaluationResult, remark ) select util_common.getAbsID, f.id, f2.content, f2.indexWeight, f2.indexCode, f2.attachment, evaluationResult, remark from vm_wf_ami_result_confirm f left join vm_wf_ami_result_APPLY_son f2 on f.memberUnderAssessment = f2.memberUnderAssessment and f2.formmain_id = f.sendFlowId where f2.formmain_id = 'VALUE_001';

-- statementId: performanceResult.delete
-- lookupStatementId: performanceResult.delete
-- source: aml_sqlmap.xml
-- type: delete
-- params: {}
delete from vm_wf_ami_result_confirm_son f where f.content is null;

-- statementId: addMemberAuthInfo.insert
-- lookupStatementId: addMemberAuthInfo.insert
-- source: authinfoinit_sqlmap.xml
-- type: insert
-- params: {}
insert into vm_authview_member_auth ( id, state, start_member_id, start_date, approve_member_id, approve_date, finishedflag, ratifyflag, ratify_member_id, ratify_date, sort, modify_member_id, modify_date, memberName, memberCode, authObjName, authObjType, memberId, authObjId, memberState, authObjCode, updateTime, extendStr ) select util_common.getAbsID() as id,1,-6760911671874597139,sysdate,0,sysdate,0,0,0,null,0,-6760911671874597139,sysdate, member_name as membername, util_user.getMemCodeByMemId(member_id) as membercode, object_name as authObjName, object_type as authObjType, object_id as authObjId, member_id as memberId, (select is_enable from org_member where id = member_id) as memberState, object_code authObjCode, update_time as updateTime, extendStr from table(util_user.getAllUserRightObjects());

-- statementId: removeMemberAuthInfo.delete
-- lookupStatementId: removeMemberAuthInfo.delete
-- source: authinfoinit_sqlmap.xml
-- type: delete
-- params: {}
delete from vm_authview_member_auth;

-- statementId: addAuthMenuInfo.insert
-- lookupStatementId: addAuthMenuInfo.insert
-- source: authinfoinit_sqlmap.xml
-- type: insert
-- params: {}
insert into vm_authview_auth_menu ( id, state, start_member_id, start_date, approve_member_id, approve_date, finishedflag, ratifyflag, ratify_member_id, ratify_date, sort, modify_member_id, modify_date, menuName, firstMenu, menuType, menuDef, authObjId, authObjName, authObjType, extendStr, authObjCode ) select util_common.getAbsID() as id,1,-6760911671874597139,sysdate,0,sysdate,0,0,0,null,0,-6760911671874597139,sysdate, MENU_NAME as menuName, LEVEL1_MENU as firstMenu, MODULE_TYPE_NAME as menuType, 1 as menuDef, OBJECT_ID as authObjId, OBJECT_NAME as authObjName, OBJECT_TYPE as authObjType, extend_str as extendStr, OBJECT_CODE as authObjCode from table(util_auth.getAllMenuAuths);

-- statementId: removeAuthMenuInfo.delete
-- lookupStatementId: removeAuthMenuInfo.delete
-- source: authinfoinit_sqlmap.xml
-- type: delete
-- params: {}
delete from vm_authview_auth_menu;

-- statementId: addAuthDataQryInfo.insert
-- lookupStatementId: addAuthDataQryInfo.insert
-- source: authinfoinit_sqlmap.xml
-- type: insert
-- params: {}
insert into vm_authview_auth_dataqry ( id, state, start_member_id, start_date, approve_member_id, approve_date, finishedflag, ratifyflag, ratify_member_id, ratify_date, sort, modify_member_id, modify_date, qryName, /*查询名称 */ qryExpr, /* 查询表达式 */ authObjName, /*授权对象名称*/ authObjType, /*授权对象类型*/ qryAuthName, /*查询权限名称*/ authObjId, /*授权对象ID */ qryId, /*查询ID */ authObjCode, /*授权对象代码 */ wholeExpr, /*完整表达式 */ extendStr ) select util_common.getAbsID() as id,1,-6760911671874597139,sysdate,0,sysdate,0,0,0,null,0,-6760911671874597139,sysdate, QUERY_NAME as qryName, FORMULA_CLAUSE as qryExpr, OBJECT_NAME as authObjName, OBJECT_TYPE as authObjType, FORMALA_AUTH_NAME as qryAuthName, OBJECT_ID as authObjId, QUERY_ID as qryId, OBJECT_CODE as authObjCode, FORMULA_EXPRESSION as wholeExpr, extendStr from table(util_auth.getAllQuerExpOrClauseAuth);

-- statementId: removeAuthDataQryInfo.delete
-- lookupStatementId: removeAuthDataQryInfo.delete
-- source: authinfoinit_sqlmap.xml
-- type: delete
-- params: {}
delete from vm_authview_auth_dataqry;

-- statementId: addMemberDataQryInfo.insert
-- lookupStatementId: addMemberDataQryInfo.insert
-- source: authinfoinit_sqlmap.xml
-- type: insert
-- params: "VALUE_001"
insert into vm_authview_member_dataqry ( id, state, start_member_id, start_date, approve_member_id, approve_date, finishedflag, ratifyflag, ratify_member_id, ratify_date, sort, modify_member_id, modify_date, qryName, qryExpr, authObjName, authObjType, qryAuthName, authObjId, qryId, authObjCode, wholeExpr, memberName, memberId, extendStr ) select util_common.getAbsID() as id,1,-6760911671874597139,sysdate,0,sysdate,0,0,0,null,0,-6760911671874597139,sysdate, QUERY_NAME as qryName, FORMULA_CLAUSE as qryExpr, OBJECT_NAME as authObjName, OBJECT_TYPE as authObjType, FORMALA_AUTH_NAME as qryAuthName, OBJECT_ID as authObjId, QUERY_ID as qryId, OBJECT_CODE as authObjCode, FORMULA_EXPRESSION as wholeExpr, util_user.getMemberNameByMemId('VALUE_001') as memberName, 'VALUE_001' as memberId, extendStr from table(util_auth.getAllQuerExpOrClauseMember('VALUE_001'));

-- statementId: removeMemberDataQryInfo.delete
-- lookupStatementId: removeMemberDataQryInfo.delete
-- source: authinfoinit_sqlmap.xml
-- type: delete
-- params: {}
delete from vm_authview_member_dataqry;

-- statementId: memberToFunction.delete
-- lookupStatementId: memberToFunction.delete
-- source: authinfoinit_sqlmap.xml
-- type: delete
-- params: {}
delete from vm_memberToFunctionSearch;

-- statementId: memberToFunction.insert
-- lookupStatementId: memberToFunction.insert
-- source: authinfoinit_sqlmap.xml
-- type: insert
-- params: {
--   "memberId": 1001,
--   "memberName": "NAME_001"
-- }
insert into vm_memberToFunctionSearch (id, state, start_member_id, start_date, approve_member_id, approve_date, finishedflag, ratifyflag, ratify_member_id, ratify_date, sort, modify_member_id, modify_date, memberId , functionModel , functionName , functionType , isAutoMenu , authObjectName , authObjectId , authObjectType , authObjectCode , extendField, memberName )select util_common.getAbsID,1,-6760911671874597139,sysdate,0,sysdate,0,0,0,null,0,-6760911671874597139,sysdate,1001, t.level1_menu, t.menu_name,module_type_name,1, object_name,object_id,object_type,object_code,extend_str,'NAME_001' from table(util_auth.getMenus4Member('',1001,'')) t where menu_name is not null;

-- statementId: authObjectToNode.insert
-- lookupStatementId: authObjectToNode.insert
-- source: authinfoinit_sqlmap.xml
-- type: insert
-- params: {}
insert into vm_authObjectToNode (id, state, start_member_id, start_date, approve_member_id, approve_date, finishedflag, ratifyflag, ratify_member_id, ratify_date, sort, modify_member_id, modify_date, flowName, nodeName, authObjectId, objectType, authObjectName, flowTemplateNumber, nodeId, functionModel, extendStr )select util_common.getAbsID,1,-6760911671874597139,sysdate,0,sysdate,0,0,0,null,0,-6760911671874597139,sysdate,t.wf_process_name,t.wf_activity_name,object_id,object_type,object_name,t1.templete_number,t.wf_activity_id,form_name,extendStr from (table(util_auth.getAllWFActivityAuths)) t left join ctp_template t1 on t.wf_template_id = t1.workflow_id;

-- statementId: authObjectToNode.delete
-- lookupStatementId: authObjectToNode.delete
-- source: authinfoinit_sqlmap.xml
-- type: delete
-- params: {}
delete from vm_authObjectToNode;

-- statementId: memberToNode.insert
-- lookupStatementId: memberToNode.insert
-- source: authinfoinit_sqlmap.xml
-- type: insert
-- params: {
--   "memberName": "NAME_001",
--   "loginName": "NAME_001"
-- }
insert into vm_memberToNode (id, state, start_member_id, start_date, approve_member_id, approve_date, finishedflag, ratifyflag, ratify_member_id, ratify_date, sort, modify_member_id, modify_date, flowName, nodeName, authObjectId, objectType, authObjectName, flowTemplateNumber, nodeId, functionModel, memberName, extendStr )select util_common.getAbsID,1,-6760911671874597139,sysdate,0,sysdate,0,0,0,null,0,-6760911671874597139,sysdate,t.wf_process_name, t.wf_activity_name,object_id,object_type,object_name,t1.templete_number,t.wf_activity_id,form_name,'NAME_001' ,extendStr from table(util_auth.getWFActivity4Member('NAME_001')) t left join ctp_template t1 on t.wf_template_id = t1.workflow_id;

-- statementId: memberToNode.delete
-- lookupStatementId: memberToNode.delete
-- source: authinfoinit_sqlmap.xml
-- type: delete
-- params: {}
delete from vm_memberToNode;

-- statementId: wfActivition.select
-- lookupStatementId: wfActivition.select
-- source: authinfoinit_sqlmap.xml
-- type: select
-- params: {}
select case when sysdate - max(update_date) > 1/24/6 or count(1) <= 0 then '1' else '0' end invalid from FG_WFACTIVITYINFO;

-- statementId: truncateWorkFlow
-- lookupStatementId: truncateWorkFlow
-- source: authinfoinit_sqlmap.xml
-- type: update
-- params: {}
truncate table FG_WFACTIVITYINFO;

-- statementId: workFlowInfo.insert
-- lookupStatementId: workFlowInfo.insert
-- source: authinfoinit_sqlmap.xml
-- type: insert
-- params: {}
insert into FG_WFACTIVITYINFO( form_id , form_name , wf_template_id , wf_process_name , wf_activity_id , wf_activity_name , wf_activity_desc , wf_activity_performer_type , wf_activity_performer_value , wf_activity_performer_desc , wf_activity_performer_account, wf_activity_right_code , wf_activity_right_name , update_date ) select form_id , form_name , wf_template_id , wf_process_name , wf_activity_id , wf_activity_name , wf_activity_desc , wf_activity_performer_type , wf_activity_performer_value , wf_activity_performer_desc , wf_activity_performer_account, wf_activity_right_code , wf_activity_right_name , sysdate as update_date from VM_WFACTIVITYINFO;

-- statementId: addMemberAuthInfoContentAll.insert
-- lookupStatementId: addMemberAuthInfoContentAll.insert
-- source: authinfoinit_sqlmap.xml
-- type: insert
-- params: {}
insert into ctp_content_all (ID, CREATE_ID, CREATE_DATE, MODIFY_ID, MODIFY_DATE, MODULE_TYPE, MODULE_ID, MODULE_TEMPLATE_ID, CONTENT_TYPE, CONTENT, CONTENT_DATA_ID, CONTENT_TEMPLATE_ID, TITLE, SORT) select util_common.getAbsID, '-6760911671874597139', sysdate, '-6760911671874597139', sysdate, '37', f.ID, '9051295399629898964', '20', null, f.ID, '470204954798539098', '权限视图_人员-授权对象', '0' from vm_authview_member_auth f;

-- statementId: addAuthDataQryInfoContent.insert
-- lookupStatementId: addAuthDataQryInfoContent.insert
-- source: authinfoinit_sqlmap.xml
-- type: insert
-- params: {}
insert into ctp_content_all (ID, CREATE_ID, CREATE_DATE, MODIFY_ID, MODIFY_DATE, MODULE_TYPE, MODULE_ID, MODULE_TEMPLATE_ID, CONTENT_TYPE, CONTENT, CONTENT_DATA_ID, CONTENT_TEMPLATE_ID, TITLE, SORT) select util_common.getAbsID, '-6760911671874597139', sysdate, '-6760911671874597139', sysdate, '37', f.ID, '8283373005032017605', '20', null, f.ID, '8827553393709633247', '权限视图_数据查询-授权对象', '0' from vm_authview_auth_dataqry f;

-- statementId: memberToNodeContent.insert
-- lookupStatementId: memberToNodeContent.insert
-- source: authinfoinit_sqlmap.xml
-- type: insert
-- params: {}
insert into ctp_content_all (ID, CREATE_ID, CREATE_DATE, MODIFY_ID, MODIFY_DATE, MODULE_TYPE, MODULE_ID, MODULE_TEMPLATE_ID, CONTENT_TYPE, CONTENT, CONTENT_DATA_ID, CONTENT_TEMPLATE_ID, TITLE, SORT) select util_common.getAbsID, '-6760911671874597139', sysdate, '-6760911671874597139', sysdate, '37', f.ID, '703405371387891107', '20', null, f.ID, '3360814543773386519', '权限视图_授权对象-流程节点', '0' from vm_memberToNode f;

-- statementId: getpromo.select
-- lookupStatementId: getpromo.select
-- source: promo_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select vm_applyson.id as ID,org_member.name as applyUser, org_member.code as applyUserNo,vm_applymain.applyDate as applyDate, vm_applymain.archiveDate as archiveDate,org_unit.name as applyDept , org_unit.code as applyDeptNo,vm_applyson.cateGory as cateGory, vm_applyson.numbers as numbers,vm_applyson.usePurpose as usePurpose,vm_applymain.flowId as flowId,vm_applyson.price as price from vm_applymain join vm_applyson on vm_applymain.id=vm_applyson.formid join org_member on vm_applymain.applyUser=org_member.id join org_unit on vm_applymain.applyDept=org_unit.id where vm_applymain.applyDate >= to_date('VALUE_001','yyyy-mm-dd');

-- statementId: getOrgMemberId.select
-- lookupStatementId: getOrgMemberId.select
-- source: promo_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id from org_member t where org_department_id in (VALUE_001);

-- statementId: batchCheckTable.update
-- lookupStatementId: batchCheckTable.update
-- source: promo_sqlmap.xml
-- type: update
-- params: {
--   "isChange": "VALUE_001",
--   "checkCount": 1,
--   "promoChangeCount": 1,
--   "batchNote": "VALUE_001",
--   "promoCode": "CODE_001"
-- }
update vm_promobatchinfo set , isChange = util_common.getEnumIdByRefName('数量是否变化','VALUE_001') , checkCount = 1 , promoChangeCount = 1 , checkNote = 'VALUE_001' where promocode = 'CODE_001';

-- statementId: promoByid.delete
-- lookupStatementId: promoByid.delete
-- source: promo_sqlmap.xml
-- type: delete
-- params: "VALUE_001"
delete from vm_promobatchinfo where batchno ='VALUE_001';

-- statementId: allInfo.delete
-- lookupStatementId: allInfo.delete
-- source: promo_sqlmap.xml
-- type: delete
-- params: "VALUE_001"
delete from vm_promobatchinfo;

-- statementId: allInfoHistory.delete
-- lookupStatementId: allInfoHistory.delete
-- source: promo_sqlmap.xml
-- type: delete
-- params: "VALUE_001"
delete from vm_promocheckhistory where promobatch='VALUE_001';

-- statementId: checkBatchInfo.select
-- lookupStatementId: checkBatchInfo.select
-- source: promo_sqlmap.xml
-- type: select
-- params: {
--   "promocode": "CODE_001"
-- }
select id, batchno, batchdate, batchmember, batchdepart, batchmanager, stockcount, checkcount, checknote, promocode, ischange, promoprice, promouse, promochangecount, promoname from vm_promobatchinfo where 1=1 AND promocode = 'CODE_001';

-- statementId: promocheck.select
-- lookupStatementId: promocheck.select
-- source: promo_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id, batchno, applayuser, batchdepart, batchmanager, batchstatus,applydate,checknote,checkremark from vm_promocheckbatch where batchstatus= util_common.getEnumIdByRefName('盘点状态','VALUE_001');

-- statementId: promocheck.update
-- lookupStatementId: promocheck.update
-- source: promo_sqlmap.xml
-- type: update
-- params: {
--   "status": 1,
--   "statusing": 1
-- }
update vm_promocheckbatch set batchstatus= 1 where batchstatus=1;

-- statementId: getDepart.select
-- lookupStatementId: getDepart.select
-- source: promo_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select vm_promocheckbatch.batchdepart from vm_promocheckbatch where vm_promocheckbatch.batchno='VALUE_001';

-- statementId: getManager.select
-- lookupStatementId: getManager.select
-- source: promo_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select vm_promocheckbatch.batchmanager from vm_promocheckbatch where vm_promocheckbatch.batchno='VALUE_001';

-- statementId: operateLogById.select
-- lookupStatementId: operateLogById.select
-- source: promo_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id,manager,managerdepart,operatedate,promoname,promochangecount,operatetype,operateprice,promocode from vm_promooperatelog where id = 'VALUE_001';

-- statementId: promoOperateLog.update
-- lookupStatementId: promoOperateLog.update
-- source: promo_sqlmap.xml
-- type: update
-- params: {
--   "promoChangeCount": 1,
--   "id": 1001
-- }
update vm_promooperatelog set promochangecount = 1 where id = 1001;

-- statementId: perateToPromoLog.insert
-- lookupStatementId: perateToPromoLog.insert
-- source: promo_sqlmap.xml
-- type: insert
-- params: {
--   "id": 1001,
--   "manager": "VALUE_001",
--   "managerDepart": "VALUE_001",
--   "operateDate": "2026-05-14",
--   "promoName": "NAME_001",
--   "promoChangeCount": 1,
--   "operateType": "VALUE_001",
--   "operatePrice": "VALUE_001",
--   "promoCode": "CODE_001"
-- }
insert into vm_promooperatelog (id,manager,managerdepart,operatedate,promoname,promochangecount,operatetype,operateprice,promocode) values (1001,'VALUE_001','VALUE_001','2026-05-14','NAME_001',1,'VALUE_001','VALUE_001','CODE_001');

-- statementId: operateToPromoLog.insert
-- lookupStatementId: operateToPromoLog.insert
-- source: promo_sqlmap.xml
-- type: insert
-- params: {
--   "id": 1001,
--   "manager": "VALUE_001",
--   "managerDepart": "VALUE_001",
--   "operateDate": "2026-05-14",
--   "promoName": "NAME_001",
--   "promoChangeCount": 1,
--   "operateType": "VALUE_001",
--   "operatePrice": "VALUE_001",
--   "promoCode": "CODE_001",
--   "updateManager": "2026-05-14",
--   "updateDate": "2026-05-14"
-- }
insert into vm_promooperatelog (id,manager,managerdepart,operatedate,promoname,promochangecount,operatetype,operateprice,promocode,updatemanager,updatedate) values (1001,'VALUE_001','VALUE_001','2026-05-14','NAME_001',1,'VALUE_001','VALUE_001','CODE_001','2026-05-14','2026-05-14');

-- statementId: contentInfoPromoLog.insert
-- lookupStatementId: contentInfoPromoLog.insert
-- source: promo_sqlmap.xml
-- type: insert
-- params: {
--   "formId": 1001
-- }
INSERT INTO CTP_CONTENT_ALL( ID , CREATE_ID , CREATE_DATE , MODIFY_ID , MODIFY_DATE , MODULE_TYPE , MODULE_ID , MODULE_TEMPLATE_ID , CONTENT_TYPE , CONTENT , CONTENT_DATA_ID , CONTENT_TEMPLATE_ID , TITLE , SORT ) VALUES(util_common.getID,-6760911671874597139,SYSDATE, -6760911671874597139,SYSDATE,37,1001,7461148667809252724, 20,null,1001, -3676677948578054032,'宣传品操作日志',0);

-- statementId: setPromoHistory.insert
-- lookupStatementId: setPromoHistory.insert
-- source: promo_sqlmap.xml
-- type: insert
-- params: {}
insert into vm_promocheckhistory (id,promobatch, promodate, promouser, promodep, promoadmin, inventnumber, checknumber, inventremark,ischange, changenumber,promoname,batchno,promoprice) select util_common.getID(),vm_promobatchinfo.batchno,vm_promobatchinfo.batchdate,vm_promobatchinfo.batchmember,vm_promobatchinfo.batchdepart,vm_promobatchinfo.batchmanager,vm_promobatchinfo.stockcount, vm_promobatchinfo.checkcount,vm_promobatchinfo.checknote, vm_promobatchinfo.ischange, vm_promobatchinfo.promochangecount,vm_promobatchinfo.promoname,vm_promobatchinfo.promocode,vm_promobatchinfo.promoprice from vm_promobatchinfo;

-- statementId: setINnfos.insert
-- lookupStatementId: setINnfos.insert
-- source: promo_sqlmap.xml
-- type: insert
-- params: {
--   "batchno": "VALUE_001",
--   "depart": [
--     "EVENT_A",
--     "EVENT_B"
--   ],
--   "manager": [
--     "EVENT_A",
--     "EVENT_B"
--   ]
-- }
insert into vm_promobatchinfo(id,promocode,batchno,batchdate,batchmember,batchdepart,batchmanager,stockcount,checknote,promoname,promoprice) select util_common.getID(),pv.promono,pb.batchno,pb.applydate,pb.applayuser,pv.dependents,pv.admins,pv.promoquantity,pb.checknote,pv.promoname,pv.promoprice from vm_promoinvent pv, vm_promocheckbatch pb where pb.batchno='VALUE_001' and (pv.dependents in ('EVENT_A','EVENT_B') or pv.admins in ('EVENT_A','EVENT_B') );

-- statementId: selectByde.select
-- lookupStatementId: selectByde.select
-- source: promo_sqlmap.xml
-- type: select
-- params: {
--   "depart": [
--     "EVENT_A",
--     "EVENT_B"
--   ],
--   "manager": [
--     "EVENT_A",
--     "EVENT_B"
--   ]
-- }
select util_common.getID(),pv.promono,pb.batchno,pb.applydate,pb.applayuser,pv.dependents,pv.admins,pv.promoquantity,pb.checknote,pv.promoname as promoname,pv.promoprice from vm_promoinvent pv, vm_promocheckbatch pb where (pv.dependents in ('EVENT_A','EVENT_B') or pv.admins in ('EVENT_A','EVENT_B') );

-- statementId: batchInfo.update
-- lookupStatementId: batchInfo.update
-- source: promo_sqlmap.xml
-- type: update
-- params: {
--   "checknote": "VALUE_001",
--   "checkremark": "VALUE_001",
--   "batchno": "VALUE_001"
-- }
update vm_promocheckbatch set vm_promocheckbatch.checknote='VALUE_001',vm_promocheckbatch.checkremark='VALUE_001' where vm_promocheckbatch.batchno ='VALUE_001';

-- statementId: getCap3ColSummaryIdById.select
-- lookupStatementId: getCap3ColSummaryIdById.select
-- source: signOffSerial_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select * from col_summary where form_recordid = 'VALUE_001' and case_id is not null;

-- statementId: getCap3OperationId.select
-- lookupStatementId: getCap3OperationId.select
-- source: signOffSerial_sqlmap.xml
-- type: select
-- params: {
--   "viewName": "NAME_001",
--   "tableName": "NAME_001"
-- }
SELECT to_char(replace(wm_concat(t.name || '.' || t.value),',','_')) as id FROM (select '/QueryList/Query[@name="' || 'NAME_001' || '"]/ShowsThrough/Colum' XPATH, f.* from form_definition f where f.name = 'NAME_001') f, xmltable(f.XPATH passing xmltype(nvl(f.query_info, '<root/>')) columns "NAME" path '@name', "VALUE" path '@value') t;

-- statementId: findCap4RptDesignId.select
-- lookupStatementId: findCap4RptDesignId.select
-- source: signOffSerial_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select vr.id from VREPORT_RECORD vr where vr.record_subject = 'VALUE_001';

-- statementId: getCap3GeneralSignInfo.select
-- lookupStatementId: getCap3GeneralSignInfo.select
-- source: signOffSerial_sqlmap.xml
-- type: select
-- params: {}
select vcf.id as "flowId", vci.id as "id", vci.serialNum as "serialNum" from vm_cap3GeneralSign_Info vci left join vm_cap3GeneralSign_flow vcf on vcf.serialNum = vci.serialNum where vci.flowUrl is null and vci.signVersion is null;

-- statementId: getCap4GeneralSignInfo.select
-- lookupStatementId: getCap4GeneralSignInfo.select
-- source: signOffSerial_sqlmap.xml
-- type: select
-- params: {}
select vcf.id as "flowId", vci.id as "id", vci.serialNum as "serialNum" from vm_cap3GeneralSign_Info vci left join vm_cap4GeneralSign_flow vcf on vcf.serialNum = vci.serialNum where vci.flowUrl is null and vci.signVersion = 'cap4';

-- statementId: updateFlowUrlField.update
-- lookupStatementId: updateFlowUrlField.update
-- source: signOffSerial_sqlmap.xml
-- type: update
-- params: {
--   "flowUrl": "VALUE_001",
--   "id": 1001
-- }
update vm_cap3GeneralSign_Info set flowUrl='VALUE_001' where id=1001;

-- statementId: updateCap4FlowUrlField.update
-- lookupStatementId: updateCap4FlowUrlField.update
-- source: signOffSerial_sqlmap.xml
-- type: update
-- params: {
--   "flowUrl": "VALUE_001",
--   "serialNum": "VALUE_001"
-- }
update vm_cap4GeneralSign_Info set flowUrl='VALUE_001' where serialNum='VALUE_001';

-- statementId: insertCap3GeneralSignInfo.insert
-- lookupStatementId: insertCap3GeneralSignInfo.insert
-- source: signOffSerial_sqlmap.xml
-- type: insert
-- params: {
--   "tableName": "demo_table"
-- }
insert into demo_table ( id, state, start_member_id, start_date, approve_member_id, approve_date, finishedflag, ratifyflag, ratify_member_id, ratify_date, field0001,/*流水号*/ field0009, field0008, field0010, field0003, field0005, field0007, field0004, field0011, field0013, field0016, field0017, field0018, field0006, field0012 ) select id, 1, -6760911671874597139, sysdate, 0, null, 0, 0, null, null, field0013,/*流水号*/ field0004, field0003, field0001, field0012, field0016, field0053, field0002, field0006, field0014, field0008, field0010, field0007, field0011, field0005 from formmain_0065 where field0013 not in (select field0001 from demo_table) and field0014 is not null;

-- statementId: signCTPContent.insert
-- lookupStatementId: signCTPContent.insert
-- source: signOffSerial_sqlmap.xml
-- type: insert
-- params: {
--   "moduleTemplateId": 1001,
--   "contentTemplateId": 1001,
--   "title": "TITLE_001",
--   "tableName": "demo_table"
-- }
insert into ctp_content_all (ID, CREATE_ID, CREATE_DATE, MODIFY_ID, MODIFY_DATE, MODULE_TYPE, MODULE_ID, MODULE_TEMPLATE_ID, CONTENT_TYPE, CONTENT, CONTENT_DATA_ID, CONTENT_TEMPLATE_ID, TITLE, SORT) select util_common.getAbsID, '-6760911671874597139', sysdate, '-6760911671874597139', sysdate, 37, id, 1001, '20', '', id, 1001, 'TITLE_001', '0' from demo_table vm where id not in(select content_data_id from ctp_content_all c where c.content_template_id = 1001 and content_data_id is not null);

-- statementId: tempEmployee.delete
-- lookupStatementId: tempEmployee.delete
-- source: org_sqlmap.xml
-- type: delete
-- params: {}
delete from spsm_employeeinfo_TEMP;

-- statementId: tempEmployee.count
-- lookupStatementId: tempEmployee.count
-- source: org_sqlmap.xml
-- type: select
-- params: {}
select count(*) from spsm_employeeinfo_TEMP;

-- statementId: tempEmployee.insert
-- lookupStatementId: tempEmployee.insert
-- source: org_sqlmap.xml
-- type: insert
-- params: {
--   "account": 1,
--   "code": "CODE_001",
--   "name": "NAME_001",
--   "staffStatus": 1,
--   "joinDate": "2026-05-14",
--   "leaveDate": "2026-05-14",
--   "companyCode": "CODE_001",
--   "companyName": "NAME_001",
--   "deptCode": "CODE_001",
--   "deptName": "NAME_001",
--   "mainJob": "VALUE_001",
--   "partTimeJob": "2026-05-14 10:00:00",
--   "mobile": "VALUE_001",
--   "certType": "VALUE_001",
--   "certNo": "VALUE_001",
--   "workPlace": "VALUE_001",
--   "staffType": "VALUE_001",
--   "job": "VALUE_001",
--   "jobGrade": "VALUE_001",
--   "sex": "VALUE_001",
--   "workPhone": "VALUE_001",
--   "workEmail": "VALUE_001"
-- }
INSERT INTO spsm_employeeinfo_TEMP (VC_ACCOUNT,VC_CODE,VC_NAME,vc_staffstatus,D_JOINDATE,D_LEAVEDATE, VC_COMPANYCODE,VC_COMPANYNAME,VC_DEPTCODE,VC_DEPTNAME,VC_MAINJOB,VC_PARTTIMEJOB, VC_MOBILE,VC_CERTTYPE,VC_CERTNO,VC_WORKPLACE,vc_stafftype,VC_job,VC_JOBGRADE,vc_sex,VC_WORKPHONE,VC_WORKEMAIL) VALUES (1,'CODE_001','NAME_001',1,to_date('2026-05-14','YYYY-MM-DD'),to_date('2026-05-14','YYYY-MM-DD'), 'CODE_001','NAME_001','CODE_001','NAME_001','VALUE_001','2026-05-14 10:00:00', 'VALUE_001','VALUE_001','VALUE_001','VALUE_001','VALUE_001','VALUE_001','VALUE_001','VALUE_001','VALUE_001','VALUE_001');

-- statementId: tempEmployee.select
-- lookupStatementId: tempEmployee.select
-- source: org_sqlmap.xml
-- type: select
-- params: {
--   "code": "CODE_001"
-- }
select t.VC_ACCOUNT as account,t.VC_CODE as code,t.VC_NAME as name,t.vc_staffstatus as staffStatus, to_char(t.D_JOINDATE,'YYYY-MM-DD') as joinDate,to_char(t.D_LEAVEDATE,'YYYY-MM-DD') as leaveDate, t.VC_COMPANYCODE as companyCode,t.VC_COMPANYNAME as companyName,t.VC_DEPTCODE as deptCode, t.VC_DEPTNAME as deptName,t.VC_MAINJOB as mainJob,t.VC_PARTTIMEJOB as partTimeJob, t.VC_MOBILE as mobile,t.VC_CERTTYPE as certType,t.VC_CERTNO as certNo,t.VC_WORKPLACE as workPlace, t.vc_stafftype as staffType,t.VC_job as job,t.VC_JOBGRADE as jobGrade,t.vc_sex as sex,VC_WORKPHONE as workPhone, VC_WORKEMAIL as workEmail from spsm_employeeinfo_TEMP t where 1=1 AND t.VC_CODE = 'CODE_001';

-- statementId: tempEmployee.update
-- lookupStatementId: tempEmployee.update
-- source: org_sqlmap.xml
-- type: update
-- params: {
--   "code": "CODE_001",
--   "partTimeJob": "2026-05-14 10:00:00",
--   "mainJob": "VALUE_001",
--   "companyName": "NAME_001",
--   "account": 1,
--   "deptName": "NAME_001",
--   "companyCode": "CODE_001",
--   "deptCode": "CODE_001",
--   "joinDate": "2026-05-14",
--   "leaveDate": "2026-05-14",
--   "staffStatus": 1,
--   "workPlace": "VALUE_001",
--   "workPhone": "VALUE_001",
--   "workEmail": "VALUE_001"
-- }
update spsm_employeeinfo_TEMP set VC_CODE = 'CODE_001', VC_PARTTIMEJOB = '2026-05-14 10:00:00', VC_MAINJOB = 'VALUE_001', VC_COMPANYNAME = 'NAME_001', VC_ACCOUNT = 1, VC_DEPTNAME = 'NAME_001', VC_COMPANYCODE = 'CODE_001', VC_DEPTCODE = 'CODE_001', D_JOINDATE = to_date('2026-05-14','YYYY-MM-DD'), D_LEAVEDATE = to_date('2026-05-14','YYYY-MM-DD'), VC_STAFFSTATUS = 1, VC_WORKPLACE = 'VALUE_001', VC_WORKPHONE = 'VALUE_001', VC_WORKEMAIL = 'VALUE_001' where VC_CODE = 'CODE_001';

-- statementId: getDiffrenceInEmploye.select
-- lookupStatementId: getDiffrenceInEmploye.select
-- source: org_sqlmap.xml
-- type: select
-- params: {}
select t1.code from (select code as code from VM_EMPLOYEEFORM where stafftype ='内部员工' and deleteflag='0' MINUS select VC_CODE as code from spsm_employeeinfo_temp)t1;

-- statementId: logicDelEmploye.update
-- lookupStatementId: logicDelEmploye.update
-- source: org_sqlmap.xml
-- type: update
-- params: {
--   "code": "CODE_001"
-- }
update VM_EMPLOYEEFORM set deleteflag='1' where code='CODE_001';

-- statementId: employeChange.insert
-- lookupStatementId: employeChange.insert
-- source: org_sqlmap.xml
-- type: insert
-- params: {
--   "account": 1,
--   "name": "NAME_001",
--   "staffStatus": 1,
--   "companyCode": "CODE_001",
--   "deptName": "NAME_001",
--   "deptCode": "CODE_001",
--   "mobile": "VALUE_001",
--   "certNo": "VALUE_001",
--   "certType": "VALUE_001",
--   "workPlace": "VALUE_001",
--   "partTimeJob": "2026-05-14 10:00:00",
--   "mainJob": "VALUE_001",
--   "joinDate": "2026-05-14",
--   "leaveDate": "2026-05-14",
--   "editDate": "2026-05-14",
--   "changeSource": "VALUE_001",
--   "changeInfo": "VALUE_001",
--   "job": "VALUE_001",
--   "pushStatus": 1,
--   "operationType": "VALUE_001",
--   "sex": "VALUE_001",
--   "code": "CODE_001",
--   "companyName": "NAME_001",
--   "jobGrade": "VALUE_001",
--   "workEmail": "VALUE_001",
--   "workPhone": "VALUE_001",
--   "staffType": "VALUE_001",
--   "confirmStatus": 1
-- }
insert into spsm_employeeinfo_change (N_RECID,VC_ACCOUNT,VC_NAME,vc_staffstatus,vc_COMPANYCODE, vc_deptname,vc_deptcode,vc_mobile,vc_certno,vc_certtype, vc_workplace,VC_PARTTIMEJOB,vc_mainjob, D_joindate,D_leavedate, D_EDITDATE,vc_changesource,VC_CHANGEINFO,vc_job, N_pushstatus,N_OPERATIONTYPE,vc_sex,vc_code,vc_companyname,VC_JOBGRADE, VC_WORKEMAIL,VC_WORKPHONE,vc_stafftype,N_CONFIRMSTATUS) values (SPSM_EMPLOYEEINFO_SEQUENCE.nextval,1,'NAME_001',1,'CODE_001', 'NAME_001','CODE_001','VALUE_001','VALUE_001', 'VALUE_001','VALUE_001','2026-05-14 10:00:00','VALUE_001', to_date('2026-05-14','YYYY-MM-DD'),to_date('2026-05-14','YYYY-MM-DD'), to_date('2026-05-14','YYYY-MM-DD hh24:mi'),'VALUE_001','VALUE_001','VALUE_001', 1,'VALUE_001','VALUE_001','CODE_001','NAME_001','VALUE_001', 'VALUE_001','VALUE_001','VALUE_001',1);

-- statementId: formalEmployee.select
-- lookupStatementId: formalEmployee.select
-- source: org_sqlmap.xml
-- type: select
-- params: {
--   "code": "CODE_001"
-- }
select nvl(t.parttimejob,'') as partTimeJob,nvl(t.account,'') as account,nvl(t.name,'') as name, nvl(t.staffstatus,'') as staffStatus,to_char(t.joindate,'yyyy-mm-dd') as joinDate, to_char(t.leaveDate,'yyyy-mm-dd') as leaveDate,nvl(t.companyname,'') as companyName,nvl(t.companycode,'') as companyCode, nvl(t.deptName,'') as deptName ,nvl(t.deptCode,'') as deptCode, nvl(t.mainJob,'') as mainJob,nvl(t.mobile,'') as mobile,nvl(t.certType,'') as certType, nvl(t.certNo,'') as certNo,nvl(t.workPlace, '') as workPlace, nvl(t.job,'') as job,nvl(t.jobGrade, '') as jobGrade,nvl(t.sex,'') as sex, nvl(t.code,'') as code,nvl(t.workEmail,'') as workEmail,nvl(t.workPhone,'') as workPhone,nvl(t.deleteFlag,'') as deleteFlag, nvl(t.staffType,'') as staffType from VM_EMPLOYEEFORM t where t.code = 'CODE_001';

-- statementId: formalEmployee.insert
-- lookupStatementId: formalEmployee.insert
-- source: org_sqlmap.xml
-- type: insert
-- params: {
--   "id": 1001,
--   "partTimeJob": "2026-05-14 10:00:00",
--   "account": 1,
--   "name": "NAME_001",
--   "staffStatus": 1,
--   "joinDate": "2026-05-14",
--   "leaveDate": "2026-05-14",
--   "companyName": "NAME_001",
--   "companyCode": "CODE_001",
--   "deptName": "NAME_001",
--   "deptCode": "CODE_001",
--   "mainJob": "VALUE_001",
--   "mobile": "VALUE_001",
--   "certType": "VALUE_001",
--   "certNo": "VALUE_001",
--   "workPlace": "VALUE_001",
--   "job": "VALUE_001",
--   "staffType": "VALUE_001",
--   "jobGrade": "VALUE_001",
--   "code": "CODE_001",
--   "sex": "VALUE_001",
--   "workPhone": "VALUE_001",
--   "workEmail": "VALUE_001"
-- }
insert into VM_EMPLOYEEFORM (ID, parttimejob,account,name,staffstatus,joindate,leavedate,companyname,companycode, deptname,deptcode,mainjob,mobile,certtype,certno,workplace, job,stafftype,jobgrade,deleteflag,code,sex,workPhone,workEmail) values(1001 , '2026-05-14 10:00:00',1,'NAME_001',1,to_date('2026-05-14','yyyy-mm-dd'),to_date('2026-05-14','yyyy-mm-dd'),'NAME_001','CODE_001', 'NAME_001','CODE_001','VALUE_001','VALUE_001','VALUE_001','VALUE_001','VALUE_001', 'VALUE_001','VALUE_001','VALUE_001',0,'CODE_001','VALUE_001','VALUE_001','VALUE_001' );

-- statementId: formalEmployee.update
-- lookupStatementId: formalEmployee.update
-- source: org_sqlmap.xml
-- type: update
-- params: {
--   "partTimeJob": "2026-05-14 10:00:00",
--   "name": "NAME_001",
--   "staffStatus": 1,
--   "joinDate": "2026-05-14",
--   "leaveDate": "2026-05-14",
--   "companyName": "NAME_001",
--   "companyCode": "CODE_001",
--   "deptName": "NAME_001",
--   "deptCode": "CODE_001",
--   "mainJob": "VALUE_001",
--   "certType": "VALUE_001",
--   "certNo": "VALUE_001",
--   "mobile": "VALUE_001",
--   "workPlace": "VALUE_001",
--   "job": "VALUE_001",
--   "jobGrade": "VALUE_001",
--   "account": 1,
--   "staffType": "VALUE_001",
--   "sex": "VALUE_001",
--   "workPhone": "VALUE_001",
--   "workEmail": "VALUE_001",
--   "code": "CODE_001"
-- }
update VM_EMPLOYEEFORM set parttimejob = '2026-05-14 10:00:00',name='NAME_001',staffstatus=1,joindate=to_date('2026-05-14','yyyy-mm-dd'), leavedate = to_date('2026-05-14','yyyy-mm-dd'),companyname = 'NAME_001',companycode = 'CODE_001', deptname = 'NAME_001',deptcode = 'CODE_001',mainjob = 'VALUE_001', certtype = 'VALUE_001',certno = 'VALUE_001',mobile = 'VALUE_001', workplace = 'VALUE_001',job = 'VALUE_001',jobgrade = 'VALUE_001',account = 1, staffType = 'VALUE_001',sex='VALUE_001', workphone = 'VALUE_001',workemail = 'VALUE_001' where code = 'CODE_001';

-- statementId: findEmployeeByCode
-- lookupStatementId: findEmployeeByCode
-- source: org_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select count(*) from VM_EMPLOYEEFORM where code = 'VALUE_001';

-- statementId: logicDel.update
-- lookupStatementId: logicDel.update
-- source: org_sqlmap.xml
-- type: update
-- params: {
--   "code": "CODE_001"
-- }
update VM_EMPLOYEEFORM set deleteflag = 1 where code = 'CODE_001';

-- statementId: showChangeRecord.select
-- lookupStatementId: showChangeRecord.select
-- source: org_sqlmap.xml
-- type: select
-- params: {
--   "code": "CODE_001",
--   "source": "VALUE_001",
--   "name": "NAME_001",
--   "startDate": "2026-05-14",
--   "endDate": "2026-05-14",
--   "org": "VALUE_001",
--   "pushStatus": 1,
--   "recId": 1001
-- }
select VC_CHANGESOURCE as source,to_char(D_EDITDATE,'YYYY-MM-DD HH24:MI') as editDate,VC_NAME as name, VC_DEPTNAME as deptName,VC_COMPANYNAME as companyName,VC_MAINJOB as mainjob,VC_PARTTIMEJOB as partTimeJob, VC_CHANGEInfo as changeInfo,VC_WORKPLACE as workPlace, case when N_PUSHSTATUS=0 then '未推送' when N_PUSHSTATUS=1 then '已推送' end as push, case when N_OPERATIONTYPE=0 then '删除' when N_OPERATIONTYPE=1 then '更新' when N_OPERATIONTYPE=2 then '新增' end as operation, VC_ACCOUNT as account,to_char(D_JOINDATE,'YYYY-MM-DD') as joinDate,to_char(D_LEAVEDATE,'YYYY-MM-DD') as leaveDate, VC_COMPANYCODE as companyCode,VC_DEPTCODE as deptCode,VC_MOBILE as mobile, VC_CERTNO as certNo,VC_CERTTYPE as certType,VC_job as job, vc_sex as sex, vc_stafftype as staffType, VC_CODE as code,vc_staffstatus as staffStatus, VC_JOBGRADE as jobGrade,VC_WORKEMAIL as workEmail,VC_WORKPHONE as workPhone, case when N_CONFIRMSTATUS=0 then '未确认' when N_CONFIRMSTATUS=1 then '已确认' when N_CONFIRMSTATUS=2 THEN '被打回' end as confirm,N_RECID as recId from spsm_employeeinfo_change where 1=1 AND VC_CODE = 'CODE_001' AND VC_CHANGESOURCE like '%'||'VALUE_001'||'%' AND VC_NAME like '%'||'NAME_001'||'%' AND D_EDITDATE >=to_date('2026-05-14','yyyy-mm-dd') AND D_EDITDATE <=to_date('2026-05-14','yyyy-mm-dd HH24:mi') AND VC_DEPTNAME like '%'||'VALUE_001'||'%' AND N_PUSHSTATUS = 1 AND N_RECID = 1001 order by D_EDITDATE desc;

-- statementId: showChangeRecord.select.count
-- lookupStatementId: showChangeRecord.select.count
-- source: org_sqlmap.xml
-- type: select
-- params: {
--   "code": "CODE_001",
--   "source": "VALUE_001",
--   "name": "NAME_001",
--   "startDate": "2026-05-14",
--   "endDate": "2026-05-14",
--   "org": "VALUE_001",
--   "pushStatus": 1,
--   "recId": 1001
-- }
select count(*) from spsm_employeeinfo_change where 1=1 AND VC_CODE = 'CODE_001' AND VC_CHANGESOURCE like '%'||'VALUE_001'||'%' AND VC_NAME like '%'||'NAME_001'||'%' AND D_EDITDATE >=to_date('2026-05-14','yyyy-mm-dd') AND D_EDITDATE <=to_date('2026-05-14','yyyy-mm-dd HH24:mi') AND VC_DEPTNAME like '%'||'VALUE_001'||'%' AND N_PUSHSTATUS = 1 AND N_RECID = 1001;

-- statementId: publishMemberChangeRecord.select
-- lookupStatementId: publishMemberChangeRecord.select
-- source: org_sqlmap.xml
-- type: select
-- params: {
--   "push": "VALUE_001",
--   "confirm": "VALUE_001",
--   "recId": [
--     "EVENT_A",
--     "EVENT_B"
--   ]
-- }
select VC_ACCOUNT as kmAccount,to_char(D_JOINDATE,'YYYY-MM-DD') as joinDate, to_char(D_LEAVEDATE,'YYYY-MM-DD') as leaveDate,VC_COMPANYCODE as companyCode, VC_DEPTCODE as depKMCode,VC_MAINJOB as mainJob,VC_PARTTIMEJOB as partTimeJob, VC_MOBILE as mobile,VC_CERTNO as certNo, VC_WORKPLACE as workPlace,to_char(D_EDITDATE,'YYYY-MM-DD') as editDate,VC_DEPTNAME as department,VC_NAME as name, vc_staffstatus as empStatus,VC_CERTTYPE as certType,VC_CHANGESOURCE as changeSource, VC_CHANGEINFO as changeInfo,VC_job as job,vc_sex as sex,N_OPERATIONTYPE as operationType, VC_COMPANYNAME as company,vc_stafftype as staffType,VC_CODE as code,VC_JOBGRADE as jobGrade, VC_WORKEMAIL as workEmail,VC_WORKPHONE as workPhone,N_CONFIRMSTATUS as confirmStatus,N_PUSHSTATUS as pushStatus, N_RECID as recId from spsm_employeeinfo_change where 1=1 AND N_PUSHSTATUS = 'VALUE_001' AND N_CONFIRMSTATUS = 'VALUE_001' AND N_RECID IN ('EVENT_A','EVENT_B');

-- statementId: publishMemberChangeRecord.update
-- lookupStatementId: publishMemberChangeRecord.update
-- source: org_sqlmap.xml
-- type: update
-- params: {
--   "recId": 1001
-- }
update spsm_employeeinfo_change set N_PUSHSTATUS = 1 where N_RECID = 1001;

-- statementId: publishOrgChangeRecord.select
-- lookupStatementId: publishOrgChangeRecord.select
-- source: org_sqlmap.xml
-- type: select
-- params: {
--   "push": "VALUE_001",
--   "confirm": "VALUE_001",
--   "recId": [
--     "EVENT_A",
--     "EVENT_B"
--   ]
-- }
select N_RECID as recId,VC_COMPANYCODE as companyCode,VC_DEPCODE as depCode,VC_DEPARTMENT as department, VC_SUPERIORDEPCODE as superiordDepCode, VC_SUPERIORDEPARTMENT as superiordDepartment,VC_MANAGERCODE as managerCode, to_char(D_CREATEDATE,'YYYY-MM-DD') as createDate,VC_managerNAME as managerName,VC_CHANGESOURCE as changeSource,VC_CHANGERECORD as changeRecord, N_OPERATIONTYPE as operationType,N_PUSHSTATUS as pushStatus,VC_COMPANY as company, N_CONFIRMSTATUS as confirmStatus , to_char(D_EDITEDATE,'YYYY-MM-DD HH24:mi') as editDate from spsm_organizations_change where 1=1 AND N_PUSHSTATUS = 'VALUE_001' AND N_CONFIRMSTATUS = 'VALUE_001' AND N_RECID IN ('EVENT_A','EVENT_B');

-- statementId: publisOrgChangeRecord.update
-- lookupStatementId: publisOrgChangeRecord.update
-- source: org_sqlmap.xml
-- type: update
-- params: {
--   "recId": 1001
-- }
update spsm_organizations_change set N_PUSHSTATUS = 1 where N_RECID = 1001;

-- statementId: organRegister.delete
-- lookupStatementId: organRegister.delete
-- source: org_sqlmap.xml
-- type: delete
-- params: {}
delete from spsm_organizations_temp;

-- statementId: tempOrgan.count
-- lookupStatementId: tempOrgan.count
-- source: org_sqlmap.xml
-- type: select
-- params: {}
select count(*) from spsm_organizations_temp;

-- statementId: organRegister.select
-- lookupStatementId: organRegister.select
-- source: org_sqlmap.xml
-- type: select
-- params: {}
select VC_DEPCODE, VC_DEPARTMENT, VC_SUPERIORDEPCODE, VC_SUPERIORDEPARTMENT, VC_MANAGERCODE, to_char(D_CREATEDATE,'yyyy-MM-dd') as D_CREATEDATE, VC_MANAGERNAME, VC_COMPANY, VC_COMPANYCODE from spsm_organizations_temp;

-- statementId: organRegisterById.select
-- lookupStatementId: organRegisterById.select
-- source: org_sqlmap.xml
-- type: select
-- params: {
--   "depCode": "CODE_001"
-- }
select VC_DEPCODE, VC_DEPARTMENT, VC_SUPERIORDEPCODE, VC_SUPERIORDEPARTMENT, VC_MANAGERCODE, to_char(D_CREATEDATE,'yyyy-MM-dd') as D_CREATEDATE, VC_MANAGERNAME, VC_COMPANY from spsm_organizations_temp where VC_DEPCODE = 'CODE_001';

-- statementId: deleteOrganById.delete
-- lookupStatementId: deleteOrganById.delete
-- source: org_sqlmap.xml
-- type: delete
-- params: {
--   "depCode": "CODE_001"
-- }
delete spsm_organizations_temp where VC_DEPCODE = 'CODE_001';

-- statementId: organRegister.insert
-- lookupStatementId: organRegister.insert
-- source: org_sqlmap.xml
-- type: insert
-- params: {
--   "DEPCODE": "CODE_001",
--   "DEPARTMENT": "VALUE_001",
--   "SUPERIORDEPCODE": "CODE_001",
--   "SUPERIORDEPARTMENT": "VALUE_001",
--   "MANAGERACCOUNT": 1,
--   "CREATEDATE": "2026-05-14",
--   "MANAGERNAME": "NAME_001",
--   "COMPANY": "VALUE_001",
--   "COMPANYCODE": "CODE_001"
-- }
insert into spsm_organizations_temp( VC_DEPCODE, VC_DEPARTMENT, VC_SUPERIORDEPCODE, VC_SUPERIORDEPARTMENT, VC_MANAGERCODE, D_CREATEDATE, VC_MANAGERNAME, VC_COMPANY, VC_COMPANYCODE ) values ('CODE_001','VALUE_001','CODE_001','VALUE_001',1, '2026-05-14','NAME_001','VALUE_001','CODE_001');

-- statementId: findCodeList.select
-- lookupStatementId: findCodeList.select
-- source: org_sqlmap.xml
-- type: select
-- params: {}
select deptcode from(select deptcode from VM_ORGANIZATIONFORM minus select vc_depcode as deptcode from spsm_organizations_temp);

-- statementId: formalLogicalDel.update
-- lookupStatementId: formalLogicalDel.update
-- source: org_sqlmap.xml
-- type: update
-- params: {
--   "FIELD0004": "VALUE_001"
-- }
update VM_ORGANIZATIONFORM set deptstatus = '1' where deptcode='VALUE_001';

-- statementId: organ.insert
-- lookupStatementId: organ.insert
-- source: org_sqlmap.xml
-- type: insert
-- params: {
--   "ID": 1001,
--   "COMPANY": "VALUE_001",
--   "COMPANYCODE": "CODE_001",
--   "CREATEDATE": "2026-05-14",
--   "DEPARTMENT": "VALUE_001",
--   "DEPCODE": "CODE_001",
--   "SUPERIORDEPARTMENT": "VALUE_001",
--   "SUPERIORDEPCODE": "CODE_001",
--   "MANAGERNAME": "NAME_001",
--   "MANAGERACCOUNT": 1,
--   "STATUS": 1
-- }
insert into VM_ORGANIZATIONFORM( id, companyname, companycode, createdate, deptname, deptcode, superiordeptname, superiordeptcode, managername, managercode, deptstatus) values (1001,'VALUE_001','CODE_001',to_char('2026-05-14','yyyy-mm-dd'),'VALUE_001','CODE_001','VALUE_001', 'CODE_001','NAME_001',1,1 );

-- statementId: findOrgtanInfoByCode.select
-- lookupStatementId: findOrgtanInfoByCode.select
-- source: org_sqlmap.xml
-- type: select
-- params: {
--   "depcode": "CODE_001"
-- }
select companyCode as vc_companycode, companyname as vc_company, deptcode as VC_DEPCODE, deptname as VC_DEPARTMENT, superiordeptcode as VC_SUPERIORDEPCODE, superiordeptname as VC_SUPERIORDEPARTMENT, managercode as VC_MANAGERCODE, managername as VC_MANAGERNAME, createdate as D_CREATEDATE FROM VM_ORGANIZATIONFORM WHERE deptcode = 'CODE_001';

-- statementId: organChange.insert
-- lookupStatementId: organChange.insert
-- source: org_sqlmap.xml
-- type: insert
-- params: {
--   "RECID": 1001,
--   "COMPANYCODE": "CODE_001",
--   "DEPCODE": "CODE_001",
--   "DEPARTMENT": "VALUE_001",
--   "SUPERIORDEPCODE": "CODE_001",
--   "SUPERIORDEPARTMENT": "VALUE_001",
--   "MANAGERACCOUNT": 1,
--   "CREATEDATE": "2026-05-14",
--   "MANAGERNAME": "NAME_001",
--   "CHANGERESOURCE": "VALUE_001",
--   "CHANGERECORD": "VALUE_001",
--   "OPERATIONTYPE": "VALUE_001",
--   "COMPANY": "VALUE_001",
--   "EDITEDATE": "2026-05-14"
-- }
insert into spsm_organizations_change( N_RECID, VC_COMPANYCODE, VC_DEPCODE, VC_DEPARTMENT, VC_SUPERIORDEPCODE, VC_SUPERIORDEPARTMENT, VC_MANAGERCODE, D_CREATEDATE, VC_MANAGERNAME, VC_CHANGESOURCE, VC_CHANGERECORD, N_OPERATIONTYPE, N_PUSHSTATUS, VC_COMPANY, N_CONFIRMSTATUS, D_EDITEDATE) values(1001,'CODE_001','CODE_001','VALUE_001','CODE_001','VALUE_001',1, '2026-05-14','NAME_001','VALUE_001','VALUE_001','VALUE_001',0,'VALUE_001',0,to_date('2026-05-14','yyyy-MM-dd HH24:mi'));

-- statementId: organ.update
-- lookupStatementId: organ.update
-- source: org_sqlmap.xml
-- type: update
-- params: {
--   "COMPANYCODE": "CODE_001",
--   "MANAGERACCOUNT": 1,
--   "MANAGERNAME": "NAME_001",
--   "COMPANY": "VALUE_001",
--   "DEPARTMENT": "VALUE_001",
--   "SUPERIORDEPCODE": "CODE_001",
--   "SUPERIORDEPARTMENT": "VALUE_001",
--   "CREATEDATE": "2026-05-14",
--   "STATUS": 1,
--   "CODE": "CODE_001"
-- }
update VM_ORGANIZATIONFORM set , companycode = 'CODE_001' , managercode = 1 , managername = 'NAME_001' , companyname = 'VALUE_001' , deptname = 'VALUE_001' , superiordeptcode = 'CODE_001' , superiordeptname = 'VALUE_001' , createdate = '2026-05-14' , deptstatus = 1 where deptcode = 'CODE_001';

-- statementId: queryForOrganizationsChange.select
-- lookupStatementId: queryForOrganizationsChange.select
-- source: org_sqlmap.xml
-- type: select
-- params: {
--   "changeStartDate": "2026-05-14",
--   "changeEndDate": "2026-05-14",
--   "changeSource": "VALUE_001",
--   "managerName": "NAME_001",
--   "department": "VALUE_001",
--   "depCode": "CODE_001",
--   "pushStatus": 1,
--   "recId": 1001
-- }
select N_RECID as recId, VC_COMPANYCODE as companyCode, VC_DEPCODE as depCode, VC_DEPARTMENT as departMent, VC_SUPERIORDEPCODE as superiorDepCode, VC_SUPERIORDEPARTMENT as superiorDepartment , VC_MANAGERCODE as managerCode , D_CREATEDATE as createDate , VC_MANAGERNAME as managerName, VC_CHANGESOURCE as changeSource, VC_CHANGERECORD as changeRecord, case when N_OPERATIONTYPE=0 then '删除' when N_OPERATIONTYPE=1 then '更新' when N_OPERATIONTYPE=2 then '新增' end as operation, case when N_PUSHSTATUS=0 then '未推送' when N_PUSHSTATUS=1 then '已推送' end as push, VC_COMPANY as company, case when N_CONFIRMSTATUS=0 then '未确认' when N_CONFIRMSTATUS=1 then '已确认' when N_CONFIRMSTATUS=2 THEN '被打回' end as confirm, to_char(D_EDITEDATE,'yyyy-MM-dd HH24:mi') as EDITEDATE from spsm_organizations_change where 1=1 AND D_EDITEDATE >= to_date('2026-05-14','YYYY-MM-DD HH24:mi') AND D_EDITEDATE<= to_date('2026-05-14','YYYY-MM-DD HH24:mi') AND vc_changesource = 'VALUE_001' AND vc_managername like '%'||'NAME_001'||'%' AND VC_DEPARTMENT like '%'||'VALUE_001'||'%' AND VC_DEPCODE like '%'||'CODE_001'||'%' AND N_PUSHSTATUS = 1 AND N_recid = 1001 order by D_EDITEDATE desc;

-- statementId: queryForOrganizationsChange.select.count
-- lookupStatementId: queryForOrganizationsChange.select.count
-- source: org_sqlmap.xml
-- type: select
-- params: {
--   "changeStartDate": "2026-05-14",
--   "changeEndDate": "2026-05-14",
--   "changeSource": "VALUE_001",
--   "managerName": "NAME_001",
--   "department": "VALUE_001",
--   "depCode": "CODE_001",
--   "pushStatus": 1,
--   "recId": 1001
-- }
select count(*) from spsm_organizations_change where 1=1 AND D_EDITEDATE >= to_date('2026-05-14','YYYY-MM-DD HH24:mi') AND D_EDITEDATE<= to_date('2026-05-14','YYYY-MM-DD HH24:mi') AND vc_changesource = 'VALUE_001' AND vc_managername like '%'||'NAME_001'||'%' AND VC_DEPARTMENT like '%'||'VALUE_001'||'%' AND VC_DEPCODE like '%'||'CODE_001'||'%' AND N_PUSHSTATUS = 1 AND N_recid = 1001;

-- statementId: selectOrgByName.select
-- lookupStatementId: selectOrgByName.select
-- source: org_sqlmap.xml
-- type: select
-- params: {
--   "deptName": "NAME_001"
-- }
select distinct t.deptname as deptName,t.deptcode as deptCode from VM_ORGANIZATIONFORM t where t.deptname like '%'||'NAME_001'||'%';

-- statementId: selectmanagerByName.select
-- lookupStatementId: selectmanagerByName.select
-- source: org_sqlmap.xml
-- type: select
-- params: {
--   "managerName": "NAME_001"
-- }
select t.name as managerName,t.code as managerAcount from VM_EMPLOYEEFORM t where t.name like '%'||'NAME_001'||'%';

-- statementId: selectOrg.select
-- lookupStatementId: selectOrg.select
-- source: org_sqlmap.xml
-- type: select
-- params: {
--   "deptName": "NAME_001"
-- }
select t.deptName as deptName,t.deptCode as deptCode from vm_organizationform t where t.deptName like '%'||'NAME_001'||'%';

-- statementId: selectMemberCode.select
-- lookupStatementId: selectMemberCode.select
-- source: org_sqlmap.xml
-- type: select
-- params: {}
SELECT SPSM_EMPLOYEEINFO_CODE_SIGN.nextval as memberCode from dual;

-- statementId: selectDepartmentCode.select
-- lookupStatementId: selectDepartmentCode.select
-- source: org_sqlmap.xml
-- type: select
-- params: {}
SELECT SPSM_ORGANIZATIONS_CODE_SIGN.nextval as deptCode from dual;

-- statementId: getRepetDepByName.select
-- lookupStatementId: getRepetDepByName.select
-- source: org_sqlmap.xml
-- type: select
-- params: {
--   "deptname": "NAME_001"
-- }
select deptname from VM_ORGANIZATIONFORM where deptname = 'NAME_001';

-- statementId: getAllComapny.select
-- lookupStatementId: getAllComapny.select
-- source: org_sqlmap.xml
-- type: select
-- params: {}
select companyname from vm_companyform;

-- statementId: getCompanyCode.select
-- lookupStatementId: getCompanyCode.select
-- source: org_sqlmap.xml
-- type: select
-- params: {
--   "companyname": "NAME_001"
-- }
select companycode from vm_companyform where companyname = 'NAME_001';

-- statementId: getPushOrgCount.select
-- lookupStatementId: getPushOrgCount.select
-- source: org_sqlmap.xml
-- type: select
-- params: {
--   "push": "VALUE_001",
--   "confirm": "VALUE_001"
-- }
select count(*) as count from spsm_organizations_change where 1=1 AND N_PUSHSTATUS = 'VALUE_001' AND N_CONFIRMSTATUS = 'VALUE_001';

-- statementId: getPushMemCount.select
-- lookupStatementId: getPushMemCount.select
-- source: org_sqlmap.xml
-- type: select
-- params: {
--   "push": "VALUE_001",
--   "confirm": "VALUE_001"
-- }
select count(*) as count from spsm_employeeinfo_change where 1=1 AND N_PUSHSTATUS = 'VALUE_001' AND N_CONFIRMSTATUS = 'VALUE_001';

-- statementId: getEmpOfficNoAndEmailByCode.select
-- lookupStatementId: getEmpOfficNoAndEmailByCode.select
-- source: org_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select o.ext_attr_1 as telePhone, o.ext_attr_2 as workEmail,o.ext_attr_3 as workPhone from org_member o where o.code = 'VALUE_001';

-- statementId: selectVmUpdateMobileKmByUserId.select
-- lookupStatementId: selectVmUpdateMobileKmByUserId.select
-- source: org_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id, userId from vm_updatePhone_km where userId = 'VALUE_001';

-- statementId: selectVmUpdateMobileKm.select
-- lookupStatementId: selectVmUpdateMobileKm.select
-- source: org_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id , userId , loginName , pushTime , pushStatus , mobile , systemName from vm_updatePhone_km where pushStatus = 'N' and systemName = 'VALUE_001' order by pushTime;

-- statementId: updateVmUpdateMobileKm.update
-- lookupStatementId: updateVmUpdateMobileKm.update
-- source: org_sqlmap.xml
-- type: update
-- params: {
--   "pushStatus": 1,
--   "id": 1001
-- }
update vm_updatePhone_km set pushStatus = 1 where id = 1001;

-- statementId: insertVmUpdateMobileKm.insert
-- lookupStatementId: insertVmUpdateMobileKm.insert
-- source: org_sqlmap.xml
-- type: insert
-- params: {
--   "id": 1001,
--   "userId": 1001,
--   "loginName": "NAME_001",
--   "pushTime": "2026-05-14 10:00:00",
--   "pushStatus": 1,
--   "mobile": "VALUE_001",
--   "systemName": "NAME_001"
-- }
insert into vm_updatePhone_km (id, state, start_member_id, start_date, approve_member_id, approve_date, finishedflag, ratifyflag, ratify_member_id, ratify_date, sort, modify_member_id, modify_date, userId, loginName, pushTime, pushStatus, mobile, systemName ) values (1001, 1, -6760911671874597139, sysdate, 0, sysdate, 0, 0, 0, null, 0, -6760911671874597139, sysdate, 1001, 'NAME_001', to_date('2026-05-14 10:00:00', 'yyyy-mm-dd'), 1, 'VALUE_001', 'NAME_001' );

-- statementId: businessTeamById.delete
-- lookupStatementId: businessTeamById.delete
-- source: org_sqlmap.xml
-- type: delete
-- params: "VALUE_001"
delete from vm_deptbusigroup v where v.businessmember in (select column_value from table(util_common.split((select w.businessmember from vm_wfdeptbusigroup w where id = 'VALUE_001'),',') ), vm_wfdeptbusigroup t2 where t2.id = 'VALUE_001') and v.businesstype = (select t.businesstype from vm_wfdeptbusigroup t where t.id = 'VALUE_001');

-- statementId: businessTeamById.update
-- lookupStatementId: businessTeamById.update
-- source: org_sqlmap.xml
-- type: update
-- params: "VALUE_001"
merge into vm_deptbusigroup a using (select t2.id, t1.column_value businessmember, t2.senduser, t2.senddepart, t2.businessType, t2.businessname, t2.adjustmentType, t2.teamleader, t2.note, t2.bussinessdepartcode from table(util_common.split((select f.businessmember from vm_wfdeptbusigroup f where f.id = 'VALUE_001'),',')) t1, vm_wfdeptbusigroup t2 where t2.id = 'VALUE_001') b on (b.businessmember = a.businessmember and a.businesstype = b.businessType) when matched then update set a.bussinessleader = b.teamleader, a.businessname = b.businessname, a.note = b.note, a.bussinessdepartcode = b.bussinessdepartcode when not matched then insert values (util_common.getAbsID, 1, -6760911671874597139, sysdate, 0, sysdate, 0, 0, 0, null, 0, -6760911671874597139, sysdate, trunc(sysdate), b.businessType, b.businessmember, b.senddepart, b.businessname, b.teamleader, b.note, b.bussinessdepartcode);

-- statementId: bussinessTeam.select
-- lookupStatementId: bussinessTeam.select
-- source: org_sqlmap.xml
-- type: select
-- params: {
--   "businessType": "VALUE_001",
--   "memberKMIDs": "RAW_VALUE",
--   "leaderKMIDs": "RAW_VALUE",
--   "deptKMIDs": "RAW_VALUE"
-- }
select id,businessType,memberKMID, memberName,deptKMID,deptName,leaderKMID,leaderName,businessGroupCode, businessGroupName from vm_interface_wfdeptbusigroup where 1=1 AND businessType = 'VALUE_001' AND memberKMID in(RAW_VALUE) AND leaderKMID in(RAW_VALUE) AND deptKMID in(RAW_VALUE);

-- statementId: bussinessCtpContent.insert
-- lookupStatementId: bussinessCtpContent.insert
-- source: org_sqlmap.xml
-- type: insert
-- params: {}
merge into ctp_content_all a using (select id from vm_deptbusigroup c where c.id not in (select module_id from ctp_content_all)) c on (1=0) when not matched then insert (ID, CREATE_ID, CREATE_DATE, MODIFY_ID, MODIFY_DATE, MODULE_TYPE, MODULE_ID, MODULE_TEMPLATE_ID, CONTENT_TYPE, CONTENT, CONTENT_DATA_ID, CONTENT_TEMPLATE_ID, TITLE, SORT) values(util_common.getAbsID, '-6760911671874597139', sysdate, '', null, '37', c.id, '-109711906195223375', '20', '', c.id, '-5566001276150398038', '部门内业务审批分组', '0');

-- statementId: searchCodeOrIDByName.select
-- lookupStatementId: searchCodeOrIDByName.select
-- source: org_sqlmap.xml
-- type: select
-- params: {
--   "name": "NAME_001",
--   "id": 1001,
--   "checkValues": "RAW_VALUE"
-- }
select type,id,code,name,orgname from ( select '岗位' as type, p.id,p.code,p.name, o.name as orgname from org_post p left join org_unit o on p.org_account_id = o.id and p.status = 1 and o.status=1 union all select '部门'as type, id, code, name,name orgName from org_unit o union all select '职级' as type,l.id,l.code,l.name,o.name orgname from org_level l left join org_unit o on l.org_account_id = o.id and l.status = 1and o.status=1 union all select '角色' as type,r.id, r.code, r.name, o.name as orgname from org_role r left join org_unit o on r.org_account_id = o.id and r.status = 1 and o.status = 1 union all select '小组' as type, t.id, t.code, t.name, o.name orgname from org_team t left join org_unit o on t.org_account_id = o.id and t.status = 1 and o.status = 1 union all select '人员' as type ,m.id, m.code, m.name, o.name orgname from org_member m left join org_unit o on m.org_account_id = o.id and m.status = 1 and o.status = 1) t where 1=1 AND (RAW_VALUE);

-- statementId: searchAuthConfigByKeyName.select
-- lookupStatementId: searchAuthConfigByKeyName.select
-- source: org_sqlmap.xml
-- type: select
-- params: {
--   "paramStr": "RAW_VALUE",
--   "checkValues": "RAW_VALUE"
-- }
select * from ( select name,objectName,tableType,objectType,authcontent from ( select t.name, decode(qname, null, appbindname, qname) as objectName, tableType, decode(qname, null, '应用绑定', '表单查询') as objectType, authcontent from (select f.name as name, extractvalue(xmltype(f.query_info), '/QueryList/Query[SystemCondition="' || f1.id || '"]/@name') qname, extractvalue(xmltype(f.appbind_info), '/Bind/FormBindAuthList/FormBindAuth/AuthList[Colum[@name="formula"]/@value="' || f1.id || '"]/Colum[@name="authName"]/@value') as appbindname, decode(f.form_type, 1, '流程表单', 2, '信息底表') as tableType, to_char(f1.expression) as authcontent from form_definition f left join CTP_FORMULA f1 on f.id = f1.owner_id where f1.id is not null) t ) o where o.objectName is not null union all select fm.name as name, extractvalue(xmltype(fm.query_info), '/QueryList/Query[@id="' || f2.module_id || '"]/@name') as objectName, decode(f2.module_type, 0, '流程表单', '信息底表') as tableType, '应用绑定' as objectType, to_char(f2.org_id) as authcontent from form_definition fm left join form_module_auth f2 on fm.id = f2.form_id union all select t.subject as name, t.subject as objectName, '流程表单' as tableType, '应用绑定' as objectType, to_char(a.auth_id) as authcontent from ctp_template_auth a left join ctp_template t on a.module_id = t.id union all select w.processname as name, w.processname as objectName, '流程表单' as tableType, '流程参与人' as objectType, substr(t.column_value, 0, 4000) as authcontent from wf_process_templete w, table(xmlsequence(extract(xmltype(nvl(w.workflow, '<a></a>')) , '/ps/p/n/a/@f'))) t where t.column_value not like '%空节点%' and t.column_value not like '%f=""%' and t.column_value not like '%WF_SUPER_NODE%' ) t where 1 = 1 AND (RAW_VALUE) AND (RAW_VALUE) order by name,objecttype;

-- statementId: memberCanChangeInfo.select
-- lookupStatementId: memberCanChangeInfo.select
-- source: org_sqlmap.xml
-- type: select
-- params: {}
select c.ref_enumid,showvalue,enumvalue from ctp_enum_item c where c.ref_enumid in (select id from ctp_enum s where s.enumname in('办公地点','证件类型'));

-- statementId: orgMember.update
-- lookupStatementId: orgMember.update
-- source: org_sqlmap.xml
-- type: update
-- params: {
--   "gender": "VALUE_001",
--   "joinDate": "2026-05-14",
--   "userId": 1001
-- }
update org_member set EXT_ATTR_11 = 'VALUE_001', EXT_ATTR_22 = to_date('2026-05-14', 'yyyy-mm-dd') where id = 1001;

-- statementId: addressBookByMemberId.insert
-- lookupStatementId: addressBookByMemberId.insert
-- source: org_sqlmap.xml
-- type: insert
-- params: {}
insert into addressbook ( id, member_id, create_date, update_date ) select util_common.getAbsID, id, sysdate, sysdate from org_member c where c.id not in(select member_id from addressbook where member_id is not null);

-- statementId: addressBook.insert
-- lookupStatementId: addressBook.insert
-- source: org_sqlmap.xml
-- type: insert
-- params: {
--   "userId": 1001,
--   "certType": "VALUE_001",
--   "certNo": "VALUE_001",
--   "workPlace": "VALUE_001",
--   "empStatus": 1,
--   "empType": "VALUE_001",
--   "hrBadge": "VALUE_001",
--   "age": "VALUE_001",
--   "leaveDate": "2026-05-14"
-- }
insert into ADDRESSBOOK ( id, member_id, create_date, update_date, ext_attr_1, ext_attr_2, ext_attr_3, ext_attr_4, ext_attr_5, ext_attr_6, EXT_ATTR_11, ext_attr_21 )values ( util_common.getAbsID, 1001, sysdate, sysdate, 'VALUE_001', 'VALUE_001', 'VALUE_001', 1, 'VALUE_001', 'VALUE_001', 'VALUE_001', to_date('2026-05-14', 'yyyy-mm-dd'));

-- statementId: addressBook.update
-- lookupStatementId: addressBook.update
-- source: org_sqlmap.xml
-- type: update
-- params: {
--   "certType": "VALUE_001",
--   "certNo": "VALUE_001",
--   "workPlace": "VALUE_001",
--   "empStatus": 1,
--   "empType": "VALUE_001",
--   "hrBadge": "VALUE_001",
--   "age": "VALUE_001",
--   "leaveDate": "2026-05-14",
--   "userId": 1001
-- }
update addressBook set update_date = sysdate, ext_attr_1 = 'VALUE_001', ext_attr_2 = 'VALUE_001', ext_attr_3 = 'VALUE_001', ext_attr_4 = 1, ext_attr_5 = 'VALUE_001', ext_attr_6 = 'VALUE_001', EXT_ATTR_11 = 'VALUE_001', ext_attr_21 = to_date('2026-05-14', 'yyyy-mm-dd') where member_id = 1001;

-- statementId: allOrgMemberInfo.select
-- lookupStatementId: allOrgMemberInfo.select
-- source: org_sqlmap.xml
-- type: select
-- params: {}
select to_char(id) as id, to_char(code) as code from org_member where code is not null;

-- statementId: oaMemberResource.select
-- lookupStatementId: oaMemberResource.select
-- source: org_sqlmap.xml
-- type: select
-- params: {
--   "departCode": "CODE_001",
--   "endDate": "2026-05-14",
--   "company": "VALUE_001"
-- }
select ol.code as levelCode, om.code as memberCode, util_common.getEnumValueById(util_common.getEnumIdByShow('-6813491134100848299', ab.ext_attr_1)) as certType, ab.ext_attr_2 as certNo, util_common.getEnumValueById(util_common.getEnumIdByShow('4660073417407942090', ab.ext_attr_3)) as officePlace, util_common.getEnumValueById(util_common.getEnumIdByShow('5543612524301798252', ab.ext_attr_4)) as memberStatus, util_common.getEnumValueById(util_common.getEnumIdByShow('-8502381049250430350', ab.ext_attr_5)) as memberType, ab.ext_attr_6 as hrNo, to_char(ab.EXT_ATTR_11) as age, to_char(ab.ext_attr_21, 'yyyy-mm-dd') as leaveDate, om.ext_attr_1 as phone, '' as type, om.name as memberName, util_user.getLoginNameByMemId(om.id) as memberAccount, om.EXT_ATTR_22 as joinDate, om.EXT_ATTR_11 as sex, util_org.getDeptCodeByDeptId(om.org_account_id) as companyCode, util_org.getDeptNameByDeptId(om.org_account_id) as companyName, util_org.getDeptCodeByDeptId(om.org_department_id) as departCode, util_org.getDeptNameByDeptId(om.org_department_id) as departName, ab.ext_attr_7 posJob, '' highLevel, '' highDegree from org_member om left join addressbook ab on om.id = ab.member_id left join org_level ol on om.org_level_id = ol.id where om.is_admin = 0 and om.is_internal = 1 and om.code is not null AND util_org.getDeptCodeByDeptId(om.org_department_id) = 'CODE_001' AND om.EXT_ATTR_22 <= to_date('2026-05-14', 'yyyy-mm-dd') AND om.org_account_id = decode('VALUE_001', 1, 97839079791739420, 2, -2948740806339441327, '3', -8906103683992302519);

-- statementId: staffInfoResource.select
-- lookupStatementId: staffInfoResource.select
-- source: org_sqlmap.xml
-- type: select
-- params: {
--   "state": 1,
--   "companyCode": "CODE_001",
--   "modifyTime": "2026-05-14 10:00:00",
--   "staffStatus": 1,
--   "loginName": "RAW_VALUE"
-- }
select id, loginName, code, name, realName, mobileNo, officeTel, email, deptCode, deptName, companyName, companyCode, staffStatus, entryDate, exitDate, workPlaceName, workPlaceCode, createTime, modifyTime, state, teamName, teamCode, lineName, lineCode, gender, photoUrl, idCardType, idCardNo, hrCode, posJob from vm_staffInfo_cache where 1=1 AND state = 1 AND companyCode = 'CODE_001' AND modifyTime >= '2026-05-14 10:00:00' AND staffStatus = 1 AND loginName not in (RAW_VALUE) order by modifyTime;

-- statementId: departInfoResource.select
-- lookupStatementId: departInfoResource.select
-- source: org_sqlmap.xml
-- type: select
-- params: {
--   "companyCode": "CODE_001",
--   "modifyTime": "2026-05-14 10:00:00",
--   "isDeleted": "VALUE_001",
--   "isEnable": "VALUE_001"
-- }
select type, unitCode, unitName, parentUnitCode, parentUnitName, managerCode, managerLoginName, managerName, lineLeaderName, lineLeaderCode, lineDirectorName, lineDirectorCode, companyCode, createTime, modifyTime, isDeleted, isEnable from vm_org_unit_cache vouc where 1=1 AND vouc.companyCode = 'CODE_001' AND vouc.modifyTime >= '2026-05-14 10:00:00' AND isDeleted = 'VALUE_001' AND isEnable = 'VALUE_001';

-- statementId: orgMemberBase.select
-- lookupStatementId: orgMemberBase.select
-- source: org_sqlmap.xml
-- type: select
-- params: {}
select to_char(id) id,code,to_char(f.ext_attr_1) telNumber,f.ext_attr_2 emailAddress, f.ext_attr_3 officeNum, to_char(f.ext_attr_11) gender,to_char(f.ext_attr_22, 'yyyy-mm-dd') joinDate,f.is_internal from org_member f where f.code is not null and f.is_admin = 0;

-- statementId: insertStaffNoCacheData.insert
-- lookupStatementId: insertStaffNoCacheData.insert
-- source: org_sqlmap.xml
-- type: insert
-- params: {
--   "loginName": "RAW_VALUE"
-- }
insert into vm_staffInfo_cache ( id, vm_state, start_member_id, start_date, approve_member_id, approve_date, finishedflag, ratifyflag, ratify_member_id, ratify_date, loginName, code, name, realName, mobileNo, officeTel, email, deptCode, deptName, companyName, companyCode, staffStatus, entryDate, exitDate, workPlaceName, workPlaceCode, createTime, modifyTime, oamodifyTime, state, linecode, linename, gender, photoUrl, idCardType, idCardNo, hrCode, posJob ) select id, 1, -6760911671874597139, sysdate, 0, null, 0, 0, null, null, loginName, code, name, realName, mobileNo, officeTel, email, deptCode, deptName, companyName, companyCode, staffStatus, entryDate, exitDate, workPlaceName, workPlaceCode, createTime, modifyTime, modifyTime, state, util_org.getLineCodeByDeptId(departId), util_org.getLineNameByDeptId(departId), gender, photoUrl, idCardType, idCardNo, "hrCode", posJob from (select f1.departId, f2.id, nvl(util_user.getLoginNameByMemId(f2.id), substr(f2.ext_attr_2,1,instr(f2.ext_attr_2, '@')-1)) loginName, f2.code code, util_user.getMemberNameByMemId(f2.id) name, nvl(f1.chnname, util_user.getMemberNameByMemId(f2.id)) realName, f2.ext_attr_1 mobileNo, f2.ext_attr_3 officeTel, f2.ext_attr_2 email, util_org.getDeptCodeByDeptId(f2.org_department_id) deptCode, util_org.getDeptNameByDeptId(f2.org_department_id) deptName, util_org.getDeptNameByDeptId(f2.org_account_id) companyName, util_org.getDeptCodeByDeptId(f2.org_account_id) companyCode, decode(f3.ext_attr_4, null,decode(f2.state, '1','1','2'), decode (f3.ext_attr_4, '在职','1','2')) staffStatus, to_char(f2.ext_attr_22, 'yyyy-mm-dd') entryDate, to_char(f3.ext_attr_21, 'yyyy-mm-dd') exitDate, f3.ext_attr_3 workPlaceName, util_common.getEnumValueById(util_common.getEnumIdByShow('4660073417407942090', f3.ext_attr_3)) workPlaceCode, to_char(f2.create_time, 'yyyy-mm-dd hh24:mi:ss') createTime, (case when f2.update_time is null and f3.update_date is not null then to_char(f3.update_date,'yyyy-mm-dd hh24:mi:ss') when f2.update_time is not null and f3.update_date is null then to_char(f2.update_time, 'yyyy-mm-dd hh24:mi:ss') when f2.update_time is null and f3.update_date is null then to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') when f2.update_time > f3.update_date then to_char(f2.update_time, 'yyyy-mm-dd hh24:mi:ss') else to_char(f3.update_date,'yyyy-mm-dd hh24:mi:ss') end) modifyTime, decode(f2.state, '1','1','2') state, f2.ext_attr_11 gender, '' photoUrl, f3.ext_attr_1 idCardType, f3.ext_attr_2 idCardNo, nvl(f3.ext_attr_6, f1.hrCode) "hrCode", f3.ext_attr_7 posJob from org_member f2 left join addressbook f3 on f2.id=f3.member_id left join vm_basememberinfo f1 on f1.memberId = f3.member_id where f2.is_admin=0 and f2.is_internal=1 and f2.type <> 2 and f2.is_virtual=0 and f2.is_deleted=0) f where f.id not in (select id from vm_staffInfo_cache) AND (f.loginName not in (RAW_VALUE) or f.loginName is null);

-- statementId: insertDepartNoCacheData.insert
-- lookupStatementId: insertDepartNoCacheData.insert
-- source: org_sqlmap.xml
-- type: insert
-- params: {}
insert into vm_org_unit_cache ( id, state, start_member_id, start_date, approve_member_id, approve_date, finishedflag, ratifyflag, ratify_member_id, ratify_date, sort, modify_member_id, modify_date, type, unitCode, unitName, parentUnitCode, parentUnitName, managerCode, managerLoginName, managerName, lineLeaderCode, lineLeaderName, lineDirectorCode, lineDirectorName, companyCode, createTime, modifyTime, isDeleted, isEnable ) select id, 1, -6760911671874597139, sysdate, 0, sysdate, 0, 0, 0, null, 0, -6760911671874597139, sysdate, type, unitCode, unitName, parentUnitCode, parentUnitName, managerCode, managerLoginName, managerName, lineLeaderCode, lineLeaderName, lineDirectorCode, lineDirectorName, companyCode, createTime, modifyTime, "isDeleted", "isEnable" from (select f1.id, (case when f1."CODE" like 'Line%' then '2' else '3' end) type, f1."CODE" unitCode, f1."NAME" unitName, f1.parent_code parentUnitCode, f1.parent_name parentUnitName, util_user.getMemCodeByMemId(util_org.getLeaderMemIdByDeptId(f1."ID")) managerCode, util_user.getLoginNameByMemId(util_org.getLeaderMemIdByDeptId(f1.id)) managerLoginName, util_user.getMemberNameByMemId(util_org.getLeaderMemIdByDeptId(f1.id)) managerName, util_user.getMemCodeByMemId(util_org.getLineLeaderMemIdByDeptId(f1."ID")) lineLeaderCode, util_user.getMemberNameByMemId(util_org.getLineLeaderMemIdByDeptId(f1.id)) lineLeaderName, util_user.getMemCodeByMemId(util_org.getLineDirectorMemIdByDeptId(f1."ID")) lineDirectorCode, util_user.getMemberNameByMemId(util_org.getLineDirectorMemIdByDeptId(f1.id)) lineDirectorName, util_org.getAccountCodeByDeptId(f1.id) companyCode, to_char(f1.create_time, 'yyyy-mm-dd HH24:mi:ss') createTime, to_char(f1.update_time, 'yyyy-mm-dd HH24:mi:ss') modifyTime, to_char(f1.IS_DELETED) "isDeleted", to_char(f1.IS_ENABLE) "isEnable" from vm_org_unit_all f1 where f1.parent_id is not null and code is not null and f1.IS_INTERNAL = 1 union all select f.id, '0' type, f.code unitCode, f.name unitName, '' parentUnitCode, '' parentUnitName, '' managerCode, '' managerLoginName, '' managerName, '' lineLeaderCode, '' lineLeaderName, '' lineDirectorCode, '' lineDirectorName, '' companyCode, to_char(f.create_time, 'yyyy-mm-dd HH24:mi:ss') createTime, to_char(f.update_time, 'yyyy-mm-dd HH24:mi:ss') modifyTime, to_char(f.IS_DELETED) "isDeleted", to_char(f.IS_ENABLE) "isEnable" from org_unit f where f.is_group = 1 union all select id, '1' type, code unitCode, name unitName, parent_code parentUnitCode, parent_name parentUnitName, '' managerCode, '' managerLoginName, '' managerName, '' lineLeaderCode, '' lineLeaderName, '' lineDirectorCode, '' lineDirectorName, '' companyCode, to_char(create_time, 'yyyy-mm-dd HH24:mi:ss') createTime, to_char(update_time, 'yyyy-mm-dd HH24:mi:ss') modifyTime, to_char(IS_DELETED) "isDeleted", to_char(IS_ENABLE) "isEnable" from (SELECT u1."ID", u1."NAME", u1."SECOND_NAME", u1."CODE", u1."SHORT_NAME", u1."TYPE", u1."IS_GROUP", u1."PATH", u1."IS_INTERNAL", u1."SORT_ID", u1."IS_ENABLE", u1."IS_DELETED", u1."STATUS", u1."LEVEL_SCOPE", u1."ORG_ACCOUNT_ID", u1."CREATE_TIME", u1."UPDATE_TIME", u2.id as parent_id, u2.name as parent_name, u2.code as parent_code, u2.type as parent_type FROM (select * from org_unit u ) u1 left join (select * from org_unit u ) u2 on (u2.path = substr(u1.path, 1, LENGTH(u1.path) - 4) or u1.path is null) and u1.type = 'Account' and u2.type = 'Account' order by u1.path) t where t.parent_type = 'Account' and t.is_internal = 1 union all select vd.id, '4' type, vd.bussinessdepartcode unitCode, vd.businessname unitName, util_org.getDeptCodeByDeptId(vd.bussinessdepart) parentUnitCode, util_org.getDeptNameByDeptId(vd.bussinessdepart) parentUnitName, util_user.getMemCodeByMemId(vd.bussinessleader) managerCode, util_user.getLoginNameByMemId(vd.bussinessleader) managerLoginName, util_user.getMemberNameByMemId(vd.bussinessleader) managerName, '' lineLeaderCode, '' lineLeaderName, '' lineDirectorCode, '' lineDirectorName, util_org.getAccountCodeByDeptId(vd.bussinessdepart) companyCode, to_char(vd.start_date, 'yyyy-mm-dd HH24:mi:ss') createTime, to_char(vd.modify_date, 'yyyy-mm-dd HH24:mi:ss') modifyTime, '0' "isDeleted", '1' "isEnable" from VM_DEPTBUSIGROUP_definition vd where vd.businesstype = -2012331098492612991) f where f.id not in (select id from vm_org_unit_cache);

-- statementId: staffCacheCTPContent.insert
-- lookupStatementId: staffCacheCTPContent.insert
-- source: org_sqlmap.xml
-- type: insert
-- params: {}
insert into ctp_content_all (ID, CREATE_ID, CREATE_DATE, MODIFY_ID, MODIFY_DATE, MODULE_TYPE, MODULE_ID, MODULE_TEMPLATE_ID, CONTENT_TYPE, CONTENT, CONTENT_DATA_ID, CONTENT_TEMPLATE_ID, TITLE, SORT) select util_common.getAbsID, '-6760911671874597139', sysdate, '-6760911671874597139', sysdate, 37, id, '-3565710345498770709', '20', '', id, '-117082064185637281', '人员信息缓存表', '0' from vm_staffInfo_cache vm where id not in(select content_data_id from ctp_content_all c where c.content_template_id = -117082064185637281 and content_data_id is not null);

-- statementId: departCacheCTPContent.insert
-- lookupStatementId: departCacheCTPContent.insert
-- source: org_sqlmap.xml
-- type: insert
-- params: {}
insert into ctp_content_all (ID, CREATE_ID, CREATE_DATE, MODIFY_ID, MODIFY_DATE, MODULE_TYPE, MODULE_ID, MODULE_TEMPLATE_ID, CONTENT_TYPE, CONTENT, CONTENT_DATA_ID, CONTENT_TEMPLATE_ID, TITLE, SORT) select util_common.getAbsID, '-6760911671874597139', sysdate, '-6760911671874597139', sysdate, 42, id, '-2616892709252546191', '20', '', id, '-4042909002876630545', '组织机构查询', '0' from vm_org_unit_cache vm where id not in(select content_data_id from ctp_content_all c where c.content_template_id = -4042909002876630545 and content_data_id is not null);

-- statementId: insertCtpContentAllInfoByTable.insert
-- lookupStatementId: insertCtpContentAllInfoByTable.insert
-- source: org_sqlmap.xml
-- type: insert
-- params: {
--   "moduleTemplateId": 1001,
--   "contentTemplateId": 1001,
--   "title": "TITLE_001",
--   "tableName": "demo_table"
-- }
insert into ctp_content_all (ID, CREATE_ID, CREATE_DATE, MODIFY_ID, MODIFY_DATE, MODULE_TYPE, MODULE_ID, MODULE_TEMPLATE_ID, CONTENT_TYPE, CONTENT, CONTENT_DATA_ID, CONTENT_TEMPLATE_ID, TITLE, SORT) select util_common.getAbsID, '-6760911671874597139', sysdate, '-6760911671874597139', sysdate, 37, id, 1001, '20', '', id, 1001, 'TITLE_001', '0' from demo_table vm where id not in(select content_data_id from ctp_content_all c where c.content_template_id = 1001 and content_data_id is not null);

-- statementId: findUpdateTimeChange.select
-- lookupStatementId: findUpdateTimeChange.select
-- source: org_sqlmap.xml
-- type: select
-- params: {}
select f.id, f.loginName, f.code, f.name, f.realName, f.mobileNo, f.officeTel, f.email, f.deptCode, f.deptName, f.companyName, f.companyCode, f.staffStatus, f.entryDate, f.exitDate, f.workPlaceName, f.workPlaceCode, f.createTime, f.modifyTime, f.modifyTime as oaModifyTime, f.state, util_org.getLineCodeByDeptId(departId) lineCode, util_org.getLineNameByDeptId(departId) lineName, f.gender, f.photoUrl, f.idCardType, f.idCardNo, f."hrCode", f.posJob from (select f1.departId, f2.id, nvl(util_user.getLoginNameByMemId(f2.id), substr(f2.ext_attr_2,1,instr(f2.ext_attr_2, '@')-1)) loginName, f2.code code, util_user.getMemberNameByMemId(f2.id) name, nvl(f1.chnname, util_user.getMemberNameByMemId(f2.id)) realName, f2.ext_attr_1 mobileNo, f2.ext_attr_3 officeTel, f2.ext_attr_2 email, util_org.getDeptCodeByDeptId(f2.org_department_id) deptCode, util_org.getDeptNameByDeptId(f2.org_department_id) deptName, util_org.getDeptNameByDeptId(f2.org_account_id) companyName, util_org.getDeptCodeByDeptId(f2.org_account_id) companyCode, decode(f3.ext_attr_4, null,decode(f2.state, '1','1','2'), decode (f3.ext_attr_4, '在职','1','2')) staffStatus, to_char(f2.ext_attr_22, 'yyyy-mm-dd') entryDate, to_char(f3.ext_attr_21, 'yyyy-mm-dd') exitDate, f3.ext_attr_3 workPlaceName, util_common.getEnumValueById(util_common.getEnumIdByShow('4660073417407942090', f3.ext_attr_3)) workPlaceCode, to_char(f2.create_time, 'yyyy-mm-dd hh24:mi:ss') createTime, TO_CHAR( GREATEST( NVL(f2.update_time, TO_DATE('0001-01-01', 'yyyy-mm-dd')), NVL(f3.update_date, TO_DATE('0001-01-01', 'yyyy-mm-dd')), NVL(f4.update_time, TO_DATE('0001-01-01', 'yyyy-mm-dd')) ), 'yyyy-mm-dd hh24:mi:ss' ) modifyTime, decode(f2.state, '1','1','2') state, f2.ext_attr_11 gender, '' photoUrl, f3.ext_attr_1 idCardType, f3.ext_attr_2 idCardNo, nvl(f3.ext_attr_6, f1.hrCode) "hrCode", f3.ext_attr_7 posJob from org_member f2 left join addressbook f3 on f2.id=f3.member_id left join vm_basememberinfo f1 on f1.memberId = f3.member_id left join org_unit f4 on f2.org_department_id = f4.id left join vm_staffInfo_cache f5 on f2.id = f5.id where f2.is_admin=0 and f2.is_internal=1 and f2.type=1 and f2.is_virtual=0 and f2.is_deleted=0) f left join vm_staffInfo_cache f2 on f.id = f2.id where f.modifyTime > f2.oaModifyTime or f.realName != f2.realname or f."hrCode" != f2.hrCode or (f."hrCode" is not null and f2.hrCode is null);

-- statementId: findUpdateTimeDepartInfoChange.select
-- lookupStatementId: findUpdateTimeDepartInfoChange.select
-- source: org_sqlmap.xml
-- type: select
-- params: {}
select id, type, unitCode, unitName, parentUnitCode, parentUnitName, managerCode, managerLoginName, managerName, lineLeaderCode, lineLeaderName, lineDirectorCode, lineDirectorName, companyCode, createTime, modifyTime, "isDeleted", "isEnable" from (select f1.id, (case when f1."CODE" like 'Line%' then '2' else '3' end) type, f1."CODE" unitCode, f1."NAME" unitName, f1.parent_code parentUnitCode, f1.parent_name parentUnitName, util_user.getMemCodeByMemId(util_org.getLeaderMemIdByDeptId(f1."ID")) managerCode, util_user.getLoginNameByMemId(util_org.getLeaderMemIdByDeptId(f1.id)) managerLoginName, util_user.getMemberNameByMemId(util_org.getLeaderMemIdByDeptId(f1.id)) managerName, util_user.getMemCodeByMemId(util_org.getLineLeaderMemIdByDeptId(f1."ID")) lineLeaderCode, util_user.getMemberNameByMemId(util_org.getLineLeaderMemIdByDeptId(f1.id)) lineLeaderName, util_user.getMemCodeByMemId(util_org.getLineDirectorMemIdByDeptId(f1."ID")) lineDirectorCode, util_user.getMemberNameByMemId(util_org.getLineDirectorMemIdByDeptId(f1.id)) lineDirectorName, util_org.getAccountCodeByDeptId(f1.id) companyCode, to_char(f1.create_time, 'yyyy-mm-dd HH24:mi:ss') createTime, to_char(f1.update_time, 'yyyy-mm-dd HH24:mi:ss') modifyTime, to_char(f1.IS_DELETED) "isDeleted", to_char(f1.IS_ENABLE) "isEnable" from vm_org_unit_all f1 inner join vm_org_unit_cache f2 on f2.id = f1.id where f1.parent_id is not null and code is not null and f1.IS_INTERNAL = 1 and to_char(f1.update_time, 'yyyy-mm-dd HH24:mi:ss') > f2.modifyTime union all select f.id, '0' type, f.code unitCode, f.name unitName, '' parentUnitCode, '' parentUnitName, '' managerCode, '' managerLoginName, '' managerName, '' lineLeaderCode, '' lineLeaderName, '' lineDirectorCode, '' lineDirectorName, '' companyCode, to_char(f.create_time, 'yyyy-mm-dd HH24:mi:ss') createTime, to_char(f.update_time, 'yyyy-mm-dd HH24:mi:ss') modifyTime, to_char(f.IS_DELETED) "isDeleted", to_char(f.IS_ENABLE) "isEnable" from org_unit f inner join vm_org_unit_cache f2 on f2.id = f.id where f.is_group = 1 and to_char(f.update_time, 'yyyy-mm-dd HH24:mi:ss') > f2.modifyTime union all select t.id, '1' type, code unitCode, name unitName, parent_code parentUnitCode, parent_name parentUnitName, '' managerCode, '' managerLoginName, '' managerName, '' lineLeaderCode, '' lineLeaderName, '' lineDirectorCode, '' lineDirectorName, '' companyCode, to_char(create_time, 'yyyy-mm-dd HH24:mi:ss') createTime, to_char(update_time, 'yyyy-mm-dd HH24:mi:ss') modifyTime, to_char(IS_DELETED) "isDeleted", to_char(IS_ENABLE) "isEnable" from (SELECT u1."ID", u1."NAME", u1."SECOND_NAME", u1."CODE", u1."SHORT_NAME", u1."TYPE", u1."IS_GROUP", u1."PATH", u1."IS_INTERNAL", u1."SORT_ID", u1."IS_ENABLE", u1."IS_DELETED", u1."STATUS", u1."LEVEL_SCOPE", u1."ORG_ACCOUNT_ID", u1."CREATE_TIME", u1."UPDATE_TIME", u2.id as parent_id, u2.name as parent_name, u2.code as parent_code, u2.type as parent_type FROM (select * from org_unit u ) u1 left join (select * from org_unit u ) u2 on (u2.path = substr(u1.path, 1, LENGTH(u1.path) - 4) or u1.path is null) and u1.type = 'Account' and u2.type = 'Account' order by u1.path) t inner join vm_org_unit_cache f2 on f2.id = t.id where t.parent_type = 'Account' and t.is_internal = 1 and to_char(update_time, 'yyyy-mm-dd HH24:mi:ss') > f2.modifyTime union all select vd.id, '4' type, vd.bussinessdepartcode unitCode, vd.businessname unitName, util_org.getDeptCodeByDeptId(vd.bussinessdepart) parentUnitCode, util_org.getDeptNameByDeptId(vd.bussinessdepart) parentUnitName, util_user.getMemCodeByMemId(vd.bussinessleader) managerCode, util_user.getLoginNameByMemId(vd.bussinessleader) managerLoginName, util_user.getMemberNameByMemId(vd.bussinessleader) managerName, '' lineLeaderCode, '' lineLeaderName, '' lineDirectorCode, '' lineDirectorName, util_org.getAccountCodeByDeptId(vd.bussinessdepart) companyCode, to_char(vd.start_date, 'yyyy-mm-dd HH24:mi:ss') createTime, to_char(vd.modify_date, 'yyyy-mm-dd HH24:mi:ss') modifyTime, '0' "isDeleted", '1' "isEnable" from VM_DEPTBUSIGROUP_definition vd inner join vm_org_unit_cache f2 on f2.id = vd.id where vd.businesstype = -2012331098492612991 and to_char(vd.modify_date, 'yyyy-mm-dd HH24:mi:ss') > f2.modifyTime ) f;

-- statementId: oaStaffInfo.update
-- lookupStatementId: oaStaffInfo.update
-- source: org_sqlmap.xml
-- type: update
-- params: {
--   "loginName": "NAME_001",
--   "code": "CODE_001",
--   "name": "NAME_001",
--   "realName": "NAME_001",
--   "mobileNo": "VALUE_001",
--   "officeTel": "VALUE_001",
--   "eMail": "VALUE_001",
--   "deptCode": "CODE_001",
--   "deptName": "NAME_001",
--   "companyName": "NAME_001",
--   "companyCode": "CODE_001",
--   "staffStatus": 1,
--   "entryDate": "2026-05-14",
--   "exitDate": "2026-05-14",
--   "workPlaceName": "NAME_001",
--   "workPlaceCode": "CODE_001",
--   "createTime": "2026-05-14 10:00:00",
--   "oaModifyTime": "2026-05-14 10:00:00",
--   "state": 1,
--   "lineName": "NAME_001",
--   "lineCode": "CODE_001",
--   "gender": "VALUE_001",
--   "photoUrl": "VALUE_001",
--   "idCardType": 1001,
--   "idCardNo": 1001,
--   "hrCode": "CODE_001",
--   "posJob": "VALUE_001",
--   "id": 1001
-- }
update vm_staffInfo_cache set loginName = 'NAME_001', code = 'CODE_001', name = 'NAME_001', realName = 'NAME_001', mobileNo = 'VALUE_001', officeTel = 'VALUE_001', email = 'VALUE_001', deptCode = 'CODE_001', deptName = 'NAME_001', companyName = 'NAME_001', companyCode = 'CODE_001', staffStatus = 1, entryDate = '2026-05-14', exitDate = '2026-05-14', workPlaceName = 'NAME_001', workPlaceCode = 'CODE_001', createTime = '2026-05-14 10:00:00', modifyTime = '2026-05-14 10:00:00', oamodifyTime = '2026-05-14 10:00:00', state = 1, lineName = 'NAME_001', lineCode = 'CODE_001', gender = 'VALUE_001', photoUrl = 'VALUE_001', idCardType = 1001, idCardNo = 1001, hrCode = 'CODE_001', posJob = 'VALUE_001' where id=1001;

-- statementId: departInfo.update
-- lookupStatementId: departInfo.update
-- source: org_sqlmap.xml
-- type: update
-- params: {
--   "unitName": "NAME_001",
--   "unitCode": "CODE_001",
--   "parentUnitName": "NAME_001",
--   "parentUnitCode": "CODE_001",
--   "type": "VALUE_001",
--   "managerLoginName": "NAME_001",
--   "managerName": "NAME_001",
--   "managerCode": "CODE_001",
--   "lineLeaderName": "NAME_001",
--   "lineLeaderCode": "CODE_001",
--   "lineDirectorName": "NAME_001",
--   "lineDirectorCode": "CODE_001",
--   "companyCode": "CODE_001",
--   "createTime": "2026-05-14 10:00:00",
--   "modifyTime": "2026-05-14 10:00:00",
--   "isDeleted": "VALUE_001",
--   "isEnable": "VALUE_001",
--   "id": 1001
-- }
update vm_org_unit_cache set unitName = 'NAME_001', unitCode = 'CODE_001', parentUnitName = 'NAME_001', parentUnitCode = 'CODE_001', type = 'VALUE_001', managerLoginName = 'NAME_001', managerName = 'NAME_001', managerCode = 'CODE_001', lineLeaderName = 'NAME_001', lineLeaderCode = 'CODE_001', lineDirectorName = 'NAME_001', lineDirectorCode = 'CODE_001', companyCode = 'CODE_001', createTime = '2026-05-14 10:00:00', modifyTime = '2026-05-14 10:00:00', isDeleted = 'VALUE_001', isEnable = 'VALUE_001' where id=1001;

-- statementId: staffInfoTeamNoData.update
-- lookupStatementId: staffInfoTeamNoData.update
-- source: org_sqlmap.xml
-- type: update
-- params: {}
update vm_staffinfo_cache vm set (teamName, teamCode, modifyTime) = (select f.businessname, f.bussinessdepartcode, to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss') from VM_DEPTBUSIGROUP f where vm.id = f.businessmember) where exists( select 'x' from VM_DEPTBUSIGROUP f where vm.id = f.businessmember and (vm.teamName is null or vm.teamCode is null) );

-- statementId: staffInfoValidateTeam.update
-- lookupStatementId: staffInfoValidateTeam.update
-- source: org_sqlmap.xml
-- type: update
-- params: {}
update vm_staffinfo_cache vm set teamName = null, teamCode = null, modifyTime = to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss') where vm.id not in ( select f.businessmember from VM_DEPTBUSIGROUP f where f.businessmember is not null ) and (teamName is not null or teamCode is not null);

-- statementId: allTeamInfo.select
-- lookupStatementId: allTeamInfo.select
-- source: org_sqlmap.xml
-- type: select
-- params: {}
select f.modify_date as modifyTime, f.businessmember as id, f.businessname as teamName, f.bussinessdepartcode teamCode from VM_DEPTBUSIGROUP f;

-- statementId: staffAllTeamInfo.select
-- lookupStatementId: staffAllTeamInfo.select
-- source: org_sqlmap.xml
-- type: select
-- params: {}
select id, teamName, teamCode from vm_staffinfo_cache where teamName is not null or teamCode is not null;

-- statementId: staffInfoTeam.update
-- lookupStatementId: staffInfoTeam.update
-- source: org_sqlmap.xml
-- type: update
-- params: {
--   "teamName": "NAME_001",
--   "teamCode": "CODE_001",
--   "modifyTime": "2026-05-14 10:00:00",
--   "id": 1001
-- }
update vm_staffinfo_cache f set teamName = 'NAME_001', teamCode = 'CODE_001', modifyTime = case when to_date(f.modifyTime, 'yyyy-mm-dd hh24:mi:ss') > '2026-05-14 10:00:00' then f.modifyTime else to_char('2026-05-14 10:00:00', 'yyyy-mm-dd hh24:mi:ss') end where id = 1001;

-- statementId: careRegisterTask.insert
-- lookupStatementId: careRegisterTask.insert
-- source: org_sqlmap.xml
-- type: insert
-- params: {
--   "id": 1001,
--   "pushMember": "VALUE_001",
--   "oldJobGrade": "VALUE_001",
--   "newJobGrade": "VALUE_001"
-- }
insert into vm_carRegisterTask (id, state, start_member_id, start_date, approve_member_id, approve_date, finishedflag, ratifyflag, ratify_member_id, ratify_date, sort, modify_member_id, modify_date, writer, writeDate, pushMember, pushDepart, planPushDate, pushState, oldJobGrade, newJobGrade, jobGradeChangeDate, serialNum) values (1001, 1, -6760911671874597139, sysdate, 0, sysdate, 0, 0, 0, null, 0, -6760911671874597139, sysdate, -6760911671874597139, sysdate, 'VALUE_001', util_user.getDeptIdByMemId('VALUE_001'), sysdate + 1, 7727549772789403399, 'VALUE_001', 'VALUE_001', sysdate, 1001);

-- statementId: careRegister.insert
-- lookupStatementId: careRegister.insert
-- source: org_sqlmap.xml
-- type: insert
-- params: {
--   "id": 1001,
--   "pushMember": "VALUE_001"
-- }
insert into vm_carRegisterInfo (id, state, start_member_id, start_date, approve_member_id, approve_date, finishedflag, ratifyflag, ratify_member_id, ratify_date, sort, modify_member_id, modify_date, writer, writeDate, userId, userDepart, userAccount ) values (1001, 1, -6760911671874597139, sysdate, 0, sysdate, 0, 0, 0, null, 0, -6760911671874597139, sysdate, -6760911671874597139, sysdate, 'VALUE_001', util_user.getDeptIdByMemId('VALUE_001'), util_user.getAccountIdByMemId('VALUE_001') );

-- statementId: departCodeToDepartIdRelation.select
-- lookupStatementId: departCodeToDepartIdRelation.select
-- source: org_sqlmap.xml
-- type: select
-- params: {}
select to_char(id) id, code from org_unit f where f.code is not null;

-- statementId: departIdToOrgIDRelation.select
-- lookupStatementId: departIdToOrgIDRelation.select
-- source: org_sqlmap.xml
-- type: select
-- params: {}
select to_char(id) id, to_char(f.org_account_id) orgId from org_unit f where f.code is not null;

-- statementId: departExtendInfo.select
-- lookupStatementId: departExtendInfo.select
-- source: org_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select departInfo from vm_departextendinfo where depart = 'VALUE_001';

-- statementId: baseMemberNote.select
-- lookupStatementId: baseMemberNote.select
-- source: org_sqlmap.xml
-- type: select
-- params: {}
select memberid,memberNote from vm_basememberinfo c where c.memberState = '在职' and memberNote is not null;

-- statementId: findCap4EmployeeByUserId.select
-- lookupStatementId: findCap4EmployeeByUserId.select
-- source: org_sqlmap.xml
-- type: select
-- params: {}
select to_char(id) as id, name, userId, company, department, depKMCode, workPlace, workfloor, certType, job, jobGrade, startDate, updateDate, cyear from VM_CAP4_EMPLOYEE;

-- statementId: insertCap4EmployeeInfo.insert
-- lookupStatementId: insertCap4EmployeeInfo.insert
-- source: org_sqlmap.xml
-- type: insert
-- params: {
--   "id": 1001,
--   "name": "NAME_001",
--   "userId": 1001,
--   "company": "VALUE_001",
--   "department": "VALUE_001",
--   "depKMCode": "CODE_001",
--   "workPlace": "VALUE_001",
--   "workfloor": "VALUE_001",
--   "certType": "VALUE_001",
--   "job": "VALUE_001",
--   "jobGrade": "VALUE_001",
--   "startDate": "2026-05-14",
--   "updateDate": "2026-05-14",
--   "cyear": "VALUE_001"
-- }
insert into VM_CAP4_EMPLOYEE( ID, STATE, START_MEMBER_ID, START_DATE, APPROVE_MEMBER_ID, APPROVE_DATE, FINISHEDFLAG, RATIFYFLAG, RATIFY_MEMBER_ID, RATIFY_DATE, SORT, MODIFY_MEMBER_ID, MODIFY_DATE, name, userId, company, department, depKMCode, workPlace, workfloor, certType, job, jobGrade, startDate, updateDate, cyear ) VALUES( 1001, 1, null, sysdate, null, sysdate, 0, 0, 0, sysdate, 0, null, sysdate, 'NAME_001', 1001, 'VALUE_001', 'VALUE_001', 'CODE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', to_date('2026-05-14','yyyy-MM-dd'), to_date('2026-05-14','yyyy-MM-dd'), 'VALUE_001' );

-- statementId: updateCap4EmployeeInfo.update
-- lookupStatementId: updateCap4EmployeeInfo.update
-- source: org_sqlmap.xml
-- type: update
-- params: {
--   "name": "NAME_001",
--   "userId": 1001,
--   "company": "VALUE_001",
--   "department": "VALUE_001",
--   "depKMCode": "CODE_001",
--   "workPlace": "VALUE_001",
--   "workfloor": "VALUE_001",
--   "certType": "VALUE_001",
--   "job": "VALUE_001",
--   "jobGrade": "VALUE_001",
--   "updateDate": "2026-05-14",
--   "cyear": "VALUE_001",
--   "id": 1001
-- }
update VM_CAP4_EMPLOYEE set name = 'NAME_001', userId = 1001, company = 'VALUE_001', department = 'VALUE_001', depKMCode = 'CODE_001', workPlace = 'VALUE_001', workfloor = 'VALUE_001', certType = 'VALUE_001', job = 'VALUE_001', jobGrade = 'VALUE_001', updateDate = to_date('2026-05-14','yyyy-MM-dd'), cyear = 'VALUE_001' where id = 1001;

-- statementId: hrCodeToOAMemberInfo.select
-- lookupStatementId: hrCodeToOAMemberInfo.select
-- source: org_sqlmap.xml
-- type: select
-- params: {}
select member_id as "memberId", EXT_ATTR_6 as "hrCode" from addressbook where EXT_ATTR_6 is not null;

-- statementId: getMemberMqInfoByUserCode.select
-- lookupStatementId: getMemberMqInfoByUserCode.select
-- source: org_sqlmap.xml
-- type: select
-- params: {
--   "code": "CODE_001"
-- }
select to_char(sysdate,'yyyy-mm-dd') as "changeDate", '' as "changeInfo", 'EHR' as "changeSource", '1' as "changeType", p.login_name as "loginName", m.code as "code", m.name as "name", to_char(m.ext_attr_11) as "gender", case when m.state=1 then '在职' when m.state=2 then '离职' end as "state", to_char(m.ext_attr_22,'yyyy-mm-dd') as "entryDate", b.ext_attr_21 as "leaveDate", o1.name as "companyName", o2.code as "deptCode", o2.name as "deptName", util_org.getLineCodeByDeptId(o2.id) as "lineCode", util_org.getLineNameByDeptId(o2.id) as "lineName", vd.businessname as "teamName", vd.bussinessdepartcode as "teamCode", m.ext_attr_2 as "email", m.ext_attr_1 as "mobileNo", m.ext_attr_3 as "officeTel", b.ext_attr_2 as "idCardNo", b.ext_attr_1 as "idCardType", b.ext_attr_3 as "workPlaceName", b.ext_attr_6 as "hrCode", b.ext_attr_7 as "posJob", b.ext_attr_9 as "jobGrade", o1.code as "companyCode", '' as "certTypeCode", '' as "workPlaceCode" from org_member m left join org_principal p on p.member_id = m.id left join addressbook b on b.member_id = m.id left join org_unit o1 on o1.id = m.org_account_id left join org_unit o2 on o2.id = m.org_department_id left join VM_DEPTBUSIGROUP vd on vd.businessmember = m.id where m.code = 'CODE_001';

-- statementId: formalEmployeeMap.select
-- lookupStatementId: formalEmployeeMap.select
-- source: org_sqlmap.xml
-- type: select
-- params: {
--   "code": "CODE_001"
-- }
select loginName as "loginName", code as "code", name as "name", gender "gender", mobileNo as "mobileNo", officeTel as "officeTel", email as "email", deptCode as "deptCode", deptName as "deptName", companyName as "companyName", companyCode as "companyCode", entryDate as "entryDate", exitDate as "exitDate", workPlaceName as "workPlaceName", workPlaceCode as "workPlaceCode", createTime as "createTime", modifyTime as "modifyTime", teamName as "teamName", teamCode as "teamCode", lineName as "lineName", lineCode as "lineCode", gender as "gender", hrCode as "hrCode", idCardType as "idCardType", idCardNo as "idCardNo", case when state=1 then '在职' when state=2 then '离职' end as "state", posJob as "posJob" from vm_staffInfo_cache where code = 'CODE_001';

-- statementId: getUserIdByNoStaffInfo.select
-- lookupStatementId: getUserIdByNoStaffInfo.select
-- source: org_sqlmap.xml
-- type: select
-- params: {}
select id from (select f2.id from org_member f2 where f2.is_admin=0 and f2.is_internal=1 and f2.type <> 2 and f2.is_virtual=0 and f2.is_deleted=0) f where f.id not in (select id from vm_staffInfo_cache);

-- statementId: insertDesignStaffNoCacheData.insert
-- lookupStatementId: insertDesignStaffNoCacheData.insert
-- source: org_sqlmap.xml
-- type: insert
-- params: {
--   "code": "CODE_001"
-- }
insert into vm_staffInfo_cache ( id, vm_state, start_member_id, start_date, approve_member_id, approve_date, finishedflag, ratifyflag, ratify_member_id, ratify_date, loginName, code, name, realName, mobileNo, officeTel, email, deptCode, deptName, companyName, companyCode, staffStatus, entryDate, exitDate, workPlaceName, workPlaceCode, createTime, modifyTime, oamodifyTime, state, linecode, linename, teamName, teamCode, gender, photoUrl, idCardType, idCardNo, hrCode, posJob ) select id, 1, -6760911671874597139, sysdate, 0, null, 0, 0, null, null, loginName, code, name, realName, mobileNo, officeTel, email, deptCode, deptName, companyName, companyCode, staffStatus, entryDate, exitDate, workPlaceName, workPlaceCode, createTime, modifyTime, modifyTime, state, util_org.getLineCodeByDeptId(departId), util_org.getLineNameByDeptId(departId), teamName, teamCode, gender, photoUrl, idCardType, idCardNo, "hrCode", posJob from (select f1.departId, f2.id, nvl(util_user.getLoginNameByMemId(f2.id), substr(f2.ext_attr_2,1,instr(f2.ext_attr_2, '@')-1)) loginName, f2.code code, util_user.getMemberNameByMemId(f2.id) name, nvl(f1.chnname, util_user.getMemberNameByMemId(f2.id)) realName, f2.ext_attr_1 mobileNo, f2.ext_attr_3 officeTel, f2.ext_attr_2 email, util_org.getDeptCodeByDeptId(f2.org_department_id) deptCode, util_org.getDeptNameByDeptId(f2.org_department_id) deptName, util_org.getDeptNameByDeptId(f2.org_account_id) companyName, util_org.getDeptCodeByDeptId(f2.org_account_id) companyCode, decode(f3.ext_attr_4, null,decode(f2.state, '1','1','2'), decode (f3.ext_attr_4, '在职','1','2')) staffStatus, to_char(f2.ext_attr_22, 'yyyy-mm-dd') entryDate, to_char(f3.ext_attr_21, 'yyyy-mm-dd') exitDate, f3.ext_attr_3 workPlaceName, util_common.getEnumValueById(util_common.getEnumIdByShow('4660073417407942090', f3.ext_attr_3)) workPlaceCode, to_char(f2.create_time, 'yyyy-mm-dd hh24:mi:ss') createTime, (case when f2.update_time is null and f3.update_date is not null then to_char(f3.update_date,'yyyy-mm-dd hh24:mi:ss') when f2.update_time is not null and f3.update_date is null then to_char(f2.update_time, 'yyyy-mm-dd hh24:mi:ss') when f2.update_time is null and f3.update_date is null then to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') when f2.update_time > f3.update_date then to_char(f2.update_time, 'yyyy-mm-dd hh24:mi:ss') else to_char(f3.update_date,'yyyy-mm-dd hh24:mi:ss') end) modifyTime, decode(f2.state, '1','1','2') state, vd.businessname as teamName, vd.bussinessdepartcode as teamCode, f2.ext_attr_11 gender, '' photoUrl, f3.ext_attr_1 idCardType, f3.ext_attr_2 idCardNo, nvl(f3.ext_attr_6, f1.hrCode) "hrCode", f3.ext_attr_7 posJob from org_member f2 left join addressbook f3 on f2.id=f3.member_id left join vm_basememberinfo f1 on f1.memberId = f3.member_id left join VM_DEPTBUSIGROUP vd on vd.businessmember = f2.id where f2.is_admin=0 and f2.is_internal=1 and f2.type <> 2 and f2.is_virtual=0 and f2.is_deleted=0) f where f.id not in (select id from vm_staffInfo_cache) and f.code = 'CODE_001';

-- statementId: designUpdateStaffInfo.update
-- lookupStatementId: designUpdateStaffInfo.update
-- source: org_sqlmap.xml
-- type: update
-- params: {
--   "loginName": "NAME_001",
--   "code": "CODE_001",
--   "name": "NAME_001",
--   "realName": "NAME_001",
--   "mobileNo": "VALUE_001",
--   "officeTel": "VALUE_001",
--   "eMail": "VALUE_001",
--   "deptCode": "CODE_001",
--   "deptName": "NAME_001",
--   "companyName": "NAME_001",
--   "companyCode": "CODE_001",
--   "staffStatus": 1,
--   "entryDate": "2026-05-14",
--   "exitDate": "2026-05-14",
--   "workPlaceName": "NAME_001",
--   "workPlaceCode": "CODE_001",
--   "createTime": "2026-05-14 10:00:00",
--   "oaModifyTime": "2026-05-14 10:00:00",
--   "state": 1,
--   "lineName": "NAME_001",
--   "lineCode": "CODE_001",
--   "teamName": "NAME_001",
--   "teamCode": "CODE_001",
--   "gender": "VALUE_001",
--   "photoUrl": "VALUE_001",
--   "idCardType": 1001,
--   "idCardNo": 1001,
--   "hrCode": "CODE_001",
--   "posJob": "VALUE_001",
--   "id": 1001
-- }
update vm_staffInfo_cache set loginName = 'NAME_001', code = 'CODE_001', name = 'NAME_001', realName = 'NAME_001', mobileNo = 'VALUE_001', officeTel = 'VALUE_001', email = 'VALUE_001', deptCode = 'CODE_001', deptName = 'NAME_001', companyName = 'NAME_001', companyCode = 'CODE_001', staffStatus = 1, entryDate = '2026-05-14', exitDate = '2026-05-14', workPlaceName = 'NAME_001', workPlaceCode = 'CODE_001', createTime = '2026-05-14 10:00:00', modifyTime = '2026-05-14 10:00:00', oamodifyTime = '2026-05-14 10:00:00', state = 1, lineName = 'NAME_001', lineCode = 'CODE_001', teamName = 'NAME_001', teamCode = 'CODE_001', gender = 'VALUE_001', photoUrl = 'VALUE_001', idCardType = 1001, idCardNo = 1001, hrCode = 'CODE_001', posJob = 'VALUE_001' where id=1001;

-- statementId: findDesignMemberChange.select
-- lookupStatementId: findDesignMemberChange.select
-- source: org_sqlmap.xml
-- type: select
-- params: {
--   "code": "CODE_001"
-- }
select f.id as "id", f.loginName as "loginName", f.code as "code", f.name as "name", f.realName as "realName", f.mobileNo as "mobileNo", f.officeTel as "officeTel", f.email as "eMail", f.deptCode as "deptCode", f.deptName as "deptName", f.companyName as "companyName", f.companyCode as "companyCode", f.staffStatus as "staffStatus", f.entryDate as "entryDate", f.exitDate as "exitDate", f.workPlaceName as "workPlaceName", f.workPlaceCode as "workPlaceCode", f.createTime as "createTime", f.modifyTime as "modifyTime", f.modifyTime as "oaModifyTime", f.state as "state", util_org.getLineCodeByDeptId(departId) as "lineCode", util_org.getLineNameByDeptId(departId) as "lineName", f.teamName as "teamName", f.teamCode as "teamCode", f.gender as "gender", f.photoUrl as "photoUrl", f.idCardType as "idCardType", f.idCardNo as "idCardNo", f."hrCode" as "hrCode", f.posJob as "posJob" from (select f1.departId, f2.id, nvl(util_user.getLoginNameByMemId(f2.id), substr(f2.ext_attr_2,1,instr(f2.ext_attr_2, '@')-1)) loginName, f2.code code, util_user.getMemberNameByMemId(f2.id) name, nvl(f1.chnname, util_user.getMemberNameByMemId(f2.id)) realName, f2.ext_attr_1 mobileNo, f2.ext_attr_3 officeTel, f2.ext_attr_2 email, vd.businessname as teamName, vd.bussinessdepartcode as teamCode, util_org.getDeptCodeByDeptId(f2.org_department_id) deptCode, util_org.getDeptNameByDeptId(f2.org_department_id) deptName, util_org.getDeptNameByDeptId(f2.org_account_id) companyName, util_org.getDeptCodeByDeptId(f2.org_account_id) companyCode, decode(f3.ext_attr_4, null,decode(f2.state, '1','1','2'), decode (f3.ext_attr_4, '在职','1','2')) staffStatus, to_char(f2.ext_attr_22, 'yyyy-mm-dd') entryDate, to_char(f3.ext_attr_21, 'yyyy-mm-dd') exitDate, f3.ext_attr_3 workPlaceName, util_common.getEnumValueById(util_common.getEnumIdByShow('4660073417407942090', f3.ext_attr_3)) workPlaceCode, to_char(f2.create_time, 'yyyy-mm-dd hh24:mi:ss') createTime, TO_CHAR( GREATEST( NVL(f2.update_time, TO_DATE('0001-01-01', 'yyyy-mm-dd')), NVL(f3.update_date, TO_DATE('0001-01-01', 'yyyy-mm-dd')), NVL(f4.update_time, TO_DATE('0001-01-01', 'yyyy-mm-dd')) ), 'yyyy-mm-dd hh24:mi:ss' ) modifyTime, decode(f2.state, '1','1','2') state, f2.ext_attr_11 gender, '' photoUrl, f3.ext_attr_1 idCardType, f3.ext_attr_2 idCardNo, nvl(f3.ext_attr_6, f1.hrCode) "hrCode", f3.ext_attr_7 posJob from org_member f2 left join addressbook f3 on f2.id=f3.member_id left join vm_basememberinfo f1 on f1.memberId = f3.member_id left join org_unit f4 on f2.org_department_id = f4.id left join vm_staffInfo_cache f5 on f2.id = f5.id left join VM_DEPTBUSIGROUP vd on vd.businessmember = f2.id where f2.is_admin=0 and f2.is_internal=1 and f2.type=1 and f2.is_virtual=0 and f2.is_deleted=0) f left join vm_staffInfo_cache f2 on f.id = f2.id where f.code = 'CODE_001' and f.modifyTime > f2.oaModifyTime or f.realName != f2.realname or f.teamName != f2.teamName or f.teamCode != f2.teamCode or f."hrCode" != f2.hrCode or (f."hrCode" is not null and f2.hrCode is null);

-- statementId: getWelfareTemplateInfo.select
-- lookupStatementId: getWelfareTemplateInfo.select
-- source: welfare_sqlmap.xml
-- type: select
-- params: {
--   "currentUser": "VALUE_001",
--   "welfareDetailType": "RAW_VALUE",
--   "templateNo": "VALUE_001",
--   "welfareAccess": "VALUE_001"
-- }
select id as "id", writer as "writer", writeDate as "writeDate", templateNo as "templateNo", util_common.getEnumShowById(templateStatus) as "templateStatus", welfareName as "welfareName", util_common.getEnumShowById(welfareType) as "welfareType", util_common.getEnumShowById(welfareProvider) as "welfareProvider", welfareManager as "welfareManager", welfareManageDept as "welfareManageDept", publishDate as "publishDate", abolishDate as "abolishDate", util_common.getEnumShowById(empStatus) as "empStatus", util_common.getEnumShowById(empType) as "empType", util_common.getEnumShowById(jobStatus) as "jobStatus", util_common.getEnumShowById(welfareAccess) as "welfareAccess", provideDeclaration as "provideDeclaration", welfareDeclaration as "welfareDeclaration", (select welfareDetail from vm_memberwelfareanaproject where( sysdate >= userValidity and sysdate < endDate ) and templateNo = t.templateNo and welfareMember = 'VALUE_001') as "welfareDetail", welfareDetail as "templateWelfareDetail", endDate as "endDate", traceUseOrNot as "traceUseOrNot", notifyDayLimit as "notifyDayLimit", notifyType as "notifyType", expenseIndicator as "expenseIndicator", autoStartOrNot as "autoStartOrNot", remark as "remark", welfareDetailType as "welfareDetailTypeId", util_common.getEnumShowById(welfareDetailType) as "welfareDetailType", (select to_char(wmsys.wm_concat(id)) from vm_memberwelfareanaproject where( to_char(launchDate,'yyyy') = to_char(sysdate,'yyyy') or to_char(endDate,'yyyy') = to_char(sysdate,'yyyy') ) and templateNo = t.templateNo and welfareMember = 'VALUE_001') as "multiWelfareProjectId" from vm_welfareTemplate t where 1=1 and welfareType = '4352357452840780248' AND welfareDetailType in (RAW_VALUE) AND templateNo = 'VALUE_001' AND templateStatus = -3961934677530555788 AND welfareAccess = 'VALUE_001' order by chartSeqNo asc, util_common.getEnumValueById(welfareDetailType) asc, templateStatus desc, welfareManageDept desc, welfareManager desc;

-- statementId: getMemberWelfareProjectByIdArea.select
-- lookupStatementId: getMemberWelfareProjectByIdArea.select
-- source: welfare_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select * from vm_memberWelfareAnaProject where id in VALUE_001;

-- statementId: generateWelfareOwnerSendFlowList.select
-- lookupStatementId: generateWelfareOwnerSendFlowList.select
-- source: welfare_sqlmap.xml
-- type: select
-- params: {
--   "id": 1001,
--   "currentUser": "VALUE_001",
--   "noticeType": "VALUE_001",
--   "noticeAccess": "VALUE_001",
--   "noticeContent": "VALUE_001",
--   "noticeFile": "VALUE_001",
--   "validityPeriod": 1001,
--   "noticeTitle": "TITLE_001",
--   "projectCode": "CODE_001"
-- }
select 1001 as "sendId", util_common.getAbsID() as "flowId", 'HR_welfare_T001' as "flowType", 'VALUE_001' as "sendUserNo", sysdate as "writeDate", mwp.projectCode as "projectCode", mwp.annual as "annual", mwp.welfareName as "welfareName", 'VALUE_001' as "noticeType", 'VALUE_001' as "noticeAccess", om.id as "receiver", util_user.getDeptIdByMemId(om.id) as "memberDept", 'VALUE_001' as "noticeContent", 'VALUE_001' as "noticeFile", 1001 as "validityPeriod", 'TITLE_001' as "noticeTitle", mwp.customCollectShow as "customOptions" from (select * from org_member where is_virtual=0 and is_admin=0 and is_enable = 1 and is_deleted = 0 and IS_INTERNAL = 1 and STATE = 1 and type = 1) om right join vm_memberWelfareAnaProject mwp on om.id = mwp.welfareMember where mwp.projectCode in ('CODE_001');

-- statementId: generateDeptContactorSendFlowList.select
-- lookupStatementId: generateDeptContactorSendFlowList.select
-- source: welfare_sqlmap.xml
-- type: select
-- params: {
--   "id": 1001,
--   "currentUser": "VALUE_001",
--   "noticeType": "VALUE_001",
--   "noticeAccess": "VALUE_001",
--   "noticeContent": "VALUE_001",
--   "noticeFile": "VALUE_001",
--   "validityPeriod": 1001,
--   "noticeTitle": "TITLE_001",
--   "projectCode": "CODE_001"
-- }
select 1001 as "sendId", util_common.getAbsID() as "flowId", 'HR_welfare_T001' as "flowType", 'VALUE_001' as "sendUserNo", sysdate as "writeDate", mwp.projectCode as "projectCode", mwp.annual as "annual", mwp.welfareName as "welfareName", 'VALUE_001' as "noticeType", 'VALUE_001' as "noticeAccess", om.role_member as "receiver", util_user.getDeptIdByMemId(om.role_member) as "memberDept", 'VALUE_001' as "noticeContent", 'VALUE_001' as "noticeFile", 1001 as "validityPeriod", 'TITLE_001' as "noticeTitle", mwp.customCollectShow as "customOptions" from (select distinct(department_id),role_member from vm_f_deptrole r where r.role_code = 'DeptLiasion') om right join (select distinct(belongdepart) as "deptlimit", t.* from vm_memberWelfareAnaProject t) mwp on om.department_id = mwp.belongdepart where mwp.projectCode in ('CODE_001') and om.role_member is not null;

-- statementId: generateMainAccountSendFlowList.select
-- lookupStatementId: generateMainAccountSendFlowList.select
-- source: welfare_sqlmap.xml
-- type: select
-- params: {
--   "id": 1001,
--   "currentUser": "VALUE_001",
--   "projectCode": "CODE_001",
--   "annual": "VALUE_001",
--   "welfareName": "NAME_001",
--   "noticeType": "VALUE_001",
--   "noticeAccess": "VALUE_001",
--   "noticeContent": "VALUE_001",
--   "noticeFile": "VALUE_001",
--   "validityPeriod": 1001,
--   "noticeTitle": "TITLE_001",
--   "welfareMember": "VALUE_001"
-- }
select 1001 as "sendId", util_common.getAbsID() as "flowId", 'HR_welfare_T001' as "flowType", 'VALUE_001' as "sendUserNo", sysdate as "writeDate", 'CODE_001' as "projectCode", 'VALUE_001' as "annual", 'NAME_001' as "welfareName", 'VALUE_001' as "noticeType", 'VALUE_001' as "noticeAccess", om.id as "receiver", util_user.getDeptIdByMemId(om.id) as "memberDept", 'VALUE_001' as "noticeContent", 'VALUE_001' as "noticeFile", 1001 as "validityPeriod", 'TITLE_001' as "noticeTitle", (select t.customCollectShow from vm_memberWelfareAnaProject t where t.projectCode = 'CODE_001' and t.welfareMember = 'VALUE_001') as "customOptions" from (select * from org_member where org_account_id = 97839079791739420 and is_virtual=0 and is_admin=0 and is_enable = 1 and is_deleted = 0 and IS_INTERNAL = 1 and STATE = 1 and type = 1 ) om;

-- statementId: getAllMemberCode.select
-- lookupStatementId: getAllMemberCode.select
-- source: welfare_sqlmap.xml
-- type: select
-- params: {}
select code from org_member where is_virtual=0 and is_admin=0 and is_enable = 1 and is_deleted = 0 and IS_INTERNAL = 1 and STATE = 1 and type = 1;

-- statementId: generateExceptHKSendFlowList.select
-- lookupStatementId: generateExceptHKSendFlowList.select
-- source: welfare_sqlmap.xml
-- type: select
-- params: {
--   "id": 1001,
--   "currentUser": "VALUE_001",
--   "projectCode": "CODE_001",
--   "annual": "VALUE_001",
--   "welfareName": "NAME_001",
--   "noticeType": "VALUE_001",
--   "noticeAccess": "VALUE_001",
--   "noticeContent": "VALUE_001",
--   "noticeFile": "VALUE_001",
--   "validityPeriod": 1001,
--   "noticeTitle": "TITLE_001",
--   "welfareMember": "VALUE_001"
-- }
select 1001 as "sendId", util_common.getAbsID() as "flowId", 'HR_welfare_T001' as "flowType", 'VALUE_001' as "sendUserNo", sysdate as "writeDate", 'CODE_001' as "projectCode", 'VALUE_001' as "annual", 'NAME_001' as "welfareName", 'VALUE_001' as "noticeType", 'VALUE_001' as "noticeAccess", om.id as "receiver", util_user.getDeptIdByMemId(om.id) as "memberDept", 'VALUE_001' as "noticeContent", 'VALUE_001' as "noticeFile", 1001 as "validityPeriod", 'TITLE_001' as "noticeTitle", (select t.customCollectShow from vm_memberWelfareAnaProject t where t.projectCode = 'CODE_001' and t.welfareMember = 'VALUE_001') as "customOptions" from (select * from org_member where org_account_id != -2948740806339441327 and org_account_id is not null and is_virtual=0 and is_admin=0 and is_enable = 1 and is_deleted = 0 and IS_INTERNAL = 1 and STATE = 1 and type = 1 ) om;

-- statementId: generateAllAccountSendFlowList.select
-- lookupStatementId: generateAllAccountSendFlowList.select
-- source: welfare_sqlmap.xml
-- type: select
-- params: {
--   "id": 1001,
--   "currentUser": "VALUE_001",
--   "projectCode": "CODE_001",
--   "annual": "VALUE_001",
--   "welfareName": "NAME_001",
--   "noticeType": "VALUE_001",
--   "noticeAccess": "VALUE_001",
--   "noticeContent": "VALUE_001",
--   "noticeFile": "VALUE_001",
--   "validityPeriod": 1001,
--   "noticeTitle": "TITLE_001",
--   "welfareMember": "VALUE_001"
-- }
select 1001 as "sendId", util_common.getAbsID() as "flowId", 'HR_welfare_T001' as "flowType", 'VALUE_001' as "sendUserNo", sysdate as "writeDate", 'CODE_001' as "projectCode", 'VALUE_001' as "annual", 'NAME_001' as "welfareName", 'VALUE_001' as "noticeType", 'VALUE_001' as "noticeAccess", om.id as "receiver", util_user.getDeptIdByMemId(om.id) as "memberDept", 'VALUE_001' as "noticeContent", 'VALUE_001' as "noticeFile", 1001 as "validityPeriod", 'TITLE_001' as "noticeTitle", (select t.customCollectShow from vm_memberWelfareAnaProject t where t.projectCode = 'CODE_001' and t.welfareMember = 'VALUE_001') as "customOptions" from (select * from org_member where is_virtual=0 and is_admin=0 and is_enable = 1 and is_deleted = 0 and IS_INTERNAL = 1 and STATE = 1 and type = 1 ) om;

-- statementId: generateCustomSendFlowList.select
-- lookupStatementId: generateCustomSendFlowList.select
-- source: welfare_sqlmap.xml
-- type: select
-- params: {
--   "id": 1001,
--   "currentUser": "VALUE_001",
--   "projectCode": "CODE_001",
--   "annual": "VALUE_001",
--   "welfareName": "NAME_001",
--   "noticeType": "VALUE_001",
--   "noticeAccess": "VALUE_001",
--   "noticeContent": "VALUE_001",
--   "noticeFile": "VALUE_001",
--   "validityPeriod": 1001,
--   "noticeTitle": "TITLE_001",
--   "welfareMember": "VALUE_001",
--   "customReceiver": "RAW_VALUE"
-- }
select 1001 as "sendId", util_common.getAbsID() as "flowId", 'HR_welfare_T001' as "flowType", 'VALUE_001' as "sendUserNo", sysdate as "writeDate", 'CODE_001' as "projectCode", 'VALUE_001' as "annual", 'NAME_001' as "welfareName", 'VALUE_001' as "noticeType", 'VALUE_001' as "noticeAccess", om.id as "receiver", util_user.getDeptIdByMemId(om.id) as "memberDept", 'VALUE_001' as "noticeContent", 'VALUE_001' as "noticeFile", 1001 as "validityPeriod", 'TITLE_001' as "noticeTitle", (select t.customCollectShow from vm_memberWelfareAnaProject t where t.projectCode = 'CODE_001' and t.welfareMember = 'VALUE_001') as "customOptions" from (select * from org_member where id in (RAW_VALUE) ) om;

-- statementId: updateMemberWelfare.update
-- lookupStatementId: updateMemberWelfare.update
-- source: welfare_sqlmap.xml
-- type: update
-- params: {
--   "welfareDetail": "VALUE_001",
--   "kind": "VALUE_001",
--   "paperVoucher": "VALUE_001",
--   "electCert": "VALUE_001",
--   "other": "VALUE_001",
--   "allowance": "VALUE_001",
--   "refund": "VALUE_001",
--   "id": 1001
-- }
update VM_MEMBERWELFAREANAPROJECT t set t.welfareDetail = 'VALUE_001',t.kind='VALUE_001', t.paperVoucher='VALUE_001', t.electCert = 'VALUE_001', t.other='VALUE_001', t.allowance='VALUE_001', t.refund='VALUE_001' where t.templateNo = (select projectCode from vm_welfareanaproject where id = 1001);

-- statementId: updateMemberNoticeSign.update
-- lookupStatementId: updateMemberNoticeSign.update
-- source: welfare_sqlmap.xml
-- type: update
-- params: {
--   "expireNoticeSign": "VALUE_001",
--   "id": 1001
-- }
update VM_MEMBERWELFAREANAPROJECT t set t.expireNoticeSign = 'VALUE_001' where t.id = 1001;

-- statementId: addWelfareNoticeSon.insert
-- lookupStatementId: addWelfareNoticeSon.insert
-- source: welfare_sqlmap.xml
-- type: insert
-- params: {
--   "formmain_id": 1001,
--   "memberDept": "VALUE_001",
--   "receivedMembers": "VALUE_001"
-- }
insert into vm_welfareNoticeSend_son(id,formmain_id,memberDept, receivedMembers ) values(util_common.getAbsID, 1001, 'VALUE_001', 'VALUE_001' );

-- statementId: findSendNoticeBySendId.select
-- lookupStatementId: findSendNoticeBySendId.select
-- source: welfare_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id as "id", writer as "writer", writeDate as "writeDate", projectCode as "projectCode", annual as "annual", welfareName as "welfareName", noticeAccess as "noticeAccess", noticeType as "noticeType", receiverType as "receiverType", customReceiver as "customReceiver", removeMember as "removeMember", noticeTitle as "noticeTitle", noticeContent as "noticeContent", noticeFile as "noticeFile" from vm_welfareNoticeSend where id = 'VALUE_001';

-- statementId: deleteWelfareNoticeSonEmpty.delete
-- lookupStatementId: deleteWelfareNoticeSonEmpty.delete
-- source: welfare_sqlmap.xml
-- type: delete
-- params: {}
delete from vm_welfareNoticeSend_son where memberDept is null;

-- statementId: deleteWelfareNoticeSonByFormmainId.delete
-- lookupStatementId: deleteWelfareNoticeSonByFormmainId.delete
-- source: welfare_sqlmap.xml
-- type: delete
-- params: {
--   "formmainId": 1001
-- }
delete from vm_welfareNoticeSend_son where formmain_id = 1001;

-- statementId: getSendFlowBySendId.select
-- lookupStatementId: getSendFlowBySendId.select
-- source: welfare_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select writer as "writer", writeDate as "writeDate", projectCode as "projectCode", annual as "annual", welfareName as "welfareName", noticeAccess as "noticeAccess", noticeType as "noticeType", receiver as "receiver", memberDept as "memberDept", noticeContent as "noticeContent", customOptions as "customOptions", noticeFile as "noticeFile", validityPeriod as "validityPeriod", noticeTitle as "noticeTitle", sendId as "sendId" from vm_wf_welfareNotice where sendId = 'VALUE_001';

-- statementId: getSendSonByFormmainId.select
-- lookupStatementId: getSendSonByFormmainId.select
-- source: welfare_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select memberDept as "memberDept", receivedMembers as "receivedMembers" from vm_welfareNoticeSend_son where formmain_id = 'VALUE_001';

-- statementId: getWelfareTemplateManager.select
-- lookupStatementId: getWelfareTemplateManager.select
-- source: welfare_sqlmap.xml
-- type: select
-- params: {}
select objective0_id from org_relationship where source_id = (select id from org_team where name = 'DP-用工管理-福利项目模板管理员') and type = 'Team_Member';

-- statementId: welfarePublish.select
-- lookupStatementId: welfarePublish.select
-- source: welfare_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select projectStatus from vm_welfareanaproject where projectStatus = 3414263659243327335 and projectCode = 'VALUE_001' and annual = 'VALUE_001';

-- statementId: selectAnaWelfareProject.select
-- lookupStatementId: selectAnaWelfareProject.select
-- source: welfare_sqlmap.xml
-- type: select
-- params: {
--   "templateNo": "VALUE_001",
--   "year": "VALUE_001"
-- }
select writer as "writer", writeDate as "writeDate", projectCode as "projectCode", templateNo as "templateNo", annual as "annual", projectStatus as "projectStatus", launchDate as "launchDate", endDate as "endDate", welfareName as "welfareName", welfareType as "welfareType", welfareProvider as "welfareProvider", welfareManager as "welfareManager", welfareManageDept as "welfareManageDept", welfareAccess as "welfareAccess", welfareScope as "welfareScope", welfareDeclaration as "welfareDeclaration", welfareDetail as "welfareDetail", publishDate as "publishDate", userValidity as "userValidity", notifyDayLimit as "notifyDayLimit", notifyType as "notifyType", expenseIndicator as "expenseIndicator", traceUseOrNot as "traceUseOrNot", sendCredential as "sendCredential", otherAttachment as "otherAttachment", note as "note", welfareDetailType as "welfareDetailType", refund as "refund", kind as "kind", paperVoucher as "paperVoucher", electCert as "electCert", other as "other", allowance as "allowance", welfareLaunchParamCode as "welfareLaunchParamCode", welfareLimit as "welfareLimit" from vm_welfareanaproject where templateNo = 'VALUE_001' and annual = 'VALUE_001';

-- statementId: welfareTemplateByTemplateCode.select
-- lookupStatementId: welfareTemplateByTemplateCode.select
-- source: welfare_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select writer, /*填写人*/ writeDate, /*填写日期*/ templateNo, /*模板编号*/ templateStatus, /*模板状态*/ welfareName, /*福利名称*/ welfareType, /*项目类型*/ welfareProvider, /*福利来源*/ welfareManager, /*项目负责人*/ welfareManageDept, /*项目负责部门*/ publishDate, /*发布日期*/ abolishDate, /*废止日期*/ empStatus, /*员工状态*/ empType, /*员工类别*/ welfareAccess, /*获取方式*/ provideDeclaration, /*发放说明*/ welfareDeclaration, /*享有说明*/ welfareDetail, /*福利内容*/ endDate, /*结束日期*/ traceUseOrNot, /*是否跟踪使用情况*/ notifyDayLimit, /*到期前第N天提醒*/ notifyType, /*到期提醒方式*/ expenseIndicator, /*报销指标*/ autoStartOrNot, /*是否自动启动年度福利项目*/ remark, /*备注*/ welfareDetailType, /*福利细项分类*/ autoUpdateWelfareScope, /*是否自动更新福利享有人范围*/ jobstatus from vm_welfaretemplate where templateNo = 'VALUE_001';

-- statementId: findAnaWelfareTemplate.select
-- lookupStatementId: findAnaWelfareTemplate.select
-- source: welfare_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select util_common.getID, f.state,f.start_member_id,f.start_date,f.approve_member_id,f.approve_date,f.finishedflag,f.ratifyflag,f.ratify_member_id,f.ratify_date,f.sort,f.modify_member_id,f.modify_date, writer, /*填写人 */ writeDate, /*填写日期*/ templateNo, /*模板编号*/ '5820848606789060598' projectStatus, /*项目状态*/ launchDate, /*启动日期*/ abolishDate as endDate, /*结束日期*/ f.welfareName, /*福利名称*/ welfareType, /*项目类型*/ welfareProvider, /*福利来源*/ welfareManager, /*项目负责人*/ welfareManageDept, /*项目负责部门*/ welfareAccess, /*福利获取方式*/ f.welfareScope, /*享有范围说明*/ welfareDeclaration, /*享有说明*/ f.welfareDetail, /*福利内容*/ publishDate, /*发放时间*/ endDate as userValidity, notifyDayLimit, /*到期前N天提醒*/ notifyType, /*到期提醒方式*/ expenseIndicator, /*报销指标*/ traceUseOrNot, /*是否跟踪使用情况*/ welfareDetailType, /*福利细项分类*/ refund, /*报销*/ kind, /*福利发放形式_实物 */ paperVoucher,/*福利发放形式_纸质提取凭证 */ electCert, /*福利发放形式_电子提取凭证 */ other, /*福利发放形式_其他 */ allowance,/*津贴*/ welfareLaunchParamCode, util_common.getEnumShowById(annual) annual from vm_welfareLaunchParam f left join vm_welfaretemplate f2 on f.welfareTemplateNo = f2.templateNo where f.id = 'VALUE_001';

-- statementId: anaWelfareTemplate.insert
-- lookupStatementId: anaWelfareTemplate.insert
-- source: welfare_sqlmap.xml
-- type: insert
-- params: {
--   "id": 1001,
--   "state": 1,
--   "start_member_id": 1001,
--   "start_date": "2026-05-14",
--   "approve_member_id": 1001,
--   "approve_date": "2026-05-14",
--   "finishedflag": 1,
--   "ratifyflag": 1,
--   "ratify_member_id": 1001,
--   "ratify_date": "2026-05-14",
--   "writer": "VALUE_001",
--   "writeDate": "2026-05-14",
--   "projectCode": "CODE_001",
--   "templateNo": "VALUE_001",
--   "annual": "VALUE_001",
--   "projectStatus": 1,
--   "launchDate": "2026-05-14",
--   "endDate": "2026-05-14",
--   "welfareName": "NAME_001",
--   "welfareType": "VALUE_001",
--   "welfareProvider": 1001,
--   "welfareManager": "VALUE_001",
--   "welfareManageDept": "VALUE_001",
--   "welfareAccess": "VALUE_001",
--   "welfareScope": "VALUE_001",
--   "welfareDeclaration": "VALUE_001",
--   "welfareDetail": "VALUE_001",
--   "publishDate": "2026-05-14",
--   "userValidity": 1001,
--   "notifyDayLimit": "VALUE_001",
--   "notifyType": "VALUE_001",
--   "expenseIndicator": "VALUE_001",
--   "traceUseOrNot": "VALUE_001",
--   "sendCredential": "VALUE_001",
--   "otherAttachment": "VALUE_001",
--   "note": "VALUE_001",
--   "welfareDetailType": "VALUE_001",
--   "refund": "VALUE_001",
--   "kind": "VALUE_001",
--   "paperVoucher": "VALUE_001",
--   "electCert": "VALUE_001",
--   "other": "VALUE_001",
--   "allowance": "VALUE_001",
--   "welfareLaunchParamCode": "CODE_001"
-- }
insert into vm_welfareanaproject (id, state, start_member_id, start_date, approve_member_id, approve_date, finishedflag, ratifyflag, ratify_member_id, ratify_date, writer, writeDate, projectCode, templateNo, annual, projectStatus, launchDate, endDate, welfareName, welfareType, welfareProvider, welfareManager, welfareManageDept, welfareAccess, welfareScope, welfareDeclaration, welfareDetail, publishDate, userValidity, notifyDayLimit, notifyType, expenseIndicator, traceUseOrNot, sendCredential, otherAttachment, note, welfareDetailType, refund, kind, paperVoucher, electCert, other, allowance, welfareLaunchParamCode) values( 1001, 1, 1001, '2026-05-14', 1001, '2026-05-14', 1, 1, 1001, '2026-05-14', 'VALUE_001', '2026-05-14', 'CODE_001', 'VALUE_001', 'VALUE_001', 1, '2026-05-14', '2026-05-14', 'NAME_001', 'VALUE_001', 1001, 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', '2026-05-14', 1001, 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'CODE_001' );

-- statementId: welfareLaunchParam.select
-- lookupStatementId: welfareLaunchParam.select
-- source: welfare_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select * from vm_welfareLaunchParam c where c.id = 'VALUE_001';

-- statementId: findWelfareLaunchParamByParamCode.select
-- lookupStatementId: findWelfareLaunchParamByParamCode.select
-- source: welfare_sqlmap.xml
-- type: select
-- params: {
--   "welfareLaunchParamCode": "CODE_001",
--   "templateNo": "VALUE_001",
--   "launchDate": "2026-05-14"
-- }
select * from vm_welfareLaunchParam c where c.welfareLaunchParamCode = 'CODE_001' and c.welfareTemplateNo = 'VALUE_001' and c.launchDate = '2026-05-14';

-- statementId: findAllWelfareMembers.select
-- lookupStatementId: findAllWelfareMembers.select
-- source: welfare_sqlmap.xml
-- type: select
-- params: {
--   "empStatus": 1,
--   "empType": "VALUE_001",
--   "candidate": "RAW_VALUE",
--   "jobStatus": 1,
--   "entryAfter": "VALUE_001",
--   "leaveBefore": "VALUE_001",
--   "sex": "VALUE_001",
--   "accounts": 7,
--   "departs": "RAW_VALUE"
-- }
select name, to_char(id) as memberId, decode(om.EXT_ATTR_11,1,'7239782878276897215',2,'8220392701272345167') sex, EXT_ATTR_22 entryDate, to_char(certType) certType, to_char(officePlace) officePlace, to_char(empType) empType, to_char(empStatus) empStatus, to_char(certNo) certNo, jobNo, age, to_char(om.org_department_id) departId, to_char(om.EXT_ATTR_1) phone from org_member om left join (select member_id as memberId, util_common.getEnumIdByShow('-6813491134100848299', EXT_ATTR_1) as certType, EXT_ATTR_2 as certNo, util_common.getEnumIdByShow('4660073417407942090', EXT_ATTR_3) as officePlace, EXT_ATTR_3 as officePlaceStr, EXT_ATTR_21 leavedate, util_common.getEnumIdByShow('5543612524301798252', EXT_ATTR_4) as empStatus, util_common.getEnumIdByShow('-8502381049250430350', EXT_ATTR_5) as empType, EXT_ATTR_6 jobNo, to_char(EXT_ATTR_11) age, util_common.getEnumIdByShow('550588585453240646', EXT_ATTR_8) as jobStatus from addressbook) oc on om.id = oc.memberId where om.code is not null AND empStatus = 1 AND empType = 'VALUE_001' AND id in (RAW_VALUE) AND jobStatus = 1 AND EXT_ATTR_22 is not null and om.EXT_ATTR_22 < 'VALUE_001' AND leavedate is not null and leavedate > 'VALUE_001' AND om.EXT_ATTR_11 = util_common.getEnumValueById('VALUE_001') AND om.org_account_id in (7) AND om.org_department_id in (RAW_VALUE);

-- statementId: welfareMemberProject.insert
-- lookupStatementId: welfareMemberProject.insert
-- source: welfare_sqlmap.xml
-- type: insert
-- params: {
--   "id": 1001,
--   "state": 1,
--   "start_member_id": 1001,
--   "start_date": "2026-05-14",
--   "approve_member_id": 1001,
--   "approve_date": "2026-05-14",
--   "finishedflag": 1,
--   "ratifyflag": 1,
--   "ratify_member_id": 1001,
--   "ratify_date": "2026-05-14",
--   "writer": "VALUE_001",
--   "writeDate": "2026-05-14",
--   "welfareMember": "VALUE_001",
--   "belongDepart": "VALUE_001",
--   "certType": "VALUE_001",
--   "certNo": "VALUE_001",
--   "sex": "VALUE_001",
--   "age": "VALUE_001",
--   "phone": "VALUE_001",
--   "officePlace": "VALUE_001",
--   "jobNo": "VALUE_001",
--   "projectCode": "CODE_001",
--   "templateNo": "VALUE_001",
--   "memberProTemNo": "VALUE_001",
--   "annual": "VALUE_001",
--   "projectStatus": 1,
--   "launchDate": "2026-05-14",
--   "endDate": "2026-05-14",
--   "welfareName": "NAME_001",
--   "welfareType": "VALUE_001",
--   "welfareProvider": 1001,
--   "welfareManager": "VALUE_001",
--   "welfareManageDept": "VALUE_001",
--   "welfareAccess": "VALUE_001",
--   "provideDeclaration": 1001,
--   "welfareDetail": "VALUE_001",
--   "publishDate": "2026-05-14",
--   "userValidity": 1001,
--   "useState": 1,
--   "useDesc": "VALUE_001",
--   "note": "VALUE_001",
--   "welfareDetailType": "VALUE_001",
--   "refund": "VALUE_001",
--   "allowance": "VALUE_001",
--   "kind": "VALUE_001",
--   "paperVoucher": "VALUE_001",
--   "electCert": "VALUE_001",
--   "other": "VALUE_001"
-- }
insert into vm_memberWelfareAnaProject ( id, state, start_member_id, start_date, approve_member_id, approve_date, finishedflag, ratifyflag, ratify_member_id, ratify_date, writer, writeDate, welfareMember, belongDepart, certType, certNo, sex, age, phone, officePlace, jobNo, projectCode, templateNo, memberProTemNo, annual, projectStatus, launchDate, endDate, welfareName, welfareType, welfareProvider, welfareManager, welfareManageDept, welfareAccess, provideDeclaration, welfareDetail, publishDate, userValidity, useState, useDesc, note, welfareDetailType, refund, allowance, kind, paperVoucher, electCert, other ) values ( 1001, 1, 1001, '2026-05-14', 1001, '2026-05-14', 1, 1, 1001, '2026-05-14', 'VALUE_001', '2026-05-14', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'CODE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 1, '2026-05-14', '2026-05-14', 'NAME_001', 'VALUE_001', 1001, 'VALUE_001', 'VALUE_001', 'VALUE_001', 1001, 'VALUE_001', '2026-05-14', 1001, 1, 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001' );

-- statementId: getExpiredAnnualProject.select
-- lookupStatementId: getExpiredAnnualProject.select
-- source: welfare_sqlmap.xml
-- type: select
-- params: {}
select * from vm_welfareanaproject t where t.notifyDayLimit is not null and (sysdate + t.notifyDayLimit) > t.userValidity;

-- statementId: getAnnualProjectById.select
-- lookupStatementId: getAnnualProjectById.select
-- source: welfare_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select * from vm_welfareanaproject t where id = 'VALUE_001';

-- statementId: getExpiredMemberProjectByProjectCode.select
-- lookupStatementId: getExpiredMemberProjectByProjectCode.select
-- source: welfare_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select * from vm_memberWelfareAnaProject where projectCode = 'VALUE_001' and (useState != 2782513347324168557 or useState is null) and expireNoticeSign is null;

-- statementId: getMemberProjectByProjectCode.select
-- lookupStatementId: getMemberProjectByProjectCode.select
-- source: welfare_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select * from vm_memberWelfareAnaProject where projectCode = 'VALUE_001';

-- statementId: welfareComBo.select
-- lookupStatementId: welfareComBo.select
-- source: welfare_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select welfareName, welfareProjectNo, welfareTemplateNo, decode(welfareCollectType,'-5882605069132150577','simpleName','666523131850541020','fullName') welfareCollectType, comBoSimpleName, comBoFullName , comBoDesc , comSort from vm_welfareCustomMain f1 left join vm_welfareCustomComBoInfo f2 on f1.id = f2.formmain_id where f1.id = 'VALUE_001' order by f2.comSort;

-- statementId: welfareComBoAttr.select
-- lookupStatementId: welfareComBoAttr.select
-- source: welfare_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id, comSort, comBoSimpleName, attrName, attrShowType, attrSpecification, attrCollectType, attrSort, attrDesc from ( select f3.id, f1.comSort, f2.comBoSimpleName, f2.attrName, decode(f2.attrShowType,'-3366012584125707175','checkbox','941334865640966317','select-one','-1251546937502316657','radio','3300527163351321836','text') attrShowType, f2.attrSpecification, decode(f2.attrCollectType, '2149214062505119170','attrValue','-7323070633672619194','all','7437882944470139590','attrText' ) attrCollectType, f2.attrSort, f2.attrDesc from vm_welfareCustomComBoInfo f1 left join vm_welfareCustomComBoAttr f2 on f1.formmain_id = f2.formmain_id and f1.combosimplename = f2.comBoSimpleName left join vm_welfareCustomMain f3 on f3.id = f2.formmain_id union all select distinct f2.formmain_id id, f1.comSort, f1.comBoSimpleName, f2.attrName, decode(f2.attrShowType,'-3366012584125707175','checkbox','941334865640966317','select-one','-1251546937502316657','radio','3300527163351321836','text') attrShowType, f2.attrSpecification, decode(f2.attrCollectType, '2149214062505119170','attrValue','-7323070633672619194','all','7437882944470139590','attrText' ) attrCollectType, f2.attrSort, f2.attrDesc from vm_welfareCustomComBoInfo f1 left join vm_welfareCustomcommonAttr f2 on 1 = 1 where f2.attrShowType is not null) t where t.id = 'VALUE_001' order by comsort , attrSort;

-- statementId: queryTemplate.select
-- lookupStatementId: queryTemplate.select
-- source: welfare_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id from( select * from vm_welfareCustomMain f where f.welfareTemplateNo = 'VALUE_001' order by start_date desc) where rownum =1;

-- statementId: existMemberWelfareProject.select
-- lookupStatementId: existMemberWelfareProject.select
-- source: welfare_sqlmap.xml
-- type: select
-- params: {
--   "projectCode": "CODE_001",
--   "annual": "VALUE_001",
--   "templateNo": "VALUE_001",
--   "welfareMember": "VALUE_001"
-- }
select count(1) from vm_memberWelfareAnaProject where ((projectCode = 'CODE_001') or (annual = 'VALUE_001' and templateNo = 'VALUE_001')) and welfareMember = 'VALUE_001';

-- statementId: queryAutoStartWelfareTemplate.select
-- lookupStatementId: queryAutoStartWelfareTemplate.select
-- source: welfare_sqlmap.xml
-- type: select
-- params: {}
select writer, /*填写人*/ writeDate, /*填写日期*/ templateNo, /*模板编号*/ templateStatus, /*模板状态*/ welfareName, /*福利名称*/ welfareType, /*项目类型*/ welfareProvider, /*福利来源*/ welfareManager, /*项目负责人*/ welfareManageDept, /*项目负责部门*/ publishDate, /*发布日期*/ abolishDate, /*废止日期*/ empStatus, /*员工状态*/ empType, /*员工类别*/ welfareAccess, /*获取方式*/ provideDeclaration, /*发放说明*/ welfareDeclaration, /*享有说明*/ welfareDetail, /*福利内容*/ endDate, /*结束日期*/ traceUseOrNot, /*是否跟踪使用情况*/ notifyDayLimit, /*到期前第N天提醒*/ notifyType, /*到期提醒方式*/ expenseIndicator, /*报销指标*/ autoStartOrNot, /*是否自动启动年度福利项目*/ remark, /*备注*/ welfareDetailType, /*福利细项分类*/ autoUpdateWelfareScope /*是否自动更新福利享有人范围*/ from vm_welfaretemplate wft where (wft.templateNo in (select templateNo from (select wfp.templateNo as templateNo, (months_between(sysdate, wfp.endDate) / 12) as overYears, row_number() over(partition by wfp.templateNo order by wfp.enddate desc) as rowno from vm_welfareanaproject wfp) where rowno = 1 and overYears > 0 ) or wft.templateNo not in (select distinct templateNo from vm_welfareanaproject) ) and wft.autoStartOrNot = -3841538853571705149 and wft.welfareType = 4352357452840780248;

-- statementId: queryAutoStartWelfareProject.select
-- lookupStatementId: queryAutoStartWelfareProject.select
-- source: welfare_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select util_common.getID, state,start_member_id,start_date,approve_member_id,approve_date,finishedflag,ratifyflag,ratify_member_id,ratify_date,sort,modify_member_id,modify_date, writer, /*填写人 */ writeDate, /*填写日期*/ templateNo, /*模板编号*/ '5820848606789060598' projectStatus, /*项目状态*/ sysdate as launchDate, /*启动日期*/ abolishDate as endDate, /*结束日期*/ welfareName, /*福利名称*/ welfareType, /*项目类型*/ welfareProvider, /*福利来源*/ welfareManager, /*项目负责人*/ welfareManageDept, /*项目负责部门*/ welfareAccess, /*福利获取方式*/ empStatus, /*人员状态*/ empType,/*人员类型*/ welfareDeclaration, /*享有说明*/ welfareDetail, /*福利内容*/ endDate as userValidity, publishDate, /*发放时间*/ notifyDayLimit, /*到期前N天提醒*/ notifyType, /*到期提醒方式*/ expenseIndicator, /*报销指标*/ traceUseOrNot, /*是否跟踪使用情况*/ welfareDetailType, /*福利细项分类*/ to_char(sysdate,'yyyy') annual from vm_welfaretemplate where templateNo = 'VALUE_001';

-- statementId: queryWelfareCollectMember.select
-- lookupStatementId: queryWelfareCollectMember.select
-- source: welfare_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id, welfareCustomSendNo, util_user.getMemCodeByMemId(writer) as senUserNo, writeDate , anaTemplateNo , welfareYear, welfareName , templateNo , customSelectDesc , to_char(isExportLastResult) isExportLastResult, attachmentId, collectName, collectCode, onlySendMember, filterMember from vm_welfareCustomCollectSend where id = 'VALUE_001';

-- statementId: customCollectMember.select
-- lookupStatementId: customCollectMember.select
-- source: welfare_sqlmap.xml
-- type: select
-- params: {
--   "ATTACHMENTID": 1001,
--   "ID": 1001,
--   "SENUSERNO": "VALUE_001",
--   "CUSTOMSELECTDESC": "VALUE_001",
--   "WELFARECUSTOMSENDNO": "VALUE_001",
--   "COLLECTNAME": "NAME_001",
--   "COLLECTCODE": "CODE_001",
--   "ANATEMPLATENO": "VALUE_001",
--   "ONLYSENDMEMBER": "RAW_VALUE",
--   "FILTERMEMBER": "RAW_VALUE"
-- }
select nvl(1001, ' ') AS attachmentId, 1001 as welfareCollectSendKeyId, id as welfareMemberDocId, 'WF_CUSTOMCOLLECT_T01' flowType, 'VALUE_001' as sendUserNo, to_char(sysdate, 'yyyy-mm-dd') as sendDate, projectCode as anaTemplateNo, annual as welfareYear, welfareName as welfareName, templateNo as templateNo, welfareMember as welfareMember, belongDepart as welfareMemberDepart, 'VALUE_001' as customSelectDesc, 'VALUE_001' || welfareMember as flowId, 'NAME_001' collectName, 'CODE_001' collectCode, 'VALUE_001' sendFlowId from vm_memberwelfareanaproject f where f.projectCode = 'VALUE_001' AND f.welfareMember in (RAW_VALUE) AND f.welfareMember not in (RAW_VALUE);

-- statementId: welfareLastCollectResult
-- lookupStatementId: welfareLastCollectResult
-- source: welfare_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select t.welfareMember,t.customCollectJson from (select f.*, row_number() over(partition by f.welfareMember order by annual desc) rn from vm_memberwelfareanaproject f where templateNo = 'VALUE_001' and f.customCollectJson is not null) t where t.rn=1;

-- statementId: customCollectDepartMemberSend.delete
-- lookupStatementId: customCollectDepartMemberSend.delete
-- source: welfare_sqlmap.xml
-- type: delete
-- params: "VALUE_001"
delete from vm_welfareCustomCollectSendSon where belongDepart is null;

-- statementId: welfareSendDoc.select
-- lookupStatementId: welfareSendDoc.select
-- source: welfare_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select count('x') from vm_welfareCustomMain c where c.welfareTemplateNo = 'VALUE_001';

-- statementId: customCollectSendDepartMember.select
-- lookupStatementId: customCollectSendDepartMember.select
-- source: welfare_sqlmap.xml
-- type: select
-- params: {
--   "id": 1001,
--   "depart": "VALUE_001"
-- }
select id,formmain_id,belongDepart,nofeedback,feedBackEmp from vm_welfareCustomCollectSendSon c where c.formmain_id = 1001 and c.belongDepart = 'VALUE_001';

-- statementId: customCollectSendDepartMember.insert
-- lookupStatementId: customCollectSendDepartMember.insert
-- source: welfare_sqlmap.xml
-- type: insert
-- params: {
--   "id": 1001,
--   "depart": "VALUE_001",
--   "members": "VALUE_001"
-- }
insert into vm_welfareCustomCollectSendSon f (f.id, f.formmain_id, f.belongDepart, f.nofeedback ) values ( util_common.getAbsID, 1001, 'VALUE_001', 'VALUE_001' );

-- statementId: customCollectSendDepartMember.update
-- lookupStatementId: customCollectSendDepartMember.update
-- source: welfare_sqlmap.xml
-- type: update
-- params: {
--   "members": "VALUE_001",
--   "id": 1001,
--   "depart": "VALUE_001"
-- }
update vm_welfareCustomCollectSendSon c set nofeedback = 'VALUE_001' where c.formmain_id = 1001 and c.belongDepart = 'VALUE_001';

-- statementId: analProjectStatus.update
-- lookupStatementId: analProjectStatus.update
-- source: welfare_sqlmap.xml
-- type: update
-- params: {
--   "projectStatus": 1,
--   "publishDate": "2026-05-14",
--   "userValidity": 1001,
--   "projectCode": "CODE_001"
-- }
update vm_welfareanaproject set projectStatus = 1 ,publishDate = to_date('2026-05-14','yyyy-mm-dd') ,userValidity = to_date(1001,'yyyy-mm-dd') where projectCode = 'CODE_001';

-- statementId: memberProjectStatus.update
-- lookupStatementId: memberProjectStatus.update
-- source: welfare_sqlmap.xml
-- type: update
-- params: {
--   "projectStatus": 1,
--   "publishDate": "2026-05-14",
--   "userValidity": 1001,
--   "projectCode": "CODE_001"
-- }
update vm_memberwelfareanaproject set projectStatus = 1 ,publishDate = to_date('2026-05-14','yyyy-mm-dd') ,userValidity = to_date(1001,'yyyy-mm-dd') where projectCode = 'CODE_001';

-- statementId: updateWelfareUseStatus.update
-- lookupStatementId: updateWelfareUseStatus.update
-- source: welfare_sqlmap.xml
-- type: update
-- params: {
--   "useState": 1,
--   "useDesc": "VALUE_001",
--   "welfareId": 1001,
--   "userPhone": "VALUE_001",
--   "userId": 1001
-- }
update vm_memberwelfareanaproject t set t.useState = 1,t.useDesc='VALUE_001' where t.projectCode = (select projectCode from vm_welfareanaproject where id = 1001) and (t.welfareMember = (select id from org_member o where o.Ext_Attr_1 = 'VALUE_001') or t.welfareMember = 1001);

-- statementId: getWelfareRefundRelationList.select
-- lookupStatementId: getWelfareRefundRelationList.select
-- source: welfare_sqlmap.xml
-- type: select
-- params: {}
select welfareName as "welfareName", interfaceProvider as "interfaceProvider", oaWelfareCode as "oaWelfareCode", interfaceWelfareCode as "interfaceWelfareCode", interfaceSonCode as "interfaceSonCode" from vm_welfareRefundRelation;

-- statementId: addWelfareRefundLog.insert
-- lookupStatementId: addWelfareRefundLog.insert
-- source: welfare_sqlmap.xml
-- type: insert
-- params: {
--   "templateNo": "VALUE_001",
--   "interfaceProvider": 1001,
--   "interfaceSonCode": "CODE_001",
--   "year": "VALUE_001",
--   "memberId": 1001,
--   "memberCode": "CODE_001",
--   "welfareState": 1,
--   "welfareDetail": "VALUE_001",
--   "welfareAccess": "VALUE_001",
--   "useState": 1,
--   "useDesc": "VALUE_001",
--   "limit": "VALUE_001",
--   "projectCode": "CODE_001",
--   "userValidity": 1001,
--   "endDate": "2026-05-14"
-- }
insert into vm_welfareRefundDataLog ( id, state, start_member_id, start_date, approve_member_id, approve_date, finishedflag, ratifyflag, ratify_member_id, ratify_date, sort, modify_member_id, modify_date, taskDate, welfareName, interfaceProvider, oaWelfareCode, interfaceWelfareCode, interfaceSonCode, year, memberId, memberCode, welfareState, welfareDetail, welfareAccess, useState, useDesc, limit, projectCode, userValidity, endDate ) values ( util_common.getAbsID, 1, -6760911671874597139, sysdate, 0, sysdate, 0, 0, 0, null, 0, -6760911671874597139, sysdate, sysdate, (select welfareName from vm_welfaretemplate where templateNo = 'VALUE_001') , 1001, 'VALUE_001', '', 'CODE_001', 'VALUE_001', 1001, 'CODE_001', 1, 'VALUE_001', 'VALUE_001', 1, 'VALUE_001', 'VALUE_001', 'CODE_001', 1001, '2026-05-14' );

-- statementId: updateMemberWelfareLimit.update
-- lookupStatementId: updateMemberWelfareLimit.update
-- source: welfare_sqlmap.xml
-- type: update
-- params: {}
merge into vm_memberWelfareAnaProject t using (select distinct wrl.welfareName as welfareName, wrl.interfaceProvider as interfaceProvider, wrl.oaWelfareCode as oaWelfareCode, wrl.interfaceWelfareCode as interfaceWelfareCode, wrl.interfaceSonCode as interfaceSonCode, wrl.year as year, wrl.memberId as memberId, wrl.memberCode as memberCode, wrl.welfareState as welfareState, wrl.limit as limit, mwi.sex as sex, mwi.entryDate as entryDate, mwi.certType as certType, mwi.officePlace as officePlace, mwi.empType as empType, mwi.empStatus as empStatus, mwi.certNo as certNo, mwi.jobNo as jobNo, mwi.age as age, mwi.departId as departId, mwi.phone as phone, wrl.welfareDetail as welfareDetail, wrl.welfareAccess as welfareAccess, wrl.useState as useState, wrl.useDesc as useDesc, wrl.projectCode as projectCode, wrl.userValidity as userValidity, wrl.endDate as endDate from vm_welfareRefundDataLog wrl left join vm_memberWholeInfo mwi on wrl.memberId = mwi.memberId where to_char(sysdate,'yyyy-mm-dd') = to_char(wrl.taskDate,'yyyy-mm-DD') ) r on( r.year = t.annual and t.templateNo = r.oaWelfareCode and r.memberId = t.welfareMember and t.annual is not null and t.templateNo is not null and t.welfareMember is not null ) when matched then update set t.consumedLimit = r.limit, t.useDesc = r.useDesc, t.useState = r.useState, t.welfareDetail = r.welfareDetail, t.welfareLimit = r.limit when not matched then insert(id, state , start_member_id , start_date , approve_member_id , approve_date , finishedflag , ratifyflag , ratify_member_id , ratify_date , sort , modify_member_id , modify_date , certType , certNo , sex , age , phone, officePlace , jobNo , projectCode, templateNo , memberProTemNo , annual , projectStatus , launchDate , welfareName , welfareDetail, welfareMember, welfareAccess, useState, useDesc, userValidity, endDate, welfarelimit ) values (util_common.getAbsID, 1, -6760911671874597139, sysdate, 0, sysdate, 0, 0, 0, null, 0, -6760911671874597139, sysdate, -r.certType, r.certNo, r.sex, r.age, r.phone, r.officePlace, r.jobNo, r.projectCode, r.oaWelfareCode, '', r.year, '3414263659243327335', sysdate, r.welfareName, r.welfareDetail, r.memberId, r.welfareAccess, r.useState, r.useDesc, r.userValidity, r.endDate, r.limit );

-- statementId: deleteExpiredRefundData.delete
-- lookupStatementId: deleteExpiredRefundData.delete
-- source: welfare_sqlmap.xml
-- type: delete
-- params: "VALUE_001"
delete from vm_welfareRefundDataLog where taskDate < sysdate - 'VALUE_001';

-- statementId: findSendAllowanceBySerialNum.select
-- lookupStatementId: findSendAllowanceBySerialNum.select
-- source: welfare_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id as "id", serialNo as "serialNo", writer as "writer", writeDate as "writeDate", writeDept as "writeDept", sendAccount as "sendAccount", sendDept as "sendDept", removeDept as "removeDept", title as "title", applyEndDate as "applyEndDate" from vm_welfareAllowanceSend where serialNo = 'VALUE_001';

-- statementId: findSendAllowanceById.select
-- lookupStatementId: findSendAllowanceById.select
-- source: welfare_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id as "id", serialNo as "serialNo", writer as "writer", writeDate as "writeDate", writeDept as "writeDept", sendAccount as "sendAccount", sendDept as "sendDept", removeDept as "removeDept", title as "title", applyEndDate as "applyEndDate" from vm_welfareAllowanceSend where id = 'VALUE_001';

-- statementId: findSendAllowanceDeptSonBySerialNum.select
-- lookupStatementId: findSendAllowanceDeptSonBySerialNum.select
-- source: welfare_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id as "id", sendDepts as "sendDepts", sendState as "sendState" from vm_welfareAllowanceSend_dept where formmain_Id = 'VALUE_001' and sendDepts is not null;

-- statementId: findSendAllowanceDept.select
-- lookupStatementId: findSendAllowanceDept.select
-- source: welfare_sqlmap.xml
-- type: select
-- params: {
--   "sendAccount": 7,
--   "sendDept": "RAW_VALUE",
--   "removeDept": "RAW_VALUE"
-- }
select util_org.getLeaderMemIdByDeptId(id) as "leaderId",id as "deptId" from org_unit where id not in (select org_departMent_id org_departMent_id from org_member where is_enable =1 group by org_departMent_id having count(1) = 1 ) and (1=0 or org_account_id in(SELECT id FROM vm_org_unit START WITH ID in (7) CONNECT BY parent_Id = PRIOR ID) or id in(RAW_VALUE) ) and id not in(RAW_VALUE) and util_org.getLeaderMemIdByDeptId(id) is not null and is_enable = 1 and is_deleted=0 and is_internal =1;

-- statementId: initAllowanceSendDeptSon.insert
-- lookupStatementId: initAllowanceSendDeptSon.insert
-- source: welfare_sqlmap.xml
-- type: insert
-- params: {
--   "formmainId": 1001,
--   "sendDepts": "VALUE_001"
-- }
insert into vm_welfareAllowanceSend_dept (id,formmain_Id,sendDepts,sendState ) values( util_common.getAbsID, 1001, 'VALUE_001', -1089048568118490234 );

-- statementId: updateAllowanceSendDeptSon.update
-- lookupStatementId: updateAllowanceSendDeptSon.update
-- source: welfare_sqlmap.xml
-- type: update
-- params: {
--   "formmainId": 1001,
--   "sendDepts": "VALUE_001"
-- }
update vm_welfareAllowanceSend_dept set sendState = -3841538853571705149 where formmain_Id = 1001 and sendDepts = 'VALUE_001';

-- statementId: findProceedingAllowanceBySerialNum.select
-- lookupStatementId: findProceedingAllowanceBySerialNum.select
-- source: welfare_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select * from col_summary where form_recordId in (select id from vm_welfareAllowanceApply where sendSerialNo = 'VALUE_001') and state = 0;

-- statementId: findAllowanceApplyBySerialNum.select
-- lookupStatementId: findAllowanceApplyBySerialNum.select
-- source: welfare_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id as "id", serialNo as "serialNo", writer as "writer", writeDate as "writeDate", writeDept as "writeDept", writeAccount as "writeAccount", title as "title", applyDept as "applyDept", welfareTemplateNo as "welfareTemplateNo", anual as "anual", appplyOrNot as "appplyOrNot", executor as "executor", sendSerialNo as "sendSerialNo", applyEndDate as "applyEndDate" from vm_welfareAllowanceApply where serialNo = 'VALUE_001';

-- statementId: findAllowanceApplySonByFormmainId.select
-- lookupStatementId: findAllowanceApplySonByFormmainId.select
-- source: welfare_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select applyMember as "applyMember", applyDept as "applyDept", applyReason as "applyReason" from vm_welfareAllowanceApply_son where formmain_id = 'VALUE_001';

-- statementId: insertAllowanceSendMemberSon.insert
-- lookupStatementId: insertAllowanceSendMemberSon.insert
-- source: welfare_sqlmap.xml
-- type: insert
-- params: {
--   "formmainId": 1001,
--   "applyMember": "VALUE_001",
--   "applyDept": "VALUE_001",
--   "applyReason": "VALUE_001"
-- }
insert into vm_welfareAllowanceSend_member (id,formmain_Id,applyMember, applyDept, applyReason ) values( util_common.getAbsID, 1001, 'VALUE_001', 'VALUE_001', 'VALUE_001' );

-- statementId: insertAllowanceMemberWelfare.insert
-- lookupStatementId: insertAllowanceMemberWelfare.insert
-- source: welfare_sqlmap.xml
-- type: insert
-- params: {
--   "welfareMember": "VALUE_001",
--   "templateNo": "VALUE_001",
--   "annual": "VALUE_001"
-- }
insert into vm_memberWelfareAnaProject (id, state, start_member_id, start_date, approve_member_id, approve_date, finishedflag, ratifyflag, ratify_member_id, ratify_date, sort, modify_member_id, modify_date, certType , certNo , sex , age , phone, officePlace , jobNo , projectCode, templateNo, welfareMember, annual, projectStatus, launchDate, welfareName, useState) values(util_common.getAbsID, 1, -6760911671874597139, sysdate, 0, sysdate, 0, 0, 0, null, 0, -6760911671874597139, sysdate, (select certType from vm_memberWholeInfo where memberId = 'VALUE_001'), (select certNo from vm_memberWholeInfo where memberId = 'VALUE_001'), (select sex from vm_memberWholeInfo where memberId = 'VALUE_001'), (select age from vm_memberWholeInfo where memberId = 'VALUE_001'), (select phone from vm_memberWholeInfo where memberId = 'VALUE_001'), (select officePlace from vm_memberWholeInfo where memberId = 'VALUE_001'), (select jobNo from vm_memberWholeInfo where memberId = 'VALUE_001'), (select projectCode from vm_welfareanaproject where templateNo = 'VALUE_001' and annual = 'VALUE_001'), 'VALUE_001', 'VALUE_001', 'VALUE_001' , 3414263659243327335, sysdate, (select welfareName from vm_welfareanaproject where templateNo = 'VALUE_001' and annual = 'VALUE_001'), 2782513347324168557 );

-- statementId: insertAllowanceNoticeSon.insert
-- lookupStatementId: insertAllowanceNoticeSon.insert
-- source: welfare_sqlmap.xml
-- type: insert
-- params: "VALUE_001"
insert into vm_welfareAllowanceNotice_son (id, formmain_id, applyMember, applyDept, applyReason ) select util_common.getAbsID, 'VALUE_001', applyMember, applyDept, applyReason from vm_welfareAllowanceSend_member where formmain_id = (select id from vm_welfareAllowanceSend where serialNo = (select sendSerialNo from vm_welfareAllowanceApply where id = 'VALUE_001'));

-- statementId: deleteAllowanceBlankRecord
-- lookupStatementId: deleteAllowanceBlankRecord
-- source: welfare_sqlmap.xml
-- type: delete
-- params: {}
delete vm_welfareAllowanceSend_member where applyMember is null;

-- statementId: deleteAllowanceBlankRecordDept.delete
-- lookupStatementId: deleteAllowanceBlankRecordDept.delete
-- source: welfare_sqlmap.xml
-- type: delete
-- params: {}
delete vm_welfareAllowanceSend_dept where sendDepts is null;

-- statementId: closePreviousYearWelfare.update
-- lookupStatementId: closePreviousYearWelfare.update
-- source: welfare_sqlmap.xml
-- type: update
-- params: {}
update vm_welfareanaproject set projectStatus=8716577955139701724 where endDate < sysdate;

-- statementId: closePreviousYearMemberWelfare.update
-- lookupStatementId: closePreviousYearMemberWelfare.update
-- source: welfare_sqlmap.xml
-- type: update
-- params: {}
update vm_memberWelfareAnaProject set projectStatus=8716577955139701724 where endDate < sysdate;

-- statementId: welfareOffice.select
-- lookupStatementId: welfareOffice.select
-- source: welfare_sqlmap.xml
-- type: select
-- params: {}
select to_char(f.dept) dept,to_char(f.mainmember)mainmember from vm_deptpost f where f.busimodel = 4053677126668929503 and f.questname = '工会福利干事';

-- statementId: updateWelfareRoom.update
-- lookupStatementId: updateWelfareRoom.update
-- source: welfare_sqlmap.xml
-- type: update
-- params: {
--   "submember": "VALUE_001",
--   "questname": "NAME_001"
-- }
update vm_deptpost a set a.submember = 'VALUE_001' where a.questname = 'NAME_001';

-- statementId: queryVmWelfareRoomSend.select
-- lookupStatementId: queryVmWelfareRoomSend.select
-- source: welfare_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select v.id, v.applyUser from vm_welfare_room_send v left join COL_SUMMARY c on c.form_recordid = v.id where c.state = 3 and v.applyUser = 'VALUE_001';

-- statementId: queryVmWelfareSubsidyAdd.select
-- lookupStatementId: queryVmWelfareSubsidyAdd.select
-- source: welfare_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select v.id, v.applyUser from vm_welfare_subsidy_add v left join COL_SUMMARY c on c.form_recordid = v.id where c.state = 3 and v.applyUser = 'VALUE_001';

-- statementId: getRentDataInfo.select
-- lookupStatementId: getRentDataInfo.select
-- source: welfare_sqlmap.xml
-- type: select
-- params: {
--   "payMonth": "VALUE_001"
-- }
select applyUser as "applyUser", applyDepartMent as "applyDepartMent", startDate as "startDate", endDate as "endDate", hrNoObj as "hrNoObj", genderObj as "genderObj", building as "building", roomNumber as "roomNumber", apartment as "apartment", joinType as "joinType" from vm_welfare_room_rentData where (to_date('VALUE_001','yyyy-mm') >= to_date(to_char(startDate, 'yyyy-mm'), 'yyyy-mm') and endDate is null) or ((to_date(to_char(startDate, 'yyyy-mm'), 'yyyy-mm') = to_date('VALUE_001','yyyy-mm') and to_date(to_char(endDate, 'yyyy-mm'), 'yyyy-mm') = to_date('VALUE_001','yyyy-mm')));

-- statementId: getHistoryWelfareRentData.select
-- lookupStatementId: getHistoryWelfareRentData.select
-- source: welfare_sqlmap.xml
-- type: select
-- params: {
--   "applyUser": "VALUE_001",
--   "payMonth": "VALUE_001"
-- }
select startDate as "startDate", endDate as "endDate" from vm_welfare_room_rentData where applyUser = 'VALUE_001' and to_date('VALUE_001','yyyy-mm') >= to_date(to_char(startDate, 'yyyy-mm'), 'yyyy-mm') order by startDate;

-- statementId: getHistorySubsidyDetail.select
-- lookupStatementId: getHistorySubsidyDetail.select
-- source: welfare_sqlmap.xml
-- type: select
-- params: {
--   "name": "NAME_001",
--   "payMonth": "VALUE_001"
-- }
select firstSubsidyPay as "firstSubsidyPay", subsidyStartDate as "subsidyStartDate", subsidyEndDate as "subsidyEndDate" from vm_welfare_subsidy_detail where name = 'NAME_001' and to_date('VALUE_001','yyyy-mm') >= to_date(to_char(subsidyStartDate, 'yyyy-mm'), 'yyyy-mm') order by subsidyStartDate;

-- statementId: getRentDataInfoByApplyUserId.select
-- lookupStatementId: getRentDataInfoByApplyUserId.select
-- source: welfare_sqlmap.xml
-- type: select
-- params: {
--   "applyUserId": 1001,
--   "endDate": "2026-05-14"
-- }
select id as "id", applyUser as "applyUser", applyDepartMent as "applyDepartMent", startDate as "startDate", endDate as "endDate", hrNoObj as "hrNoObj", genderObj as "genderObj", building as "building", roomNumber as "roomNumber", apartment as "apartment", joinType as "joinType" from vm_welfare_room_rentData where endDate is null and applyUser = 1001 and to_date('2026-05-14','yyyy-mm-dd') > to_date(to_char(startDate, 'yyyy-mm-dd'), 'yyyy-mm-dd') order by startDate desc;

-- statementId: getCheckStartDate.select
-- lookupStatementId: getCheckStartDate.select
-- source: welfare_sqlmap.xml
-- type: select
-- params: {
--   "applyUserId": 1001
-- }
select id as "id", applyUser as "applyUser", applyDepartMent as "applyDepartMent", startDate as "startDate", endDate as "endDate", hrNoObj as "hrNoObj", genderObj as "genderObj", building as "building", roomNumber as "roomNumber", apartment as "apartment", joinType as "joinType" from vm_welfare_room_rentData where endDate is not null and applyUser = 1001 order by endDate desc;

-- statementId: getCheckEndDate.select
-- lookupStatementId: getCheckEndDate.select
-- source: welfare_sqlmap.xml
-- type: select
-- params: {
--   "applyUserId": 1001
-- }
select id as "id", applyUser as "applyUser", applyDepartMent as "applyDepartMent", startDate as "startDate", endDate as "endDate", hrNoObj as "hrNoObj", genderObj as "genderObj", building as "building", roomNumber as "roomNumber", apartment as "apartment", joinType as "joinType" from vm_welfare_room_rentData where endDate is null and applyUser = 1001 order by startDate desc;

-- statementId: getSubsidyDetailByApplyUserId.select
-- lookupStatementId: getSubsidyDetailByApplyUserId.select
-- source: welfare_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id as "id", name as "name", dept as "dept", startDate as "startDate", endDate as "endDate", subsidyStartDate as "subsidyStartDate", subsidyEndDate as "subsidyEndDate", hrNoObj as "hrNoObj", genderObj as "genderObj" from vm_welfare_subsidy_detail where subsidyEndDate is null and name = 'VALUE_001' order by subsidyStartDate desc;

-- statementId: getWelfareRoomRecordInfoByMonth.select
-- lookupStatementId: getWelfareRoomRecordInfoByMonth.select
-- source: welfare_sqlmap.xml
-- type: select
-- params: {
--   "eventDate": "2026-05-14"
-- }
select applyUser as "applyUser", applyDepartMent as "applyDepartMent", startDate as "startDate", endDate as "endDate", hrNoObj as "hrNoObj", genderObj as "genderObj", building as "building", roomNumber as "roomNumber", apartment as "apartment", joinType as "joinType" from vm_welfare_room_rentData where to_date(to_char(endDate, 'yyyy-mm'), 'yyyy-mm') = to_date('2026-05-14','yyyy-mm');

-- statementId: getWelfareSubsidyInfo.select
-- lookupStatementId: getWelfareSubsidyInfo.select
-- source: welfare_sqlmap.xml
-- type: select
-- params: {
--   "payMonth": "VALUE_001"
-- }
select name as "name", dept as "dept", startDate as "startDate", endDate as "endDate", subsidyStartDate as "subsidyStartDate", subsidyEndDate as "subsidyEndDate", hrNoObj as "hrNoObj", genderObj as "genderObj" from vm_welfare_subsidy_detail where to_date('VALUE_001','yyyy-mm') >= to_date(to_char(subsidyStartDate, 'yyyy-mm'), 'yyyy-mm') and (subsidyEndDate is null or to_date(to_char(subsidyEndDate, 'yyyy-mm'), 'yyyy-mm') >= to_date('VALUE_001','yyyy-mm'));

-- statementId: queryWelfareRoomInfo.select
-- lookupStatementId: queryWelfareRoomInfo.select
-- source: welfare_sqlmap.xml
-- type: select
-- params: {
--   "apartment": "VALUE_001",
--   "building": "VALUE_001",
--   "roomNumber": "VALUE_001"
-- }
select apartment as "apartment", building as "building", roomNumber as "roomNumber", pay as "pay" from vm_welfare_room_basic where apartment = 'VALUE_001' and building = 'VALUE_001' and roomNumber = 'VALUE_001';

-- statementId: getWelfareRoomUserIdByHrId.select
-- lookupStatementId: getWelfareRoomUserIdByHrId.select
-- source: welfare_sqlmap.xml
-- type: select
-- params: {
--   "hrId": 1001
-- }
select v.userid from vm_member v, org_principal p where v.userid = p.member_id and v.hrId = 1001;

-- statementId: deleteWelfareRoomPay.delete
-- lookupStatementId: deleteWelfareRoomPay.delete
-- source: welfare_sqlmap.xml
-- type: delete
-- params: {
--   "payMonth": "VALUE_001"
-- }
delete from vm_welfare_room_pay where month = 'VALUE_001';

-- statementId: deleteWelfareSubsidyGrant.delete
-- lookupStatementId: deleteWelfareSubsidyGrant.delete
-- source: welfare_sqlmap.xml
-- type: delete
-- params: {
--   "payMonth": "VALUE_001"
-- }
delete from vm_welfare_subsidy_grant where month = 'VALUE_001';

-- statementId: insertWelfareRoomPay.insert
-- lookupStatementId: insertWelfareRoomPay.insert
-- source: welfare_sqlmap.xml
-- type: insert
-- params: {
--   "name": "NAME_001",
--   "dept": "VALUE_001",
--   "month": "VALUE_001",
--   "startDate": "2026-05-14",
--   "endDate": "2026-05-14",
--   "hrNoObj": "VALUE_001",
--   "genderObj": "VALUE_001",
--   "pay": "VALUE_001",
--   "room": "VALUE_001",
--   "type": "VALUE_001",
--   "applyUser": "VALUE_001",
--   "applyDept": "VALUE_001",
--   "apartment": "VALUE_001",
--   "building": "VALUE_001"
-- }
insert into vm_welfare_room_pay (id, name, dept, month, startDate, endDate, hrNoObj, genderObj, pay, room, type, applyUser, applyDept, apartment, building ) values( util_common.getAbsID, 'NAME_001', 'VALUE_001', 'VALUE_001', to_date(substr('2026-05-14',1,10),'yyyy-mm-dd'), to_date(substr('2026-05-14',1,10),'yyyy-mm-dd'), 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001' );

-- statementId: insertWelfareSubsidyGrant.insert
-- lookupStatementId: insertWelfareSubsidyGrant.insert
-- source: welfare_sqlmap.xml
-- type: insert
-- params: {
--   "name": "NAME_001",
--   "dept": "VALUE_001",
--   "month": "VALUE_001",
--   "startDate": "2026-05-14",
--   "endDate": "2026-05-14",
--   "hrNoObj": "VALUE_001",
--   "genderObj": "VALUE_001",
--   "pay": "VALUE_001",
--   "applyUser": "VALUE_001",
--   "applyDept": "VALUE_001"
-- }
insert into vm_welfare_subsidy_grant (id, name, dept, month, startDate, endDate, hrNoObj, genderObj, pay, applyUser, applyDept ) values( util_common.getAbsID, 'NAME_001', 'VALUE_001', 'VALUE_001', to_date(substr('2026-05-14',1,10),'yyyy-mm-dd'), to_date(substr('2026-05-14',1,10),'yyyy-mm-dd'), 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001' );

-- statementId: welfareRoomPayResource.select
-- lookupStatementId: welfareRoomPayResource.select
-- source: welfare_sqlmap.xml
-- type: select
-- params: {
--   "month": "VALUE_001"
-- }
select id, name, dept, month, startDate, endDate, hrNoObj, genderObj, pay, room, type from vm_welfare_room_pay v where 1=1 AND v.month = 'VALUE_001';

-- statementId: welfareSubsidyGrantResource.select
-- lookupStatementId: welfareSubsidyGrantResource.select
-- source: welfare_sqlmap.xml
-- type: select
-- params: {
--   "month": "VALUE_001"
-- }
select id, name, dept, month, startDate, endDate, hrNoObj, genderObj, pay from vm_welfare_subsidy_grant v where 1=1 AND v.month = 'VALUE_001';

-- statementId: updateWelfareRoomSend.update
-- lookupStatementId: updateWelfareRoomSend.update
-- source: welfare_sqlmap.xml
-- type: update
-- params: {
--   "applyAmount": "VALUE_001",
--   "id": 1001
-- }
update vm_welfare_room_send a set a.applyAmount = 'VALUE_001' where a.id = 1001;

-- statementId: updateWelfareSubsidyAdd.update
-- lookupStatementId: updateWelfareSubsidyAdd.update
-- source: welfare_sqlmap.xml
-- type: update
-- params: {
--   "applyAmount": "VALUE_001",
--   "id": 1001
-- }
update vm_welfare_subsidy_add a set a.applyAmount = 'VALUE_001' where a.id = 1001;

-- statementId: updateRentDataInfoById.update
-- lookupStatementId: updateRentDataInfoById.update
-- source: welfare_sqlmap.xml
-- type: update
-- params: {
--   "endDate": "2026-05-14",
--   "id": 1001
-- }
update vm_welfare_room_rentData a set a.endDate = to_date('2026-05-14','yyyy-mm-dd') where a.id = 1001;

-- statementId: updateSubsidyDetailById.update
-- lookupStatementId: updateSubsidyDetailById.update
-- source: welfare_sqlmap.xml
-- type: update
-- params: {
--   "subsidyEndDate": "2026-05-14",
--   "id": 1001
-- }
update vm_welfare_subsidy_detail a set a.subsidyEndDate = to_date('2026-05-14','yyyy-mm-dd') where a.id = 1001;

-- statementId: queryAnaProjectCustomCollection.select
-- lookupStatementId: queryAnaProjectCustomCollection.select
-- source: welfare_sqlmap.xml
-- type: select
-- params: {
--   "collectCode": "CODE_001"
-- }
select m.welfareMember as "welfareMember", m.projectCode as "projectCode", m.templateNo as "templateNo", m.memberProTemNo as "memberProTemNo", m.annual as "annual", m.projectStatus as "projectStatus", m.launchDate as "launchDate", m.welfareName as "welfareName", m.welfareType as "welfareType", s.repeatcustomname as "repeatCustomName", s.repeatcustomresult as "repeatCustomResult" from vm_memberWelfareAnaProject m right join (select * from vm_welfareCustomInfo where repeatcustomname is not null and isDelete = -1089048568118490234) s on m.id = s.formmain_id where collectCode = 'CODE_001' order by welfaremember desc,s.repeatsort asc;

-- statementId: selectCustomCollectionConfigByCode.select
-- lookupStatementId: selectCustomCollectionConfigByCode.select
-- source: welfare_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select attr.id, attr.formmain_id as "formmainId", attr.comboSimpleName as "comboSimpleName", attr.attrDesc as "attrDesc", attr.attrShowType as "attrShowType", attr.attrSpecification as "attrSpecification", attr.attrCollectType as "attrCollectType", attr.attrSort as "attrSort", '0' as "attrSumAble", attr.attrName as "attrName", info.comBoFullName as "comboFullName", info.calcAttrName as "calcAttrName" from vm_welfareCustomComBoInfo info left join Vm_Welfarecustomcomboattr attr on attr.formmain_id = info.formmain_id and attr.comBoSimpleName = info.combosimplename where attr.formmain_id = (select id from vm_welfareCustomMain where serialNo = 'VALUE_001') union all select common.id, common.formmain_id, info.comBoSimpleName as "comboSimpleName", common.attrDesc as "attrDesc", common.attrShowType as "attrShowType", common.attrSpecification as "attrSpecification", common.attrCollectType as "attrCollectType", common.attrSort as "attrSort", common.attrSumAble as "attrSumAble", common.attrName as "attrName", info.comBoFullName as "comboFullName", info.calcAttrName as "calcAttrName" from vm_welfareCustomComBoInfo info left join vm_welfareCustomcommonAttr common on info.formmain_id = common.formmain_id where common.formmain_id = (select id from vm_welfareCustomMain where serialNo = 'VALUE_001');

-- statementId: selectMemberPhoneByMemberId.select
-- lookupStatementId: selectMemberPhoneByMemberId.select
-- source: welfare_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select EXT_ATTR_1 from org_member where id = 'VALUE_001';

-- statementId: selectMemberCertNoByMemberId.select
-- lookupStatementId: selectMemberCertNoByMemberId.select
-- source: welfare_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select EXT_ATTR_2 from addressbook where member_id = 'VALUE_001';

-- statementId: deleteTodayEhrRecord.delete
-- lookupStatementId: deleteTodayEhrRecord.delete
-- source: welfare_sqlmap.xml
-- type: delete
-- params: {}
delete from vm_welfareRefundDataLog where to_char(sysdate,'yyyy-mm-dd') = to_char(taskDate,'yyyy-mm-dd');

-- statementId: gethomeleaveInfo.select
-- lookupStatementId: gethomeleaveInfo.select
-- source: welfare_sqlmap.xml
-- type: select
-- params: {
--   "startDate": "2026-05-14",
--   "endDate": "2026-05-14"
-- }
select main.id as "id", main.serialNo as "serialNo", main.memberId as "memberId", main.memberDept as "memberDept", son.year as "year", son.kinsfolkName as "kinsfolkName", son.transportationType as "transportationType", to_char(son.startDate,'yyyy-mm-dd') as "startDate", to_char(son.endDate,'yyyy-mm-dd') as "endDate", son.days as "days", son.expectedCost as "expectedCost", son.destination as "destination" from vm_cap_homeleaveInfo_apply son left join vm_cap_homeleaveInfo main on main.id = son.formmain_id where son.year is not null and kinsfolkName is not null and son.startDate >= '2026-05-14' and son.endDate <= '2026-05-14';

-- statementId: findNeedPushCar.select
-- lookupStatementId: findNeedPushCar.select
-- source: welfare_sqlmap.xml
-- type: select
-- params: {
--   "id": "RAW_VALUE"
-- }
select 'CLDJ_T0001' flowType, util_user.getMemberNameByMemId(pushMember) name, to_char(id) id, f.serialNum flowId, util_user.getMemCodeByMemId(f.pushMember) sendUserNo, to_char(sysdate, 'yyyy-mm-dd') pushDate, f.pushDepart from vm_carRegisterTask f where (f.pushState = 7727549772789403399 or f.pushState is null) and f.serialNum not in (select flowId from vm_wf_carRegister where flowId is not null) and sysdate >= f.planPushDate and id in (RAW_VALUE);

-- statementId: findNoPushCareRegisterInfo
-- lookupStatementId: findNoPushCareRegisterInfo
-- source: welfare_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select 'CLDJ_T0001' flowType, util_user.getMemberNameByMemId(pushMember) name, to_char(id) id, f.serialNum flowId, util_user.getMemCodeByMemId(f.pushMember) sendUserNo, to_char(sysdate, 'yyyy-mm-dd') pushDate, f.pushDepart from vm_carRegisterTask f where (f.pushState = 7727549772789403399 or f.pushState is null) and f.serialNum not in (select flowId from vm_wf_carRegister where flowId is not null) and sysdate >= f.planPushDate and id = 'VALUE_001';

-- statementId: findKinsfolkInfoList.select
-- lookupStatementId: findKinsfolkInfoList.select
-- source: welfare_sqlmap.xml
-- type: select
-- params: {
--   "applyUser": "VALUE_001",
--   "kinsfolkName": "NAME_001",
--   "kinsfolkRelation": "VALUE_001"
-- }
select kinsfolkName as "kinsfolkName", kinsfolkRelation as "kinsfolkRelation", liveTogether as "liveTogether", liveAddress as "liveAddress", addressSignDate as "addressSignDate" from vm_cap_homeleaveInfo_kinsfolk where formmain_id = (select id from vm_cap_homeleaveInfo where memberId = 'VALUE_001' ) and kinsfolkName = 'NAME_001' and kinsfolkRelation = 'VALUE_001';

-- statementId: careRegisterRecord.select
-- lookupStatementId: careRegisterRecord.select
-- source: welfare_sqlmap.xml
-- type: select
-- params: {
--   "startDate": "2026-05-14",
--   "endDate": "2026-05-14",
--   "isValid": 1001
-- }
select id, code, name, deptCode, deptName, to_char(registerDate, 'yyyy-mm-dd') registerDate, licensePlateNumber, isValid from (select f.id, UTIL_USER.getMemCodeByMemId(userId) code, UTIL_USER.getMemberNameByMemId(USERID) name, UTIL_ORG.getDeptCodeByDeptId(userDepart) deptCode, UTIL_ORG.getDeptNameByDeptId(userDepart) deptName, registerDate, licensePlateNumber, decode(isValid,'-3841538853571705149',1,'-1089048568118490234',0) isValid from vm_carRegisterInfo f left join vm_carRegisterInfoSon f2 on f.id = f2.formmain_id) f3 where isvalid is not null and registerDate >= '2026-05-14' and registerDate <= '2026-05-14' and isValid = 1001;

-- statementId: getCareWelfareInfo.select
-- lookupStatementId: getCareWelfareInfo.select
-- source: welfare_sqlmap.xml
-- type: select
-- params: {
--   "applyDateStart": "2026-05-14",
--   "applyDateEnd": "2026-05-14"
-- }
select id as "id", serialNo as "serialNo", applyUser as "applyUser", to_char(applyDate,'yyyy-mm-dd') as "applyDate", to_char(entryDate,'yyyy-mm-dd') as "entryDate", to_char(eventDate,'yyyy-mm-dd') as "eventDate", '2' as "careType", amount as "amount", remark as "remark" from vm_wf_marriageCare w where (select state from col_summary c where c.form_recordId = w.id) = 3 and applyDate >= '2026-05-14' and applyDate <= '2026-05-14' and 1 = 0 union all select id, serialNo as "serialNo", applyUser as "applyUser", to_char(applyDate,'yyyy-mm-dd') as "applyDate", to_char((select EXT_ATTR_22 from org_member o where o.id = w.applyUser ),'yyyy-mm-dd') as "entryDate", to_char(hospitalizedDate,'yyyy-mm-dd') as "entryDate", '3' as "careType", amount as "amount", remark as "remark" from vm_wf_sickCare w where (select state from col_summary c where c.form_recordId = w.id) = 3 and applyDate >= '2026-05-14' and applyDate <= '2026-05-14' and 1 = 0 union all select id, serialNo as "serialNo", applyUser as "applyUser", to_char(applyDate,'yyyy-mm-dd') as "applyDate", to_char((select EXT_ATTR_22 from org_member o where o.id = w.applyUser ),'yyyy-mm-dd') as "entryDate", to_char(applyDate,'yyyy-mm-dd') as "entryDate", '0' as "careType", amount as "amount", applyReason as "remark" from vm_wf_laborunionCare w where (select state from col_summary c where c.form_recordId = w.id) = 3 and applyDate >= '2026-05-14' and applyDate <= '2026-05-14' and 1 = 0;

-- statementId: findMemberJobGradeByGrades
-- lookupStatementId: findMemberJobGradeByGrades
-- source: welfare_sqlmap.xml
-- type: select
-- params: {
--   "JobGrade": "RAW_VALUE",
--   "registerCarAccount": 7
-- }
select to_char(og.id) id,ab.ext_attr_9 jobGrade from org_member og left join addressbook ab on og.id = ab.member_id where is_admin=0 and is_internal=1 and type <> 2 and is_virtual=0 and is_deleted=0 and state = 1 and og.id not in (select userId from vm_carRegisterInfo where userId is not null) and ab.ext_attr_9 is not null AND ab.ext_attr_9 in (RAW_VALUE) AND og.org_account_id in (7);

-- statementId: getInsuranceSendRecordById.select
-- lookupStatementId: getInsuranceSendRecordById.select
-- source: welfare_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id as "id", writer as "writer", writeDept as "writeDept", serialNo as "serialNo", writeDate as "writeDate", sendFlowAccounts as "sendFlowAccounts", notSendMembers as "notSendMembers", insuranceYear as "insuranceYear", insuranceExplain as "insuranceExplain" from vm_cap_InsuraceResearchSend where id = 'VALUE_001';

-- statementId: updateInsuranceResearchFlow.update
-- lookupStatementId: updateInsuranceResearchFlow.update
-- source: welfare_sqlmap.xml
-- type: update
-- params: {
--   "spouseName": "NAME_001",
--   "spouseNo": "VALUE_001",
--   "spouseAge": "VALUE_001",
--   "spouseGender": "VALUE_001",
--   "haveSpouse": "VALUE_001",
--   "haveChildren": "VALUE_001",
--   "colId": 1001
-- }
update vm_cap_wf_InsuranceResearch t set spouseName = 'NAME_001', spouseNo = 'VALUE_001', spouseAge = 'VALUE_001', spouseGender = 'VALUE_001', haveSpouse = 'VALUE_001', haveChild = 'VALUE_001' where id = (select form_recordId from col_summary where id = 1001);

-- statementId: insertInsuranceResearchChildInfo.insert
-- lookupStatementId: insertInsuranceResearchChildInfo.insert
-- source: welfare_sqlmap.xml
-- type: insert
-- params: {
--   "colId": 1001,
--   "childName": "NAME_001",
--   "childNo": "VALUE_001",
--   "childAge": "VALUE_001",
--   "childGender": "VALUE_001"
-- }
insert into vm_cap_wf_InsuranceResearch_son( id, formmain_id, childName, childNo, childAge, childGender ) values( util_common.getAbsID, (select form_recordId from col_summary where id = 1001), 'NAME_001', 'VALUE_001', 'VALUE_001', 'VALUE_001' );

-- statementId: getMemberKinsfolkInfo.select
-- lookupStatementId: getMemberKinsfolkInfo.select
-- source: welfare_sqlmap.xml
-- type: select
-- params: {
--   "memberId": 1001
-- }
select id as "id", kinsfolkIdNo as "kinsfolkIdNo", kinsfolkName as "kinsfolkName", kinsfolkAge as "kinsfolkAge", kinsfolkType as "kinsfolkType", kinsfolkGender as "kinsfolkGender" from vm_basemember_kinsfolk where formmain_id = (select id from vm_basememberinfo where memberId = 1001);

-- statementId: getDoneInsuranceResearchFlowBySendBatchNo.select
-- lookupStatementId: getDoneInsuranceResearchFlowBySendBatchNo.select
-- source: welfare_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id as "id", serialNo as "serialNo", spouseName as "spouseName", insuranceYear as "insuranceYear", spouseNo as "spouseNo", spouseInsurance as "spouseInsurance", writeDept as "writeDept", writer as "writer", writeDate as "writeDate", checkMemberId as "checkMemberId", sendBatchNo as "sendBatchNo", haveSpouse as "haveSpouse", haveChild as "haveChild", memberConfirm as "memberConfirm", flowId as "flowId" from vm_cap_wf_InsuranceResearch wf where sendBatchNo = 'VALUE_001' and 3 = (select state from col_summary where form_recordId = wf.id);

-- statementId: deleteInsuranceSendDeptSon.delete
-- lookupStatementId: deleteInsuranceSendDeptSon.delete
-- source: welfare_sqlmap.xml
-- type: delete
-- params: "VALUE_001"
delete from vm_cap_InsuraceResearchSend_son where formmain_id = (select id from vm_cap_InsuraceResearchSend where serialNo = 'VALUE_001');

-- statementId: insertInsuranceSendDeptSon.insert
-- lookupStatementId: insertInsuranceSendDeptSon.insert
-- source: welfare_sqlmap.xml
-- type: insert
-- params: {
--   "sendBatchNo": "VALUE_001",
--   "deptId": 1001,
--   "undoneMembers": "VALUE_001",
--   "doneMembers": "VALUE_001"
-- }
insert into vm_cap_InsuraceResearchSend_son( id, formmain_id, memberDept, unfinishedMembers, finishendMembers) values( util_common.getAbsID, (select id from vm_cap_InsuraceResearchSend where serialNo = 'VALUE_001'), 1001, 'VALUE_001', 'VALUE_001' );

-- statementId: getSendInsuranceResearchMemberIdByBatchNo.select
-- lookupStatementId: getSendInsuranceResearchMemberIdByBatchNo.select
-- source: welfare_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select checkMemberId from vm_cap_wf_InsuranceResearch t where t.sendBatchNo = 'VALUE_001';

-- statementId: insertKinsfolkChildrenInfo.insert
-- lookupStatementId: insertKinsfolkChildrenInfo.insert
-- source: welfare_sqlmap.xml
-- type: insert
-- params: {
--   "memberId": 1001,
--   "kinsfolkIdNo": 1001,
--   "kinsfolkName": "NAME_001",
--   "kinsfolkAge": "VALUE_001",
--   "kinsfolkGender": "VALUE_001",
--   "kinsfolkType": "VALUE_001"
-- }
insert into vm_basemember_kinsfolk( id, formmain_id, kinsfolkIdNo, kinsfolkName, kinsfolkAge, kinsfolkGender, kinsfolkType ) values( util_common.getAbsID, (select id from vm_basememberinfo where memberId = 1001), 1001, 'NAME_001', 'VALUE_001', 'VALUE_001', 'VALUE_001' );

-- statementId: insertKinsfolkSpouseInfo.insert
-- lookupStatementId: insertKinsfolkSpouseInfo.insert
-- source: welfare_sqlmap.xml
-- type: insert
-- params: {
--   "sendBatchNo": "VALUE_001",
--   "deptId": 1001,
--   "undoneMembers": "VALUE_001",
--   "doneMembers": "VALUE_001"
-- }
insert into vm_basemember_kinsfolk( id, formmain_id, memberDept, unfinishedMembers, finishendMembers) values( util_common.getAbsID, (select id from vm_cap_InsuraceResearchSend where serialNo = 'VALUE_001'), 1001, 'VALUE_001', 'VALUE_001' );

-- statementId: deleteKinsfolkByMemberId.delete
-- lookupStatementId: deleteKinsfolkByMemberId.delete
-- source: welfare_sqlmap.xml
-- type: delete
-- params: "VALUE_001"
delete from vm_basemember_kinsfolk where formmain_id = (select id from vm_basememberinfo where memberId = 'VALUE_001');

-- statementId: deleteInsuranceResearchEmptySon.delete
-- lookupStatementId: deleteInsuranceResearchEmptySon.delete
-- source: welfare_sqlmap.xml
-- type: delete
-- params: {}
delete from vm_cap_wf_InsuranceResearch_son where childName is null;

-- statementId: getMemberInsuranceResearchLimit.select
-- lookupStatementId: getMemberInsuranceResearchLimit.select
-- source: welfare_sqlmap.xml
-- type: select
-- params: {
--   "templateNo": "VALUE_001",
--   "annual": "VALUE_001",
--   "welfareMember": "VALUE_001"
-- }
select welfarelimit from vm_memberWelfareAnaProject where templateNo = 'VALUE_001' and annual = 'VALUE_001' and welfareMember = 'VALUE_001';

-- statementId: queryWelfareWithhold.select
-- lookupStatementId: queryWelfareWithhold.select
-- source: welfare_sqlmap.xml
-- type: select
-- params: {
--   "month": "VALUE_001"
-- }
select to_date(v.month,'yyyy-mm') as "Term", util_user.getMemCodeByMemId(v.applyUser) as "KMBadge", 0 as "type", v.pay as "Amount" from vm_welfare_room_pay v where 1=1 AND v.month = 'VALUE_001';

-- statementId: queryWelfareSubsidy.select
-- lookupStatementId: queryWelfareSubsidy.select
-- source: welfare_sqlmap.xml
-- type: select
-- params: {
--   "month": "VALUE_001"
-- }
select to_date(v.month,'yyyy-mm') as "Term", util_user.getMemCodeByMemId(v.applyUser) as "KMBadge", 1 as "type", v.pay as "Amount" from vm_welfare_subsidy_grant v where 1=1 AND v.month = 'VALUE_001';

-- statementId: findContactPersonList.select
-- lookupStatementId: findContactPersonList.select
-- source: welfare_sqlmap.xml
-- type: select
-- params: {}
select pushDepartMent as "pushDepartMent", contactPerson as "contactPerson", isFirstDeptPush as "isFirstDeptPush" from vm_contact_person;

-- statementId: difficultEmployeeById.select
-- lookupStatementId: difficultEmployeeById.select
-- source: welfare_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id, serialNum, pushAccount, pushDepart, to_char(pushYear) pushYear, removeDept from vm_difficultEmployeeReportPush where id = 'VALUE_001';

-- statementId: findDifficultEmployByYear.select
-- lookupStatementId: findDifficultEmployByYear.select
-- source: welfare_sqlmap.xml
-- type: select
-- params: "VALUE_001"
SELECT applyUser, applyDepart, applySupperDepart, applyReason, applyDate FROM ( SELECT to_char(applyUser) AS applyUser, to_char(applyDepart) AS applyDepart, to_char(applySupperDepart) AS applySupperDepart, applyReason, applyDate, ROW_NUMBER() OVER (PARTITION BY applyUser ORDER BY applyDate) AS rn FROM vm_assistance_doc LEFT JOIN org_member om ON applyUser = om.id WHERE om.is_enable = 1 AND om.is_deleted = 0 AND STATE = 1 AND applyYear = 'VALUE_001' ) WHERE rn = 1 ORDER BY applyDate ASC;

-- statementId: difficultEmployeeByParam.Select
-- lookupStatementId: difficultEmployeeByParam.Select
-- source: welfare_sqlmap.xml
-- type: select
-- params: {
--   "PUSHACCOUNT": 7,
--   "PUSHDEPART": "RAW_VALUE",
--   "REMOVEDEPT": "RAW_VALUE"
-- }
select distinct id from org_unit f where f.is_enable = 1and f.is_deleted = 0 and f.is_internal = 1 and f.type = 'Department' and ( 1=0 or org_account_id in(SELECT id FROM vm_org_unit START WITH ID in (7) CONNECT BY parent_Id = PRIOR ID) or id in(RAW_VALUE) ) and id not in(RAW_VALUE);

-- statementId: pushDifficultEmployeeReportDepartBy.select
-- lookupStatementId: pushDifficultEmployeeReportDepartBy.select
-- source: welfare_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select reportDepart from vm_difficultEmployeeReport where pushSerialNum = 'VALUE_001';

-- statementId: welfareEmployee.SonRecord.insert
-- lookupStatementId: welfareEmployee.SonRecord.insert
-- source: welfare_sqlmap.xml
-- type: insert
-- params: {
--   "formmain_id": 1001,
--   "company": "VALUE_001",
--   "department": "VALUE_001",
--   "personName": "NAME_001",
--   "hrCode": "CODE_001",
--   "gender": "VALUE_001",
--   "workPlace": "VALUE_001",
--   "workFloor": "VALUE_001",
--   "phone": "VALUE_001",
--   "idCard": 1001,
--   "hireDate": "2026-05-14",
--   "serviceYears": "VALUE_001",
--   "birthDate": "2026-05-14",
--   "positionLevel": "VALUE_001"
-- }
insert into vm_welfareEmployeeList_son (id, formmain_id, sort, company, department, personName, hrCode, gender, workplace, workFloor, phone, idCard, hireDate, serviceYears, birthDate, positionLevel) values(util_common.getAbsID, 1001,(select count(1) + 1 from vm_welfareEmployeeList_son vws where vws.formmain_id = 1001), 'VALUE_001', 'VALUE_001', 'NAME_001', 'CODE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 1001, to_date('2026-05-14','yyyy-MM-dd'), 'VALUE_001',to_date('2026-05-14','yyyy-MM-dd'), 'VALUE_001');

-- statementId: findCap4EmployeeList.select
-- lookupStatementId: findCap4EmployeeList.select
-- source: welfare_sqlmap.xml
-- type: select
-- params: {
--   "lastJoinDate": "2026-05-14",
--   "companyScope": "RAW_VALUE",
--   "region": "RAW_VALUE",
--   "welfareMonth": "VALUE_001",
--   "memberIdStr": "RAW_VALUE"
-- }
select e.company as "company", e.department as "department", o.code as "code", e.name as "personName", a.ext_attr_6 as "hrCode", o.ext_attr_11 as "gender", e.workPlace as "workPlace", e.workfloor as "workFloor", o.ext_attr_1 as "phone", a.ext_attr_2 as "idCard", o.ext_attr_22 as "hireDate", e.cyear as "serviceYears", o.ext_attr_21 as "birthDate", e.jobGrade as "positionLevel" from VM_CAP4_EMPLOYEE e left join org_member o on o.id = e.userId left join addressbook a on a.member_id = e.userId where 1=1 and o.ext_attr_22 <= to_date('2026-05-14','yyyy-MM-dd') and e.company in(RAW_VALUE) and e.workPlace in(RAW_VALUE) and to_number(to_char(o.ext_attr_21, 'MM')) = 'VALUE_001' and o.id not in (RAW_VALUE);

-- statementId: findCap4RegionList.select
-- lookupStatementId: findCap4RegionList.select
-- source: welfare_sqlmap.xml
-- type: select
-- params: {
--   "regionId": "RAW_VALUE"
-- }
select crs.workPlaceId from vm_wf_cap4_region_son crs left join vm_wf_cap4_region cr on crs.formmainId = cr.id where 1=1 and cr.regionId in (RAW_VALUE);

-- statementId: getWelfareName.select
-- lookupStatementId: getWelfareName.select
-- source: welfare_sqlmap.xml
-- type: select
-- params: {
--   "id": 1001
-- }
select welfareName "welfareName" from vm_welfare_deal_doc where id = 1001;

-- statementId: getWelfareDetails.select
-- lookupStatementId: getWelfareDetails.select
-- source: welfare_sqlmap.xml
-- type: select
-- params: {
--   "formmain_id": 1001
-- }
select hrCode "hrCode", /*工号 */ util_user.getDeptNameByMemId(memberId) "departName", /*部门名称*/ memberId "memberId", /*员工 */ memberName "memberName", /*真实姓名*/ util_common.getEnumShowById(signState) "signState", /*签收情况*/ to_char(signDate, 'yyyy/mm/dd HH24:MI') "signDate", /*签收日期*/ ab.ext_attr_3 "place"/*工作地*/ from vm_welfare_deal_membereSon f left join addressbook ab on f.memberId = ab.member_id where formmain_id = 1001 order by util_user.getDeptNameByMemId(memberId);

-- statementId: getArchivesValue.select
-- lookupStatementId: getArchivesValue.select
-- source: report_sqlmap.xml
-- type: select
-- params: {
--   "matterId": 1001
-- }
select * from vm_archives_update f where f.field0008 = 1001;

-- statementId: getUpdateValue.select
-- lookupStatementId: getUpdateValue.select
-- source: report_sqlmap.xml
-- type: select
-- params: {
--   "matterId": 1001,
--   "fildId": 1001
-- }
select * from formmain_3374 f where f.field0008 = 1001 and f.field0001 = 1001;

-- statementId: report.select
-- lookupStatementId: report.select
-- source: report_sqlmap.xml
-- type: select
-- params: {}
select v.id as id, v.matter_id as matterId, v.next_submitted_date as nextSubmittedDate, v.next_task_date as nextTaskDate, v.submitted_rate as submittedRate, v.year_submitted_date as yearSubmittedDate, v.year_task_date as yearTaskDate, v.submitted_time_basic as submittedTimeBasic, v.submitted_time_number as submittedTimeNumber, v.submitted_time_unit as submittedTimeUnit, v.push_time_basic as pushTimeBasic, v.push_time_number as pushTimeNumber, v.push_time_unit as pushTimeUnit from vm_submitted_archives v where push_falg in ('3827536082177116572','1329538010751910982') and ispush = '-8120149130502781733' and isregular <> -7378876665094976280 and v.next_task_date is not null and to_date(v.next_task_date,'YYYYMMDDHH24:MISS') <= sysdate and not exists (select 1 from vm_submitted_process a where a.matter_id = v.matter_id and a.end_submitted_date = v.next_submitted_date);

-- statementId: report.process.select
-- lookupStatementId: report.process.select
-- source: report_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select f.id as flowId, f.end_submitted_date as nextSubmittedDate, f.leader as leader, f.matter_title as matterTitle from vm_submitted_process f where f.finishedflag = 0 VALUE_001;

-- statementId: report.message.select
-- lookupStatementId: report.message.select
-- source: report_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select f.leader as leader, to_char(count(f.leader)) as matterCount, to_char(wmsys.wm_concat('《'||matter_title||'》OAFLAG')) as title from vm_submitted_process f where f.end_submitted_date is not null and f.finishedflag = 0 VALUE_001 group by f.leader;

-- statementId: report.select.count
-- lookupStatementId: report.select.count
-- source: report_sqlmap.xml
-- type: select
-- params: {
--   "matterId": 1001,
--   "strSubmittedDate": "2026-05-14"
-- }
select count(1) from vm_submitted_process f where f.matter_id = 1001 and f.end_submitted_date = '2026-05-14';

-- statementId: reportNextSubmitted.update
-- lookupStatementId: reportNextSubmitted.update
-- source: report_sqlmap.xml
-- type: update
-- params: {
--   "nextSubmittedDate": "2026-05-14",
--   "matterId": 1001
-- }
update vm_submitted_archives v set v.next_submitted_date = '2026-05-14' where v.matter_id = 1001;

-- statementId: modifyDate.update
-- lookupStatementId: modifyDate.update
-- source: report_sqlmap.xml
-- type: update
-- params: {
--   "modifyDate": "2026-05-14",
--   "matterId": 1001
-- }
update vm_report_archives v set v.modify_date = '2026-05-14' where v.matter_id = 1001;

-- statementId: reportNextSubmitted.this.update
-- lookupStatementId: reportNextSubmitted.this.update
-- source: report_sqlmap.xml
-- type: update
-- params: {
--   "nextSubmittedDateThis": "2026-05-14",
--   "matterId": 1001
-- }
update vm_report_archives v set v.next_report_date_this = '2026-05-14' where v.matter_id = 1001;

-- statementId: reportTaskStatus.update
-- lookupStatementId: reportTaskStatus.update
-- source: report_sqlmap.xml
-- type: update
-- params: {
--   "enumId": 1001,
--   "matterId": 1001
-- }
update vm_submitted_archives v set v.push_falg = 1001 where v.matter_id = 1001;

-- statementId: reportProcessStatus.update
-- lookupStatementId: reportProcessStatus.update
-- source: report_sqlmap.xml
-- type: update
-- params: {
--   "enumId": 1001,
--   "id": 1001
-- }
update vm_submitted_process f set f.matter_status = 1001 where f.id = 1001;

-- statementId: reportNextTask.update
-- lookupStatementId: reportNextTask.update
-- source: report_sqlmap.xml
-- type: update
-- params: {
--   "nextTaskDate": "2026-05-14",
--   "matterId": 1001
-- }
update vm_submitted_archives v set v.next_task_date = '2026-05-14' where v.matter_id = 1001;

-- statementId: reportNextTask.this.update
-- lookupStatementId: reportNextTask.this.update
-- source: report_sqlmap.xml
-- type: update
-- params: {
--   "nextTaskDateThis": "2026-05-14",
--   "matterId": 1001
-- }
update vm_report_archives v set v.next_task_date_this = '2026-05-14' where v.matter_id = 1001;

-- statementId: sendReport.select
-- lookupStatementId: sendReport.select
-- source: report_sqlmap.xml
-- type: select
-- params: {
--   "matterId": 1001
-- }
select v.matter_id as matterId, V.matter_title AS matterTitle, V.matter_desc AS matterDesc, V.submitted_object AS submittedObject, V.report_template AS reportTemplate, V.next_submitted_date AS nextSubmittedDate, V.other_contacts AS otherContacts, V.other_phone AS otherPhone, V.other_email AS otherEmail, V.submitted_platform AS submittedPlatform, V.submitted_mode AS submittedMode, V.submitted_explain AS submittedExplain, V.submitted_company AS submittedCompany, V.submitted_depart AS submittedDepart, V.leader AS leader, V.reviewer AS reviewer, V.co_leader AS coLeader, v.systems as systems, v.mail as mail, v.paper as paper, v.platform_id as platformId, V.object_id AS objectId, v.submitted_rate as reportRate, v.submitted_enclosure as reportEnclosure from vm_submitted_archives v where v.matter_id = 1001;

-- statementId: report.object.select
-- lookupStatementId: report.object.select
-- source: report_sqlmap.xml
-- type: select
-- params: {
--   "specialId": 1001
-- }
select id from formmain_3366 c where c.field0003 = 1001;

-- statementId: report.platform.select
-- lookupStatementId: report.platform.select
-- source: report_sqlmap.xml
-- type: select
-- params: {
--   "specialId": 1001
-- }
select id from vm_report_platform c where c.platform_id = 1001;

-- statementId: report.getFileId.select
-- lookupStatementId: report.getFileId.select
-- source: report_sqlmap.xml
-- type: select
-- params: {
--   "refId": 1001,
--   "Id": 1001
-- }
select distinct(c.file_url) file_url from ctp_attachment c where c.sub_reference = 1001 and c.att_reference = 1001;

-- statementId: report.beginMonth.select
-- lookupStatementId: report.beginMonth.select
-- source: report_sqlmap.xml
-- type: select
-- params: {
--   "nowdate": "2026-05-14",
--   "submittedCount": 1
-- }
select util_common.getNextWorkDay(util_common.getFirstWorkDayMonth('2026-05-14'),1) from dual;

-- statementId: report.beginNextMonth.select
-- lookupStatementId: report.beginNextMonth.select
-- source: report_sqlmap.xml
-- type: select
-- params: {
--   "nowdate": "2026-05-14",
--   "submittedCount": 1
-- }
select util_common.getNextWorkDay(util_common.getFirstWorkDayNextMonth('2026-05-14'),1) from dual;

-- statementId: report.endMonth.select
-- lookupStatementId: report.endMonth.select
-- source: report_sqlmap.xml
-- type: select
-- params: {
--   "nowdate": "2026-05-14",
--   "submittedCount": 1
-- }
select util_common.getNextWorkDay(util_common.getLastWorkDayMonth('2026-05-14'),1) from dual;

-- statementId: report.endNextMonth.select
-- lookupStatementId: report.endNextMonth.select
-- source: report_sqlmap.xml
-- type: select
-- params: {
--   "nowdate": "2026-05-14",
--   "submittedCount": 1
-- }
select util_common.getNextWorkDay(util_common.getLastWorkDayNextMonth('2026-05-14'),1) from dual;

-- statementId: report.beginSeason.select
-- lookupStatementId: report.beginSeason.select
-- source: report_sqlmap.xml
-- type: select
-- params: {
--   "nowdate": "2026-05-14",
--   "submittedCount": 1
-- }
select util_common.getNextWorkDay(util_common.getFirstWorkdaySeason('2026-05-14'),1) from dual;

-- statementId: report.beginNextSeason.select
-- lookupStatementId: report.beginNextSeason.select
-- source: report_sqlmap.xml
-- type: select
-- params: {
--   "nowdate": "2026-05-14",
--   "submittedCount": 1
-- }
select util_common.getNextWorkDay(util_common.getFirstWorkdayNextSeason('2026-05-14'),1) from dual;

-- statementId: report.endSeason.select
-- lookupStatementId: report.endSeason.select
-- source: report_sqlmap.xml
-- type: select
-- params: {
--   "nowdate": "2026-05-14",
--   "submittedCount": 1
-- }
select util_common.getNextWorkDay(util_common.getLastWorkdaySeason('2026-05-14'),1) from dual;

-- statementId: report.endNextSeason.select
-- lookupStatementId: report.endNextSeason.select
-- source: report_sqlmap.xml
-- type: select
-- params: {
--   "nowdate": "2026-05-14",
--   "submittedCount": 1
-- }
select util_common.getNextWorkDay(util_common.getLastWorkdayNextSeason('2026-05-14'),1) from dual;

-- statementId: report.isWorkDay.select
-- lookupStatementId: report.isWorkDay.select
-- source: report_sqlmap.xml
-- type: select
-- params: {
--   "date": "2026-05-14"
-- }
select util_common.isWorkDay('2026-05-14') from dual;

-- statementId: report.getNextWorkDay.select
-- lookupStatementId: report.getNextWorkDay.select
-- source: report_sqlmap.xml
-- type: select
-- params: {
--   "date": "2026-05-14",
--   "count": 1
-- }
select util_common.getNextWorkDay('2026-05-14',1) from dual;

-- statementId: report.getReportMessage
-- lookupStatementId: report.getReportMessage
-- source: report_sqlmap.xml
-- type: select
-- params: {}
select '今日分管部门共有_allReportCount_个对外报送事项,其中按时完成_onReportCount_项,逾期补报完成_outReportCount_项,还有_noReportCount_项没有完成。' from dual;

-- statementId: report.manager.getReportMessage
-- lookupStatementId: report.manager.getReportMessage
-- source: report_sqlmap.xml
-- type: select
-- params: {}
select '今日部门共有_allReportCount_个对外报送事项,其中按时完成_onReportCount_项,逾期补报完成_outReportCount_项,还有_noReportCount_项没有完成。' from dual;

-- statementId: report.operation.getReportMessage
-- lookupStatementId: report.operation.getReportMessage
-- source: report_sqlmap.xml
-- type: select
-- params: {}
select '今日共有_allReportCount_个对外报送事项,其中按时完成_onReportCount_项,逾期补报完成_outReportCount_项,还有_noReportCount_项没有完成。' from dual;

-- statementId: unReport.remind.select
-- lookupStatementId: unReport.remind.select
-- source: report_sqlmap.xml
-- type: select
-- params: {}
select f.id as flowId, f.end_submitted_date as nextSubmittedDate, f.leader as leader, f.matter_title as matterTitle from vm_submitted_process f where f.end_submitted_date is not null and f.finishedflag = 0 and to_date(substr(f.end_submitted_date,1,8),'yyyymmdd') = to_date(to_char(sysdate,'yyyymmdd'),'yyyymmdd');

-- statementId: queryCfgsByWfName.select
-- lookupStatementId: queryCfgsByWfName.select
-- source: msgShielded_sqlmap.xml
-- type: select
-- params: {
--   "templateId": 1001,
--   "userId": 1001
-- }
SELECT id, receiver, creator, wfTemplateName, wfTemplateTitle, matchingType, reason, createTime, useable from vm_msgShieldedCfg v1 where wfTemplateName = (select SUBJECT from ctp_template where is_system=1 and is_delete=0 and state=0 and id = 1001) and 1001 in (select COLUMN_VALUE from table ( util_common.split((select receiver from vm_msgShieldedCfg v2 where id = v1.id),','))) and useable = '-286897663746683514';

-- statementId: queryMessageConfigs.select
-- lookupStatementId: queryMessageConfigs.select
-- source: msgShielded_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select ID, serialNo, messageKeyword, matchPattern , messageChannel, creator, receiver, (select id from ctp_template f where f.templete_number = templateNo) templateNo, blockReason, enableFlag, createTime, recordLogFlag, departments, accounts, to_char(isWhitelist) isWhitelist from vm_cap4MessageConfigs where isWhitelist = 'VALUE_001';

-- statementId: getPropagandizeFlowSonBySerialNo.select
-- lookupStatementId: getPropagandizeFlowSonBySerialNo.select
-- source: propagandize_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select productCode as "productCode", productName as "productName", productType as "productType", checkMembers as "checkMembers", recordCount as "recordCount", fundCode as "fundCode" from vm_wf_propagandize_pdson where formmain_id = (select id from VM_LAUNCHMATERIALPROCESS where serialNum = 'VALUE_001');

-- statementId: getPropagandizeFlowBySerialNo.select
-- lookupStatementId: getPropagandizeFlowBySerialNo.select
-- source: propagandize_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select uploadEndDraft as "uploadEndDraft", applyDept as "applyDept", applyUser as "applyUser" from VM_LAUNCHMATERIALPROCESS where serialNum = 'VALUE_001';

-- statementId: querySealApplyFlowBySerialNo.select
-- lookupStatementId: querySealApplyFlowBySerialNo.select
-- source: operdemand_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select senduser as "writer" from vm_pdmprodreview where serialNo = 'VALUE_001';

-- statementId: exportEevcationInfo.select
-- lookupStatementId: exportEevcationInfo.select
-- source: evection_sqlmap.xml
-- type: select
-- params: {}
select code KM工号_1, to_char(begindate, 'yyyy-mm-dd') 出差开始日期_2, to_char(enddate, 'yyyy-mm-dd') 出差结束日期_3, origin 出差事由_4, evectiontype 备注_5 from (select ev.*, m2.code, m2.name staffName from (select t1.proposercode, t1.origin , t1.evectiontype, t1.begindate, t1.enddate, t2.column_value partID from vm_evations t1, table (select util_common.split(t1.man || ',' || t1.son, ',') from dual) t2) ev left join org_member m on ev.proposercode = m.id left join org_member m2 on ev.partID = m2.id) info order by KM工号_1,出差开始日期_2;

-- statementId: stateByid.update
-- lookupStatementId: stateByid.update
-- source: evection_sqlmap.xml
-- type: update
-- params: "VALUE_001"
update vm_predimission set predimissionuserstate=1 where id ='VALUE_001';

-- statementId: addReptionspect.insert
-- lookupStatementId: addReptionspect.insert
-- source: evection_sqlmap.xml
-- type: insert
-- params: {
--   "staffID": 1001,
--   "beginDate": "2026-05-14",
--   "endDate": "2026-05-14",
--   "days": "VALUE_001",
--   "origin": "VALUE_001",
--   "departCode": "CODE_001",
--   "applytime": "2026-05-14 10:00:00",
--   "kmRecid": 1001
-- }
insert into vm_evations (reqid, state, createmember, createdate, approvemember, approvedate, finishedflag, ratifyflag, ratify_member_id, ratify_date, sort, modify_member_id, modify_date, MAN, BEGINDATE, ENDDATE, DAYS, ORIGIN, DEPARTCODE, PROPOSERCODE, APPLYTIME, KMRECID, type) values (util_common.getID, 1, util_user.getMemIdByLoginName('flowbot'), sysdate, 0, sysdate, 0, 0, 0, null, 0, util_user.getMemIdByLoginName('flowbot'), sysdate, 1001, to_date(substr('2026-05-14', 1, 10), 'yyyy-mm-dd'), to_date(substr('2026-05-14', 1, 10), 'yyyy-mm-dd'), 'VALUE_001', 'VALUE_001', 'CODE_001', 1001, to_date(substr('2026-05-14 10:00:00', 1, 10), 'yyyy-mm-dd'), 1001, util_common.getEnumIdByRefName('出差类型', '调研'));

-- statementId: maxInspectRecid.select
-- lookupStatementId: maxInspectRecid.select
-- source: evection_sqlmap.xml
-- type: select
-- params: {}
select max(to_number(kmrecid)) from vm_evations;

-- statementId: evectionInfo.select
-- lookupStatementId: evectionInfo.select
-- source: evection_sqlmap.xml
-- type: select
-- params: 
select reqID,staffID,exitReviewEndMarker,staffName,department,destination,to_char(begindate,'yyyy-mm-dd') beginDate,to_char(enddate,'yyyy-mm-dd') endDate,days,origin,evectiontype,to_char(applytime,'yyyy-mm-dd') applytime,propose,proposercode,abroadFlag,flowSerialNo,applyStatus, currentState, refSerialNo,flowUrl,inspStates,backFlowUrl from (select ev.*, m.name propose,m.code proposercode,m2.code staffID, m2.name staffName from (select t1.reqid, t1.department, t1.origin, t1.evectiontype, t1.enddate, t1.begindate, t1.destination, t1.proposercode proposercodes, t1.days, t1.applytime, t1.abroadflag, t2.column_value partID, t1.includehk, t1.flowSerialNo, t1.applyStatus, nvl(t1.ifrefund, '0') exitReviewEndMarker, currentState, refSerialNo, flowUrl, inspStates, backFlowUrl from vm_evations t1, table (select util_common.split(t1.man || ',' || t1.son, ',') from dual) t2 where (includehk =0 or includehk is null or t1.includeHK = 'VALUE_001' ) and ((decode （t1.evectiontype ,'出差',1,0) = 1 and ('0' = 'VALUE_001' or (t1.ifrefund = 1 or t1.ifrefund is null)) ) or decode（t1.evectiontype ,'出差',1,0) = 0) and t1.evectiontype = 'VALUE_001' and t1.department like '%'|| 'VALUE_001' || '%' and (t1.applyStatus = 'VALUE_001' or t1.applyStatus is null) and t1.applyStatus = 'VALUE_001' and to_date(to_char(t1.modify_date, 'yyyy-mm-dd'), 'yyyy-mm-dd') between to_date('2026-05-14', 'yyyy-mm-dd') and to_date('2026-05-14', 'yyyy-mm-dd') ) ev left join org_member m on ev.proposercodes = m.id left join org_member m2 on ev.partID = m2.id) info where 1=1 and staffID in (RAW_VALUE);
-- error: org.opentest4j.AssertionFailedError: evectionInfo.select generated SQL with extra closing parenthesis: select reqID,staffID,exitReviewEndMarker,staffName,department,destination,to_char(begindate,'yyyy-mm-dd') beginDate,to_char(enddate,'yyyy-mm-dd') endDate,days,origin,evectiontype,to_char(applytime,'yyyy-mm-dd') applytime,propose,proposercode,abroadFlag,flowSerialNo,applyStatus, currentState, refSerialNo,flowUrl,inspStates,backFlowUrl from (select ev.*, m.name propose,m.code proposercode,m2.code staffID, m2.name staffName from (select t1.reqid, t1.department, t1.origin, t1.evectiontype, t1.enddate, t1.begindate, t1.destination, t1.proposercode proposercodes, t1.days, t1.applytime, t1.abroadflag, t2.column_value partID, t1.includehk, t1.flowSerialNo, t1.applyStatus, nvl(t1.ifrefund, '0') exitReviewEndMarker, currentState, refSerialNo, flowUrl, inspStates, backFlowUrl from vm_evations t1, table (select util_common.split(t1.man || ',' || t1.son, ',') from dual) t2 where (includehk =0 or includehk is null or t1.includeHK = 'VALUE_001' ) and ((decode （t1.evectiontype ,'出差',1,0) = 1 and ('0' = 'VALUE_001' or (t1.ifrefund = 1 or t1.ifrefund is null)) ) or decode（t1.evectiontype ,'出差',1,0) = 0) and t1.evectiontype = 'VALUE_001' and t1.department like '%'|| 'VALUE_001' || '%' and (t1.applyStatus = 'VALUE_001' or t1.applyStatus is null) and t1.applyStatus = 'VALUE_001' and to_date(to_char(t1.modify_date, 'yyyy-mm-dd'), 'yyyy-mm-dd') between to_date('2026-05-14', 'yyyy-mm-dd') and to_date('2026-05-14', 'yyyy-mm-dd') ) ev left join org_member m on ev.proposercodes = m.id left join org_member m2 on ev.partID = m2.id) info where 1=1 and staffID in (RAW_VALUE) ==> expected: <true> but was: <false>

-- statementId: queryReptionsByRecid.select
-- lookupStatementId: queryReptionsByRecid.select
-- source: evection_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id, kmrecid, to_char(beginDate, 'yyyy-mm-dd') beginDate, to_char(endDate, 'yyyy-mm-dd') endDate, inspStates from vm_evations v where v.kmrecid = 'VALUE_001';

-- statementId: findResearchRecordsInLibrary.select
-- lookupStatementId: findResearchRecordsInLibrary.select
-- source: evection_sqlmap.xml
-- type: select
-- params: {
--   "recids": [
--     "EVENT_A",
--     "EVENT_B"
--   ]
-- }
select id, kmRecid, to_char(beginDate, 'yyyy-mm-dd') beginDate, to_char(endDate, 'yyyy-mm-dd') endDate, inspStates from vm_cap4Evation where evationtype = -1018115749788758189 and kmrecid in ('EVENT_A','EVENT_B');

-- statementId: contractId.select
-- lookupStatementId: contractId.select
-- source: contract_sqlmap.xml
-- type: select
-- params: {
--   "contractNo": "VALUE_001"
-- }
select ID from formmain_0535 where field0002 = 'VALUE_001';

-- statementId: contract.select
-- lookupStatementId: contract.select
-- source: contract_sqlmap.xml
-- type: select
-- params: {
--   "datetime": "2026-05-14"
-- }
select decode(vm.id,null,'0','1') as isSendOAContractMaintain, field0001 as subject, field0002 as contractNo, ORG_PRINCIPAL.LOGIN_NAME as sponsor, ORG_UNIT.CODE as sponsorDepartment, '' as linkSign, field0005 as linkSignSubject, field0007 as sourceSystem, '' as sourceSystemID, '' as sourceSystemURL, enum_item_contractType.SHOWVALUE as contractPayType, enum_item_contractClassify.SHOWVALUE as contractClassify, enum_item_contractPayType.SHOWVALUE as contractType, '' as contractCategory, field0014 as amount, field0015 as amountInWord, field0016 as startTime, field0017 as endTime, enum_item_state.SHOWVALUE as state, field0019 as mainBody, field0021 as attachment, field0022 as analogueContact, field0023 as analogueName, field0024 as contactType, field0025 as contactAddress, enum_item_payType.SHOWVALUE as payType, enum_item_payWay.SHOWVALUE as payWay, field0028 as sealAttachment, '' as bidProcess, field0030 as bidAttachment, field0031 as stateChangeDeclare, '' as participant, '' as negotiateDate, '' as negotiateFile, field0035 as stateModifyNo, to_char(formmain_0535.start_date,'yyyy-mm-dd hh24:mi:dd') as createTime, field0057 as destroyTime, to_char(formmain_0535.start_date,'YYYY-MM-DD hh:mi:dd') as fileTime from ORG_PRINCIPAL RIGHT OUTER JOIN formmain_0535 ON ORG_PRINCIPAL.MEMBER_ID = formmain_0535.field0003 LEFT OUTER JOIN vm_wfcontractmaintain vm on field0002 = vm.contractFileNo LEFT OUTER JOIN ORG_UNIT ON formmain_0535.field0004 = ORG_UNIT.ID LEFT OUTER JOIN CTP_ENUM_ITEM enum_item_contractPayType ON formmain_0535.field0010 = enum_item_contractPayType.ID LEFT OUTER JOIN CTP_ENUM_ITEM enum_item_contractClassify ON formmain_0535.field0011 = enum_item_contractClassify.ID LEFT OUTER JOIN CTP_ENUM_ITEM enum_item_contractType on formmain_0535.field0012 = enum_item_contractType.ID LEFT OUTER JOIN CTP_ENUM_ITEM enum_item_contractCategory on formmain_0535.field0013 = enum_item_contractCategory.ID LEFT OUTER JOIN CTP_ENUM_ITEM enum_item_state on formmain_0535.field0018 = enum_item_state.ID LEFT OUTER JOIN CTP_ENUM_ITEM enum_item_payType on formmain_0535.field0026 = enum_item_payType.ID LEFT OUTER JOIN CTP_ENUM_ITEM enum_item_payWay on formmain_0535.field0027 = enum_item_payWay.ID where modify_date >= to_date('2026-05-14','YYYY-MM-DD HH24:MI:SS') and field0002 is not null;

-- statementId: modifyTerms.select
-- lookupStatementId: modifyTerms.select
-- source: contract_sqlmap.xml
-- type: select
-- params: {
--   "formmain_id": 1001
-- }
select field0049 as changeNo, field0050 as changeDate, field0051 as applicat, field0052 as changeType, field0053 as changeAmount, field0054 as term, field0055 as changeAttachment from formson_0538 where formmain_id = 1001;

-- statementId: exceptPay.select
-- lookupStatementId: exceptPay.select
-- source: contract_sqlmap.xml
-- type: select
-- params: {
--   "formmain_id": 1001
-- }
select field0036 as no, field0037 as payBatch, field0038 as payAmount, field0039 as percentage, field0040 as paymentTerms, '' as deliverable, field0042 as "comment" from formson_0536 where formmain_id = 1001;

-- statementId: exceptPay.delete
-- lookupStatementId: exceptPay.delete
-- source: contract_sqlmap.xml
-- type: delete
-- params: {
--   "contractNo": "VALUE_001"
-- }
delete formson_0537 where field0043 = 1 and field0045 is null and field0046 is null and FORMMAIN_ID in (select id from formmain_0535 where field0002 ='VALUE_001');

-- statementId: payment.insert
-- lookupStatementId: payment.insert
-- source: contract_sqlmap.xml
-- type: insert
-- params: {
--   "ID": 1001,
--   "formmain_id": 1001,
--   "payBatch": "VALUE_001",
--   "paymentSerialNumber": "VALUE_001"
-- }
insert into formson_0537(ID,formmain_id,sort,field0043,field0044,field0045,field0046,field0047,field0048) values(1001,1001,#no:numeric:NULL#,#no:numeric:NULL#,'VALUE_001',#payAmount:numeric:NULL#,#percentage:numeric:NULL#,to_date(#paymentDate:datetime:NULL#,'YYYY-MM-DD HH24:MI:SS'),'VALUE_001');

-- statementId: supplier.select
-- lookupStatementId: supplier.select
-- source: contract_sqlmap.xml
-- type: select
-- params: {
--   "supplierNo": "VALUE_001"
-- }
select * from formmain_0328 t where t.field0001= 'VALUE_001';

-- statementId: supplier.update
-- lookupStatementId: supplier.update
-- source: contract_sqlmap.xml
-- type: update
-- params: {
--   "supplierNo": "VALUE_001",
--   "supplierName": "NAME_001",
--   "supplierType": "VALUE_001",
--   "ifEffective": "VALUE_001",
--   "createDate": "2026-05-14",
--   "supplierContacts": "VALUE_001",
--   "supplierPhone": "VALUE_001",
--   "supplierAddress": "VALUE_001"
-- }
update formmain_0328 set FIELD0001='VALUE_001' ,FIELD0002='NAME_001' ,FIELD0003='VALUE_001' , FIELD0005='VALUE_001' ,FIELD0006=to_date('2026-05-14','yyyy-MM-dd'), FIELD0007='VALUE_001' , FIELD0009='VALUE_001', FIELD0010='VALUE_001' where field0001='VALUE_001' and not(field0006 >= to_date('2026-05-14','yyyy-MM-dd'));

-- statementId: supplier.insert
-- lookupStatementId: supplier.insert
-- source: contract_sqlmap.xml
-- type: insert
-- params: {
--   "id": 1001,
--   "supplierNo": "VALUE_001",
--   "supplierName": "NAME_001",
--   "supplierType": "VALUE_001",
--   "ifEffective": "VALUE_001",
--   "supplierContacts": "VALUE_001",
--   "supplierTypeStr": "VALUE_001",
--   "supplierPhone": "VALUE_001",
--   "supplierAddress": "VALUE_001",
--   "creditCode": "CODE_001",
--   "channelType": "VALUE_001"
-- }
insert into vm_supplierInfo ( id, state, start_member_id, start_date, approve_member_id, approve_date, supplierNo, supplierName, supplierType, ifEffective, createDate, supplierContacts, supplierTypeStr, supplierPhone, supplierAddress, creditCode, channelType )values ( 1001, '1', '0', sysdate, null, sysdate, 'VALUE_001', 'NAME_001', 'VALUE_001', 'VALUE_001', sysdate, 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'CODE_001', 'VALUE_001' );

-- statementId: contractAmount.update
-- lookupStatementId: contractAmount.update
-- source: contract_sqlmap.xml
-- type: update
-- params: {
--   "formId": 1001
-- }
update formmain_0578 set field0011=0 where id = 1001 and field0008 = -3439448072536899479;

-- statementId: contractPayPlan.delete
-- lookupStatementId: contractPayPlan.delete
-- source: contract_sqlmap.xml
-- type: delete
-- params: {
--   "formId": 1001
-- }
delete formson_0579　 where　formmain_id in (SELECT id from formmain_0578　where　id = 1001 and field0008 = -3439448072536899479);

-- statementId: contractProjectInfo.insert
-- lookupStatementId: contractProjectInfo.insert
-- source: contract_sqlmap.xml
-- type: insert
-- params: {
--   "id": 1001,
--   "state": 1,
--   "start_member_id": 1001,
--   "start_date": "2026-05-14",
--   "approve_member_id": 1001,
--   "approve_date": "2026-05-14",
--   "finishedflag": 1,
--   "ratifyflag": 1,
--   "ratify_member_id": 1001,
--   "ratify_date": "2026-05-14",
--   "serialNumber": "VALUE_001",
--   "projectNumber": "VALUE_001",
--   "projectName": "NAME_001",
--   "leader": "VALUE_001",
--   "LeadingDepart": "VALUE_001",
--   "applyDate": "2026-05-14",
--   "projectId": 1001,
--   "indicatorId": 1001,
--   "leadingDepartId": 1001,
--   "leaderKMId": 1001,
--   "projectDetailsUrl": "VALUE_001",
--   "ProjectStatus": 1,
--   "indicatorName": "NAME_001",
--   "indicatorIdBelongDepart": 1001,
--   "indicatorDepartName": "NAME_001"
-- }
insert into vm_fwprojectInfo( id, state, start_member_id, start_date, approve_member_id, approve_date, finishedflag, ratifyflag, ratify_member_id, ratify_date, serialNumber, projectNumber, projectName, leader, LeadingDepart, applyDate, projectId, indicatorId, leadingDepartId, leaderKMId, projectDetailsUrl, ProjectStatus, indicatorName, indicatorIdBelongDepart, indicatorDepartName ) values( 1001, 1, 1001, '2026-05-14', 1001, '2026-05-14', 1, 1, 1001, '2026-05-14', 'VALUE_001', 'VALUE_001', 'NAME_001', 'VALUE_001', 'VALUE_001', to_date('2026-05-14','yyyy/mm/dd HH24:MI:SS'), 1001, 1001, 1001, 1001, 'VALUE_001', 1, 'NAME_001', 1001, 'NAME_001' );

-- statementId: projectInfoByProjectId.select
-- lookupStatementId: projectInfoByProjectId.select
-- source: contract_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id, state, start_member_id, start_date, approve_member_id, approve_date, finishedflag, ratifyflag, ratify_member_id, ratify_date, serialNumber, projectNumber, projectName, leader, LeadingDepart, applyDate, projectId, indicatorId, leadingDepartId , leaderKMId, projectDetailsUrl, ProjectStatus from vm_fwprojectInfo vm where vm.projectId = 'VALUE_001';

-- statementId: procurementMatters.insert
-- lookupStatementId: procurementMatters.insert
-- source: contract_sqlmap.xml
-- type: insert
-- params: {
--   "id": 1001,
--   "state": 1,
--   "start_member_id": 1001,
--   "start_date": "2026-05-14",
--   "approve_member_id": 1001,
--   "approve_date": "2026-05-14",
--   "finishedflag": 1,
--   "ratifyflag": 1,
--   "ratify_member_id": 1001,
--   "ratify_date": "2026-05-14",
--   "serialNumber": "VALUE_001",
--   "ITProMattersNumber": "VALUE_001",
--   "ITProMattersName": "NAME_001",
--   "ownerOfMatters": "VALUE_001",
--   "money": "VALUE_001",
--   "itemType": "VALUE_001",
--   "proSubjectMatter": "TITLE_001",
--   "ITProMattersId": 1001,
--   "indicatorId": 1001,
--   "itDetailUrl": "VALUE_001",
--   "updateTime": "2026-05-14"
-- }
insert into vm_itpromatters values( 1001, 1, 1001, '2026-05-14', 1001, '2026-05-14', 1, 1, 1001, '2026-05-14', 'VALUE_001', 'VALUE_001', 'NAME_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'TITLE_001', 1001, 1001, 'VALUE_001','2026-05-14');

-- statementId: procurementMatters.select
-- lookupStatementId: procurementMatters.select
-- source: contract_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id, state, start_member_id, start_date, approve_member_id, approve_date, finishedflag, ratifyflag, ratify_member_id, ratify_date, serialNumber, ITProMattersNumber, ITProMattersName, ownerOfMatters, money, itemType, proSubjectMatter, ITProMattersId, indicatorId from vm_itpromatters vm where vm.ITProMattersId = 'VALUE_001';

-- statementId: personInfoSave.insert
-- lookupStatementId: personInfoSave.insert
-- source: contract_sqlmap.xml
-- type: insert
-- params: {
--   "id": 1001,
--   "state": 1,
--   "start_member_id": 1001,
--   "start_date": "2026-05-14",
--   "approve_member_id": 1001,
--   "approve_date": "2026-05-14",
--   "finishedflag": 1,
--   "ratifyflag": 1,
--   "ratify_member_id": 1001,
--   "ratify_date": "2026-05-14",
--   "personName": "NAME_001",
--   "departName": "NAME_001",
--   "personId": 1001,
--   "personKMCode": "CODE_001",
--   "departmentId": 1001,
--   "updateTime": "2026-05-14"
-- }
insert into vm_personinfo values( 1001, 1, 1001, '2026-05-14', 1001, '2026-05-14', 1, 1, 1001, '2026-05-14', 'NAME_001', 'NAME_001', 1001, 'CODE_001', 1001,'2026-05-14');

-- statementId: personInfoById.select
-- lookupStatementId: personInfoById.select
-- source: contract_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id, state, start_member_id, start_date, approve_member_id, approve_date, finishedflag, ratifyflag, ratify_member_id, ratify_date, personName, departName, personId, personKMCode, departmentId from vm_personinfo vm where vm.personId = 'VALUE_001';

-- statementId: deletePersonInfo.delete
-- lookupStatementId: deletePersonInfo.delete
-- source: contract_sqlmap.xml
-- type: delete
-- params: {}
delete from vm_personinfo;

-- statementId: organizationInfoSave.insert
-- lookupStatementId: organizationInfoSave.insert
-- source: contract_sqlmap.xml
-- type: insert
-- params: {
--   "id": 1001,
--   "state": 1,
--   "start_member_id": 1001,
--   "start_date": "2026-05-14",
--   "approve_member_id": 1001,
--   "approve_date": "2026-05-14",
--   "finishedflag": 1,
--   "ratifyflag": 1,
--   "ratify_member_id": 1001,
--   "ratify_date": "2026-05-14",
--   "departmentName": "NAME_001",
--   "departmentId": 1001,
--   "departmentSuperId": 1001,
--   "departmentCode": "CODE_001",
--   "isBottomLevel": "VALUE_001",
--   "OADepartId": 1001,
--   "departmentKMCode": "CODE_001",
--   "updateTime": "2026-05-14"
-- }
insert into vm_fkorganization values( 1001, 1, 1001, '2026-05-14', 1001, '2026-05-14', 1, 1, 1001, '2026-05-14', 'NAME_001', 1001, 1001, 'CODE_001', 'VALUE_001', 1001, 'CODE_001', '2026-05-14' );

-- statementId: organizationInfById.select
-- lookupStatementId: organizationInfById.select
-- source: contract_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id, state, start_member_id, start_date, approve_member_id, approve_date, finishedflag, ratifyflag, ratify_member_id, ratify_date, departmentName, departmentId, departmentSuperId, departmentCode, isBottomLevel from vm_fkorganization vm where vm.departmentId = 'VALUE_001';

-- statementId: deleteOrganizationInfo.delete
-- lookupStatementId: deleteOrganizationInfo.delete
-- source: contract_sqlmap.xml
-- type: delete
-- params: {}
delete from vm_fkorganization;

-- statementId: indicatorInfo.insert
-- lookupStatementId: indicatorInfo.insert
-- source: contract_sqlmap.xml
-- type: insert
-- params: {
--   "id": 1001,
--   "state": 1,
--   "start_member_id": 1001,
--   "start_date": "2026-05-14",
--   "approve_member_id": 1001,
--   "approve_date": "2026-05-14",
--   "finishedflag": 1,
--   "ratifyflag": 1,
--   "ratify_member_id": 1001,
--   "ratify_date": "2026-05-14",
--   "departName": "NAME_001",
--   "indicatorName": "NAME_001",
--   "indicatorId": 1001,
--   "indicatorSuperId": 1001,
--   "indicatorCode": "CODE_001",
--   "isBottomLevel": "VALUE_001",
--   "departId": 1001,
--   "note": "VALUE_001",
--   "updateTime": "2026-05-14"
-- }
insert into vm_IndicatorInfo values ( 1001,1,1001,'2026-05-14',1001, '2026-05-14',1,1,1001, '2026-05-14','NAME_001','NAME_001',1001,1001, 'CODE_001','VALUE_001',1001,'VALUE_001','2026-05-14');

-- statementId: indicatorInfo.delete
-- lookupStatementId: indicatorInfo.delete
-- source: contract_sqlmap.xml
-- type: delete
-- params: {
--   "indicatorId": 1001,
--   "departId": 1001
-- }
delete from vm_IndicatorInfo where indicatorId = 1001 and departId = 1001;

-- statementId: contractStateChange.insert
-- lookupStatementId: contractStateChange.insert
-- source: contract_sqlmap.xml
-- type: insert
-- params: {
--   "id": 1001,
--   "state": 1,
--   "start_member_id": 1001,
--   "start_date": "2026-05-14",
--   "approve_member_id": 1001,
--   "approve_date": "2026-05-14",
--   "finishedflag": 1,
--   "ratifyflag": 1,
--   "ratify_member_id": 1001,
--   "ratify_date": "2026-05-14",
--   "contractFlow": "VALUE_001",
--   "contractStatus": 1,
--   "colSummaryId": 1001,
--   "dataMainId": 1001,
--   "contractFileNo": "VALUE_001"
-- }
insert into vm_contractstatechange values ( 1001, 1, 1001, '2026-05-14', 1001, '2026-05-14', 1, 1, 1001, '2026-05-14', 'VALUE_001', 1, 1001, 1001, 'VALUE_001' );

-- statementId: contractStateChangeByState.select
-- lookupStatementId: contractStateChangeByState.select
-- source: contract_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id , state , start_member_id , start_date , approve_member_id , approve_date , finishedflag , ratifyflag , ratify_member_id , ratify_date , contractFlow, contractStatus, colSummaryId, datamainId, contractFileNo from vm_contractstatechange where contractStatus != 'VALUE_001';

-- statementId: contractState.update
-- lookupStatementId: contractState.update
-- source: contract_sqlmap.xml
-- type: update
-- params: {
--   "contractState": 1,
--   "contractFileNo": "VALUE_001"
-- }
update vm_contractstatechange set contractStatus = 1 where contractFileNo = 'VALUE_001';

-- statementId: contractMartin.select
-- lookupStatementId: contractMartin.select
-- source: contract_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select state from vm_wfcontractmaintain where id = 'VALUE_001';

-- statementId: contractStateByContractFileNo.select
-- lookupStatementId: contractStateByContractFileNo.select
-- source: contract_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id , state , start_member_id , start_date , approve_member_id , approve_date , finishedflag , ratifyflag , ratify_member_id , ratify_date , contractFlow, contractStatus, colSummaryId, datamainId, contractFileNo from vm_contractstatechange where contractFileNo = 'VALUE_001';

-- statementId: bankInfoByBankId.select
-- lookupStatementId: bankInfoByBankId.select
-- source: contract_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id, state, start_member_id, start_date, approve_member_id, approve_date, finishedflag, ratifyflag, ratify_member_id, ratify_date, bankCode, bankOfDeposit, province, city, bankName, bankIBPS, freezeOrNot from vm_bankoutletinformation where bankCode = 'VALUE_001';

-- statementId: bankInfo.insert
-- lookupStatementId: bankInfo.insert
-- source: contract_sqlmap.xml
-- type: insert
-- params: {
--   "id": 1001,
--   "state": 1,
--   "start_member_id": 1001,
--   "start_date": "2026-05-14",
--   "approve_member_id": 1001,
--   "approve_date": "2026-05-14",
--   "finishedflag": 1,
--   "ratifyflag": 1,
--   "ratify_member_id": 1001,
--   "ratify_date": "2026-05-14",
--   "bankCode": "CODE_001",
--   "bankOfDeposit": "VALUE_001",
--   "province": "VALUE_001",
--   "city": "VALUE_001",
--   "bankName": "NAME_001",
--   "freezeOrNot": "VALUE_001",
--   "bankIBPS": "VALUE_001"
-- }
insert into vm_bankoutletinformation (id, state, start_member_id, start_date, approve_member_id, approve_date, finishedflag, ratifyflag, ratify_member_id, ratify_date, bankCode, bankOfDeposit, province, city, bankName, freezeOrNot, bankIBPS) values (1001, 1, 1001, '2026-05-14', 1001, '2026-05-14', 1, 1, 1001, '2026-05-14', 'CODE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'NAME_001', 'VALUE_001', 'VALUE_001');

-- statementId: bankInfo.update
-- lookupStatementId: bankInfo.update
-- source: contract_sqlmap.xml
-- type: update
-- params: {
--   "state": 1,
--   "start_member_id": 1001,
--   "start_date": "2026-05-14",
--   "approve_member_id": 1001,
--   "approve_date": "2026-05-14",
--   "finishedflag": 1,
--   "ratifyflag": 1,
--   "ratify_member_id": 1001,
--   "ratify_date": "2026-05-14",
--   "bankCode": "CODE_001",
--   "bankOfDeposit": "VALUE_001",
--   "province": "VALUE_001",
--   "city": "VALUE_001",
--   "bankName": "NAME_001",
--   "freezeOrNot": "VALUE_001",
--   "bankIBPS": "VALUE_001",
--   "id": 1001
-- }
update vm_bankoutletinformation set state=1, start_member_id=1001, start_date='2026-05-14', approve_member_id=1001, approve_date='2026-05-14', finishedflag=1, ratifyflag=1, ratify_member_id=1001, ratify_date='2026-05-14', bankCode ='CODE_001', bankOfDeposit='VALUE_001', province='VALUE_001', city='VALUE_001', bankName='NAME_001', freezeOrNot='VALUE_001', bankIBPS='VALUE_001' where id = 1001;

-- statementId: supplierManager.select
-- lookupStatementId: supplierManager.select
-- source: contract_sqlmap.xml
-- type: select
-- params: {
--   "key": "VALUE_001"
-- }
select id, modify_date, applyUser, applyDate, applyDepart, supplierName, supplierNo, util_common.getEnumValueById(qualificationsOfTaxpayer) qualificationsOfTaxpayer, supplierAddress, taxpayerIdentificationNumber, dateOfIncorporation, supplierType, specialSupplierNumber, util_common.getEnumValueById(supplierStatus) supplierStatus, isSpecialSupplier from vm_itsuppliermanager where 1 = 1 and modify_date > to_date('VALUE_001','yyyymmdd');

-- statementId: bankInfoByFormMainId.select
-- lookupStatementId: bankInfoByFormMainId.select
-- source: contract_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id, formmain_id, bankOfDeposit, bankAccount, accountName, bankName, bankIBPS, province, city, util_common.getEnumValueById(freezeOrNot) as freezeOrNot, bankCode from vm_ITSupplierBankoutletInfoson where formmain_id = 'VALUE_001';

-- statementId: supplierInfoSerach.select
-- lookupStatementId: supplierInfoSerach.select
-- source: contract_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id,creditCode,supplierNo,supplierName,supplierType from vm_supplierInfo vm where vm.supplierNo = 'VALUE_001';

-- statementId: SupplierInfoDatas.insert
-- lookupStatementId: SupplierInfoDatas.insert
-- source: contract_sqlmap.xml
-- type: insert
-- params: {
--   "id": 1001,
--   "createDate": "2026-05-14",
--   "supplierNo": "VALUE_001",
--   "supplierName": "NAME_001",
--   "supplierContacts": "VALUE_001",
--   "supplierPhone": "VALUE_001",
--   "supplierAddress": "VALUE_001",
--   "creditCode": "CODE_001",
--   "channelType": "VALUE_001",
--   "belongOrg": "VALUE_001",
--   "belongOrgStr": "VALUE_001"
-- }
insert into vm_supplierinfo ( id, state, start_member_id, start_date, approve_member_id, approve_date, finishedflag, ratifyflag, ratify_member_id, sort, modify_member_id, modify_date, supplierNo, supplierName, supplierType, ifEffective, createDate, supplierContacts, supplierTypeStr, supplierPhone, supplierAddress, creditCode, channelType, belongOrg, belongOrgStr ) values ( 1001, 1, -6760911671874597139, sysdate, 0, sysdate, 0, 0, 0, 0, -6760911671874597139, to_date('2026-05-14','yyyy-mm-dd'), 'VALUE_001', 'NAME_001', -3986095288122979941, 5118794060043470886, to_date('2026-05-14','yyyy-mm-dd'), 'VALUE_001', '零售渠道', 'VALUE_001', 'VALUE_001', 'CODE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001' );

-- statementId: supplierInfo.update
-- lookupStatementId: supplierInfo.update
-- source: contract_sqlmap.xml
-- type: update
-- params: {
--   "supplierName": "NAME_001",
--   "createDate": "2026-05-14",
--   "channelType": "VALUE_001",
--   "creditCode": "CODE_001",
--   "belongOrg": "VALUE_001",
--   "belongOrgStr": "VALUE_001",
--   "supplierNo": "VALUE_001"
-- }
update vm_supplierInfo set supplierName = 'NAME_001', modify_date = to_date('2026-05-14','yyyy-mm-dd'), channelType= 'VALUE_001', creditCode = 'CODE_001' ,supplierType = -3986095288122979941,belongOrg = 'VALUE_001' ,belongOrgStr='VALUE_001' where supplierNo = 'VALUE_001';

-- statementId: ctpVmAffairInfo.select
-- lookupStatementId: ctpVmAffairInfo.select
-- source: contract_sqlmap.xml
-- type: select
-- params: {
--   "affairId": 1001,
--   "form_recordid": 1001
-- }
select id, to_char(is_cover_time) IS_COVER_TIME ,/* 是否超期*/ to_char(member_id) member_id ,/* 人员ID*/ sender_id ,/* 发送人ID*/ subject ,/* 标题 */ app ,/* 应用 */ object_id ,/* 主应用ID*/ sub_object_id ,/* 对应worktime_id状态*/ state ,/* 状态 */ sub_state ,/* 子状态 */ hasten_times ,/* 催办次数 */ remind_date ,/* 提醒时间 */ to_char(deadline_date) deadline_date ,/* 节点期限 */ can_due_remind ,/* 是否到期提醒 */ create_date ,/* 节点创建时间 */ to_char(receive_time, 'yyyy-MM-dd HH24:mi:ss') receive_time ,/* 接收时间 */ to_char(complete_time, 'yyyy-MM-dd HH24:mi:ss') complete_time ,/* 完成时间 */ remind_interval ,/* 提醒周期 */ is_delete ,/* 是否被删除 */ track ,/* 是否跟踪 */ archive_id ,/* 归档ID */ addition ,/* 属性 text*/ ext_props ,/* 扩展属性 */ update_date ,/* 更新时间 */ is_finish ,/* 是否结束 */ body_type ,/* 正文类型 */ important_level ,/* 重要程度 */ resent_time ,/* 重复次数 */ forward_member ,/* 转发人 text*/ identifier ,/* 标识符 text*/ transactor_id ,/* 代理人 text*/ node_policy ,/* 节点权限 */ activity_id ,/* 工作流节点ID */ form_app_id ,/* 表单应用ID */ form_id ,/* 表单视图ID */ form_operation_id ,/* 表单操作ID */ to_char(templete_id) templete_id ,/* 模板ID */ from_id ,/* 会签操作来源ID */ over_worktime ,/* 按工作时间计算超期时间 */ run_worktime ,/* 按工作时间计算运行时间 */ over_time ,/* 按自然时间计算超期时间 */ run_time ,/* 按自然日计算运行时间 */ deal_term_type ,/* 处理期限到处理类型 */ deal_term_userid ,/* 处理前线到处理类型1的辅*/ sub_app ,/* 子应用ID */ expected_process_time ,/* 执行时间 */ org_account_id ,/* 单位ID */ process_id ,/* 实列ID */ is_process_over_time ,/* is_process_o*/ form_multi_operation_id ,/* 记录视图权限ID串 */ back_from_id ,/* 回退人的ID */ form_relative_static_ids ,/* OA任务状态 */ form_relative_query_ids ,/* FORM_RELATIV*/ task_state ,/* FORM_RELATIV*/ has_favorite ,/* 是否收藏 */ to_char(from_type) from_type ,/* 加签等操作类型 */ to_char(form_recordid) form_recordid ,/* 表单数据记录ID */ case_id ,/* 流程case_id数据关*/ relation_data_id ,/* 数据关联id */ firstview_period ,/* 首次查看时长 */ firstview_date ,/* 首次查看时间点 */ firstresponse_period ,/* 首次响应耗时 */ signleview_period ,/* 首次查看耗时 */ pre_approver ,/* 上一处理人 */ auto_run ,/* 是否自动发起流程 */ summary_state ,/* 节点流程状态 */ top_time ,/* 置顶时间 */ sort_weight ,/* 智能排序权重值 */ ai_processing ,/* 智能处理标记 */ process_deadline_time ,/* 流程期限 */ proxy_member_id ,/* 代理人ID */ match_department_id ,/* 匹配的部门ID */ match_post_id ,/* 匹配的岗位ID */ node_name ,/* 节点名称 */ match_account_id ,/* 匹配的单位ID */ print_nm ,/* 是否打印_打印此时 */ message_rule_id /* 消息规则ID */ from VM_OVERTIME_TASK_INFO where 1=1 and id = 1001 and form_recordid = 1001;

-- statementId: ctpAffairInfo.select
-- lookupStatementId: ctpAffairInfo.select
-- source: contract_sqlmap.xml
-- type: select
-- params: {
--   "affairId": 1001,
--   "form_recordid": 1001
-- }
select id, to_char(is_cover_time) IS_COVER_TIME ,/* 是否超期*/ to_char(member_id) member_id ,/* 人员ID*/ sender_id ,/* 发送人ID*/ subject ,/* 标题 */ app ,/* 应用 */ object_id ,/* 主应用ID*/ sub_object_id ,/* 对应worktime_id状态*/ state ,/* 状态 */ sub_state ,/* 子状态 */ hasten_times ,/* 催办次数 */ remind_date ,/* 提醒时间 */ to_char(deadline_date) deadline_date ,/* 节点期限 */ can_due_remind ,/* 是否到期提醒 */ create_date ,/* 节点创建时间 */ to_char(receive_time, 'yyyy-MM-dd HH24:mi:ss') receive_time ,/* 接收时间 */ to_char(complete_time, 'yyyy-MM-dd HH24:mi:ss') complete_time ,/* 完成时间 */ remind_interval ,/* 提醒周期 */ is_delete ,/* 是否被删除 */ track ,/* 是否跟踪 */ archive_id ,/* 归档ID */ addition ,/* 属性 text*/ ext_props ,/* 扩展属性 */ update_date ,/* 更新时间 */ is_finish ,/* 是否结束 */ body_type ,/* 正文类型 */ important_level ,/* 重要程度 */ resent_time ,/* 重复次数 */ forward_member ,/* 转发人 text*/ identifier ,/* 标识符 text*/ transactor_id ,/* 代理人 text*/ node_policy ,/* 节点权限 */ activity_id ,/* 工作流节点ID */ form_app_id ,/* 表单应用ID */ form_id ,/* 表单视图ID */ form_operation_id ,/* 表单操作ID */ to_char(templete_id) templete_id ,/* 模板ID */ from_id ,/* 会签操作来源ID */ over_worktime ,/* 按工作时间计算超期时间 */ run_worktime ,/* 按工作时间计算运行时间 */ over_time ,/* 按自然时间计算超期时间 */ run_time ,/* 按自然日计算运行时间 */ deal_term_type ,/* 处理期限到处理类型 */ deal_term_userid ,/* 处理前线到处理类型1的辅*/ sub_app ,/* 子应用ID */ expected_process_time ,/* 执行时间 */ org_account_id ,/* 单位ID */ process_id ,/* 实列ID */ is_process_over_time ,/* is_process_o*/ form_multi_operation_id ,/* 记录视图权限ID串 */ back_from_id ,/* 回退人的ID */ form_relative_static_ids ,/* OA任务状态 */ form_relative_query_ids ,/* FORM_RELATIV*/ task_state ,/* FORM_RELATIV*/ has_favorite ,/* 是否收藏 */ to_char(from_type) from_type ,/* 加签等操作类型 */ to_char(form_recordid) form_recordid ,/* 表单数据记录ID */ case_id ,/* 流程case_id数据关*/ relation_data_id ,/* 数据关联id */ firstview_period ,/* 首次查看时长 */ firstview_date ,/* 首次查看时间点 */ firstresponse_period ,/* 首次响应耗时 */ signleview_period ,/* 首次查看耗时 */ pre_approver ,/* 上一处理人 */ auto_run ,/* 是否自动发起流程 */ summary_state ,/* 节点流程状态 */ top_time ,/* 置顶时间 */ sort_weight ,/* 智能排序权重值 */ ai_processing ,/* 智能处理标记 */ process_deadline_time ,/* 流程期限 */ proxy_member_id ,/* 代理人ID */ match_department_id ,/* 匹配的部门ID */ match_post_id ,/* 匹配的岗位ID */ node_name ,/* 节点名称 */ match_account_id ,/* 匹配的单位ID */ print_nm ,/* 是否打印_打印此时 */ message_rule_id /* 消息规则ID */ from ctp_affair where 1=1 and id = 1001 and form_recordid = 1001;

-- statementId: memberIsOverManager.select
-- lookupStatementId: memberIsOverManager.select
-- source: contract_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select to_char(count(*)) from org_member om left join org_level ol on ol.id = om.org_level_id and ol.org_account_id = om.org_account_id where om.is_enable = 1 and ((ol.level_id > 7 and ol.org_account_id = 97839079791739420) or (ol.org_account_id = -8906103683992302519 and ol.level_id > 4) or (ol.org_account_id = -2948740806339441327 and ol.level_id > 4)) and om.id = 'VALUE_001';

-- statementId: memberIsOverOrEqManager.select
-- lookupStatementId: memberIsOverOrEqManager.select
-- source: contract_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select to_char(count(*)) from org_member om left join org_level ol on ol.id = om.org_level_id and ol.org_account_id = om.org_account_id where om.is_enable = 1 and ((ol.level_id >= 7 and ol.org_account_id = 97839079791739420) or (ol.org_account_id = -8906103683992302519 and ol.level_id >= 4) or (ol.org_account_id = -2948740806339441327 and ol.level_id >= 4)) and om.id = 'VALUE_001';

-- statementId: overTimeInfo.select
-- lookupStatementId: overTimeInfo.select
-- source: contract_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select case when ((ol.level_id = 7 and ol.org_account_id = 97839079791739420) or (ol.org_account_id = -8906103683992302519 and ol.level_id = 4) or (ol.org_account_id = -2948740806339441327 and ol.level_id = 4)) then 'true' else 'false' end isDepartManager, c.is_cover_time, util_user.getMemberNameByMemId(c.member_id) memberName, c.node_name, to_char(c.deadline_date) deadline_date, to_char(c.receive_time, 'yyyy-MM-dd HH24:mi:ss') receive_time, to_char(c.complete_time, 'yyyy-MM-dd HH24:mi:ss') complete_time from VM_OVERTIME_TASK_INFO c left join org_member om on om.id = c.member_id and om.org_account_id = c.org_account_id left join org_level ol on ol.id = om.org_level_id and ol.org_account_id = om.org_account_id where ((ol.level_id >= 7 and ol.org_account_id = 97839079791739420) or (ol.org_account_id = -8906103683992302519 and ol.level_id >= 4) or (ol.org_account_id = -2948740806339441327 and ol.level_id >= 4)) and c.node_desc like '%isShowNoteManagerOverTime:1%' and c.form_recordid = 'VALUE_001';

-- statementId: taskExpireNote.select
-- lookupStatementId: taskExpireNote.select
-- source: contract_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select * from vm_taskexpirednotiinfo v1 left join ctp_template v2 on v1.templateId =v2.templete_number where v2.id ='VALUE_001' and util_common.getEnumShowById(useable) = '是' and util_common.getEnumShowById(cfgtype) = '加签超期提醒';

-- statementId: userManualCalcWorkTime.select
-- lookupStatementId: userManualCalcWorkTime.select
-- source: contract_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select COUNT('X') from dual WHERE (to_char(to_date('VALUE_001', 'yyyy-mm-dd HH24:mi:ss'), 'HH24mi') between '0000' AND '0845') OR (to_char(to_date('VALUE_001', 'yyyy-mm-dd HH24:mi:ss'), 'HH24mi') between '1730' AND '2359') OR util_common.isWorkDay(to_date('VALUE_001', 'yyyy-MM-dd HH24:mi:ss')) = 0;

-- statementId: queryContractExtraCheckFlowBySerialNo.select
-- lookupStatementId: queryContractExtraCheckFlowBySerialNo.select
-- source: contract_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select main.id as "id", serialNo as "serialNo", writeTime as "writeTime", applyMember as "applyMember", applyDept as "applyDept", applyAccount as "applyAccount", contractTitle as "contractTitle", contractPayType as "contractPayType", contractType as "contractType", contractCatagory as "contractCatagory", contractStartDate as "contractStartDate", contractEndDate as "contractEndDate", productCode as "productCode", contractName as "contractName", contractModelNo as "contractModelNo", contractModelName as "contractModelName", contractCount as "contractCount", contractModelFile as "contractModelFile", sealedPrintType as "sealedPrintType", companySeal as "companySeal", corporateSeal as "corporateSeal", corporateSign as "corporateSign", attachFile as "attachFile", remark as "remark", deptBusinessLeader as "deptBusinessLeader", deptBusinessGroup as "deptBusinessGroup", contractSeriesCount as "contractSeriesCount", extraContractCount as "extraContractCount", counterpartySeq as "counterpartySeq", contractHandleType as "contractHandleType", counterparty as "counterparty", counterpartyType as "counterpartyType", isSaved as "isSaved", contractRemark as "contractRemark", counterpartyContractNo as "counterpartyContractNo", rfsop as "rfsop" from vm_wf_one2manyContractAddCheck main right join vm_wf_one2manyCounterparty_son son on main.id = son.formmain_id where main.serialNo = 'VALUE_001' and son.isSaved = -1089048568118490234;

-- statementId: queryContractExtraCheckFlowTodoBySerialNo.select
-- lookupStatementId: queryContractExtraCheckFlowTodoBySerialNo.select
-- source: contract_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select main.id as "id", serialNo as "serialNo", writeTime as "writeTime", applyMember as "applyMember", applyDept as "applyDept", applyAccount as "applyAccount", contractTitle as "contractTitle", contractPayType as "contractPayType", contractType as "contractType", contractCatagory as "contractCatagory", contractStartDate as "contractStartDate", contractEndDate as "contractEndDate", productCode as "productCode", contractName as "contractName", contractModelNo as "contractModelNo", contractModelName as "contractModelName", contractCount as "contractCount", contractModelFile as "contractModelFile", sealedPrintType as "sealedPrintType", companySeal as "companySeal", corporateSeal as "corporateSeal", corporateSign as "corporateSign", attachFile as "attachFile", remark as "remark", deptBusinessLeader as "deptBusinessLeader", deptBusinessGroup as "deptBusinessGroup", contractSeriesCount as "contractSeriesCount", extraContractCount as "extraContractCount", counterpartySeq as "counterpartySeq", contractHandleType as "contractHandleType", counterparty as "counterparty", counterpartyType as "counterpartyType", isSaved as "isSaved", contractRemark as "contractRemark", counterpartyContractNo as "counterpartyContractNo", rfsop as "rfsop" from vm_wf_one2manyContractAddCheck main right join vm_wf_one2manyCounterparty_son son on main.id = son.formmain_id where main.serialNo = 'VALUE_001' and son.isSaved = -1089048568118490234 and contractHandleType != -8576853803970704870;

-- statementId: queryContractExtraCheckFlowById.select
-- lookupStatementId: queryContractExtraCheckFlowById.select
-- source: contract_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select main.id as "id", serialNo as "serialNo", writeTime as "writeTime", applyMember as "applyMember", applyDept as "applyDept", applyAccount as "applyAccount", contractTitle as "contractTitle", contractPayType as "contractPayType", contractType as "contractType", contractCatagory as "contractCatagory", contractStartDate as "contractStartDate", contractEndDate as "contractEndDate", productCode as "productCode", contractName as "contractName", contractModelNo as "contractModelNo", contractModelName as "contractModelName", contractCount as "contractCount", contractModelFile as "contractModelFile", sealedPrintType as "sealedPrintType", companySeal as "companySeal", corporateSeal as "corporateSeal", corporateSign as "corporateSign", attachFile as "attachFile", remark as "remark", deptBusinessLeader as "deptBusinessLeader", deptBusinessGroup as "deptBusinessGroup", contractSeriesCount as "contractSeriesCount", extraContractCount as "extraContractCount", counterpartySeq as "counterpartySeq", contractHandleType as "contractHandleType", counterparty as "counterparty", counterpartyType as "counterpartyType", isSaved as "isSaved", contractRemark as "contractRemark", counterpartyContractNo as "counterpartyContractNo", rfsop as "rfsop" from vm_wf_one2manyContractAddCheck main right join vm_wf_one2manyCounterparty_son son on main.id = son.formmain_id where main.id = 'VALUE_001' and son.isSaved = -1089048568118490234;

-- statementId: updateContractExtraCheckFlowIsSaved.update
-- lookupStatementId: updateContractExtraCheckFlowIsSaved.update
-- source: contract_sqlmap.xml
-- type: update
-- params: {
--   "formmainId": 1001,
--   "counterpartySeq": 1
-- }
update vm_wf_one2manyCounterparty_son set isSaved = -3841538853571705149 where formmain_Id = 1001 and counterpartySeq = 1;

-- statementId: insertCounterpartySonRecord.insert
-- lookupStatementId: insertCounterpartySonRecord.insert
-- source: contract_sqlmap.xml
-- type: insert
-- params: {
--   "seq": "VALUE_001",
--   "formmainId": 1001,
--   "counterpartySeq": 1,
--   "copyCounterpartySeq": 1
-- }
insert into vm_wf_one2manyCounterparty_son( id, sort, formmain_id, contractHandleType, counterpartySeq, copyCounterpartySeq, isSaved ) values ( util_common.getAbsID, 'VALUE_001', 1001, -8576853803970704870, 1, 1, -1089048568118490234 );

-- statementId: countProceedOne2ManyContract.select
-- lookupStatementId: countProceedOne2ManyContract.select
-- source: contract_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select count(1) from col_summary where form_recordId in (select id from vm_wf_one2manyContractAddSave where productCode = 'VALUE_001' and contractHandleType = -6872678870404281961) and state = 3;

-- statementId: updateCheckFlowCatagory.update
-- lookupStatementId: updateCheckFlowCatagory.update
-- source: contract_sqlmap.xml
-- type: update
-- params: "VALUE_001"
update vm_wf_one2manyContractAddCheck set contractCatagory = -173591692096352527 where id = 'VALUE_001';

-- statementId: allIndicatorInfo.select
-- lookupStatementId: allIndicatorInfo.select
-- source: contract_sqlmap.xml
-- type: select
-- params: {}
select indicatorId, indicatorSuperId, indicatorName, indicatorCode, isBottomLevel, departId, note, departName, updateTime from vm_IndicatorInfo;

-- statementId: indicatorInfo.update
-- lookupStatementId: indicatorInfo.update
-- source: contract_sqlmap.xml
-- type: update
-- params: {
--   "indicatorSuperId": 1001,
--   "indicatorName": "NAME_001",
--   "indicatorCode": "CODE_001",
--   "isBottomLevel": "VALUE_001",
--   "departName": "NAME_001",
--   "indicatorId": 1001,
--   "departId": 1001
-- }
update vm_IndicatorInfo set indicatorSuperId = 1001, indicatorName = 'NAME_001', indicatorCode = 'CODE_001', isBottomLevel = 'VALUE_001', departName = 'NAME_001' where indicatorId = 1001 and departId = 1001;

-- statementId: getITSupplierSonId.select
-- lookupStatementId: getITSupplierSonId.select
-- source: contract_sqlmap.xml
-- type: select
-- params: {
--   "formMainId": 1001,
--   "supplierWholeName": "NAME_001"
-- }
select id from vm_wf_itsupplierCheck_son where formmain_id = 1001 and supplierName = 'NAME_001';

-- statementId: contractMeetingInfo.select
-- lookupStatementId: contractMeetingInfo.select
-- source: contract_sqlmap.xml
-- type: select
-- params: {
--   "startDate": "2026-05-14",
--   "endDate": "2026-05-14"
-- }
select a.id, a.tableType, a.contractNo , o.name as initiator , to_char(o.ext_attr_22,'yyyy-MM-dd') as hireDate , u.name as department , a.amount ,to_char(a.contractstartTime, 'yyyy-mm-dd') startTime , cs.id as objectId , cl.id as transId , 1 as transState , o.code as empKMCode , u.code as deptKMCode from (select id, 'cap3' tableType, contractNo, initiator, department, type, amount, contractstartTime from vm_wf_contractApprove union all select id, 'cap4' tableType, contractNo, initiator, department, TO_CHAR(type) TYPE, amount, contractstartTime from vm_wf_contractapprovecap4 ) a left join org_member o on a.initiator = o.id left join org_unit u on u.id = a.department left join col_summary cs on a.id = cs.form_recordid left join ctp_process_log cl on cl.process_id = cs.process_id where u.path like '000000010008%' and a.type in (6392553218480033760,-6218287431535212809, 3770742154700737459, -4940602325090024640) and cl.action_id in (1,2,37) and cs.state is not null and cs.state in (0,1,2) and to_date(to_char(cs.create_date, 'yyyy-mm-dd'), 'yyyy-mm-dd') between to_date('2026-05-14','yyyy-MM-dd') and to_date('2026-05-14','yyyy-MM-dd') order by startTime;

-- statementId: collectPensionAttachment.select
-- lookupStatementId: collectPensionAttachment.select
-- source: contract_sqlmap.xml
-- type: select
-- params: {
--   "flowId": 1001,
--   "productStatus": "RAW_VALUE",
--   "productType": "RAW_VALUE"
-- }
select "flowId", "loginName", "deptName", "chineseName", "oaProcessDate", "contractNum", "productName", "productCode" from vm_pension_contract_push where "flowId" = 1001 AND "productStatus" not in (RAW_VALUE) AND "productType" not in (RAW_VALUE);

-- statementId: findSupplierDarkList.select.count
-- lookupStatementId: findSupplierDarkList.select.count
-- source: contract_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select count('x') from vm_itsuppliermanager where supplierType = 9083492222702405265 and taxpayerIdentificationNumber = 'VALUE_001';

-- statementId: findITSupplierList.select.count
-- lookupStatementId: findITSupplierList.select.count
-- source: contract_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select count('x') from vm_itsuppliermanager where supplierStatus = 2071864719110065567 and taxpayerIdentificationNumber = 'VALUE_001' and( isSpecialSupplier = -1089048568118490234 or isSpecialSupplier is null);

-- statementId: findSupplierBySign.select.count
-- lookupStatementId: findSupplierBySign.select.count
-- source: contract_sqlmap.xml
-- type: select
-- params: {
--   "tax": "VALUE_001",
--   "signOffSerialNumber": "VALUE_001"
-- }
select count('x') from vm_itsuppliermanager f where taxpayerIdentificationNumber = 'VALUE_001' and specialSupplierNumber = 'VALUE_001';

-- statementId: findSupplierNoByTax.select
-- lookupStatementId: findSupplierNoByTax.select
-- source: contract_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select supplierNo from vm_cap4_supplier f where f.supplierState = 2071864719110065567 and (f.enableState = -3841538853571705149 or f.enableState is null) and taxpayerIdentificationNumber = 'VALUE_001';

-- statementId: findAllChannelSupplier.select
-- lookupStatementId: findAllChannelSupplier.select
-- source: contract_sqlmap.xml
-- type: select
-- params: {}
select taxpayerIdentificationNumber,dealerCode,dealerType,shortName,belongOrg from vm_cap4_supplier f where f.supplierState = 2071864719110065567 and f.taxpayerIdentificationNumber is not null and (f.enableState is null or f.enableState = -3841538853571705149);

-- statementId: findBankInfoByMainId.select
-- lookupStatementId: findBankInfoByMainId.select
-- source: contract_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id, formmain_id, bankOfDeposit khyh, bankAccount yhzh, accountName zhmc, bankName yhhm, province sf, city ds, freezeOrNot zhsfdj, bankCode yhbh, bankId, bankIBPS from VM_ITSUPPLIERBANKOUTLETINFOSON where formmain_id = 'VALUE_001';

-- statementId: deptDefaultGroupCount.select
-- lookupStatementId: deptDefaultGroupCount.select
-- source: defaultgroup_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select count(defaultgroupname) from vm_defaultgroup where defaultgroupname = 'VALUE_001';

-- statementId: defaultGroup.update
-- lookupStatementId: defaultGroup.update
-- source: defaultgroup_sqlmap.xml
-- type: update
-- params: {
--   "member": "VALUE_001",
--   "deptName": "NAME_001"
-- }
update vm_defaultgroup set defaultgroupmember = 'VALUE_001' where defaultgroupname = 'NAME_001';

-- statementId: defaultGroup.insert
-- lookupStatementId: defaultGroup.insert
-- source: defaultgroup_sqlmap.xml
-- type: insert
-- params: {
--   "id": 1001,
--   "departName": "NAME_001",
--   "member": "VALUE_001",
--   "groupType": "VALUE_001"
-- }
insert into vm_defaultgroup(id, creator, createdate, defaultgroupname, defaultgroupmember, defaulttype) values(1001,util_user.getMemIdByLoginName('flowbot'), trunc(sysdate),'NAME_001', 'VALUE_001', util_common.getEnumIdByRefName('默认组类型','VALUE_001'));

-- statementId: deptMember.select
-- lookupStatementId: deptMember.select
-- source: defaultgroup_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id from org_member where id in (select source_id from org_relationship where objective0_id = 'VALUE_001' and objective2_id is not null) and status = 1 and is_enable = 1 and code is not null;

-- statementId: activeDeptName.select
-- lookupStatementId: activeDeptName.select
-- source: defaultgroup_sqlmap.xml
-- type: select
-- params: {}
select id, name from org_unit where type = 'Department' and IS_DELETED = 0 and status = 1 and is_internal = 1;

-- statementId: curentNoSignPolling.select
-- lookupStatementId: curentNoSignPolling.select
-- source: fullpolling_sqlmap.xml
-- type: select
-- params: {}
select to_char(id) from vm_fullpollingNoSignUpDoc c where c.pollingYare = to_number(to_char(sysdate, 'yyyy'));

-- statementId: currentNoSignPolling.insert
-- lookupStatementId: currentNoSignPolling.insert
-- source: fullpolling_sqlmap.xml
-- type: insert
-- params: {
--   "id": 1001,
--   "serialNum": "VALUE_001",
--   "userId": 1001
-- }
insert into vm_fullpollingNoSignUpDoc ( id, state, start_member_id, start_date, approve_member_id, approve_date, finishedflag, ratifyflag, ratify_member_id, ratify_date, sort, modify_member_id, modify_date, serialNo, writerMember, writeDepart, writeDate, pollingYare, note ) values ( 1001, 1, -6760911671874597139, sysdate, 0, sysdate, 0, 0, 0, null, 0, '-6760911671874597139', sysdate, 'VALUE_001', 1001, util_user.getDeptIdByMemId(1001), sysdate, to_char(sysdate, 'yyyy'), '');

-- statementId: allInvaliData.select
-- lookupStatementId: allInvaliData.select
-- source: fullpolling_sqlmap.xml
-- type: select
-- params: {}
select to_char(id) as id, c.ext_attr_22 as joinDate, c.org_department_id as departMent from org_member c where c.is_internal = 1 and c.is_admin = 0 and c.is_enable = 1 and c.is_deleted = 0;

-- statementId: currentSignUpInfo.select
-- lookupStatementId: currentSignUpInfo.select
-- source: fullpolling_sqlmap.xml
-- type: select
-- params: {}
select f2.id, f2.formmain_id, serialNo, writer, writerDate, writeDepart, pollingYear, yearBatch, departureDate, destination, batchState, signUpMember, belongDepart, joinDate, signUpDate, isSignUpValidate, note, isIncAdjust, f2.sort from vm_fullpollingBatchDoc f1 left join vm_fullpollingBatchSignup f2 on f1.id = f2.formmain_id where f2.isSignUpValidate = -3841538853571705149 and f1.pollingYear = to_number(to_char(sysdate, 'yyyy'));

-- statementId: noSignUpmember.delete
-- lookupStatementId: noSignUpmember.delete
-- source: fullpolling_sqlmap.xml
-- type: delete
-- params: "VALUE_001"
delete from vm_fullpollingnosignupdoc;

-- statementId: insertNoSignUpMember
-- lookupStatementId: insertNoSignUpMember
-- source: fullpolling_sqlmap.xml
-- type: insert
-- params: {}
insert into vm_fullpollingnosignupdoc ( id, state, start_member_id, start_date, approve_member_id, approve_date, finishedflag, ratifyflag, ratify_member_id, ratify_date, sort, modify_member_id, modify_date, writeDate, pollingYare, note, noSignUpMember, belongDepart, joinDate) select util_common.getAbsID, 1, -6760911671874597139, sysdate, 0, sysdate, 0, 0, 0, null, 0, '-6760911671874597139', sysdate, sysdate, to_number(to_char(sysdate, 'yyyy')), '', to_char(id) as id, c.org_department_id as departMent, c.ext_attr_22 as joinDate from org_member c where c.is_internal = 1 and c.is_loginable = 1 and c.is_virtual = 0 and c.is_admin =0 and c.is_assigned = 1 and c.type = 1 and c.state = 1 and c.is_enable = 1 and c.is_deleted = 0 and c.status = 1 and id is not null and id not in (SELECT F2.signUpMember from vm_fullpollingBatchDoc f1 left join vm_fullpollingBatchSignup f2 on f1.id = f2.formmain_id where f2.isSignUpValidate = -3841538853571705149 and f1.pollingYear = to_number(to_char(sysdate, 'yyyy')) AND F1.batchState != 4845015860421214524);

-- statementId: insertNoSignUpMemberCount
-- lookupStatementId: insertNoSignUpMemberCount
-- source: fullpolling_sqlmap.xml
-- type: insert
-- params: {}
insert into ctp_content_all c ( id , create_id , create_date , modify_id , modify_date , module_type , module_id , module_template_id , content_type , content , content_data_id , content_template_id , title ) select util_common.getID, -6760911671874597139, sysdate, -6760911671874597139, sysdate, 37, c.id, -6150285474670555896, 20, '', c.id, 2460746423235071531, '轮训未报名管理' from vm_fullpollingnosignupdoc c;

-- statementId: wfFullPolingAdd.select
-- lookupStatementId: wfFullPolingAdd.select
-- source: fullpolling_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select f1.pollingYear, f2.yearBatch, f2.serialNo as batchSerialNum, signUpMember, belongDepart, joinDate, signUpDate from vm_wf_fullpollingAddNM f1 left join vm_wf_fullpollingAddNMsom f2 on f1.id = f2.formmain_id where f1.serialNum = 'VALUE_001';

-- statementId: wfFullPolingAdJust.select
-- lookupStatementId: wfFullPolingAdJust.select
-- source: fullpolling_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select serialNum, sendUser signUpMember, sendDepart belongDepart, joinDate, pollingYear, newBatch yearBatch , batchFlow batchSerialNum from vm_wf_fullpollingadjust f where f.serialNum = 'VALUE_001';

-- statementId: fullPollingBatchByBAANDAY.select
-- lookupStatementId: fullPollingBatchByBAANDAY.select
-- source: fullpolling_sqlmap.xml
-- type: select
-- params: {
--   "analYear": "VALUE_001",
--   "yearBatch": "VALUE_001",
--   "signUpMember": "VALUE_001"
-- }
select f1.id, f2.formmain_id, f2.signUpMember from vm_fullpollingBatchDoc f1 left join vm_fullpollingBatchSignup f2 on f1.id = f2.formmain_id where f1.pollingYear = 'VALUE_001' and f1.yearBatch = 'VALUE_001' and f2.signUpMember = 'VALUE_001';

-- statementId: fullPolingBatchNo.update
-- lookupStatementId: fullPolingBatchNo.update
-- source: fullpolling_sqlmap.xml
-- type: update
-- params: {
--   "joinDate": "2026-05-14",
--   "belongDepart": "VALUE_001",
--   "isSignUpValidate": "2026-05-14",
--   "isIncAdjust": "VALUE_001",
--   "signUpMember": "VALUE_001",
--   "id": 1001
-- }
update vm_fullpollingBatchSignup vm set vm.joinDate = '2026-05-14', vm.signUpDate = sysdate, vm.belongDepart = 'VALUE_001', vm.isSignUpValidate = '2026-05-14', vm.isIncAdjust = 'VALUE_001' where vm.signUpMember = 'VALUE_001' and id = 1001;

-- statementId: fullPolingBatchNo.insert
-- lookupStatementId: fullPolingBatchNo.insert
-- source: fullpolling_sqlmap.xml
-- type: insert
-- params: {
--   "formmain_id": 1001,
--   "joinDate": "2026-05-14",
--   "signUpDate": "2026-05-14",
--   "belongDepart": "VALUE_001",
--   "isSignUpValidate": "2026-05-14",
--   "isIncAdjust": "VALUE_001",
--   "signUpMember": "VALUE_001"
-- }
insert into vm_fullpollingBatchSignup (id, formmain_id, joinDate, signUpDate, belongDepart, isSignUpValidate, isIncAdjust, signUpMember) values (util_common.getAbsID, 1001, '2026-05-14', '2026-05-14', 'VALUE_001', '2026-05-14', 'VALUE_001', 'VALUE_001');

-- statementId: fullPollingBatchInfo
-- lookupStatementId: fullPollingBatchInfo
-- source: fullpolling_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id from vm_fullpollingBatchDoc f where f.serialNo = 'VALUE_001';

-- statementId: fullPollingBatchAdjust.select
-- lookupStatementId: fullPollingBatchAdjust.select
-- source: fullpolling_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id, state, start_member_id, start_date, approve_member_id, approve_date, finishedflag, ratifyflag, ratify_member_id, ratify_date, sort, modify_member_id, modify_date, serialNum, sendUser, sendDepart, sendDate, sendAccount, joinDate, pollingYear, oldBatch, newBatch, batchFlow, departureDate, destination, note from vm_wf_fullpollingadjust f where f.serialNum = 'VALUE_001';

-- statementId: findSendFullPollingById.select
-- lookupStatementId: findSendFullPollingById.select
-- source: fullpolling_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id as "id", serialNo as "serialNo", writeDepart as "writeDepart", writeAccount as "writeAccount", writerDate as "writerDate", pollingYear as "pollingYear", collectorType as "collectorType", lastEntryDate as "lastEntryDate", sendAccount as "sendAccount", sendDept as "sendDept", removeDept as "removeDept", writeExpireLimit as "writeExpireLimit", signComment as "signComment", attachFile as "attachFile" from vm_fullpollingSendFlow where id = 'VALUE_001';

-- statementId: findSendFullPollingDeptSonByFormmainId.select
-- lookupStatementId: findSendFullPollingDeptSonByFormmainId.select
-- source: fullpolling_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id as "id", department as "department", sendState as "sendState" from vm_fullpollingSendFlow_son where formmain_Id = 'VALUE_001' and department is not null;

-- statementId: findSendFullPollingDept.select
-- lookupStatementId: findSendFullPollingDept.select
-- source: fullpolling_sqlmap.xml
-- type: select
-- params: {
--   "sendAccount": 7,
--   "sendDept": "RAW_VALUE",
--   "removeDept": "RAW_VALUE"
-- }
select id as "deptId" from org_unit where (1=0 or org_account_id in(SELECT id FROM (select substr(u.path, 1, length(u.path) - 4) parentPath, u.* from org_unit u where is_enable = 1 and is_deleted = 0 and is_internal = 1) u START WITH path in (select path from org_unit u where u.id in(7)) CONNECT BY parentPath = PRIOR path and type != 'Account') or id in(RAW_VALUE) ) and id not in(RAW_VALUE) and type='Department' and id in ( select om.org_department_id from org_member om where om.is_internal=1 and om.is_virtual=0 and om.is_enable=1 and om.is_deleted=0 and om.type = 1 and om.state = 1) order by path;

-- statementId: findSendFullPollingGroup.select
-- lookupStatementId: findSendFullPollingGroup.select
-- source: fullpolling_sqlmap.xml
-- type: select
-- params: {
--   "sendAccount": 7,
--   "sendDept": "RAW_VALUE",
--   "removeDept": "RAW_VALUE"
-- }
select id as "deptId" from org_unit where (1=0 or org_account_id in(SELECT id FROM (select substr(u.path, 1, length(u.path) - 4) parentPath, u.* from org_unit u where is_enable = 1 and is_deleted = 0 and is_internal = 1) u START WITH path in (select path from org_unit u where u.id in(7)) CONNECT BY parentPath = PRIOR path) or id in(RAW_VALUE) ) and id not in(RAW_VALUE) and type='Department' and id in ( select om.org_department_id from org_member om where om.is_internal=1 and om.is_virtual=0 and om.is_enable=1 and om.is_deleted=0 and om.type = 1 and om.state = 1) order by path;

-- statementId: initSendFullPollingSendDeptSon.insert
-- lookupStatementId: initSendFullPollingSendDeptSon.insert
-- source: fullpolling_sqlmap.xml
-- type: insert
-- params: {
--   "formmainId": 1001,
--   "department": "VALUE_001"
-- }
insert into vm_fullpollingSendFlow_son (id,formmain_Id,department,sendState ) values( util_common.getAbsID, 1001, 'VALUE_001', 1231833455121088919 );

-- statementId: updateFullPollingSendDeptSon.update
-- lookupStatementId: updateFullPollingSendDeptSon.update
-- source: fullpolling_sqlmap.xml
-- type: update
-- params: {
--   "formmainId": 1001,
--   "sendDepts": "VALUE_001"
-- }
update vm_fullpollingSendFlow_son set sendState = -4223597634433956603 where formmain_Id = 1001 and department = 'VALUE_001';

-- statementId: deleteFullPollingBlankRecordDept.delete
-- lookupStatementId: deleteFullPollingBlankRecordDept.delete
-- source: fullpolling_sqlmap.xml
-- type: delete
-- params: {}
delete vm_fullpollingSendFlow_son where department is null;

-- statementId: findFullPollingMembers.select
-- lookupStatementId: findFullPollingMembers.select
-- source: fullpolling_sqlmap.xml
-- type: select
-- params: {
--   "deptId": 1001
-- }
select id from org_member o where o.is_internal = 1 and o.is_loginable = 1 and o.is_virtual = 0 and o.is_admin =0 and o.is_assigned = 1 and o.type = 1 and o.state = 1 and o.is_enable = 1 and o.is_deleted = 0 and o.status = 1 and o.org_department_id = 1001;

-- statementId: findFullPollingSignBatchList.select
-- lookupStatementId: findFullPollingSignBatchList.select
-- source: fullpolling_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select signMember as "signMember", yearBatch as "yearBatch", batchSerialNo AS "batchSerialNo", util_common.getEnumValueById(yearBatch) AS "enum_value" from vm_fullpollingSign_son WHERE formmain_Id = (SELECT id FROM vm_fullpollingSign WHERE serialNo = 'VALUE_001') UNION ALL SELECT signMember AS "signMember", yearBatch AS "yearBatch", batchSerialNo AS "batchSerialNo", util_common.getEnumValueById(yearBatch) AS "enum_value" FROM vm_cap4fullpollingSign_son WHERE formmain_Id = (SELECT id FROM vm_cap4fullpollingSign WHERE serialNo = 'VALUE_001') ORDER BY "enum_value" ASC;

-- statementId: findTrainBatchCollectorByDept.select
-- lookupStatementId: findTrainBatchCollectorByDept.select
-- source: fullpolling_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select trainBatchCollector from vm_deptAffairRole where roleDept = 'VALUE_001';

-- statementId: memberOldFullPollingBatch
-- lookupStatementId: memberOldFullPollingBatch
-- source: fullpolling_sqlmap.xml
-- type: delete
-- params: {
--   "oldBatch": "VALUE_001",
--   "sendUser": "VALUE_001"
-- }
delete from vm_fullpollingBatchSignup f where f.formmain_id = (select id from vm_fullpollingBatchDoc f1 where f1.pollingYear = to_number(to_char(sysdate, 'yyyy')) and f1.yearBatch = 'VALUE_001') and f.signUpMember = 'VALUE_001';

-- statementId: queryTrainBatchApplyInfo.select
-- lookupStatementId: queryTrainBatchApplyInfo.select
-- source: fullpolling_sqlmap.xml
-- type: select
-- params: {
--   "pollingYear": "VALUE_001",
--   "yearBatch": "VALUE_001",
--   "kmDeptCode": "CODE_001"
-- }
select signUpMember as "signUpMember", belongDepart as "belongDepart", isSignUpValidate as "isSignUpValidate" from vm_fullpollingBatchSignup where formmain_id = (select id from vm_fullpollingbatchdoc where pollingYear = 'VALUE_001' and util_common.getEnumValueById(yearBatch) = 'VALUE_001' and batchState != 4845015860421214524) and belongDepart = (select id from org_unit where code = 'CODE_001');

-- statementId: updateFullPollingJoinState.update
-- lookupStatementId: updateFullPollingJoinState.update
-- source: fullpolling_sqlmap.xml
-- type: update
-- params: {
--   "batchId": 1001,
--   "memberId": 1001,
--   "kmDeptCode": "CODE_001",
--   "joinDate": "2026-05-14"
-- }
merge into vm_fullpollingBatchSignup a using (select 1001 as batchId,1001 as memberId from dual) c on ( a.formmain_id = c.batchId and a.signUpMember=c.memberId) when not matched then insert( id, formmain_id, signUpMember, belongDepart, joinDate, signUpDate, isSignUpValidate, note, isIncAdjust, isAttend ) values(util_common.getAbsID, 1001, 1001, util_org.getDeptIdByDeptCode('CODE_001'), '2026-05-14', sysDate, -773383727967156351, to_char(sysDate,'yyyy-mm-dd')||':EHR回传已出勤,增补报名记录。', -773383727967156351, -773383727967156351 ) when matched then update set isAttend = -773383727967156351, note = to_char(sysDate,'yyyy-mm-dd')||':EHR回传已出勤。';

-- statementId: qryTrainBatchInfoByYearAndBatch.select
-- lookupStatementId: qryTrainBatchInfoByYearAndBatch.select
-- source: fullpolling_sqlmap.xml
-- type: select
-- params: {
--   "yearBatch": "VALUE_001",
--   "pollingYear": "VALUE_001"
-- }
select id as "id", serialNo as "serialNo", writer as "writer", writerDate as "writerDate", writeDepart as "writeDepart", pollingYear as "pollingYear", yearBatch as "yearBatch", departureDate as "departureDate", destination as "destination", batchState as "batchState" from vm_fullpollingbatchdoc where util_common.getEnumValueById(yearBatch) = 'VALUE_001' and pollingYear = 'VALUE_001' and batchState != 4845015860421214524;

-- statementId: fullpollingContentData.delete
-- lookupStatementId: fullpollingContentData.delete
-- source: fullpolling_sqlmap.xml
-- type: delete
-- params: {}
delete from ctp_content_all c where c.module_template_id = -6150285474670555896 and c.content_template_id = 2460746423235071531;

-- statementId: resetTrainBatchJoinState.update
-- lookupStatementId: resetTrainBatchJoinState.update
-- source: fullpolling_sqlmap.xml
-- type: update
-- params: "VALUE_001"
update vm_fullpollingBatchSignup set isAttend = 6217529297725901496, note = to_char(sysDate,'yyyy-mm-dd')||':EHR回传未出勤。' where formmain_id = 'VALUE_001';

-- statementId: qryLastTrainBatchByYear.select
-- lookupStatementId: qryLastTrainBatchByYear.select
-- source: fullpolling_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select * from (select util_common.getEnumValueById(yearBatch) from vm_fullpollingbatchdoc where pollingYear = 'VALUE_001' and batchState != 4845015860421214524 order by util_common.getEnumValueById(yearBatch) desc ) where rownum = 1;

-- statementId: updateFullPollingAddNMSon.insert
-- lookupStatementId: updateFullPollingAddNMSon.insert
-- source: fullpolling_sqlmap.xml
-- type: insert
-- params: {
--   "colId": 1001,
--   "signUpMember": "VALUE_001"
-- }
insert into VM_WF_FULLPOLLINGADDNMSOM ( id, formmain_id, signUpMember, belongDepart, joinDate ) values ( util_common.getAbsID, (select form_recordId from col_summary where id = 1001), 'VALUE_001', util_user.getDeptIdByMemId('VALUE_001'), (select ext_attr_22 from org_member where id = 'VALUE_001') );

-- statementId: deleteFullPollingAddNMSon.delete
-- lookupStatementId: deleteFullPollingAddNMSon.delete
-- source: fullpolling_sqlmap.xml
-- type: delete
-- params: {}
delete from VM_WF_FULLPOLLINGADDNMSOM where signUpMember is null;

-- statementId: getUserEntryDateByUserId.select
-- lookupStatementId: getUserEntryDateByUserId.select
-- source: fullpolling_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select EXT_ATTR_22 from org_member where id = 'VALUE_001';

-- statementId: selectFundProductCodes.select
-- lookupStatementId: selectFundProductCodes.select
-- source: productcontract_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select productCode as "productCode",productType as "productType" from VM_APPROVESON where formmain_id = 'VALUE_001';

-- statementId: selectFundProductCodesCap4.select
-- lookupStatementId: selectFundProductCodesCap4.select
-- source: productcontract_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select productCode as "productCode",to_char(productType) as "productType",productname as "productName" from vm_cap_approveson where formmain_id = 'VALUE_001';

-- statementId: smallFundByDateRegion.select
-- lookupStatementId: smallFundByDateRegion.select
-- source: productcontract_sqlmap.xml
-- type: select
-- params: {
--   "beginDate": "2026-05-14",
--   "endDate": "2026-05-14"
-- }
select id, to_char(dt_dt, 'yyyy-mm-dd') dt_dt, cnfr_dt, fnd_cd, fnd_nm, fnd_typ, ntvl_dt, is_intt_typ, smll_fnd_mdl, smll_fnd_scl, smll_fnd_accn_nmbr, cntn_dys, cntn_how_mch_day_ovrr, fnd_scl, fnd_accn_nmbr, estb_3yr_day, fnd_mngr, prdc_mngr from vm_smll_fnd_dt_infr where dt_dt between to_date('2026-05-14', 'yyyymmdd') and to_date('2026-05-14', 'yyyymmdd');

-- statementId: smallFundByConfirmDate.select
-- lookupStatementId: smallFundByConfirmDate.select
-- source: productcontract_sqlmap.xml
-- type: select
-- params: {
--   "confirmDate": "2026-05-14"
-- }
select id, to_char(dt_dt, 'yyyy-mm-dd') dt_dt, cnfr_dt, fnd_cd, fnd_nm, fnd_typ, ntvl_dt, is_intt_typ, smll_fnd_mdl, smll_fnd_scl, smll_fnd_accn_nmbr, cntn_dys, cntn_how_mch_day_ovrr, fnd_scl, fnd_accn_nmbr, estb_3yr_day, fnd_mngr, prdc_mngr, dl_rng from vm_smll_fnd_dt_infr where ntvl_dt >= '2026-05-14' order by ntvl_dt asc;

-- statementId: smallFund.insert
-- lookupStatementId: smallFund.insert
-- source: productcontract_sqlmap.xml
-- type: insert
-- params: {
--   "id": 1001,
--   "dt_dt": "VALUE_001",
--   "cnfr_dt": "VALUE_001",
--   "fnd_cd": "VALUE_001",
--   "fnd_nm": "VALUE_001",
--   "fnd_typ": "VALUE_001",
--   "ntvl_dt": "VALUE_001",
--   "is_intt_typ": "VALUE_001",
--   "smll_fnd_mdl": "VALUE_001",
--   "smll_fnd_scl": "VALUE_001",
--   "smll_fnd_accn_nmbr": "VALUE_001",
--   "cntn_dys": "VALUE_001",
--   "cntn_how_mch_day_ovrr": "VALUE_001",
--   "fnd_scl": "VALUE_001",
--   "fnd_accn_nmbr": "VALUE_001",
--   "estb_3yr_day": "VALUE_001",
--   "fnd_mngr": "VALUE_001",
--   "prdc_mngr": "VALUE_001",
--   "dl_rng": "VALUE_001"
-- }
insert into vm_smll_fnd_dt_infr (id, state, start_member_id, start_date, approve_member_id, approve_date, finishedflag, ratifyflag, ratify_member_id, ratify_date, sort, modify_member_id, modify_date, dt_dt, cnfr_dt, fnd_cd, fnd_nm, fnd_typ, ntvl_dt, is_intt_typ, smll_fnd_mdl, smll_fnd_scl, smll_fnd_accn_nmbr, cntn_dys, cntn_how_mch_day_ovrr, fnd_scl, fnd_accn_nmbr, estb_3yr_day, fnd_mngr, prdc_mngr, dl_rng )values( 1001, 1, -6760911671874597139, sysdate, 0, null, 1, 0, 0, null, 0, null, null, to_date('VALUE_001', 'yyyy-mm-dd'), to_date('VALUE_001','yyyy-mm-dd'), 'VALUE_001', 'VALUE_001', 'VALUE_001', to_date('VALUE_001','yyyy-mm-dd'), 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', decode('VALUE_001', null, null, to_date('VALUE_001', 'yyyy-mm-dd')), 'VALUE_001', 'VALUE_001', 'VALUE_001' );

-- statementId: smallFundToSendRecord.insert
-- lookupStatementId: smallFundToSendRecord.insert
-- source: productcontract_sqlmap.xml
-- type: insert
-- params: {
--   "id": 1001,
--   "writeDate": "2026-05-14",
--   "fundCode": "CODE_001",
--   "fundName": "NAME_001",
--   "fundType": "VALUE_001",
--   "triggerValue": "VALUE_001",
--   "triggerAccount": 1,
--   "checkType": "VALUE_001",
--   "smallFundModel": "VALUE_001"
-- }
insert into vm_cap_smallfundSend (id, state, start_member_id, start_date, approve_member_id, approve_date, finishedflag, ratifyflag, ratify_member_id, ratify_date, sort, modify_member_id, modify_date, writeDate, fundCode, fundName, fundType, triggerValue, triggerAccount, checkType, smallFundModel )values( 1001, 1, -6760911671874597139, sysdate, 0, null, 1, 0, 0, null, 0, null, null, to_date('2026-05-14', 'yyyy-mm-dd'), 'CODE_001', 'NAME_001', 'VALUE_001', 'VALUE_001', 1, 'VALUE_001', 'VALUE_001' );

-- statementId: smallFundToSendRecordSon.insert
-- lookupStatementId: smallFundToSendRecordSon.insert
-- source: productcontract_sqlmap.xml
-- type: insert
-- params: {
--   "id": 1001,
--   "formmain_id": 1001,
--   "continue1": "VALUE_001",
--   "continue10": "VALUE_001",
--   "continue20": "VALUE_001",
--   "valueConfirm": "VALUE_001",
--   "accountConfirm": 1,
--   "dialogFlowState": 1,
--   "decisionFlowState": 1
-- }
insert into vm_cap_smallfundSend_son (id, formmain_id, continue1, continue10, continue20, valueConfirm, accountConfirm, dialogFlowState, decisionFlowState )values( 1001, 1001, to_date('VALUE_001', 'yyyy-mm-dd'), to_date('VALUE_001', 'yyyy-mm-dd'), to_date('VALUE_001', 'yyyy-mm-dd'), 'VALUE_001', 1, 1, 1 );

-- statementId: smallFundToSendRecord.select
-- lookupStatementId: smallFundToSendRecord.select
-- source: productcontract_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select main.id as "id", main.writeDate as "writeDate", main.fundCode as "fundCode", main.fundName as "fundName", main.fundType as "fundType", main.triggerValue as "triggerValue", main.triggerAccount as "triggerAccount", main.checkType as "checkType", son.ID as "sonId", son.formmain_id as "formmianId", son.continue1 as "continue1", son.continue10 as "continue10", son.continue20 as "continue20", son.valueConfirm as "valueConfirm", son.accountConfirm as "accountConfirm", son.dialogFlowState as "dialogFlowState", son.decisionFlowState as "decisionFlowState", son.dialogFlowSerialNo as "dialogFlowSerialNo", son.decisionFlowSerialNo as "decisionFlowSerialNo", main.smallFundModel as "smallFundModel" from vm_cap_smallfundSend main left join vm_cap_smallfundSend_Son son on main.id = son.formmain_id where main.fundCode = 'VALUE_001' order by son.continue1 desc;

-- statementId: smallFundToSendRecordDialogToSend.select
-- lookupStatementId: smallFundToSendRecordDialogToSend.select
-- source: productcontract_sqlmap.xml
-- type: select
-- params: {
--   "beginDate": "2026-05-14"
-- }
select main.id as "id", main.writeDate as "writeDate", main.fundCode as "fundCode", main.fundName as "fundName", main.fundType as "fundType", main.triggerValue as "triggerValue", main.triggerAccount as "triggerAccount", main.checkType as "checkType", son.ID as "sonId", son.formmain_id as "formmianId", son.continue1 as "continue1", son.continue10 as "continue10", son.continue20 as "continue20", son.valueConfirm as "valueConfirm", son.accountConfirm as "accountConfirm", son.dialogFlowState as "dialogFlowState", son.decisionFlowState as "decisionFlowState", son.dialogFlowSerialNo as "dialogFlowSerialNo", son.decisionFlowSerialNo as "decisionFlowSerialNo", main.smallFundModel as "smallFundModel" from vm_cap_smallfundSend main right join (select * from vm_cap_smallfundSend_Son where continue10 > '2026-05-14' and dialogFlowState = -1089048568118490234) son on main.id = son.formmain_id where main.checkType in ('普通开放式','发起式成立满3年后','定期开放封闭期内');

-- statementId: smallFundToSendRecordDecisionToSend.select
-- lookupStatementId: smallFundToSendRecordDecisionToSend.select
-- source: productcontract_sqlmap.xml
-- type: select
-- params: {
--   "beginDate": "2026-05-14"
-- }
select main.id as "id", main.writeDate as "writeDate", main.fundCode as "fundCode", main.fundName as "fundName", main.fundType as "fundType", main.triggerValue as "triggerValue", main.triggerAccount as "triggerAccount", main.checkType as "checkType", son.ID as "sonId", son.formmain_id as "formmianId", son.continue1 as "continue1", son.continue10 as "continue10", son.continue20 as "continue20", son.valueConfirm as "valueConfirm", son.accountConfirm as "accountConfirm", son.dialogFlowState as "dialogFlowState", son.decisionFlowState as "decisionFlowState", son.dialogFlowSerialNo as "dialogFlowSerialNo", son.decisionFlowSerialNo as "decisionFlowSerialNo", main.smallFundModel as "smallFundModel" from vm_cap_smallfundSend main right join (select * from vm_cap_smallfundSend_Son where continue20 > '2026-05-14' and dialogFlowState = -3841538853571705149 and decisionFlowState = -1089048568118490234) son on main.id = son.formmain_id where main.checkType in ('普通开放式','发起式成立满3年后','定期开放封闭期内');

-- statementId: smallFundToSendRecordInitiatingFund.select
-- lookupStatementId: smallFundToSendRecordInitiatingFund.select
-- source: productcontract_sqlmap.xml
-- type: select
-- params: {
--   "beginDate": "2026-05-14"
-- }
select main.id as "id", main.writeDate as "writeDate", main.fundCode as "fundCode", main.fundName as "fundName", main.fundType as "fundType", main.triggerValue as "triggerValue", main.triggerAccount as "triggerAccount", main.checkType as "checkType", son.ID as "sonId", son.formmain_id as "formmianId", son.continue1 as "continue1", son.continue10 as "continue10", son.continue20 as "continue20", son.valueConfirm as "valueConfirm", son.accountConfirm as "accountConfirm", son.dialogFlowState as "dialogFlowState", son.decisionFlowState as "decisionFlowState", son.dialogFlowSerialNo as "dialogFlowSerialNo", son.decisionFlowSerialNo as "decisionFlowSerialNo", main.smallFundModel as "smallFundModel" from vm_cap_smallfundSend main right join (select * from vm_cap_smallfundSend_Son where continue1 > '2026-05-14' and dialogFlowState = -1089048568118490234 and decisionFlowState = -1089048568118490234) son on main.id = son.formmain_id where main.checkType in ('发起式成立未满3年(成立满3年后的对日前10个工作日)','发起式成立未满3年(成立满3年后的对日前一个月)');

-- statementId: smallFundToSendDecisionRecordInitiatingFund.select
-- lookupStatementId: smallFundToSendDecisionRecordInitiatingFund.select
-- source: productcontract_sqlmap.xml
-- type: select
-- params: {
--   "beginDate": "2026-05-14"
-- }
select main.id as "id", main.writeDate as "writeDate", main.fundCode as "fundCode", main.fundName as "fundName", main.fundType as "fundType", main.triggerValue as "triggerValue", main.triggerAccount as "triggerAccount", main.checkType as "checkType", son.ID as "sonId", son.formmain_id as "formmianId", son.continue1 as "continue1", son.continue10 as "continue10", son.continue20 as "continue20", son.valueConfirm as "valueConfirm", son.accountConfirm as "accountConfirm", son.dialogFlowState as "dialogFlowState", son.decisionFlowState as "decisionFlowState", son.dialogFlowSerialNo as "dialogFlowSerialNo", son.decisionFlowSerialNo as "decisionFlowSerialNo", main.smallFundModel as "smallFundModel" from vm_cap_smallfundSend main right join (select * from vm_cap_smallfundSend_Son where continue1 > '2026-05-14' and dialogFlowState = -3841538853571705149 and decisionFlowState = -1089048568118490234) son on main.id = son.formmain_id where main.checkType in ('发起式成立未满3年(成立满3年后的对日前10个工作日)','发起式成立未满3年(成立满3年后的对日前一个月)');

-- statementId: getSmallFundNumber.select
-- lookupStatementId: getSmallFundNumber.select
-- source: productcontract_sqlmap.xml
-- type: select
-- params: {
--   "date": "2026-05-14"
-- }
select count(id) as "number" from vm_SMLL_FND_DT_INFR where to_char(dt_dt,'yyyy-MM-dd') = to_char('2026-05-14','yyyy-MM-dd');

-- statementId: productInvestmentDep.update
-- lookupStatementId: productInvestmentDep.update
-- source: productcontract_sqlmap.xml
-- type: update
-- params: {
--   "investmentDepOneFMOne": "VALUE_001",
--   "investmentDepOne": "VALUE_001",
--   "regularMembers": "VALUE_001",
--   "id": 1001
-- }
update vm_product_change set tztxOnejjOneMember = 'VALUE_001' ,tztxOneMember = 'VALUE_001' ,regularMembers = 'VALUE_001' where id = 1001;

-- statementId: smallFundToSendRecordSon.update
-- lookupStatementId: smallFundToSendRecordSon.update
-- source: productcontract_sqlmap.xml
-- type: update
-- params: {
--   "continue10": "VALUE_001",
--   "continue20": "VALUE_001",
--   "valueConfirm": "VALUE_001",
--   "accountConfirm": 1,
--   "dialogFlowState": 1,
--   "decisionFlowState": 1,
--   "dialogFlowSerialNo": "VALUE_001",
--   "decisionFlowSerialNo": "VALUE_001",
--   "id": 1001
-- }
update vm_cap_smallfundSend_son set id = id ,continue10 = to_date('VALUE_001', 'yyyy-mm-dd') ,continue20 = to_date('VALUE_001', 'yyyy-mm-dd') ,valueConfirm = 'VALUE_001' ,accountConfirm = 1 ,dialogFlowState = 1 ,decisionFlowState = 1 ,dialogFlowSerialNo = 'VALUE_001' ,decisionFlowSerialNo = 'VALUE_001' where id = 1001;

-- statementId: getFundInfoByFundCode.select
-- lookupStatementId: getFundInfoByFundCode.select
-- source: productcontract_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id as "id", pirid as "pirid", fundkind as "fundkind", prdcode as "prdcode", prdname as "prdname", fdshotnm as "fdshotnm", status as "status", productManager as "productManager", fundAdmin as "fundAdmin", saleManager as "saleManager", regularMember as "regularMember", productTypeMonthly as "productTypeMonthly", taOperateManager as "taOperateManager" from vm_fundproductinfo where prdcode = 'VALUE_001';

-- statementId: getFundInfoByProductId.select
-- lookupStatementId: getFundInfoByProductId.select
-- source: productcontract_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id as "id", pirid as "pirid", fundkind as "fundkind", prdcode as "prdcode", prdname as "prdname", fdshotnm as "fdshotnm", status as "status", productManager as "productManager", fundAdmin as "fundAdmin", saleManager as "saleManager", regularMember as "regularMember", productTypeMonthly as "productTypeMonthly", taOperateManager as "taOperateManager" from vm_fundproductinfo where pirid = 'VALUE_001';

-- statementId: getFundManagerByFundCode.select
-- lookupStatementId: getFundManagerByFundCode.select
-- source: productcontract_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select fundmanagername as "fundmanagername" from vm_fundproductinfoson where formmain_id = (select id from vm_fundproductinfo where prdcode = 'VALUE_001');

-- statementId: getFundManagerByPirId.select
-- lookupStatementId: getFundManagerByPirId.select
-- source: productcontract_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select fundmanagername as "fundmanagername" from vm_fundproductinfoson where formmain_id = (select id from vm_fundproductinfo where pirid = 'VALUE_001');

-- statementId: getRegularMemberByPirId.select
-- lookupStatementId: getRegularMemberByPirId.select
-- source: productcontract_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select regularMember from vm_fundproductinfo where pirid = 'VALUE_001';

-- statementId: getProductCodeList.select
-- lookupStatementId: getProductCodeList.select
-- source: productcontract_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select productCode_detail from vm_product_changeson where formmain_id = 'VALUE_001';

-- statementId: getPublicFundApprovalByFundCode.select
-- lookupStatementId: getPublicFundApprovalByFundCode.select
-- source: productcontract_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select t1.id as "id", t1.fundCode as "fundCode", t1.productName as "productName", t1.institutionCheckMember as "institutionCheckMember", t1.retailCheckMember as "retailCheckMember", t1.electricCheckMember as "electricCheckMember", t2.subject as "flowTitle" from vm_wf_publicFundApproval t1 left join col_summary t2 on t1.id = t2.form_recordId where t1.fundCode = 'VALUE_001' and t1.finishedflag = 1;

-- statementId: attachFlowColumn.insert
-- lookupStatementId: attachFlowColumn.insert
-- source: productcontract_sqlmap.xml
-- type: insert
-- params: {
--   "colId": 1001,
--   "flowId": 1001,
--   "fieldName": "NAME_001",
--   "memberId": 1001,
--   "fromFormId": 1001,
--   "toFormId": 1001,
--   "relationShipId": 1001,
--   "dataInfo": "VALUE_001"
-- }
insert into CAP_FORM_RELATION_RECORD ( ID, FROM_MASTERDATA_ID, TO_MASTERDATA_ID, FIELD_NAME, FORM_TYPE, TYPE, MEMBER_ID, FROM_SUBDATA_ID, TO_SUBDATA_ID, FROM_FORM_ID, TO_FORM_ID, RELATION_SHIP_ID, VIEW_THROUGH, DATA_INFO) values ( util_common.getAbsID, (select form_recordId from col_summary where id = 1001), (select id from col_summary where form_recordid=1001), 'NAME_001', '1', '1', 1001, null, null, 1001, 1001, 1001, '1', 'VALUE_001' );

-- statementId: attachSmallFundDialogFlow.insert
-- lookupStatementId: attachSmallFundDialogFlow.insert
-- source: productcontract_sqlmap.xml
-- type: insert
-- params: {
--   "colId": 1001,
--   "flowId": 1001
-- }
insert into CAP_FORM_RELATION_RECORD ( ID, FROM_MASTERDATA_ID, TO_MASTERDATA_ID, FIELD_NAME, FORM_TYPE, TYPE, MEMBER_ID, FROM_SUBDATA_ID, TO_SUBDATA_ID, FROM_FORM_ID, TO_FORM_ID, RELATION_SHIP_ID, VIEW_THROUGH, DATA_INFO) values ( util_common.getAbsID, (select form_recordId from col_summary where id = 1001), (select id from col_summary where form_recordid=1001), 'field0009', '1', '1', '1374924066090270886', null, null, '4783741118343891633', '4783741118343891633', '3479334232820894850', '1', '{"pcView":"7262546445818547798.-2667544057049756824","phoneView":"7262546445818547798.-2667544057049756824"}' );

-- statementId: smallFundToSendRecordDuplicateCheck.select
-- lookupStatementId: smallFundToSendRecordDuplicateCheck.select
-- source: productcontract_sqlmap.xml
-- type: select
-- params: {
--   "formmain_id": 1001,
--   "continue1": "VALUE_001"
-- }
select ID as "id", formmain_id as "formmianId", continue1 as "continue1", continue10 as "continue10", continue20 as "continue20", valueConfirm as "valueConfirm", accountConfirm as "accountConfirm", dialogFlowState as "dialogFlowState", decisionFlowState as "decisionFlowState" from vm_cap_smallfundSend_Son where formmain_id = 1001 and continue1 is not null and to_char(continue1,'yyyy-mm-dd') = 'VALUE_001' order by continue1 desc;

-- statementId: getSmallFundDialogFlowByColId.select
-- lookupStatementId: getSmallFundDialogFlowByColId.select
-- source: productcontract_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id as "id", serialNo as "serialNo", fundCode as "fundCode", sender as "sender", sentDept as "sentDept", sendDate as "sendDate", fundName as "fundName", triggerAccount as "triggerAccount", triggerValue as "triggerValue", smallFundCount as "smallFundCount", continue1Date as "continue1Date", toClearDays as "toClearDays", approvalFlow as "approvalFlow", investmentDepOne as "investmentDepOne", investmentDepOneFM as "investmentDepOneFM", institutionCheckMember as "institutionCheckMember", brokerCheckMember as "brokerCheckMember", retailCheckMember as "retailCheckMember", electricCheckMember as "electricCheckMember", riskCheckMember as "riskCheckMember", financeCheckMember as "financeCheckMember", marketCheckMember as "marketCheckMember", investmentDepTwo as "investmentDepTwo", investmentDepThree as "investmentDepThree", investmentDepTwoFM as "investmentDepTwoFM", investmentDepThreeFM as "investmentDepThreeFM", clearDateConfirm as "clearDateConfirm", taOperateManager as "taOperateManager", regularMember as "regularMember" from vm_cap_wf_smallfundDialog where id = (select form_recordId from col_summary where id = 'VALUE_001');

-- statementId: getSmallFundDecisionFlowByColId.select
-- lookupStatementId: getSmallFundDecisionFlowByColId.select
-- source: productcontract_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id as "id", serialNo as "serialNo", fundCode as "fundCode", sender as "sender", sentDept as "sentDept", sendDate as "sendDate", fundName as "fundName", approvalFlow as "approvalFlow", investmentDepOne as "investmentDepOne", investmentDepOneFM as "investmentDepOneFM", institutionCheckMember as "institutionCheckMember", brokerCheckMember as "brokerCheckMember", retailCheckMember as "retailCheckMember", electricCheckMember as "electricCheckMember", riskCheckMember as "riskCheckMember", financeCheckMember as "financeCheckMember", investmentDepTwo as "investmentDepTwo", investmentDepThree as "investmentDepThree", investmentDepTwoFM as "investmentDepTwoFM", investmentDepThreeFM as "investmentDepThreeFM", regularMember as "regularMember" from vm_cap_wf_smallfundDecision where id = (select form_recordId from col_summary where id = 'VALUE_001');

-- statementId: getSmallFundDialogFlowBySerialNo.select
-- lookupStatementId: getSmallFundDialogFlowBySerialNo.select
-- source: productcontract_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select t1.id as "id", t1.serialNo as "serialNo", t1.fundCode as "fundCode", t1.sender as "sender", t1.sentDept as "sentDept", t1.sendDate as "sendDate", t1.fundName as "fundName", t1.triggerAccount as "triggerAccount", t1.triggerValue as "triggerValue", t1.smallFundCount as "smallFundCount", t1.continue1Date as "continue1Date", t1.toClearDays as "toClearDays", t1.approvalFlow as "approvalFlow", t1.investmentDepOne as "investmentDepOne", t1.investmentDepOneFM as "investmentDepOneFM", t1.institutionCheckMember as "institutionCheckMember", t1.brokerCheckMember as "brokerCheckMember", t1.retailCheckMember as "retailCheckMember", t1.electricCheckMember as "electricCheckMember", t1.riskCheckMember as "riskCheckMember", t1.financeCheckMember as "financeCheckMember", t1.marketCheckMember as "marketCheckMember", t1.investmentDepTwo as "investmentDepTwo", t1.investmentDepThree as "investmentDepThree", t1.investmentDepTwoFM as "investmentDepTwoFM", t1.investmentDepThreeFM as "investmentDepThreeFM", t1.clearDateConfirm as "clearDateConfirm", t1.taOperateManager as "taOperateManager", t1.regularMember as "regularMember", t2.subject as "flowTitle" from vm_cap_wf_smallfundDialog t1 left join col_summary t2 on t1.id = t2.form_recordId where t1.serialNo = 'VALUE_001';

-- statementId: getCheckFundState.select
-- lookupStatementId: getCheckFundState.select
-- source: productcontract_sqlmap.xml
-- type: select
-- params: {
--   "id": 1001,
--   "productCode": "CODE_001"
-- }
select haveSendNotice as "haveSendNotice" from vm_approveson where formmain_id = 1001 and productcode = 'CODE_001';

-- statementId: getCheckFundStateCap4.select
-- lookupStatementId: getCheckFundStateCap4.select
-- source: productcontract_sqlmap.xml
-- type: select
-- params: {
--   "id": 1001,
--   "productCode": "CODE_001"
-- }
select haveSendNotice as "haveSendNotice" from vm_cap_approveson where formmain_id = 1001 and productcode = 'CODE_001';

-- statementId: updateCheckFundState.update
-- lookupStatementId: updateCheckFundState.update
-- source: productcontract_sqlmap.xml
-- type: update
-- params: {
--   "haveSendNotice": "VALUE_001",
--   "id": 1001,
--   "productCode": "CODE_001"
-- }
update vm_approveson set haveSendNotice = 'VALUE_001' where formmain_id = 1001 and productcode = 'CODE_001';

-- statementId: updateCheckFundStateCap4.update
-- lookupStatementId: updateCheckFundStateCap4.update
-- source: productcontract_sqlmap.xml
-- type: update
-- params: {
--   "haveSendNotice": "VALUE_001",
--   "id": 1001,
--   "productCode": "CODE_001"
-- }
update vm_cap_approveson set haveSendNotice = 'VALUE_001' where formmain_id = 1001 and productcode = 'CODE_001';

-- statementId: postChange.select
-- lookupStatementId: postChange.select
-- source: post_sqlmap.xml
-- type: select
-- params: {
--   "dept": "VALUE_001",
--   "busiModel": "VALUE_001",
--   "questName": "NAME_001"
-- }
SELECT M.ID AS MEMBERID, M.NAME AS MEMBERNAME, P.ID AS POSTID, P.NAME AS POSTNAME, U.ID AS DEPTID, U.NAME AS DEPTNAME, ORG_POST_ID FROM ORG_MEMBER M INNER JOIN ORG_UNIT U ON M.ORG_DEPARTMENT_ID = U.ID INNER JOIN ORG_POST P ON M.ORG_POST_ID = P.ID INNER JOIN ORG_POST P ON M.ORG_POST_ID = P.ID WHERE ORG_DEPARTMENT_ID = 'VALUE_001' AND ORG_POST_ID IN ( SELECT T1.* FROM VM_DEPTPOST, TABLE (UTIL_COMMON.SPLIT(POSTSCOPE, ',')) T1 WHERE BUSIMODEL = 'VALUE_001' AND QUESTNAME = 'NAME_001') AND M.STATE = 1 AND M.IS_ADMIN = 0 AND M.IS_ENABLE = 1;

-- statementId: postChange.select.count
-- lookupStatementId: postChange.select.count
-- source: post_sqlmap.xml
-- type: select
-- params: {
--   "dept": "VALUE_001",
--   "busiModel": "VALUE_001",
--   "questName": "NAME_001"
-- }
SELECT count(*) FROM ORG_MEMBER　M INNER JOIN ORG_UNIT U ON M.ORG_DEPARTMENT_ID = U.ID INNER JOIN ORG_POST P ON M.ORG_POST_ID = P.ID WHERE ORG_DEPARTMENT_ID = 'VALUE_001' AND ORG_POST_ID IN ( SELECT T1.* FROM VM_DEPTPOST, TABLE (UTIL_COMMON.SPLIT(POSTSCOPE, ',')) T1 WHERE BUSIMODEL = 'VALUE_001' AND QUESTNAME = 'NAME_001');

-- statementId: postChangeByDept.select
-- lookupStatementId: postChangeByDept.select
-- source: post_sqlmap.xml
-- type: select
-- params: {
--   "dept": "VALUE_001"
-- }
SELECT M.ID AS MEMBERID, M.NAME AS MEMBERNAME, '' AS POSTID, '' AS POSTNAME, m.org_department_id AS DEPTID, util_org.getDeptNameByDeptId(m.org_department_id) AS DEPTNAME FROM ORG_MEMBER m where M.STATE = 1 AND M.IS_ADMIN = 0 AND M.IS_ENABLE = 1 and m.is_deleted = 0 and m.org_department_id = 'VALUE_001';

-- statementId: postChangeByDept.select.count
-- lookupStatementId: postChangeByDept.select.count
-- source: post_sqlmap.xml
-- type: select
-- params: {
--   "dept": "VALUE_001"
-- }
SELECT count(*) from org_member m where M.STATE = 1 AND M.IS_ADMIN = 0 AND M.IS_ENABLE = 1 and m.is_deleted = 0 and m.org_department_id = 'VALUE_001';

-- statementId: postChangeFlow.select
-- lookupStatementId: postChangeFlow.select
-- source: post_sqlmap.xml
-- type: select
-- params: {
--   "id": 1001
-- }
SELECT questname, busimodel, mainmember, submember FROM vm_deptchange WHERE mainid =1001;

-- statementId: postChange.update
-- lookupStatementId: postChange.update
-- source: post_sqlmap.xml
-- type: update
-- params: {
--   "mainmember": "VALUE_001",
--   "submember": "VALUE_001",
--   "questname": "NAME_001",
--   "busimodel": "VALUE_001"
-- }
update VM_DEPTPOST set id=id , mainmember = 'VALUE_001' , submember = 'VALUE_001' WHERE questname='NAME_001' and busimodel = 'VALUE_001';

-- statementId: deptPostConfig.select
-- lookupStatementId: deptPostConfig.select
-- source: post_sqlmap.xml
-- type: select
-- params: {
--   "activityId": 1001,
--   "templeteId": 1001,
--   "taskname": "NAME_001",
--   "busimodel": "VALUE_001"
-- }
SELECT VC_ACTIVITYID as activityid,vc_businessmodel as busimodel, VC_TASKNAME as taskname,VC_EXCUTEMEMBER as excutemember , N_RECID as id FROM FG_DEPT_POST_CONFIG WHERE 1=1 and VC_ACTIVITYID = 1001 and VC_templeteId = 1001 and VC_TASKNAME = 'NAME_001' and vc_businessmodel = 'VALUE_001';

-- statementId: getTableField.select
-- lookupStatementId: getTableField.select
-- source: post_sqlmap.xml
-- type: select
-- params: {
--   "templeteId": 1001,
--   "prefixFileDisplay": "VALUE_001",
--   "suffixFileDisplay": "VALUE_001",
--   "allFileDisplay": "VALUE_001"
-- }
select distinct vc_fielddisplay as questname from vm_formfield where vc_formname = (SELECT NAME FROM form_definition WHERE ID= (SELECT Content_Template_id FROM ctp_content_all WHERE ID= (SELECT BODY FROM ctp_template WHERE ID=1001))) and vc_fielddisplay like 'VALUE_001' || '%' and vc_fielddisplay like '%' || 'VALUE_001' and vc_fielddisplay like '%'|| 'VALUE_001' ||'%';

-- statementId: busiModelEnum.select
-- lookupStatementId: busiModelEnum.select
-- source: post_sqlmap.xml
-- type: select
-- params: {}
SELECT cei.id AS enumid, cei.showvalue AS enumname FROM ctp_enum_item cei WHERE cei.ref_enumid in (SELECT ID FROM ctp_enum ce WHERE ce.enumname = '业务模块');

-- statementId: questNameByBusi.select
-- lookupStatementId: questNameByBusi.select
-- source: post_sqlmap.xml
-- type: select
-- params: {
--   "busimodel": "VALUE_001"
-- }
SELECT questname AS questname FROM VM_DEPTPOST WHERE busimodel = 'VALUE_001';

-- statementId: deptPostConfig.insert
-- lookupStatementId: deptPostConfig.insert
-- source: post_sqlmap.xml
-- type: insert
-- params: {
--   "id": 1001,
--   "activityId": 1001,
--   "templeteId": 1001,
--   "busimodel": "VALUE_001",
--   "taskname": "NAME_001",
--   "excutemember": "VALUE_001"
-- }
INSERT INTO FG_DEPT_POST_CONFIG (N_RECID, VC_ACTIVITYID,VC_templeteId, VC_BUSINESSMODEL, VC_TASKNAME, VC_EXCUTEMEMBER) VALUES (1001, 1001,1001, 'VALUE_001', 'NAME_001', 'VALUE_001');

-- statementId: deptPostConfig.delete
-- lookupStatementId: deptPostConfig.delete
-- source: post_sqlmap.xml
-- type: delete
-- params: {
--   "activityId": 1001,
--   "templeteId": 1001
-- }
delete FG_DEPT_POST_CONFIG WHERE vc_activityid = 1001 and vc_templeteid = 1001;

-- statementId: questExcuteMember.select
-- lookupStatementId: questExcuteMember.select
-- source: post_sqlmap.xml
-- type: select
-- params: {
--   "busimodel": "VALUE_001",
--   "questname": "NAME_001"
-- }
SELECT mainmember AS mainmember, submember AS submember FROM VM_DEPTPOST WHERE busimodel = 'VALUE_001' AND questname = 'NAME_001';

-- statementId: postRelation.select
-- lookupStatementId: postRelation.select
-- source: post_sqlmap.xml
-- type: select
-- params: {
--   "idList": [
--     "EVENT_A",
--     "EVENT_B"
--   ]
-- }
SELECT T3.NAME , T3.ACTIVITYID, T3.APPID, FD.NAME as flowname,t4.vc_taskname AS taskname FROM (SELECT T2.NAME, T2.ACTIVITYID, S1.APPID FROM (SELECT T1.WORKFLOW, T1.APPID FROM WF_PROCESS_TEMPLETE T1 WHERE INSTR(T1.WORKFLOW, 'ps') > 0) S1, XMLTABLE('ps/p/n' PASSING XMLTYPE(S1.WORKFLOW) COLUMNS "NAME" VARCHAR2(50) PATH '@n', "ACTIVITYID" VARCHAR2(50) PATH '@i') T2 WHERE T2.ACTIVITYID IN (SELECT VC_ACTIVITYID FROM FG_DEPT_POST_CONFIG PMI, VM_DEPTPOST VDP WHERE PMI.VC_BUSINESSMODEL = VDP.BUSIMODEL AND PMI.VC_TASKNAME = VDP.QUESTNAME AND VDP.ID in ('EVENT_A','EVENT_B') )) T3, FORM_DEFINITION FD,FG_DEPT_POST_CONFIG t4,VM_DEPTPOST T5 WHERE T3.APPID = FD.ID AND t3.ACTIVITYID=t4.Vc_Activityid AND T5.questname = t4.VC_taskname AND T5.ID in ('EVENT_A','EVENT_B');

-- statementId: findTempleteIdByActivityId.select
-- lookupStatementId: findTempleteIdByActivityId.select
-- source: post_sqlmap.xml
-- type: select
-- params: {
--   "activityId": 1001
-- }
select distinct templete_id from ctp_affair where activity_id=1001;

-- statementId: adminByAccountId.select
-- lookupStatementId: adminByAccountId.select
-- source: post_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select to_char(member_id) from org_principal where login_name='unitbot';

-- statementId: departPostRecord.select
-- lookupStatementId: departPostRecord.select
-- source: post_sqlmap.xml
-- type: select
-- params: {
--   "name": "NAME_001",
--   "modelId": 1001
-- }
select * from vm_deptpost where 1 = 1 and questName = 'NAME_001' and BUSIMODEL = 1001;

-- statementId: teamByName.select
-- lookupStatementId: teamByName.select
-- source: post_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select * from org_team where name = 'VALUE_001' and is_enable = 1 and is_deleted = 0;

-- statementId: teamByNameType.select
-- lookupStatementId: teamByNameType.select
-- source: post_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id,name,code,owner_id,is_enable,is_deleted,status,sort_id,org_account_id,to_char(create_time, 'yyyy-mm-dd hh:mm') as create_date, to_char(update_time, 'yyyy-mm-dd hh:mm') as update_time,description,creater_id,external_type from org_team where name like 'VALUE_001'||'%';

-- statementId: teamBackInsert.insert
-- lookupStatementId: teamBackInsert.insert
-- source: post_sqlmap.xml
-- type: insert
-- params: {
--   "ID": 1001,
--   "UPDATETIME": "2026-05-14",
--   "NAME": "NAME_001",
--   "CODE": "CODE_001",
--   "TYPE": "VALUE_001",
--   "OWNER_ID": 1001,
--   "IS_ENABLE": "VALUE_001",
--   "IS_DELETED": "VALUE_001",
--   "STATUS": 1,
--   "SORT_ID": 1,
--   "ORG_ACCOUNT_ID": 1,
--   "CREATE_TIME": "2026-05-14 10:00:00",
--   "UPDATE_TIME": "2026-05-14",
--   "DESCRIPTION": "VALUE_001",
--   "CREATER_ID": 1001,
--   "EXTERNAL_TYPE": "VALUE_001"
-- }
insert into org_team_copy (ID,updatetime, NAME, CODE, TYPE, OWNER_ID, IS_ENABLE, IS_DELETED, STATUS, SORT_ID, ORG_ACCOUNT_ID, CREATE_TIME, UPDATE_TIME, DESCRIPTION, CREATER_ID, EXTERNAL_TYPE) values (1001,'2026-05-14','NAME_001','CODE_001','VALUE_001',1001,'VALUE_001','VALUE_001',1,1,1,'2026-05-14 10:00:00','2026-05-14','VALUE_001',1001,'VALUE_001');

-- statementId: postBackInsert.insert
-- lookupStatementId: postBackInsert.insert
-- source: post_sqlmap.xml
-- type: insert
-- params: {
--   "ID": 1001,
--   "UPDATETIME": "2026-05-14",
--   "DEPT": "VALUE_001",
--   "BUSIMODEL": "VALUE_001",
--   "QUESTNAME": "NAME_001",
--   "POSTSCOPE": "VALUE_001",
--   "MAINMEMBER": "VALUE_001",
--   "SUBMEMBER": "VALUE_001"
-- }
insert into tb_departposition_copy(ID,updatetime, DEPT, BUSIMODEL, QUESTNAME, POSTSCOPE, MAINMEMBER, SUBMEMBER) values (1001,'2026-05-14','VALUE_001','VALUE_001','NAME_001','VALUE_001','VALUE_001','VALUE_001');

-- statementId: departPostById.select
-- lookupStatementId: departPostById.select
-- source: post_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select * from vm_deptpost where id = 'VALUE_001';

-- statementId: postDepartById.delete
-- lookupStatementId: postDepartById.delete
-- source: post_sqlmap.xml
-- type: delete
-- params: "VALUE_001"
delete from vm_deptpost where id = 'VALUE_001';

-- statementId: deptchangeByMainId.select
-- lookupStatementId: deptchangeByMainId.select
-- source: post_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select * from vm_deptchange where mainid = 'VALUE_001';

-- statementId: memberSerarchByTeamId.select
-- lookupStatementId: memberSerarchByTeamId.select
-- source: post_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select org.objective0_id from org_relationship org where org.source_id = 'VALUE_001' and org.type = 'Team_Member';

-- statementId: updatePostByteam.select
-- lookupStatementId: updatePostByteam.select
-- source: post_sqlmap.xml
-- type: update
-- params: {
--   "dept": "VALUE_001",
--   "mainpost": "VALUE_001",
--   "submember": "VALUE_001",
--   "busimodel": "VALUE_001",
--   "id": 1001
-- }
update vm_deptpost set DEPT = 'VALUE_001', mainmember = 'VALUE_001', submember = 'VALUE_001', busimodel = 'VALUE_001', modifydate = sysdate where id = 1001;

-- statementId: meetingRoomExtendInfo.select
-- lookupStatementId: meetingRoomExtendInfo.select
-- source: meeting_sqlmap.xml
-- type: select
-- params: {}
select id, createmember, createdate, meetingroomid, roomsystemcode, roomname, floor, area, privilegedepart, privilegemember, equipment, isprivileged, belongroomsystem from vm_meetingroomextendinfo;

-- statementId: meetingRoomAppByMeetingId.select
-- lookupStatementId: meetingRoomAppByMeetingId.select
-- source: meeting_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select * from meeting_room_app where meetingsysmtid = 'VALUE_001' and used_status = 0;

-- statementId: meetingRoomByAppId.select
-- lookupStatementId: meetingRoomByAppId.select
-- source: meeting_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select * from meeting_room_perm m where m.appid = 'VALUE_001';

-- statementId: meetingRoomAppByTimeQuantum.select
-- lookupStatementId: meetingRoomAppByTimeQuantum.select
-- source: meeting_sqlmap.xml
-- type: select
-- params: {
--   "startDate": "2026-05-14",
--   "endDate": "2026-05-14"
-- }
select * from meeting_room_app mra where ((mra.startdatetime between '2026-05-14' and '2026-05-14') or(mra.enddatetime between '2026-05-14' and '2026-05-14') or('2026-05-14' between mra.startdatetime and mra.enddatetime) or('2026-05-14' between mra.startdatetime and mra.enddatetime)) and meetingsysmtid is not null;

-- statementId: meeingRoomBookNoSys.select
-- lookupStatementId: meeingRoomBookNoSys.select
-- source: meeting_sqlmap.xml
-- type: select
-- params: {
--   "startDate": "2026-05-14",
--   "endDate": "2026-05-14",
--   "meetingroomid": 1001
-- }
select * from meeting_room_app mra, meeting_room_perm mrp where mra.id = mrp.appid(+) and (mrp.ISALLOWED = 1 or mrp.ISALLOWED is null) and mra.used_status = 0 and ((mra.startdatetime between '2026-05-14' and '2026-05-14') or(mra.enddatetime between '2026-05-14' and '2026-05-14') or('2026-05-14' between mra.startdatetime and mra.enddatetime) or('2026-05-14' between mra.startdatetime and mra.enddatetime)) and meetingsysmtid is null AND meetingroomid = 1001;

-- statementId: queryBookedMeeingRoom.select
-- lookupStatementId: queryBookedMeeingRoom.select
-- source: meeting_sqlmap.xml
-- type: select
-- params: {
--   "startDate": "2026-05-14",
--   "endDate": "2026-05-14",
--   "loginName": "NAME_001",
--   "meetingroomid": 1001
-- }
select * from meeting_room_app where ((startdatetime between '2026-05-14' and '2026-05-14') or(enddatetime between '2026-05-14' and '2026-05-14') or('2026-05-14' between startdatetime and enddatetime) or('2026-05-14' between startdatetime and enddatetime)) and util_user.getLoginNameByMemId(perid) = 'NAME_001' and meetingsysmtid is not null and meetingsysmtid != '0' AND meetingroomid = 1001;

-- statementId: meetingRoomApp.insert
-- lookupStatementId: meetingRoomApp.insert
-- source: meeting_sqlmap.xml
-- type: insert
-- params: {
--   "ID": 1001,
--   "MEETINGROOMID": 1001,
--   "PERID": 1001,
--   "DEPARTMENTID": 1001,
--   "STARTDATETIME": "2026-05-14",
--   "ENDDATETIME": "2026-05-14",
--   "MEETINGID": 1001,
--   "DESCRIPTION": "VALUE_001",
--   "STATUS": 1,
--   "APPDATETIME": "2026-05-14",
--   "AUDITING_ID": 1001,
--   "TEMPLATE_ID": 1001,
--   "PERIODICITY_ID": 1001,
--   "USED_STATUS": 1,
--   "TIME_DIFF": "2026-05-14 10:00:00",
--   "ACCOUNT_ID": 1,
--   "MEETINGSYSMTID": 1001
-- }
insert into meeting_room_app (ID, MEETINGROOMID, PERID, DEPARTMENTID, STARTDATETIME, ENDDATETIME, MEETINGID, DESCRIPTION, STATUS, APPDATETIME, AUDITING_ID, TEMPLATE_ID, PERIODICITY_ID, USED_STATUS, TIME_DIFF, ACCOUNT_ID, MEETINGSYSMTID) values (1001,1001,1001,1001,'2026-05-14','2026-05-14',1001,'VALUE_001',1,'2026-05-14',1001,1001,1001,1,'2026-05-14 10:00:00',1,1001);

-- statementId: meetingRoomPrem.insert
-- lookupStatementId: meetingRoomPrem.insert
-- source: meeting_sqlmap.xml
-- type: insert
-- params: {
--   "APPID": "VALUE_001",
--   "ISALLOWED": "VALUE_001",
--   "DESCRIPTION": "VALUE_001",
--   "PRODATETIME": "2026-05-14",
--   "DELFLAG": 1,
--   "IS_PERIODICITY": "VALUE_001",
--   "AUDITING_ID": 1001,
--   "ID": 1001,
--   "MEETING_ROOM_ID": 1001,
--   "MEETING_ID": 1001,
--   "PROXY_ID": 1001
-- }
insert into meeting_room_perm (APPID, ISALLOWED, DESCRIPTION, PRODATETIME, DELFLAG, IS_PERIODICITY, AUDITING_ID, ID, MEETING_ROOM_ID, MEETING_ID, PROXY_ID) values ('VALUE_001','VALUE_001','VALUE_001','2026-05-14',1,'VALUE_001',1001,1001,1001,1001,1001);

-- statementId: meetingRoomAppCopy.insert
-- lookupStatementId: meetingRoomAppCopy.insert
-- source: meeting_sqlmap.xml
-- type: insert
-- params: {
--   "ID": 1001,
--   "MEETINGROOMID": 1001,
--   "PERID": 1001,
--   "DEPARTMENTID": 1001,
--   "STARTDATETIME": "2026-05-14",
--   "ENDDATETIME": "2026-05-14",
--   "MEETINGID": 1001,
--   "DESCRIPTION": "VALUE_001",
--   "STATUS": 1,
--   "APPDATETIME": "2026-05-14",
--   "AUDITING_ID": 1001,
--   "TEMPLATE_ID": 1001,
--   "PERIODICITY_ID": 1001,
--   "USED_STATUS": 1,
--   "TIME_DIFF": "2026-05-14 10:00:00",
--   "ACCOUNT_ID": 1,
--   "MEETINGSYSMTID": 1001
-- }
insert into meeting_room_app_copy (ID, MEETINGROOMID, PERID, DEPARTMENTID, STARTDATETIME, ENDDATETIME, MEETINGID, DESCRIPTION, STATUS, APPDATETIME, AUDITING_ID, TEMPLATE_ID, PERIODICITY_ID, USED_STATUS, TIME_DIFF, ACCOUNT_ID, MEETINGSYSMTID) values (1001,1001,1001,1001,'2026-05-14','2026-05-14',1001,'VALUE_001',1,'2026-05-14',1001,1001,1001,1,'2026-05-14 10:00:00',1,1001);

-- statementId: meetingRoomPremCopy.insert
-- lookupStatementId: meetingRoomPremCopy.insert
-- source: meeting_sqlmap.xml
-- type: insert
-- params: {
--   "APPID": "VALUE_001",
--   "ISALLOWED": "VALUE_001",
--   "DESCRIPTION": "VALUE_001",
--   "PRODATETIME": "2026-05-14",
--   "DELFLAG": 1,
--   "IS_PERIODICITY": "VALUE_001",
--   "AUDITING_ID": 1001,
--   "ID": 1001,
--   "MEETING_ROOM_ID": 1001,
--   "MEETING_ID": 1001,
--   "PROXY_ID": 1001
-- }
insert into meeting_room_perm_copy (APPID, ISALLOWED, DESCRIPTION, PRODATETIME, DELFLAG, IS_PERIODICITY, AUDITING_ID, ID, MEETING_ROOM_ID, MEETING_ID, PROXY_ID) values ('VALUE_001','VALUE_001','VALUE_001','2026-05-14',1,'VALUE_001',1001,1001,1001,1001,1001);

-- statementId: meetingRoomAppById.delete
-- lookupStatementId: meetingRoomAppById.delete
-- source: meeting_sqlmap.xml
-- type: delete
-- params: "VALUE_001"
delete meeting_room_app where ID = 'VALUE_001';

-- statementId: meetingRoomPremById.delete
-- lookupStatementId: meetingRoomPremById.delete
-- source: meeting_sqlmap.xml
-- type: delete
-- params: "VALUE_001"
delete meeting_room_perm where appid = 'VALUE_001';

-- statementId: memberByName.select
-- lookupStatementId: memberByName.select
-- source: meeting_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id,org_department_id from org_member o where o.name like 'VALUE_001' and o.is_enable =1 and o.is_deleted = 0;

-- statementId: failMeetingRoom.select
-- lookupStatementId: failMeetingRoom.select
-- source: meeting_sqlmap.xml
-- type: select
-- params: {}
select t.* from MEETINGROOM_CancleFail_record t left join meeting_room_app_copy m on t.meetingid=m.MEETINGSYSMTID where sysDate > m.startDateTime;

-- statementId: failMeetingRoom.delete
-- lookupStatementId: failMeetingRoom.delete
-- source: meeting_sqlmap.xml
-- type: delete
-- params: "VALUE_001"
delete from MEETINGROOM_CancleFail_record where meetingid = 'VALUE_001';

-- statementId: meetingRoonById.update
-- lookupStatementId: meetingRoonById.update
-- source: meeting_sqlmap.xml
-- type: update
-- params: {
--   "date": "2026-05-14",
--   "id": 1001
-- }
update meeting_room_app m set m.enddatetime = '2026-05-14' where id = 1001;

-- statementId: updateSysMtId.update
-- lookupStatementId: updateSysMtId.update
-- source: meeting_sqlmap.xml
-- type: update
-- params: {
--   "meetingSysId": 1001,
--   "id": 1001
-- }
update meeting_room_app m set m.meetingsysmtid = 1001 where id = 1001;

-- statementId: meetingRoomAppByApplyId.select
-- lookupStatementId: meetingRoomAppByApplyId.select
-- source: meeting_sqlmap.xml
-- type: select
-- params: {
--   "applyId": 1001
-- }
select * from meeting_room_app where id = 1001;

-- statementId: queryMeeting.select
-- lookupStatementId: queryMeeting.select
-- source: meeting_sqlmap.xml
-- type: select
-- params: {
--   "startDateTime": "2026-05-14",
--   "endDateTime": "2026-05-14",
--   "title": "TITLE_001",
--   "memberId": 1001
-- }
select b.ID, b.TITLE, b.EMCEE_ID, b.CONFEREES, b.RECORDER_ID, to_char(b.BEGIN_DATE,'yyyy-mm-dd hh24:mi') BEGIN_DATE, to_char(b.END_DATE,'yyyy-mm-dd hh24:mi') END_DATE, (select place from meeting_room where id = room) as roomaddress, (select name from meeting_room where id = room) as roomname, b.CREATE_DATE, b.CREATE_USER, b.STATE, b.ACCOUNT_ID, b.TITLE, b.MT_TITLE, b.MEET_PLACE from ctp_affair a left join meeting b on (a.subject = b.title and a.create_date = b.create_date) where b.state != 0 AND ('2026-05-14' <= b.BEGIN_DATE and b.BEGIN_DATE <= '2026-05-14' or '2026-05-14' >= b.END_DATE and b.END_DATE >= '2026-05-14') AND b.TITLE like 'TITLE_001' AND a.member_id = 1001;

-- statementId: queryMeetingEomp.select
-- lookupStatementId: queryMeetingEomp.select
-- source: meeting_sqlmap.xml
-- type: select
-- params: {
--   "startDateTime": "2026-05-14",
--   "endDateTime": "2026-05-14",
--   "createStartDate": "2026-05-14",
--   "createEndDate": "2026-05-14",
--   "title": "TITLE_001",
--   "state": 1
-- }
select b.ID, b.TITLE, b.EMCEE_ID, b.CONFEREES, b.RECORDER_ID, to_char(b.BEGIN_DATE,'yyyy-mm-dd hh24:mi') BEGIN_DATE, to_char(b.END_DATE,'yyyy-mm-dd hh24:mi') END_DATE, (select place from meeting_room where id = room) as roomaddress, (select name from meeting_room where id = room) as roomname, to_char(b.CREATE_DATE,'yyyy-mm-dd hh24:mi') CREATE_DATE, to_char(b.UPDATE_DATE,'yyyy-mm-dd hh24:mi') UPDATE_DATE, b.CREATE_USER, b.STATE, b.ACCOUNT_ID, b.TITLE, b.MT_TITLE, b.MEET_PLACE from meeting b where 0 = 0 AND ( ('2026-05-14' <= b.BEGIN_DATE and b.BEGIN_DATE <= '2026-05-14') or ('2026-05-14' <= b.END_DATE and b.END_DATE <= '2026-05-14') ) AND ('2026-05-14' <= b.UPDATE_DATE and b.UPDATE_DATE <= '2026-05-14') AND b.TITLE like 'TITLE_001' AND state = 1;

-- statementId: queryMeetingParticipate.select
-- lookupStatementId: queryMeetingParticipate.select
-- source: meeting_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select a.member_Id as memberId from ctp_affair a left join meeting b on (a.subject = b.title and a.create_date = b.create_date) where b.id = 'VALUE_001';

-- statementId: queryMembersId.select
-- lookupStatementId: queryMembersId.select
-- source: meeting_sqlmap.xml
-- type: select
-- params: {
--   "deptId": 1001,
--   "levelId": 1001,
--   "postId": 1001
-- }
select ID from org_member where 1=1 AND org_department_id = 1001 AND org_level_id = 1001 AND org_post_id = 1001 and is_enable = 1;

-- statementId: queryMembersIdByTeam.select
-- lookupStatementId: queryMembersIdByTeam.select
-- source: meeting_sqlmap.xml
-- type: select
-- params: {
--   "teamId": 1001
-- }
select c.objective0_id from org_relationship c where c.source_id = 1001 and (select is_enable from org_member where id = c.objective0_id) = 1;

-- statementId: queryDeptDescription.select
-- lookupStatementId: queryDeptDescription.select
-- source: meeting_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select DESCRIPTION from ORG_UNIT where id = 'VALUE_001';

-- statementId: oaDepartExtendInfo.insert
-- lookupStatementId: oaDepartExtendInfo.insert
-- source: meeting_sqlmap.xml
-- type: insert
-- params: {}
insert into vm_department_extendInfo ( id, state, start_member_id, start_date, approve_member_id, approve_date, finishedflag, ratifyflag, ratify_member_id, ratify_date, writter, writeDate, departId , TXMeetingDepartId, isInvalidTXDepart, updateDate, account, path ) select util_common.getAbsID, 1, -6760911671874597139, sysdate, -6760911671874597139, sysdate, 0, 0, 0, null, -6760911671874597139, sysdate, vm.id, null, -3841538853571705149, sysdate, vm.org_account_id, path from vm_org_unit vm where vm.parent_id is not null and code is not null and vm.IS_INTERNAL = 1 and vm.id not in (select c.departId from vm_department_extendInfo c where c.departId is not null);

-- statementId: oaDepartExtendInfoContent.insert
-- lookupStatementId: oaDepartExtendInfoContent.insert
-- source: meeting_sqlmap.xml
-- type: insert
-- params: {}
insert into ctp_content_all (ID, CREATE_ID, CREATE_DATE, MODIFY_ID, MODIFY_DATE, MODULE_TYPE, MODULE_ID, MODULE_TEMPLATE_ID, CONTENT_TYPE, CONTENT, CONTENT_DATA_ID, CONTENT_TEMPLATE_ID, TITLE, SORT) select util_common.getAbsID, '-6760911671874597139', sysdate, '-6760911671874597139', sysdate, 37, id, '-7450664796185736396', '20', '', id, '5703827208807141039', 'OA组织机构扩展信息表', '0' from vm_department_extendInfo vm where id not in(select content_data_id from ctp_content_all c where c.content_template_id = 5703827208807141039 and content_data_id is not null);

-- statementId: needSysTXMeeting.select
-- lookupStatementId: needSysTXMeeting.select
-- source: meeting_sqlmap.xml
-- type: select
-- params: {}
select id, state, start_member_id, start_date, approve_member_id, approve_date, finishedflag, ratifyflag, ratify_member_id, ratify_date, writter, writeDate, departId , util_org.getDeptNameByDeptId(departId) departName, TXMeetingDepartId, isInvalidTXDepart, updateDate, account from vm_department_extendInfo vm where vm.TXMeetingDepartId is null and vm.isInvalidTXDepart = -3841538853571705149 order by path;

-- statementId: oaDepartExtendInfoState.update
-- lookupStatementId: oaDepartExtendInfoState.update
-- source: meeting_sqlmap.xml
-- type: update
-- params: {}
update vm_department_extendInfo v1 set v1.isInvalidTXDepart = -1089048568118490234 ,v1.updateDate = sysdate where v1.departId not in( select vm.ID from vm_org_unit vm where vm.parent_id is not null and code is not null and vm.IS_INTERNAL = 1 );

-- statementId: currentParentTXMeDepartId.select
-- lookupStatementId: currentParentTXMeDepartId.select
-- source: meeting_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select TXMeetingDepartId from vm_department_extendInfo where departid = (select vm.parent_id from vm_org_unit vm where id = 'VALUE_001');

-- statementId: currentParentTXMeOrgId.select
-- lookupStatementId: currentParentTXMeOrgId.select
-- source: meeting_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select TXMeetingDepartId from vm_department_extendInfo vm1 where account = (select vm.parent_id from vm_org_unit vm where id = 'VALUE_001') and vm1.departId is null;

-- statementId: allOADepartExtendInfo.select
-- lookupStatementId: allOADepartExtendInfo.select
-- source: meeting_sqlmap.xml
-- type: select
-- params: {}
select id, state, start_member_id, start_date, approve_member_id, approve_date, finishedflag, ratifyflag, ratify_member_id, ratify_date, writter, writeDate, departId , TXMeetingDepartId, util_org.getDeptNameByDeptId(departId) departName, isInvalidTXDepart, updateDate from vm_department_extendInfo v1 where v1.departId is not null order by path desc;

-- statementId: txMeetingId.update
-- lookupStatementId: txMeetingId.update
-- source: meeting_sqlmap.xml
-- type: update
-- params: {
--   "department_id": 1001,
--   "departId": 1001
-- }
update vm_department_extendInfo set TXMeetingDepartId = 1001 where departId = 1001;

-- statementId: TXMeetingDepartId.Update
-- lookupStatementId: TXMeetingDepartId.Update
-- source: meeting_sqlmap.xml
-- type: update
-- params: "VALUE_001"
update vm_department_extendInfo set TXMeetingDepartId = null where TXMeetingDepartId = 'VALUE_001';

-- statementId: needCreateTXMeeting.select
-- lookupStatementId: needCreateTXMeeting.select
-- source: meeting_sqlmap.xml
-- type: select
-- params: "VALUE_001"
VALUE_001;

-- statementId: invalidateTXMeetingUser.select
-- lookupStatementId: invalidateTXMeetingUser.select
-- source: meeting_sqlmap.xml
-- type: select
-- params: {
--   "sql": "update demo_table set status = 1"
-- }
update demo_table set status = 1;

-- statementId: allTXMeetingUser.select
-- lookupStatementId: allTXMeetingUser.select
-- source: meeting_sqlmap.xml
-- type: select
-- params: "VALUE_001"
VALUE_001;

-- statementId: TXMeetingInfo.update
-- lookupStatementId: TXMeetingInfo.update
-- source: meeting_sqlmap.xml
-- type: update
-- params: {
--   "TXUserId": 1001,
--   "id": 1001
-- }
update vm_baseMemberInfo set isOpenTXMeeting = -3841538853571705149, TXUserId = 1001 where id = 1001;

-- statementId: TXMeetingInfoDelete.update
-- lookupStatementId: TXMeetingInfoDelete.update
-- source: meeting_sqlmap.xml
-- type: update
-- params: "VALUE_001"
update vm_baseMemberInfo set isOpenTXMeeting = -1089048568118490234, TXUserId = null where TXUserId = 'VALUE_001';

-- statementId: queryAllUsableMeeringroom.select
-- lookupStatementId: queryAllUsableMeeringroom.select
-- source: meeting_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select name from meeting_room where delflag = 0;

-- statementId: getAllMembersPhoneNo.select
-- lookupStatementId: getAllMembersPhoneNo.select
-- source: meeting_sqlmap.xml
-- type: select
-- params: {}
select to_char(ext_attr_1) from org_member where state = 1 and IS_INTERNAL =1 and IS_LOGINABLE =1 and IS_VIRTUAL=0 and IS_ADMIN=0 and IS_ASSIGNED=1 and type = 1 and IS_ENABLE = 1 and IS_DELETED = 0 and STATUS = 1;

-- statementId: getMemberIdByPhoneNo.select
-- lookupStatementId: getMemberIdByPhoneNo.select
-- source: meeting_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select count(id) from org_member where ext_attr_1 = 'VALUE_001';

-- statementId: queryMeetingRoomInfo.select
-- lookupStatementId: queryMeetingRoomInfo.select
-- source: meeting_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select place as "place",name as "name" from meeting_room where id = (select room from meeting where id = 'VALUE_001');

-- statementId: getApplyMeetingTableData.select
-- lookupStatementId: getApplyMeetingTableData.select
-- source: meeting_sqlmap.xml
-- type: select
-- params: {
--   "startDate": "2026-05-14",
--   "endDate": "2026-05-14"
-- }
select id as "id", roomName as "roomName", perId as "perId", appBeginDate as "appBeginDate", appEndDate as "appEndDate", description as "description", appId as "appId", roomTypeName as "roomTypeName", status as "status" from vm_meetingRoom_applyInfo where 1=1 AND appBeginDate >= to_date('2026-05-14', 'yyyy-mm-dd hh24:mi:ss') AND appBeginDate <= to_date('2026-05-14', 'yyyy-mm-dd hh24:mi:ss');

-- statementId: findAllMeetingRoom
-- lookupStatementId: findAllMeetingRoom
-- source: meeting_sqlmap.xml
-- type: select
-- params: {}
select name, to_char(id) id,to_char(qr_code_apply) qr_code_apply from meeting_room;

-- statementId: getMeetingRoomTypeMap.select
-- lookupStatementId: getMeetingRoomTypeMap.select
-- source: meeting_sqlmap.xml
-- type: select
-- params: {}
select mr.id, mrt.name from meeting_room mr left join meeting_room_type mrt on mrt.id = mr.room_type_id where mr.delflag = 0 and mr.status = 0;

-- statementId: getAllFormResource.select
-- lookupStatementId: getAllFormResource.select
-- source: formField_sqlmap.xml
-- type: select
-- params: {}
select id as "id", form_id as "formId", resource_name as "resourceName", content as "content", property_type as "propertyType", property_name as "propertyName" from FORM_RESOURCE where property_type = '103';

-- statementId: getFormFieldByFormId.select
-- lookupStatementId: getFormFieldByFormId.select
-- source: formField_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select n_formid as "nFormId", n_tableid as "nTableId", vc_tablename as "vcTableName", vc_tabledisplay as "vcTableDisplay", vc_tabletype as "vcTableType", vc_ownertableid as "vcOwnerTableId", n_fieldid as "nFieldId", vc_fieldname as "vcFieldName", vc_fielddisplay as "vcFieldDisplay", vc_fieldinputtype as "vcFieldInputType", vc_fieldrefid as "vcFieldRefId", d_modifytime as "dModifyTime" from FG_FORMFIELD where n_formid = 'VALUE_001';

-- statementId: selectFieldInputType.select
-- lookupStatementId: selectFieldInputType.select
-- source: formField_sqlmap.xml
-- type: select
-- params: {
--   "fieldDisplayXml": "VALUE_001",
--   "formId": 1001
-- }
select extractValue(xmltype(t.content), 'VALUE_001') from form_resource t where t.form_id = 1001 and t.property_type=103;

-- statementId: updateFieldInputType.update
-- lookupStatementId: updateFieldInputType.update
-- source: formField_sqlmap.xml
-- type: update
-- params: {
--   "fieldInputType": "VALUE_001",
--   "formId": 1001,
--   "fieldDisplay": "VALUE_001"
-- }
update fg_formfield ff set ff.d_modifytime=sysdate,ff.vc_fieldinputtype= 'VALUE_001' where ff.n_formid= 1001 and ff.vc_fielddisplay = 'VALUE_001';

-- statementId: selectFormRefId.select
-- lookupStatementId: selectFormRefId.select
-- source: formField_sqlmap.xml
-- type: select
-- params: {
--   "fieldDisplayXml": "VALUE_001",
--   "formId": 1001
-- }
select extractValue(xmltype(t.content), 'VALUE_001') from form_resource t where t.form_id = 1001 and t.property_type=103;

-- statementId: updateFormRefId.update
-- lookupStatementId: updateFormRefId.update
-- source: formField_sqlmap.xml
-- type: update
-- params: {
--   "enumRefId": 1001,
--   "formId": 1001,
--   "fieldDisplay": "VALUE_001"
-- }
update fg_formfield ff set ff.vc_fieldrefid= 1001 where ff.n_formid=1001 and ff.vc_fielddisplay = 'VALUE_001';

-- statementId: formedFormRefId.update
-- lookupStatementId: formedFormRefId.update
-- source: formField_sqlmap.xml
-- type: update
-- params: {
--   "formId": 1001
-- }
update fg_formfield ff set ff.vc_fieldrefid=substr(vc_fieldrefid,0,instr(vc_fieldrefid,'_')-1) where ff.n_formid=1001 and vc_fieldrefid is not null;

-- statementId: deleteFormField.delete
-- lookupStatementId: deleteFormField.delete
-- source: formField_sqlmap.xml
-- type: delete
-- params: "VALUE_001"
delete from fg_formfield ff where ff.n_formid = 'VALUE_001';

-- statementId: getAllFormDefinition.select
-- lookupStatementId: getAllFormDefinition.select
-- source: formField_sqlmap.xml
-- type: select
-- params: {}
select id as "id", name as "name", create_id as "createId", create_time as "createTime", form_type as "formType", category_id as "categoryId", use_flag as "useFlag", state as "state", delete_flag as "deleteFlag", field_info as "fieldInfo", view_info as "viewInfo", query_info as "queryInfo", report_info as "reportInfo", trigger_info as "triggerInfo", appbind_info as "appbindInfo", extensions_info as "extensionsInfo", modify_time as "modifyTime", form_style as "formStyle", prepare_flag as "prepareFlag", source_type as "sourceType" from FORM_DEFINITION;

-- statementId: getFormInfoByXml.select
-- lookupStatementId: getFormInfoByXml.select
-- source: formField_sqlmap.xml
-- type: select
-- params: {
--   "formId": 1001
-- }
select vc_tableid as "tableId", vc_tablename as "tableName", vc_tabletype as "tableType", vc_tabledisplay as "tableDisplay", vc_ownertableid as "ownerTableId" from xmltable('/TableList/Table' passing ( select xmltype(fd.field_info) from form_definition fd where fd.id = 1001 ) columns vc_tableid VARCHAR2(255) path '@id', vc_tablename VARCHAR2(255) path '@name', vc_tabledisplay VARCHAR2(255) path '@display', vc_ownertableid VARCHAR2(255) path '@onwertable', vc_tabletype VARCHAR2(20) path '@tabletype') table_info;

-- statementId: addFormFieldInfo.insert
-- lookupStatementId: addFormFieldInfo.insert
-- source: formField_sqlmap.xml
-- type: insert
-- params: {
--   "formId": 1001,
--   "tableId": 1001,
--   "tableName": "NAME_001",
--   "tableType": "VALUE_001",
--   "tableDisplay": "VALUE_001",
--   "ownerTableId": 1001
-- }
merge into fg_formfield ff using( select 1001 as formId, 1001 as tableId, 'NAME_001' as tableName, 'VALUE_001' as tableType, 'VALUE_001' as tableDisplay, 1001 as ownerTableId, field_info.field_id as fieldId, field_info.field_name as fieldName, field_info.field_display as fieldDisplay, sysdate as modify_date from xmltable('//FieldList/Field' passing (select extract(xmltype(fd.field_info),'/TableList/Table[@name="' || 'NAME_001' || '"]') from form_definition fd where id = 1001) columns field_id varchar2(255) path '@id', field_name varchar2(255) path '@name', field_display varchar2(100) path '@display') field_info ) sou on ( ff.n_formid = sou.formId and ff.n_tableid = sou.tableId and ff.n_fieldid = sou.fieldId ) when matched then update set vc_tablename = sou.tableName , vc_tabledisplay = sou.tableDisplay , vc_tabletype = sou.tableType , vc_ownertableid = sou.ownerTableId , vc_fieldname = sou.fieldName , vc_fielddisplay = sou.fieldDisplay where ff.n_formid = sou.formId and n_tableid = sou.tableId and n_fieldid = sou.fieldId and (vc_tablename != sou.tableName or vc_tabledisplay != sou.tableDisplay or vc_tabletype != sou.tableType or vc_ownertableid != sou.ownerTableId or vc_fieldname != sou.fieldName or vc_fielddisplay != sou.fieldDisplay) when not matched then insert ( id, state, start_member_id, start_date, approve_member_id, approve_date, finishedflag, ratifyflag, ratify_member_id, ratify_date, sort, modify_member_id, modify_date, n_formid, n_tableid, vc_tablename, vc_tabletype, vc_tabledisplay, vc_ownertableid, n_fieldid, vc_fieldname, vc_fielddisplay, d_modifytime ) values ( util_common.getAbsID(), 1, -6760911671874597139, sysdate, 0, sysdate, 0, 0, 0, null, 0, '-6760911671874597139', sysdate, sou.formId, sou.tableId, sou.tableName, sou.tableType, sou.tableDisplay, sou.ownerTableId, sou.fieldId, sou.fieldName, sou.fieldDisplay, sysdate );

-- statementId: updateFieldInputTypeDefinition.update
-- lookupStatementId: updateFieldInputTypeDefinition.update
-- source: formField_sqlmap.xml
-- type: update
-- params: {
--   "fieldInputType": "VALUE_001",
--   "formId": 1001,
--   "fieldDisplay": "VALUE_001"
-- }
update fg_formfield ff set ff.vc_fieldinputtype= 'VALUE_001' where ff.n_formid=1001 and exists(select 1 from form_resource t where t.form_id=ff.n_formid and t.property_type=103) and ff.vc_fielddisplay = 'VALUE_001';

-- statementId: updateFormRefIdDefinition.update
-- lookupStatementId: updateFormRefIdDefinition.update
-- source: formField_sqlmap.xml
-- type: update
-- params: {
--   "enumRefId": 1001,
--   "formId": 1001,
--   "fieldDisplay": "VALUE_001"
-- }
update fg_formfield ff set ff.vc_fieldrefid= 1001 where ff.n_formid=1001 and exists(select 1 from form_resource t where t.form_id=ff.n_formid) and ff.vc_fielddisplay = 'VALUE_001';

-- statementId: findSealApplyArchiveInfo.select
-- lookupStatementId: findSealApplyArchiveInfo.select
-- source: seal_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select * from vm_sealApplyArchiveInfo where applyNo = 'VALUE_001';

-- statementId: findSealRecordInfo.select
-- lookupStatementId: findSealRecordInfo.select
-- source: seal_sqlmap.xml
-- type: select
-- params: {
--   "sealName": "NAME_001",
--   "sealStatus": 1
-- }
select * from vm_sealRecordInfo where sealName='NAME_001' and sealStatus =1;

-- statementId: sealDetailInsert.insert
-- lookupStatementId: sealDetailInsert.insert
-- source: seal_sqlmap.xml
-- type: insert
-- params: {
--   "id": 1001,
--   "formmainId": 1001,
--   "sealCount": 1,
--   "approver": "VALUE_001",
--   "keeper": "VALUE_001",
--   "keeperDept": "VALUE_001",
--   "sealStatus": 1,
--   "sealName": "NAME_001",
--   "sealNumber": "VALUE_001"
-- }
insert into vm_sealApplyArchiveChildInfo ( id, formmainId, sealCount, approver, keeper, keeperDept, sealStatus, sort, sealSerialNumber, sealName, sealNumber )values( 1001, 1001, 1, 'VALUE_001', 'VALUE_001', 'VALUE_001', 1, (select max(sort)+1 from vm_sealApplyArchiveChildInfo), (select max(sealSerialNumber)+1 from vm_sealApplyArchiveChildInfo), 'NAME_001', 'VALUE_001' );

-- statementId: sealForKMInsert.insert
-- lookupStatementId: sealForKMInsert.insert
-- source: seal_sqlmap.xml
-- type: insert
-- params: {
--   "id": 1001,
--   "state": 1,
--   "startMemberId": 1001,
--   "startDate": "2026-05-14",
--   "approveMemberId": 1001,
--   "approveDate": "2026-05-14",
--   "finishedflag": 1,
--   "ratifyflag": 1,
--   "ratifyMemberId": 1001,
--   "ratifyDate": "2026-05-14",
--   "modifyMemberId": 1001,
--   "modifyDate": "2026-05-14",
--   "businessTitle": "TITLE_001",
--   "applyUserCode": "CODE_001",
--   "agentUserNo": "VALUE_001",
--   "sealDate": "2026-05-14",
--   "applyDeptCode": "CODE_001",
--   "sealNumberTotal": "VALUE_001",
--   "remark": "VALUE_001",
--   "applyNo": "VALUE_001",
--   "businessType": "VALUE_001",
--   "fileStringBuffer": "VALUE_001",
--   "sealedFilesStringBuffer": "VALUE_001",
--   "serialNumber": "VALUE_001",
--   "businessSubType": "VALUE_001",
--   "businessURL": "VALUE_001"
-- }
insert into vm_sealApplyArchiveInfo (id, state, startMemberId, startDate, approveMemberId, approveDate, finishedflag, ratifyflag, ratifyMemberId, ratifyDate, modifyMemberId, modifyDate, sort, businessTitle, applyUserNo, agentUserNo, sealDate, applyDeptCode, sealNumberTotal, remark, applyNo, businessType, files, sealedFiles, serialNumber, businessSubType, businessURL )values ( 1001, 1, 1001, '2026-05-14', 1001, '2026-05-14', 1, 1, 1001, '2026-05-14', 1001, '2026-05-14', (select max(sort)+1 from vm_sealApplyArchiveInfo), 'TITLE_001', 'CODE_001', 'VALUE_001', '2026-05-14', 'CODE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001' );

-- statementId: companySeal.select
-- lookupStatementId: companySeal.select
-- source: seal_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id, sealId, sealCode, sealName, sealnameenum from (select id, sealId, sealCode, sealName, sealnameenum from VM_SEALRECORDINFO union all select id, sealId, sealCode, sealName, sealnameenum from VM_SEALRECORDINFOSH) where sealid = 'VALUE_001';

-- statementId: companySealList.select
-- lookupStatementId: companySealList.select
-- source: seal_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id,sealId,sealCode,sealName,sealnameenum from VM_SEALRECORDINFO where sealisok='VALUE_001';

-- statementId: companySeal.insert
-- lookupStatementId: companySeal.insert
-- source: seal_sqlmap.xml
-- type: insert
-- params: {
--   "formId": 1001,
--   "sealstatus": 1,
--   "sealname": "NAME_001",
--   "sealid": 1001,
--   "sealcode": "CODE_001",
--   "sealisok": "VALUE_001",
--   "sealnameenum": "NAME_001",
--   "restrainNumber": "VALUE_001"
-- }
insert into VM_SEALRECORDINFO ( id, state, start_member_id, start_date, approve_member_id, approve_date, finishedflag, ratifyflag, ratify_member_id, ratify_date, modify_member_id, modify_date, sort, sealstatus, opendate, sealname, sealid, sealcode, sealisok, sealnameenum, restrainnumber ) values ( 1001, 1, '6105960157477424523', sysdate, '0', sysdate, 0, 0, '0', sysdate, '6105960157477424523', sysdate, 0, 1, sysdate, 'NAME_001', 1001, 'CODE_001', 'VALUE_001', 'NAME_001', 'VALUE_001' );

-- statementId: companySealStatus.update
-- lookupStatementId: companySealStatus.update
-- source: seal_sqlmap.xml
-- type: update
-- params: {
--   "sealstatus": 1,
--   "id": 1001
-- }
update VM_SEALRECORDINFO set sealstatus = 1 where id = 1001;

-- statementId: companySealname.update
-- lookupStatementId: companySealname.update
-- source: seal_sqlmap.xml
-- type: update
-- params: {
--   "sealname": "NAME_001",
--   "sealnameenum": "NAME_001",
--   "id": 1001
-- }
update VM_SEALRECORDINFO set sealname = 'NAME_001', sealnameenum = 'NAME_001' where id = 1001;

-- statementId: findEnumItemById.select
-- lookupStatementId: findEnumItemById.select
-- source: seal_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select to_char(ID) id, to_char(REF_ENUMID) as parentId, SHOWVALUE, to_char(ENUMVALUE) ENUMVALUE, to_char(SORTNUMBER) SORTNUMBER, STATE, OUTPUT_SWITCH, ORG_ACCOUNT_ID, PARENT_ID, ROOT_ID, LEVEL_NUM, DESCRIPTION, IFUSE, I18N, EXT1 from ctp_enum_item where id = 'VALUE_001';

-- statementId: sealMaxSortInfo.select
-- lookupStatementId: sealMaxSortInfo.select
-- source: seal_sqlmap.xml
-- type: select
-- params: {}
select '1938448756302630027' parentid, to_char(max(f.sortnumber+1)) as enumvalue, to_char(max(f.sortnumber+1)) as sortnumber from ctp_enum_item f where f.ref_enumid = 1938448756302630027;

-- statementId: companySealSH.select
-- lookupStatementId: companySealSH.select
-- source: seal_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id,sealId,sealCode,sealName,sealnameenum from VM_SEALRECORDINFOSH where sealid = 'VALUE_001';

-- statementId: companySealListSH.select
-- lookupStatementId: companySealListSH.select
-- source: seal_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id,sealId,sealCode,sealName,sealnameenum from VM_SEALRECORDINFOSH where sealisok='VALUE_001';

-- statementId: companySealStatusSH.update
-- lookupStatementId: companySealStatusSH.update
-- source: seal_sqlmap.xml
-- type: update
-- params: {
--   "sealstatus": 1,
--   "id": 1001
-- }
update VM_SEALRECORDINFOSH set sealstatus = 1 where id = 1001;

-- statementId: companySealnameSH.update
-- lookupStatementId: companySealnameSH.update
-- source: seal_sqlmap.xml
-- type: update
-- params: {
--   "sealname": "NAME_001",
--   "sealnameenum": "NAME_001",
--   "id": 1001
-- }
update VM_SEALRECORDINFOSH set sealname = 'NAME_001', sealnameenum = 'NAME_001' where id = 1001;

-- statementId: sealMaxSortInfoSH.select
-- lookupStatementId: sealMaxSortInfoSH.select
-- source: seal_sqlmap.xml
-- type: select
-- params: {}
select '-2170604792472449072' parentid, to_char(max(f.sortnumber+1)) as enumvalue, to_char(max(f.sortnumber+1)) as sortnumber from ctp_enum_item f where f.ref_enumid = -2170604792472449072;

-- statementId: companySealSH.insert
-- lookupStatementId: companySealSH.insert
-- source: seal_sqlmap.xml
-- type: insert
-- params: {
--   "formId": 1001,
--   "sealstatus": 1,
--   "sealname": "NAME_001",
--   "sealid": 1001,
--   "sealcode": "CODE_001",
--   "sealisok": "VALUE_001",
--   "sealnameenum": "NAME_001",
--   "restrainNumber": "VALUE_001"
-- }
insert into VM_SEALRECORDINFOSH ( id, state, start_member_id, start_date, approve_member_id, approve_date, finishedflag, ratifyflag, ratify_member_id, ratify_date, modify_member_id, modify_date, sort, sealstatus, opendate, sealname, sealid, sealcode, sealisok, sealnameenum, signtype, restrainNumber ) values ( 1001, 1, '6105960157477424523', sysdate, '0', sysdate, 0, 0, '0', sysdate, '6105960157477424523', sysdate, 0, 1, sysdate, 'NAME_001', 1001, 'CODE_001', 'VALUE_001', 'NAME_001', '3924100868922361882', 'VALUE_001' );

-- statementId: findSignalInfo.select
-- lookupStatementId: findSignalInfo.select
-- source: seal_sqlmap.xml
-- type: select
-- params: {
--   "type": "VALUE_001",
--   "id": 1001
-- }
select A1.TYPE, A1.ID, A1.SERIALNO, A1.SUBJECTMATTER, A1.SENDUSER, A1.FILEKEYS, A1.PRESERVER, A1.SIGNTYPE, A1.SEALID, A1.EDGESIGN, A1.KEYWORDSIGN from vm_sealcolinfo a1 where 1=1 and type = 'VALUE_001' and id = 1001;

-- statementId: findAllFailSignSeal.select
-- lookupStatementId: findAllFailSignSeal.select
-- source: seal_sqlmap.xml
-- type: select
-- params: {}
select id, state, start_member_id start_date, approve_member_id, approve_date, finishedflag, ratifyflag, ratify_member_id, ratify_date, sort, modify_member_id, modify_date, flowName, serialNumber, isPigeonhole, EQBSerialNumber, retryCount, sealState, sealFormName, signareataskid from vm_electronicsealrecord where sealState = 1219999897547194393 and isSignSeal = -3841538853571705149;

-- statementId: sealQueueConfig.select
-- lookupStatementId: sealQueueConfig.select
-- source: seal_sqlmap.xml
-- type: select
-- params: {}
select sysCode, routingKey, bussType, isEnable from vm_sealQueueConfig where isEnable = -3841538853571705149;

-- statementId: affair.select
-- lookupStatementId: affair.select
-- source: affair_sqlmap.xml
-- type: select
-- params: {
--   "objectId": 1001
-- }
SELECT ca.id as id,om.name as senderLoginName, ca.SUBJECT as subject, nvl(op.login_name, substr(om.ext_attr_2,1,instr(om.ext_attr_2, '@')-1)) sendername, ca.MEMBER_ID as memberId, ca.proxy_member_id proxyMemberId, ca.OBJECT_ID as objectId, ca.ACTIVITY_ID as activityId, to_char(ca.RECEIVE_TIME, 'YYYY-MM-DD HH24:MI:SS') as receiveTime, ca.TASK_STATE as taskState, ca.STATE as state, ca.is_delete as isDelete, ca.SUB_STATE AS subState, ca.TEMPLETE_ID as templeteId, cs.PROCESS_ID as processId, ca.complete_time as completeTime from CTP_AFFAIR ca left join org_principal op on ca.sender_id = op.member_id left join org_member om on ca.sender_id = om.id left join col_summary cs on ca.object_id = cs.id where ca.app in (1) AND NOT EXISTS (SELECT 1 FROM vm_affairlog vm WHERE vm.taskID = to_char(ca.id) AND vm.pushresult = '失败') AND ca.OBJECT_ID = 1001 AND ca.task_state != 2;

-- statementId: affairMeeting.select
-- lookupStatementId: affairMeeting.select
-- source: affair_sqlmap.xml
-- type: select
-- params: {}
SELECT ca.id as id,om.name as senderLoginName, ca.SUBJECT as subject, nvl(op.login_name, substr(om.ext_attr_2,1,instr(om.ext_attr_2, '@')-1)) sendername, ca.MEMBER_ID as memberId, ca.OBJECT_ID as objectId, ca.ACTIVITY_ID as activityId, to_char(ca.RECEIVE_TIME, 'YYYY-MM-DD HH24:MI:SS') as receiveTime, ca.TASK_STATE as taskState, ca.is_delete as isDelete, ca.STATE as state, ca.SUB_STATE AS subState, ca.TEMPLETE_ID as templeteId, cs.PROCESS_ID as processId, to_char(ca.complete_time, 'YYYY-MM-DD HH24:MI:SS') as completeTime, ca.app as app from CTP_AFFAIR ca left join org_principal op on ca.sender_id = op.member_id left join org_member om on ca.sender_id = om.id left join col_summary cs on ca.object_id = cs.id where ca.app in (6,29) AND ( ( ca.task_state = 0 and ca.state = 3 and ca.sub_state!=34 and receive_time <= SYSDATE + 7) or ( ca.task_state = 1 and ca.state in (4,10) ) or (ca.task_state = 1 and ca.sub_state in(11,12,31,32,33) and ca.state !=4) or (ca.is_delete = 1 and ca.task_state!=2 and ca.state = 3 and ca.app = 29) );

-- statementId: affairByAffairId.select
-- lookupStatementId: affairByAffairId.select
-- source: affair_sqlmap.xml
-- type: select
-- params: {
--   "affairId": 1001
-- }
SELECT ca.id as id,om.name as senderLoginName, ca.SUBJECT as subject, nvl(op.login_name, substr(om.ext_attr_2,1,instr(om.ext_attr_2, '@')-1)) sendername, ca.MEMBER_ID as memberId, ca.proxy_member_id proxyMemberId, ca.OBJECT_ID as objectId, ca.is_delete as isDelete, ca.ACTIVITY_ID as activityId, to_char(ca.RECEIVE_TIME, 'YYYY-MM-DD HH24:MI:SS') as receiveTime, ca.TASK_STATE as taskState, ca.STATE as state, ca.SUB_STATE AS subState, to_char(ca.complete_time, 'YYYY-MM-DD HH24:MI:SS') as completeTime from CTP_AFFAIR ca left join org_principal op on ca.sender_id = op.member_id left join org_member om on ca.sender_id = om.id where ca.app in (1) and ca.task_state != '2' AND ca.id = 1001;

-- statementId: affairByMeetingId.select
-- lookupStatementId: affairByMeetingId.select
-- source: affair_sqlmap.xml
-- type: select
-- params: {
--   "objectId": 1001
-- }
SELECT ca.id as id,om.name as senderLoginName, ca.is_delete as isDelete, ca.SUBJECT as subject, nvl(op.login_name, substr(om.ext_attr_2,1,instr(om.ext_attr_2, '@')-1)) sendername, ca.MEMBER_ID as memberId, ca.OBJECT_ID as objectId, ca.ACTIVITY_ID as activityId, to_char(ca.RECEIVE_TIME, 'YYYY-MM-DD HH24:MI:SS') as receiveTime, ca.TASK_STATE as taskState, ca.STATE as state, ca.SUB_STATE AS subState, to_char(ca.complete_time, 'YYYY-MM-DD HH24:MI:SS') as completeTime from CTP_AFFAIR ca left join org_principal op on ca.sender_id = op.member_id left join org_member om on ca.sender_id = om.id where ca.app in (6) and ca.OBJECT_ID = 1001;

-- statementId: affairTaskState.update
-- lookupStatementId: affairTaskState.update
-- source: affair_sqlmap.xml
-- type: update
-- params: {
--   "taskState": 1,
--   "id": 1001
-- }
UPDATE CTP_AFFAIR SET Task_State = 1 where id = 1001;

-- statementId: affairLog.select
-- lookupStatementId: affairLog.select
-- source: affair_sqlmap.xml
-- type: select
-- params: {
--   "id": 1001
-- }
select id, taskId, dataLog, pushType from vm_affairlog where id = 1001;

-- statementId: getAffairLogInfo.select
-- lookupStatementId: getAffairLogInfo.select
-- source: affair_sqlmap.xml
-- type: select
-- params: {
--   "pushResult": "VALUE_001",
--   "pushCount": 1,
--   "pushTime": "2026-05-14 10:00:00"
-- }
select id, taskId, dataLog, pushType from vm_affairlog where pushResult = 'VALUE_001' and pushCount <= 1 and pushTime >= to_date('2026-05-14 10:00:00','yyyy/mm/dd');

-- statementId: affairLog.insert
-- lookupStatementId: affairLog.insert
-- source: affair_sqlmap.xml
-- type: insert
-- params: {
--   "id": 1001,
--   "taskSubject": "TITLE_001",
--   "taskId": 1001,
--   "senderId": 1001,
--   "memberId": 1001,
--   "taskTime": "2026-05-14 10:00:00",
--   "pushTime": "2026-05-14 10:00:00",
--   "pushResult": "VALUE_001",
--   "dataLog": "VALUE_001",
--   "returnMsg": "VALUE_001",
--   "pushType": "VALUE_001"
-- }
INSERT INTO vm_affairlog (ID, taskSubject, taskId, senderId, memberId, taskTime, pushTime, pushCount,pushResult, dataLog, returnMsg, pushType) VALUES (1001, 'TITLE_001', 1001, 1001, 1001, '2026-05-14 10:00:00', '2026-05-14 10:00:00', '1', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001');

-- statementId: affairLog.update
-- lookupStatementId: affairLog.update
-- source: affair_sqlmap.xml
-- type: update
-- params: {
--   "pushTime": "2026-05-14 10:00:00",
--   "pushResult": "VALUE_001",
--   "returnMsg": "VALUE_001",
--   "id": 1001
-- }
update vm_affairlog set pushTime='2026-05-14 10:00:00' , pushCount = pushCount + 1 , pushResult = 'VALUE_001' , returnMsg = 'VALUE_001' where id = 1001;

-- statementId: findNodeInfoByColId.select
-- lookupStatementId: findNodeInfoByColId.select
-- source: affair_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id, util_user.getLoginNameByMemId(c.member_id) as loginName from ctp_affair c where c.object_id = 'VALUE_001' and c.state = 3;

-- statementId: deailAgentTaskContinuityMemApprove.select
-- lookupStatementId: deailAgentTaskContinuityMemApprove.select
-- source: affair_sqlmap.xml
-- type: select
-- params: {
--   "memberIds": "RAW_VALUE"
-- }
select q1.id,q1.object_id as colSummaryId , util_user.getLoginNameByMemId(worker_id) as LOGINNAME from ( select row_number() over(partition by object_id order by receive_time,state_order ) row_num, lag(worker_id,1,null) over(partition by object_id order by receive_time,state_order) last_worker_id, lag(state,1,null) over(partition by object_id order by receive_time,state_order) last_status, q.* from ( select case when a.state in (4) then decode(transactor_id,null,m.name,m4.name) else nvl(ag.agent_name,m.name) end worker_name, case when a.state in(4) then decode(transactor_id,null,m.id,transactor_id) else nvl(ag.agent_id,a.member_id) end worker_id, m4.name transactor_name,m.name member_name , decode(a.state,null,0,2,1,4,1,2) state_order, a.* from (select * from ctp_affair a where a.is_delete=0 and a.state not in (1,6 ) and a.node_policy not in ('inform') and a.receive_time>sysdate-100) a join org_member m on a.member_id=m.id left join org_member m4 on a.transactor_id=m4.id left join (select * from col_summary cs where cs.finish_date is null) cs on a.object_id=cs.id left join (select m1.name agent_name,m2.name agent_to_name,ag.* from agent ag ,org_member m1,org_member m2 where ag.agent_id=m1.id and ag.agent_to_id=m2.id and ag.cancel_flag=0 and sysdate between ag.start_date and ag.end_date ) ag on a.member_id=ag.agent_to_id ) q ) q1 where 1=1 and q1.last_worker_id=q1.worker_id and q1.state in(3) and q1.last_worker_id <> q1.member_id and member_id in(RAW_VALUE);

-- statementId: errorAffair.select
-- lookupStatementId: errorAffair.select
-- source: affair_sqlmap.xml
-- type: select
-- params: {}
select taskID from vm_affairlog vm where vm.pushresult = '失败';

-- statementId: wupTask.select
-- lookupStatementId: wupTask.select
-- source: affair_sqlmap.xml
-- type: select
-- params: {}
select appTaskId, partUserCode, taskName, taskDesc, partiUserName, state, subState from (select t.app_task_id as appTaskId, t.parti_user_code as partUserCode, t.task_name as taskName, t.task_desc as taskDesc, t.parti_user_name as partiUserName, -1 as state, -1 as subState from wup_task t where not (regexp_like(t.app_task_id, '^-*\d+$$') and t.app_task_id in (select id from ctp_affair a where a.task_state is null or a.task_state < 2 union all select id from inquiry_affair union all select id from vm_meeting_emcee_reminder) or regexp_like(t.app_task_id, '^.*[a-zA-Z]+.*$$') and t.app_task_id in (select f.proxy_task_id from vm_task_proxy_push f)) union all select w.app_task_id as appTaskId, w.parti_user_code as partUserCode, w.task_name as taskName, w.task_desc as taskDesc, w.parti_user_name as partiUserName, c.state, c.sub_state as subState from wup_task w left join ctp_affair c on regexp_like(w.app_task_id, '^-*\d+$$') and w.app_task_id = c.id where c.is_delete = 1 or c.state in (2, 4, 8, 10, 5, 7, 6, 15, 31, 32, 33) or c.sub_state = 21) where rownum <= 20000 order by apptaskid desc;

-- statementId: isTaskByAgentIdHandle.select
-- lookupStatementId: isTaskByAgentIdHandle.select
-- source: affair_sqlmap.xml
-- type: select
-- params: {
--   "taskId": 1001,
--   "generalManagerId": 1001
-- }
select c.subject from ctp_affair c where c.id = 1001 and c.pre_approver = 1001;

-- statementId: findAgentLoginName.select
-- lookupStatementId: findAgentLoginName.select
-- source: affair_sqlmap.xml
-- type: select
-- params: {}
select loginname from (select distinct util_user.getLoginNameByMemId(a.agent_id) loginname from agent a where a.end_date> sysdate and cancel_flag = 0) a where a.loginname is not null;

-- statementId: expireNotificationRule.select
-- lookupStatementId: expireNotificationRule.select
-- source: affair_sqlmap.xml
-- type: select
-- params: {}
select templateId, activityId, expireDays, messageTemplate, templateCreateTime from vm_taskexpirednotiinfo vm where USEABLE = '-286897663746683514';

-- statementId: expireNotificationMember.select
-- lookupStatementId: expireNotificationMember.select
-- source: affair_sqlmap.xml
-- type: select
-- params: {
--   "TEMPLATEID": 1001,
--   "ACTIVITYID": 1001,
--   "EXPIREDAYS": "VALUE_001",
--   "TEMPLATECREATETIME": "2026-05-14 10:00:00"
-- }
select MEMBER_ID, count(MEMBER_ID) as totalExpiredTask from ctp_affair where STATE = 3 and IS_DELETE = 0 and TEMPLETE_ID = (select ID FROM CTP_TEMPLATE where TEMPLETE_NUMBER = 1001) and ACTIVITY_ID = 1001 and TRUNC(SYSDATE - RECEIVE_TIME) >= 'VALUE_001' and to_date('2026-05-14 10:00:00','yyyy/mm/dd') >= trunc(create_date) group by MEMBER_ID;

-- statementId: expireNotiTemplateName.select
-- lookupStatementId: expireNotiTemplateName.select
-- source: affair_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select PROCESSNAME AS templateName from WF_PROCESS_TEMPLETE where ID = (SELECT WORKFLOW_ID FROM CTP_TEMPLATE WHERE TEMPLETE_NUMBER = 'VALUE_001');

-- statementId: expireNotiActivityName.select
-- lookupStatementId: expireNotiActivityName.select
-- source: affair_sqlmap.xml
-- type: select
-- params: {
--   "ACTIVITYID": 1001,
--   "TEMPLATEID": 1001
-- }
select EXTRACTVALUE(XMLTYPE(wf.workflow), '/ps/p/n[@i="' || 1001 || '"]/@n') as activityName from WF_PROCESS_TEMPLETE wf where wf.id = (select WORKFLOW_ID from ctp_template where TEMPLETE_NUMBER = 1001);

-- statementId: queryExpiredAffair.select
-- lookupStatementId: queryExpiredAffair.select
-- source: affair_sqlmap.xml
-- type: select
-- params: {}
select ID, IS_COVER_TIME, MEMBER_ID, SENDER_ID, SUBJECT, APP, OBJECT_ID, SUB_OBJECT_ID, STATE, SUB_STATE, HASTEN_TIMES, REMIND_DATE, DEADLINE_DATE, CAN_DUE_REMIND, CREATE_DATE, to_char(RECEIVE_TIME,'yyyy-MM-dd HH24:mi:ss') RECEIVE_TIME_STR, COMPLETE_TIME, REMIND_INTERVAL, IS_DELETE, TRACK, ARCHIVE_ID, EXT_PROPS, UPDATE_DATE, IS_FINISH, BODY_TYPE, IMPORTANT_LEVEL, RESENT_TIME, FORWARD_MEMBER, IDENTIFIER, TRANSACTOR_ID, NODE_POLICY, ACTIVITY_ID, FORM_APP_ID, FORM_ID, FORM_OPERATION_ID, TEMPLETE_ID, FROM_ID, OVER_WORKTIME, RUN_WORKTIME, OVER_TIME, RUN_TIME, DEAL_TERM_TYPE, DEAL_TERM_USERID, SUB_APP, EXPECTED_PROCESS_TIME, ORG_ACCOUNT_ID, PROCESS_ID, IS_PROCESS_OVER_TIME, FORM_MULTI_OPERATION_ID, BACK_FROM_ID, FORM_RELATIVE_STATIC_IDS, FORM_RELATIVE_QUERY_IDS, HAS_FAVORITE, FROM_TYPE, FORM_RECORDID, CASE_ID, RELATION_DATA_ID, FIRSTVIEW_PERIOD, FIRSTVIEW_DATE, FIRSTRESPONSE_PERIOD, SIGNLEVIEW_PERIOD, PRE_APPROVER, AUTO_RUN, SUMMARY_STATE, TOP_TIME, SORT_WEIGHT, AI_PROCESSING, PROCESS_DEADLINE_TIME, PROXY_MEMBER_ID, MATCH_DEPARTMENT_ID, MATCH_POST_ID, NODE_NAME, MATCH_ACCOUNT_ID, PRINT_NM, MESSAGE_RULE_ID, util_wf.getAffairNodeDesc(id,activity_id) as extendJsonStr, ((sysdate - CREATE_DATE)*24*60)-DEADLINE_DATE as overMin from ctp_affair where ( ( ((sysdate - RECEIVE_TIME)*24*60) > (DEADLINE_DATE) and DEADLINE_DATE is not null and util_wf.getWFNodeExtendParam((select ct.workflow_id from CTP_TEMPLATE ct where ct.id =templete_id),activity_id) is not null and node_policy != 'inform' ) or from_type in (1,3) ) and state = 3 and templete_id is not null and FORM_RECORDID is not null;

-- statementId: queryPreviousRemind.select
-- lookupStatementId: queryPreviousRemind.select
-- source: affair_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select previousNoti from vm_overtime_TASK_INFO where id = 'VALUE_001';

-- statementId: updatePreviousRemind.update
-- lookupStatementId: updatePreviousRemind.update
-- source: affair_sqlmap.xml
-- type: update
-- params: "VALUE_001"
UPDATE vm_overtime_TASK_INFO SET previousNoti = sysdate where id = 'VALUE_001';

-- statementId: notiEnable.select
-- lookupStatementId: notiEnable.select
-- source: affair_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select count(1) from VM_TASKEXPIREDNOTIINFO where (select id from ctp_template where templete_number = templateId) = 'VALUE_001' and util_common.getEnumShowById(useable) = '是' and util_common.getEnumShowById(cfgtype) = '加签超期提醒';

-- statementId: meetingRoomName.select
-- lookupStatementId: meetingRoomName.select
-- source: affair_sqlmap.xml
-- type: select
-- params: {}
SELECT distinct to_char(ca.object_id) as ObjectId, '('|| cm.meet_place || ')' as name from ctp_affair ca left join meeting cm on ca.object_id = cm.id where ca.app in (6, 29) and ((ca.task_state = 0 and ca.state = 3 and ca.sub_state != 34) or (ca.task_state = 1 and ca.state in (4, 10)) or (ca.task_state = 1 and ca.sub_state in (11, 12, 31, 32, 33) and ca.state != 4) or (ca.is_delete = 1 and ca.task_state != 2 and ca.state = 3 and ca.app = 29)) and cm.meet_place is not null;

-- statementId: inquiryAffair.select
-- lookupStatementId: inquiryAffair.select
-- source: affair_sqlmap.xml
-- type: select
-- params: {}
select ia.id, util_user.getLoginNameByMemId(ca.sender_id) sendername, ca.subject, util_user.getMemberNameByMemId(ca.sender_id) senderLoginName, ca.member_id memberId, ca.object_id objectId, to_char(ca.RECEIVE_TIME, 'YYYY-MM-DD HH24:MI:SS') as receiveTime, ca.TASK_STATE as taskState, ca.STATE as state, ca.is_delete as isDelete, ca.SUB_STATE AS subState, to_char(ca.complete_time, 'YYYY-MM-DD HH24:MI:SS') as completeTime from INQUIRY_SURVEYBASIC isc left join ctp_affair ca on isc.id = ca.object_id left join inquiry_affair ia on ca.member_id = ia.member_id and ca.object_id = ia.object_id where ca.task_state = 0 and ca.state = 3 and CENSOR <> 5 and (close_date is null or close_date > sysdate) and ca.is_delete = 0 and isc.surveydesc like '%【推送统一工作门户任务】%';

-- statementId: inquiryAffairId.select
-- lookupStatementId: inquiryAffairId.select
-- source: affair_sqlmap.xml
-- type: select
-- params: {}
select to_char(ia.id) id, to_char(ca.id) as affairId from INQUIRY_SURVEYBASIC isc left join ctp_affair ca on isc.id = ca.object_id left join inquiry_affair ia on ca.member_id = ia.member_id and ca.object_id = ia.object_id where ca.task_state = 0 and ca.state = 3 and CENSOR <> 5 and (close_date is null or close_date > sysdate) and ca.is_delete = 0 and isc.surveydesc like '%【推送统一工作门户任务】%';

-- statementId: findNeedUpdateWupTask.select
-- lookupStatementId: findNeedUpdateWupTask.select
-- source: affair_sqlmap.xml
-- type: select
-- params: {}
select appTaskId, partUserCode, taskName, taskDesc, partiUserName, decode(state, '3', '19', '4', '12', '19') taskStatus, subState from ( select w.app_task_id as appTaskId, w.parti_user_code as partUserCode, w.task_name as taskName, w.task_desc as taskDesc, w.parti_user_name as partiUserName, c.state, c.sub_state as subState from wup_task w left join inquiry_affair c on regexp_like(w.app_task_id, '^-*\d+$$') and w.app_task_id = c.id left join inquiry_surveybasic iqs on c.object_id = iqs.id where c.is_delete = 1 or c.state = 4 or (iqs.CENSOR = 5 or iqs.close_date < sysdate) and w.task_status not in (12, 19)) where rownum < 200 order by apptaskid desc;

-- statementId: inquiryTask.select
-- lookupStatementId: inquiryTask.select
-- source: affair_sqlmap.xml
-- type: select
-- params: {
--   "inquiryId": 1001,
--   "memberId": 1001
-- }
select id appTaskId, '12' taskStatus, f.subject taskName, to_char(f.create_date , 'YYYY-MM-DD HH24:MI:SS') receiveTime , to_char(f.create_date, 'YYYY-MM-DD HH24:MI:SS') initTime, util_user.getLoginNameByMemId(f.member_id) partiUserCode, util_user.getLoginNameByMemId(f.sender_id) initiUserCode from inquiry_affair f where f.object_id = 1001 and f.member_id = 1001;

-- statementId: findNoHostNameRemainMeetingInfo
-- lookupStatementId: findNoHostNameRemainMeetingInfo
-- source: affair_sqlmap.xml
-- type: select
-- params: {
--   "judgeDate": "2026-05-14",
--   "filterMember": [
--     "EVENT_A",
--     "EVENT_B"
--   ]
-- }
select to_char(id) id from meeting m where not EXISTS ( select 1 from vm_meeting_emcee_reminder ma where m.id = ma.apply_id and to_char(m.begin_date, 'yyyy-mm-dd hh:mm') = to_char(ma.start_time, 'yyyy-mm-dd hh:mm') and to_char(m.end_date, 'yyyy-mm-dd hh:mm') = to_char(ma.end_time, 'yyyy-mm-dd hh:mm') ) and m.end_date > sysdate and m.state <> 0 and m.state <> -1 and m.begin_date <= '2026-05-14' and util_user.getLoginNameByMemId(m.emcee_id) not in ('EVENT_A','EVENT_B');

-- statementId: findNoHostNameRemainMeetingRoomInfo
-- lookupStatementId: findNoHostNameRemainMeetingRoomInfo
-- source: affair_sqlmap.xml
-- type: select
-- params: {
--   "judgeDate": "2026-05-14",
--   "filterMember": [
--     "EVENT_A",
--     "EVENT_B"
--   ]
-- }
select id from meeting_room_app m where not EXISTS ( select 1 from vm_meeting_emcee_reminder ma where m.id = ma.apply_id and to_char(m.startdatetime, 'yyyy-mm-dd hh:mm') = to_char(ma.start_time, 'yyyy-mm-dd hh:mm') and to_char(m.enddatetime, 'yyyy-mm-dd hh:mm') = to_char(ma.end_time, 'yyyy-mm-dd hh:mm') ) and m.enddatetime > sysdate and m.meetingid is null and m.periodicity_id is null and m.startdatetime <= '2026-05-14' and util_user.getLoginNameByMemId(m.perid) not in ('EVENT_A','EVENT_B');

-- statementId: findHostNameRemainFinishMeeting
-- lookupStatementId: findHostNameRemainFinishMeeting
-- source: affair_sqlmap.xml
-- type: select
-- params: {
--   "MT_PUSH": "VALUE_001",
--   "NO": "VALUE_001"
-- }
select f.id, f.apply_id, f.emcee, to_char(is_reminder) is_reminder from vm_meeting_emcee_reminder f where (f.end_time < sysdate and f.task_push_status = 'VALUE_001') or (f.is_reminder = 'VALUE_001' and f.task_push_status = 'VALUE_001');

-- statementId: noPushESBInHostNameRemain.select
-- lookupStatementId: noPushESBInHostNameRemain.select
-- source: affair_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select to_char(id) id, emcee,/*会议主持人*/ topic,/*会议主题*/ location,/*会议地点*/ to_char(creator_name) creator_name,/*会议创建人*/ creation_time,/*会议创建时间*/ to_char(start_time, 'YYYY-MM-DD HH24:MI:SS') start_time,/*会议开始时间*/ to_char(end_time, 'YYYY-MM-DD HH24:MI:SS') end_time,/*会议结束时间*/ task_push_status,/*任务推送状态*/ to_char(is_reminder) is_reminder,/*是否提醒*/ to_char(apply_id) apply_id, to_char(apply_type) apply_type from vm_meeting_emcee_reminder f where f.end_time > sysdate and f.task_push_status = 'VALUE_001' and is_reminder = -3841538853571705149;

-- statementId: findEnableAgentConfigInfo.select
-- lookupStatementId: findEnableAgentConfigInfo.select
-- source: affair_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select agent || '|' || agentTo as agentInfo from vm_cap4_fgAgentConfig f where f.enable = -3841538853571705149 and f.supportType = 'VALUE_001';

-- statementId: agentTaskInfoByTaskId.select
-- lookupStatementId: agentTaskInfoByTaskId.select
-- source: affair_sqlmap.xml
-- type: select
-- params: {
--   "agentId": 1001,
--   "taskId": 1001
-- }
SELECT distinct to_char(f.id) id FROM ctp_affair f JOIN ctp_affair f2 ON f.object_id = f2.object_id WHERE f.app = 1 AND f.state = 4 AND f.node_policy <> 'inform' AND f.member_id = 1001 AND f2.id = 1001;

-- statementId: dealMemberTaskInfoByTaskId.select
-- lookupStatementId: dealMemberTaskInfoByTaskId.select
-- source: affair_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select to_char(f.member_id) memberId from ctp_affair f where f.id = 'VALUE_001';

-- statementId: delaAdaptSpecialConfigFlow.select
-- lookupStatementId: delaAdaptSpecialConfigFlow.select
-- source: affair_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id serialNum, filter, filingDate, filingDepart, agentTo, agent, explanation, enable, supportType, priSerialNum, priNodeID, priTemplateCode, currentPriSerialNum, currentTemplateCode from vm_cap4_fgAgentConfig where supportType = 'VALUE_001' and enable = -3841538853571705149;

-- statementId: findTaskHaveDealByPreFlowInfo.select
-- lookupStatementId: findTaskHaveDealByPreFlowInfo.select
-- source: affair_sqlmap.xml
-- type: select
-- params: {
--   "formTable": "demo_table",
--   "formRecordId": 1001,
--   "memberId": 1001,
--   "priNodeID": 1001
-- }
select count('x') from ctp_affair f left join demo_table f2 on f.form_recordid = f2.id where f.form_recordid = 1001 and f.is_delete = 0 and (f.is_finish = 1 or f2.ratifyflag = 1) and f.member_id = 1001 and f.app = 1 AND f.state = 4 AND f.node_policy <> 'inform' AND activity_id = 1001;

-- statementId: agentPushRecord.insert
-- lookupStatementId: agentPushRecord.insert
-- source: affair_sqlmap.xml
-- type: insert
-- params: {
--   "id": 1001,
--   "task_title": "TITLE_001",
--   "task_description": "VALUE_001",
--   "task_initiator": "VALUE_001",
--   "is_proxy_valid": 1001,
--   "task_processor": "VALUE_001",
--   "task_proxy": "VALUE_001",
--   "task_creation_time": "2026-05-14 10:00:00",
--   "task_closure_time": "2026-05-14 10:00:00",
--   "portal_task_push_time": "2026-05-14 10:00:00",
--   "portal_task_closure_time": "2026-05-14 10:00:00",
--   "is_task_closed": "VALUE_001",
--   "portal_task_status": 1,
--   "task_id": 1001,
--   "proxy_task_id": 1001,
--   "proxy_effective_time": "2026-05-14 10:00:00",
--   "proxy_expiration_time": "2026-05-14 10:00:00",
--   "portal_push_create_info": "VALUE_001",
--   "portal_push_create_response": "VALUE_001",
--   "portal_push_update_info": "2026-05-14",
--   "portal_push_update_response": "2026-05-14"
-- }
INSERT INTO vm_task_proxy_push ( id, state, start_member_id, start_date, approve_member_id, approve_date, finishedflag, ratifyflag, ratify_member_id, ratify_date, modify_member_id, modify_date, sort, task_title, task_description, task_initiator, is_proxy_valid, task_processor, task_proxy, task_creation_time, task_closure_time, portal_task_push_time, portal_task_closure_time, is_task_closed, portal_task_status, task_id, proxy_task_id, proxy_effective_time, proxy_expiration_time, portal_push_create_info, portal_push_create_response, portal_push_update_info, portal_push_update_response ) VALUES ( 1001, 1, '6105960157477424523', sysdate, '0', sysdate, 0, 0, '0', sysdate, '6105960157477424523', sysdate, 0, 'TITLE_001', 'VALUE_001', 'VALUE_001', 1001, 'VALUE_001', 'VALUE_001', '2026-05-14 10:00:00', '2026-05-14 10:00:00', '2026-05-14 10:00:00', '2026-05-14 10:00:00', 'VALUE_001', 1, 1001, 1001, '2026-05-14 10:00:00', '2026-05-14 10:00:00', 'VALUE_001', 'VALUE_001', '2026-05-14', '2026-05-14' );

-- statementId: esbagentPushLog.update
-- lookupStatementId: esbagentPushLog.update
-- source: affair_sqlmap.xml
-- type: update
-- params: {
--   "is_proxy_valid": 1001,
--   "task_closure_time": "2026-05-14 10:00:00",
--   "portal_task_push_time": "2026-05-14 10:00:00",
--   "portal_task_closure_time": "2026-05-14 10:00:00",
--   "is_task_closed": "VALUE_001",
--   "portal_task_status": 1,
--   "portal_push_create_info": "VALUE_001",
--   "portal_push_create_response": "VALUE_001",
--   "portal_push_update_info": "2026-05-14",
--   "portal_push_update_response": "2026-05-14",
--   "proxy_task_id": 1001
-- }
update vm_task_proxy_push set , is_proxy_valid = 1001 , task_closure_time = '2026-05-14 10:00:00' , portal_task_push_time = '2026-05-14 10:00:00' , portal_task_closure_time = '2026-05-14 10:00:00' , is_task_closed = 'VALUE_001' , portal_task_status = 1 , portal_push_create_info = 'VALUE_001' , portal_push_create_response = 'VALUE_001' , portal_push_update_info = '2026-05-14' , portal_push_update_response = '2026-05-14' where proxy_task_id = 1001;

-- statementId: noPushAgent.select
-- lookupStatementId: noPushAgent.select
-- source: affair_sqlmap.xml
-- type: select
-- params: {}
SELECT v.task_id, ca.id as id, util_user.getMemberNameByMemId(ca.member_id) senderLoginName, ca.SUBJECT as subject, util_user.getLoginNameByMemId(ca.sender_id) sendername, ca.MEMBER_ID as memberId, ca.proxy_member_id proxyMemberId, ca.OBJECT_ID as objectId, ca.PROCESS_ID as processId, ca.ACTIVITY_ID as activityId, to_char(ca.RECEIVE_TIME, 'YYYY-MM-DD HH24:MI:SS') as receiveTime, ca.TASK_STATE as taskState, ca.STATE as state, ca.is_delete as isDelete, ca.SUB_STATE AS subState, ca.TEMPLETE_ID as templeteId, to_char(ca.complete_time, 'YYYY-MM-DD HH24:MI:SS') as completeTime FROM CTP_AFFAIR ca LEFT JOIN vm_task_proxy_push v ON ca.id = v.task_id AND ca.proxy_member_id = v.task_proxy WHERE ca.app IN (1) AND ca.state = 3 AND ca.proxy_member_id IS NOT NULL AND ca.receive_time >= TRUNC(SYSDATE) - INTERVAL '99' DAY AND v.task_id IS NULL;

-- statementId: pushAgentUpdate.select
-- lookupStatementId: pushAgentUpdate.select
-- source: affair_sqlmap.xml
-- type: select
-- params: {}
SELECT ca.id as id, util_user.getMemberNameByMemId(ca.member_id) senderLoginName, ca.SUBJECT as subject, util_user.getLoginNameByMemId(ca.sender_id) sendername, ca.MEMBER_ID as memberId, ca.proxy_member_id proxyMemberId, ca.OBJECT_ID as objectId, ca.ACTIVITY_ID as activityId, ca.PROCESS_ID as processId, to_char(ca.RECEIVE_TIME, 'YYYY-MM-DD HH24:MI:SS') as receiveTime, ca.TASK_STATE as taskState, ca.STATE as state, ca.is_delete as isDelete, util_common.getEnumValueById(vtp.portal_task_status) AS subState, ca.TEMPLETE_ID as templeteId, to_char(ca.complete_time, 'YYYY-MM-DD HH24:MI:SS') as completeTime from vm_task_proxy_push vtp left join CTP_AFFAIR ca on vtp.task_id = ca.id and vtp.task_proxy = ca.proxy_member_id where ca.app = 1 and ca.proxy_member_id is not null and (vtp.is_need_close_task is null or vtp.is_need_close_task = -1089048568118490234) and ( (ca.state in (4,5,6,7,8,11) and util_common.getEnumValueById(vtp.portal_task_status) in (1,3,4) ) or （ca.state = 3 and util_common.getEnumValueById(vtp.portal_task_status) = 3） or (ca.state = 3 and util_common.getEnumValueById(vtp.portal_task_status) = 2) );

-- statementId: findNoActivityAgentTask.select
-- lookupStatementId: findNoActivityAgentTask.select
-- source: affair_sqlmap.xml
-- type: select
-- params: {}
SELECT DISTINCT ca.id AS id, util_user.getMemberNameByMemId(ca.member_id) AS senderLoginName, ca.SUBJECT AS subject, util_user.getLoginNameByMemId(ca.sender_id) AS sendername, ca.MEMBER_ID AS memberId, vtp.task_proxy proxyMemberId, ca.OBJECT_ID AS objectId, ca.ACTIVITY_ID AS activityId, TO_CHAR(ca.RECEIVE_TIME, 'YYYY-MM-DD HH24:MI:SS') AS receiveTime, ca.TASK_STATE AS taskState, ca.STATE AS state, ca.is_delete AS isDelete, util_common.getEnumValueById(vtp.portal_task_status) AS subState, ca.TEMPLETE_ID AS templeteId, TO_CHAR(ca.complete_time, 'YYYY-MM-DD HH24:MI:SS') AS completeTime FROM vm_task_proxy_push vtp LEFT JOIN CTP_AFFAIR ca ON vtp.task_id = ca.id WHERE ca.app = 1 AND ( (((ca.proxy_member_id IS NULL) or (ca.proxy_member_id <> vtp.task_proxy)) AND util_common.getEnumValueById(vtp.portal_task_status) = 1) or (is_need_close_task = -3841538853571705149 and util_common.getEnumValueById(vtp.portal_task_status) = 1) );

-- statementId: getFillReasonArchives.business.select
-- lookupStatementId: getFillReasonArchives.business.select
-- source: phone_sqlmap.xml
-- type: select
-- params: {}
select v.id id, v.bengin_date bengin_date, v.end_date end_date, v.business_sendate business_sendate, v.secretary_sendate secretary_sendate, v.business_flag business_flag, v.secretary_flag secretary_flag from vm_fillreason_archives v where v.business_sendate <= sysdate and nvl(v.business_flag,'0') <> '1';

-- statementId: getFillReasonArchives.sectetary.select
-- lookupStatementId: getFillReasonArchives.sectetary.select
-- source: phone_sqlmap.xml
-- type: select
-- params: {}
select v.id id, v.bengin_date bengin_date, v.end_date end_date, v.business_sendate business_sendate, v.secretary_sendate secretary_sendate, v.business_flag business_flag, v.secretary_flag secretary_flag from vm_fillreason_archives v where v.secretary_sendate <= sysdate and nvl(v.secretary_flag,'0') <> '1';

-- statementId: getUnHandPhoneRecord.select
-- lookupStatementId: getUnHandPhoneRecord.select
-- source: phone_sqlmap.xml
-- type: select
-- params: {
--   "benginDate": "2026-05-14",
--   "endDate": "2026-05-14"
-- }
select v.id id, v.register_date register_date, v.register_period register_period, v.uphand_member business, v.depart depart, v.hand_state hand_state, v.unhand_season unhand_season, v.send_state send_state, v.comments comments from vm_unhandphone_archives v where v.unhand_season is null and v.register_date between trunc('2026-05-14') and '2026-05-14' and v.hand_state = 2148475974818942065 and v.send_state = -4924790884161860057;

-- statementId: getUnHandPhoneRecord.secretary.select
-- lookupStatementId: getUnHandPhoneRecord.secretary.select
-- source: phone_sqlmap.xml
-- type: select
-- params: {
--   "benginDate": "2026-05-14",
--   "endDate": "2026-05-14"
-- }
select v.id id, v.register_date register_date, v.register_period register_period, v.uphand_member business, v.depart depart, v.hand_state hand_state, v.unhand_season unhand_season, v.send_state send_state from vm_unhandphone_archives v where v.unhand_season is null and v.register_date between '2026-05-14' and '2026-05-14' and v.hand_state = 2148475974818942065 and v.send_state = -660051773175676407;

-- statementId: getEvations.select
-- lookupStatementId: getEvations.select
-- source: phone_sqlmap.xml
-- type: select
-- params: {
--   "date": "2026-05-14",
--   "proposercode": "CODE_001"
-- }
select nvl(v.begindate,v.applytime) beginDate, v.enddate endDate, v.proposercode proposercode, v.evectiontype evectiontype from vm_evations v where nvl(v.begindate,v.applytime) <= '2026-05-14' and v.enddate >= '2026-05-14' and v.proposercode = 'CODE_001' and rownum = 1;

-- statementId: getAbsence.select
-- lookupStatementId: getAbsence.select
-- source: phone_sqlmap.xml
-- type: select
-- params: {
--   "date": "2026-05-14",
--   "period": "VALUE_001",
--   "proposercode": "CODE_001"
-- }
select v.proposercode proposercode, v.begindate begindate, v.enddate enddate, v.beginPeriod beginPeriod, v.endPeriod endPeriod from vm_absence v where v.begindate is not null and v.enddate is not null and to_date(to_char(v.begindate,'yyyy-mm-dd') || decode(v.beginperiod,770469099444389055,'00:00:00','12:00:00'),'yyyy-mm-ddhh24:mi:ss') <= to_date(to_char('2026-05-14' ,'yyyy-mm-dd') || decode('VALUE_001',-8856166350962081063,'09:00:00','13:00:00'),'yyyy-mm-ddhh24:mi:ss') and to_date(to_char(v.enddate,'yyyy-mm-dd') || decode(v.endperiod,770469099444389055,'12:00:00','23:59:00'),'yyyy-mm-ddhh24:mi:ss') >= to_date(to_char('2026-05-14' ,'yyyy-mm-dd') || decode('VALUE_001',-8856166350962081063,'09:00:00','13:00:00'),'yyyy-mm-ddhh24:mi:ss') and v.proposercode = 'CODE_001' and rownum = 1;

-- statementId: unHandPhoneRecord.update
-- lookupStatementId: unHandPhoneRecord.update
-- source: phone_sqlmap.xml
-- type: update
-- params: {
--   "reason": "VALUE_001",
--   "id": 1001
-- }
update vm_unhandphone_archives set unhand_season = 'VALUE_001',hand_state = 3725937545616052073 where id = 1001;

-- statementId: updateO32CommentsToRecord.update
-- lookupStatementId: updateO32CommentsToRecord.update
-- source: phone_sqlmap.xml
-- type: update
-- params: {
--   "comments": "VALUE_001",
--   "id": 1001
-- }
update vm_unhandphone_archives set comments = 'VALUE_001' where id = 1001;

-- statementId: fillReasonArchives.SonRecord.insert
-- lookupStatementId: fillReasonArchives.SonRecord.insert
-- source: phone_sqlmap.xml
-- type: insert
-- params: {
--   "id": 1001,
--   "taskEnumId": 1001,
--   "userId": 1001,
--   "sendEnumId": 1001
-- }
insert into vm_fillreason_archives_son(id, formmain_id, sort,task_type,member,send_state)( select util_common.getAbsID, 1001, (select count(1) + 1 from vm_fillreason_archives_son where formmain_id = 1001), 1001, 1001, 1001 from dual);

-- statementId: unHandPhoneRecord.insert
-- lookupStatementId: unHandPhoneRecord.insert
-- source: phone_sqlmap.xml
-- type: insert
-- params: {
--   "id": 1001,
--   "registerDate": "2026-05-14",
--   "registerPeriod": "VALUE_001",
--   "uphandMember": "VALUE_001",
--   "depart": "VALUE_001",
--   "handState": 1,
--   "comments": "VALUE_001",
--   "hrId": 1001
-- }
insert into vm_unhandphone_archives( id,state,start_member_id,start_date,approve_member_id,approve_date, finishedflag,ratifyflag,ratify_member_id,update_member,update_date, register_date,register_period,uphand_member,depart, hand_state,date_sources, comments,send_state,hrid ) values ( 1001,1,-6760911671874597139,sysdate,0,sysdate, 0,0,0,-6760911671874597139,sysdate, '2026-05-14','VALUE_001','VALUE_001','VALUE_001', 1,-4757194022281916618, 'VALUE_001',-4924790884161860057,1001 );

-- statementId: unHandPhoneRecordContent.insert
-- lookupStatementId: unHandPhoneRecordContent.insert
-- source: phone_sqlmap.xml
-- type: insert
-- params: "VALUE_001"
insert into ctp_content_all (ID, CREATE_ID, CREATE_DATE, MODIFY_ID, MODIFY_DATE, MODULE_TYPE, MODULE_ID, MODULE_TEMPLATE_ID, CONTENT_TYPE, CONTENT, CONTENT_DATA_ID, CONTENT_TEMPLATE_ID, TITLE, SORT) values (util_common.getAbsID, '-6760911671874597139', sysdate, '', null, '37', 'VALUE_001', '-1192136872180628670', '20', '', 'VALUE_001', '8962213824091408148', '手机未交档案', '0');

-- statementId: fillReasonArchivesByDate.select
-- lookupStatementId: fillReasonArchivesByDate.select
-- source: phone_sqlmap.xml
-- type: select
-- params: {
--   "beginDate": "2026-05-14",
--   "endDate": "2026-05-14"
-- }
select id from vm_fillreason_archives v where to_char(v.bengin_date, 'yyyy-mm-dd') = to_char('2026-05-14', 'yyyy-mm-dd') and to_char(v.end_date, 'yyyy-mm-dd')=to_char('2026-05-14', 'yyyy-mm-dd');

-- statementId: fillReasonArchives.insert
-- lookupStatementId: fillReasonArchives.insert
-- source: phone_sqlmap.xml
-- type: insert
-- params: {
--   "beginDate": "2026-05-14",
--   "endDate": "2026-05-14"
-- }
insert into vm_fillreason_archives( id,state,start_member_id,start_date,approve_member_id,approve_date, finishedflag,ratifyflag,ratify_member_id,update_member,update_date, bengin_date,end_date, business_sendate,business_flag,secretary_flag )values( util_common.getAbsID,1,-6760911671874597139,sysdate,0,sysdate, 0,0,0,-6760911671874597139,sysdate, '2026-05-14','2026-05-14', sysdate ,'0','0' );

-- statementId: isHaveRecord.select
-- lookupStatementId: isHaveRecord.select
-- source: phone_sqlmap.xml
-- type: select
-- params: {
--   "uphandMember": "VALUE_001",
--   "registerDate": "2026-05-14",
--   "registerPeriod": "VALUE_001"
-- }
select count(1) from vm_unhandphone_archives where uphand_member = 'VALUE_001' and register_date = '2026-05-14' and register_period = 'VALUE_001';

-- statementId: isConfiguredPerson.select
-- lookupStatementId: isConfiguredPerson.select
-- source: phone_sqlmap.xml
-- type: select
-- params: {
--   "userId": 1001
-- }
select count(1) from formmain_3592 where field0003 = 1001;

-- statementId: getConfiguredPerson.select
-- lookupStatementId: getConfiguredPerson.select
-- source: phone_sqlmap.xml
-- type: select
-- params: {}
select field0003 from formmain_3592;

-- statementId: getO32Info.select
-- lookupStatementId: getO32Info.select
-- source: phone_sqlmap.xml
-- type: select
-- params: {}
select field0003 AS USERID,field0005 O32ID from formmain_3592;

-- statementId: fillReasonArchives.SonRecord.delete
-- lookupStatementId: fillReasonArchives.SonRecord.delete
-- source: phone_sqlmap.xml
-- type: update
-- params: {
--   "id": 1001
-- }
delete from vm_fillreason_archives_son where formmain_id = 1001 and member is null;

-- statementId: fillReasonArchives.businessFlag.update
-- lookupStatementId: fillReasonArchives.businessFlag.update
-- source: phone_sqlmap.xml
-- type: update
-- params: {
--   "id": 1001
-- }
update vm_fillreason_archives set business_flag = '1' where id = 1001;

-- statementId: fillReasonArchives.sectetaryFlag.update
-- lookupStatementId: fillReasonArchives.sectetaryFlag.update
-- source: phone_sqlmap.xml
-- type: update
-- params: {
--   "id": 1001
-- }
update vm_fillreason_archives set secretary_flag = '1',secretary_sendate=sysdate where id = 1001;

-- statementId: fillReasonArchives.update
-- lookupStatementId: fillReasonArchives.update
-- source: phone_sqlmap.xml
-- type: update
-- params: {
--   "secretarySendate": "2026-05-14",
--   "id": 1001
-- }
update vm_fillreason_archives set secretary_sendate = '2026-05-14' where id = 1001;

-- statementId: getSectetary.select
-- lookupStatementId: getSectetary.select
-- source: phone_sqlmap.xml
-- type: select
-- params: {
--   "depart": "VALUE_001"
-- }
select field0004 from formmain_3593 where field0003 = 'VALUE_001';

-- statementId: getUserIdByHrId.select
-- lookupStatementId: getUserIdByHrId.select
-- source: phone_sqlmap.xml
-- type: select
-- params: {
--   "hrId": 1001
-- }
select * from vm_member v, org_principal p where v.userid = p.member_id and v.hrId = 1001;

-- statementId: phone.getPhonesql
-- lookupStatementId: phone.getPhonesql
-- source: phone_sqlmap.xml
-- type: select
-- params: {}
select 'select o.str_state as manipulate, CONVERT(nvarchar(30), o.str_date,101) registerDate, CONVERT(nvarchar(30), o.str_date,120) date, case when convert(int, replace(convert(char(8), o.str_date, 108), ' || ''':''' || ','''')) between 080000 and 113000 and convert(int, replace(convert(char(8), o.str_date, 108), ' || ''':''' || ', '''')) != 113000 then' || '''AM''' || ' when convert(int,replace(convert(char(8), o.str_date, 108), ' || ''':''' || ', '''')) between 113000 and 160000 then ' || '''PM''' || ' else '''' end registerPeriod, k.keys hrId, u.userreason as reason from [sjg].[dbo].[lz_openlog] o left join [sjg].[dbo].[lz_keys] k on o.Str_CardNo = k.keys left join [sjg].[dbo].[lz_usertakekey] u on u.userid = o.Str_CardNo and u.date_time between DATEADD(MINUTE,-3,o.str_date) and DATEADD(MINUTE,3,o.str_date) where k.keys is not null and k.keys != ' || '''0''' || ' and o.str_date between convert(datetime,' || '''_strBeginDate_''' || ' ,101) and convert(datetime, ' || '''_strEndDate_''' || ' ,101) and cast(DATEPART(HOUR,o.str_date) as int) between 8 and 16 order by o.str_lockn,o.str_date ' from dual;

-- statementId: phone.isWorkDay.select
-- lookupStatementId: phone.isWorkDay.select
-- source: phone_sqlmap.xml
-- type: select
-- params: {
--   "date": "2026-05-14"
-- }
select util_common.isWorkDay('2026-05-14') from dual;

-- statementId: findBusinessFlowBydate.select
-- lookupStatementId: findBusinessFlowBydate.select
-- source: phone_sqlmap.xml
-- type: select
-- params: {
--   "monday": "VALUE_001",
--   "friday": 1001
-- }
select id from formmain_3595 f where trunc(f.start_date) between trunc( 'VALUE_001') and trunc( 1001) and f.finishedflag = 0;

-- statementId: updateBusinessWriteByFormIds.updtae
-- lookupStatementId: updateBusinessWriteByFormIds.updtae
-- source: phone_sqlmap.xml
-- type: update
-- params: {
--   "formIds": [
--     "EVENT_A",
--     "EVENT_B"
--   ]
-- }
update wf_businesswritereason set note = note || '超过规定期限未填写,由OA系统自动终止流程,终止时间' || to_char(sysdate,'yyyy-mm-dd') WHERE id IN ('EVENT_A','EVENT_B');

-- statementId: researcherShouldHandPhoneInfo.insert
-- lookupStatementId: researcherShouldHandPhoneInfo.insert
-- source: phone_sqlmap.xml
-- type: insert
-- params: {
--   "state": 1,
--   "start_member_id": 1001,
--   "start_date": "2026-05-14",
--   "approve_member_id": 1001,
--   "approve_date": "2026-05-14",
--   "finishedflag": 1,
--   "ratifyflag": 1,
--   "ratify_member_id": 1001,
--   "ratify_date": "2026-05-14",
--   "login_name": "NAME_001",
--   "depart_name": "NAME_001",
--   "km_id": 1001,
--   "phone_hand_date": "2026-05-14"
-- }
insert into vm_ResearcherHandlePhoneInfo (id, state, start_member_id, start_date, approve_member_id, approve_date, finishedflag, ratifyflag, ratify_member_id, ratify_date, login_name, depart_name, km_id, phone_hand_date, userId) values( util_common.getAbsID, 1, 1001, '2026-05-14', 1001, '2026-05-14', 1, 1, 1001, '2026-05-14', 'NAME_001', 'NAME_001', 1001, to_date('2026-05-14', 'yyyymmdd'), util_user.getMemIdByMemCode(1001));

-- statementId: researcherHandlePhone.select
-- lookupStatementId: researcherHandlePhone.select
-- source: phone_sqlmap.xml
-- type: select
-- params: {
--   "startdate": "2026-05-14",
--   "enddate": "2026-05-14"
-- }
select to_char(phone_hand_date, 'yyyymmdd') || login_name from vm_ResearcherHandlePhoneInfo where to_char(phone_hand_date, 'yyyymmdd') between '2026-05-14' and '2026-05-14';

-- statementId: handPhoneMemberConfInfo.select
-- lookupStatementId: handPhoneMemberConfInfo.select
-- source: phone_sqlmap.xml
-- type: select
-- params: {}
select field0003 memberId, field0006 isResearcher from formmain_3592;

-- statementId: findResearcherHandPhone.select
-- lookupStatementId: findResearcherHandPhone.select
-- source: phone_sqlmap.xml
-- type: select
-- params: {
--   "beginDate": "2026-05-14",
--   "endDate": "2026-05-14"
-- }
select (userId || to_char(phone_hand_date, 'MM/dd/yyyy')) as memberDate from vm_ResearcherHandlePhoneInfo where to_char(phone_hand_date, 'yyyy-mm-dd') between to_char('2026-05-14', 'yyyy-mm-dd') and to_char('2026-05-14', 'yyyy-mm-dd');

-- statementId: businessNoWriteReasonByDate.select
-- lookupStatementId: businessNoWriteReasonByDate.select
-- source: phone_sqlmap.xml
-- type: select
-- params: {
--   "beginDate": "2026-05-14",
--   "endDate": "2026-05-14"
-- }
select distinct 'CL_FillInReason_T001' flowType, to_char('2026-05-14', 'yyyy-mm-dd') || to_char('2026-05-14', 'yyyy-mm-dd') || uphand_member flowId, h.secretary writer, '14000' sendUserNo, v.depart depart, to_char(sysdate, 'yyyy-mm-dd HH24:mi:ss') sendDate, to_char('2026-05-14', 'yyyy-mm-dd') bengin_date, to_char('2026-05-14', 'yyyy-mm-dd') end_date, v.uphand_member business from vm_unhandphone_archives v left join handPhoneSecretaryConfig h on v.depart = h.depart where v.unhand_season is null and v.register_date between '2026-05-14' and '2026-05-14' and v.hand_state = 2148475974818942065 and v.unhand_season is null and v.uphand_member not in (select f.business from vm_fillreason_phone f where to_char(f.bengin_date, 'yyyy-mm-dd') = to_char('2026-05-14', 'yyyy-mm-dd') and to_char(f.end_date, 'yyyy-mm-dd') = to_char('2026-05-14', 'yyyy-mm-dd') and f.business is not null);

-- statementId: phoneAndTradingRecordByUserId.select
-- lookupStatementId: phoneAndTradingRecordByUserId.select
-- source: phone_sqlmap.xml
-- type: select
-- params: {
--   "userId": 1001
-- }
select id, registerDate, userId, hrId, mornSubState, mornNonSubReason, afterSubState, afterNonSubReason from vm_cap4_phoneAndTradingRecord where userId = 1001;

-- statementId: phoneCabinetSonRecordById.select
-- lookupStatementId: phoneCabinetSonRecordById.select
-- source: phone_sqlmap.xml
-- type: select
-- params: {
--   "formmain_id": 1001
-- }
select id, registerPeriod, manipulate, phoneCabineDate, reason from vm_cap4_phoneCabinetSonRecord where formmain_id = 1001;

-- statementId: tradingSystemSonRecordById.select
-- lookupStatementId: tradingSystemSonRecordById.select
-- source: phone_sqlmap.xml
-- type: select
-- params: {
--   "formmain_id": 1001
-- }
select id, registerPeriod, referType, o32IdOrLoginName, name, isOperationLog, lastRecordDate, platformStatus from vm_cap4_tradingSystemSonRecord where formmain_id = 1001;

-- statementId: insertPhoneAndTradingRecordRecord.insert
-- lookupStatementId: insertPhoneAndTradingRecordRecord.insert
-- source: phone_sqlmap.xml
-- type: insert
-- params: {
--   "id": 1001,
--   "registerDate": "2026-05-14",
--   "userId": 1001,
--   "hrId": 1001,
--   "mornSubState": 1,
--   "mornNonSubReason": "VALUE_001",
--   "afterSubState": 1,
--   "afterNonSubReason": "VALUE_001"
-- }
insert into vm_cap4_phoneAndTradingRecord( ID, STATE, START_MEMBER_ID, START_DATE, APPROVE_MEMBER_ID, APPROVE_DATE, FINISHEDFLAG, RATIFYFLAG, RATIFY_MEMBER_ID, RATIFY_DATE, SORT, MODIFY_MEMBER_ID, MODIFY_DATE, registerDate, userId, hrId, mornSubState, mornNonSubReason, afterSubState, afterNonSubReason ) VALUES( 1001, 1, null, sysdate, null, sysdate, 0, 0, 0, sysdate, 0, null, sysdate, to_date('2026-05-14','yyyy-MM-dd'), 1001, 1001, 1, 'VALUE_001', 1, 'VALUE_001' );

-- statementId: updatePhoneAndTradingRecord.update
-- lookupStatementId: updatePhoneAndTradingRecord.update
-- source: phone_sqlmap.xml
-- type: update
-- params: {
--   "hrId": 1001,
--   "mornSubState": 1,
--   "mornNonSubReason": "VALUE_001",
--   "afterSubState": 1,
--   "afterNonSubReason": "VALUE_001",
--   "id": 1001
-- }
update vm_cap4_phoneAndTradingRecord set hrId = 1001, mornSubState = 1, mornNonSubReason = 'VALUE_001', afterSubState = 1, afterNonSubReason = 'VALUE_001' where id = 1001;

-- statementId: deletePhoneCabinetSonRecord.delete
-- lookupStatementId: deletePhoneCabinetSonRecord.delete
-- source: phone_sqlmap.xml
-- type: delete
-- params: {
--   "id": 1001
-- }
delete vm_cap4_phoneCabinetSonRecord where formmain_id = 1001;

-- statementId: deleteTradingSystemSonRecord.delete
-- lookupStatementId: deleteTradingSystemSonRecord.delete
-- source: phone_sqlmap.xml
-- type: delete
-- params: {
--   "id": 1001
-- }
delete vm_cap4_tradingSystemSonRecord where formmain_id = 1001;

-- statementId: insertPhoneCabinetSonRecord.insert
-- lookupStatementId: insertPhoneCabinetSonRecord.insert
-- source: phone_sqlmap.xml
-- type: insert
-- params: {
--   "formmain_id": 1001,
--   "registerPeriod": "VALUE_001",
--   "manipulate": "VALUE_001",
--   "phoneCabineDate": "2026-05-14",
--   "reason": "VALUE_001"
-- }
insert into vm_cap4_phoneCabinetSonRecord values(util_common.getAbsID, 1001, 'VALUE_001', 'VALUE_001', to_date('2026-05-14','yyyy-MM-dd HH24:mi:ss'), 'VALUE_001');

-- statementId: insertTradingSystemSonRecord.insert
-- lookupStatementId: insertTradingSystemSonRecord.insert
-- source: phone_sqlmap.xml
-- type: insert
-- params: {
--   "formmain_id": 1001,
--   "registerPeriod": "VALUE_001",
--   "referType": "VALUE_001",
--   "o32IdOrLoginName": 1001,
--   "name": "NAME_001",
--   "isOperationLog": "VALUE_001",
--   "lastRecordDate": "2026-05-14",
--   "platformStatus": 1
-- }
insert into vm_cap4_tradingSystemSonRecord values(util_common.getAbsID, 1001, 'VALUE_001', 'VALUE_001', 1001, 'NAME_001', 'VALUE_001', to_date('2026-05-14','yyyy-MM-dd HH24:mi:ss'), 1);

-- statementId: queryPhoneAndTradingIdByDate.select
-- lookupStatementId: queryPhoneAndTradingIdByDate.select
-- source: phone_sqlmap.xml
-- type: select
-- params: {
--   "registerDate": "2026-05-14"
-- }
select id from vm_cap4_phoneAndTradingRecord where to_char(registerDate, 'yyyy-mm-dd') = to_char('2026-05-14', 'yyyy-mm-dd');

-- statementId: deletePhoneCabinetSonRecordById.delete
-- lookupStatementId: deletePhoneCabinetSonRecordById.delete
-- source: phone_sqlmap.xml
-- type: delete
-- params: {
--   "ids": "RAW_VALUE"
-- }
delete vm_cap4_phoneCabinetSonRecord where formmain_id in (RAW_VALUE);

-- statementId: deleteTradingSystemSonRecordById.delete
-- lookupStatementId: deleteTradingSystemSonRecordById.delete
-- source: phone_sqlmap.xml
-- type: delete
-- params: {
--   "ids": "RAW_VALUE"
-- }
delete vm_cap4_tradingSystemSonRecord where formmain_id in (RAW_VALUE);

-- statementId: deletePhoneAndTradingRecordById.delete
-- lookupStatementId: deletePhoneAndTradingRecordById.delete
-- source: phone_sqlmap.xml
-- type: delete
-- params: {
--   "ids": "RAW_VALUE"
-- }
delete vm_cap4_phoneAndTradingRecord where id in (RAW_VALUE);

-- statementId: deleteIsHaveRecord.delete
-- lookupStatementId: deleteIsHaveRecord.delete
-- source: phone_sqlmap.xml
-- type: delete
-- params: {
--   "uphandMember": "VALUE_001",
--   "registerDate": "2026-05-14",
--   "registerPeriod": "VALUE_001"
-- }
delete from vm_unhandphone_archives where uphand_member = 'VALUE_001' and register_date = '2026-05-14' and register_period = 'VALUE_001';

-- statementId: updatePhoneAndTradingMornNonSubReason.update
-- lookupStatementId: updatePhoneAndTradingMornNonSubReason.update
-- source: phone_sqlmap.xml
-- type: update
-- params: {
--   "mornNonSubReason": "VALUE_001",
--   "registerDate": "2026-05-14",
--   "userId": 1001
-- }
update vm_cap4_phoneAndTradingRecord set mornNonSubReason = 'VALUE_001' where to_char(registerDate, 'yyyy-mm-dd') = to_char('2026-05-14', 'yyyy-mm-dd') and userId = 1001;

-- statementId: updatePhoneAndTradingAfterSubReason.update
-- lookupStatementId: updatePhoneAndTradingAfterSubReason.update
-- source: phone_sqlmap.xml
-- type: update
-- params: {
--   "afterNonSubReason": "VALUE_001",
--   "registerDate": "2026-05-14",
--   "userId": 1001
-- }
update vm_cap4_phoneAndTradingRecord set afterNonSubReason = 'VALUE_001' where to_char(registerDate, 'yyyy-mm-dd') = to_char('2026-05-14', 'yyyy-mm-dd') and userId = 1001;

-- statementId: updatePhoneAndTradingMornStateCause.update
-- lookupStatementId: updatePhoneAndTradingMornStateCause.update
-- source: phone_sqlmap.xml
-- type: update
-- params: {
--   "mornNonSubCause": "VALUE_001",
--   "registerDate": "2026-05-14",
--   "userId": 1001
-- }
update vm_cap4_phoneAndTradingRecord set mornNonSubCause = 'VALUE_001', mornSubState = 3725937545616052073 where to_char(registerDate, 'yyyy-mm-dd') = to_char('2026-05-14', 'yyyy-mm-dd') and userId = 1001;

-- statementId: updatePhoneAndTradingAfterStateCause.update
-- lookupStatementId: updatePhoneAndTradingAfterStateCause.update
-- source: phone_sqlmap.xml
-- type: update
-- params: {
--   "afterSubCause": "VALUE_001",
--   "registerDate": "2026-05-14",
--   "userId": 1001
-- }
update vm_cap4_phoneAndTradingRecord set afterSubCause = 'VALUE_001', afterSubState = 3725937545616052073 where to_char(registerDate, 'yyyy-mm-dd') = to_char('2026-05-14', 'yyyy-mm-dd') and userId = 1001;

-- statementId: writeReason.SonRecord.insert
-- lookupStatementId: writeReason.SonRecord.insert
-- source: phone_sqlmap.xml
-- type: update
-- params: {
--   "formmain_id": 1001,
--   "register_date": "2026-05-14",
--   "register_period": "VALUE_001",
--   "comments": "VALUE_001"
-- }
insert into vm_writereason_phone_son (id, formmain_id, sort, register_date, register_period, comments) values(util_common.getAbsID, 1001,(select count(1) + 1 from vm_writereason_phone_son vws where vws.formmain_id = 1001), to_date('2026-05-14','yyyy-MM-dd'), 'VALUE_001', 'VALUE_001');

-- statementId: updateUnHandPhoneById.update
-- lookupStatementId: updateUnHandPhoneById.update
-- source: phone_sqlmap.xml
-- type: update
-- params: {
--   "send_state": 1,
--   "id": 1001
-- }
update vm_unhandphone_archives set send_state = 1 where id = 1001;

-- statementId: setAffairTrack.update
-- lookupStatementId: setAffairTrack.update
-- source: common_sqlmap.xml
-- type: update
-- params: {
--   "isTrack": "VALUE_001",
--   "id": 1001
-- }
update ctp_affair set track = 'VALUE_001' where id = 1001;

-- statementId: ctpAffairStatus.update
-- lookupStatementId: ctpAffairStatus.update
-- source: common_sqlmap.xml
-- type: update
-- params: {
--   "status": 1,
--   "subStatus": 1,
--   "affairId": 1001,
--   "activityId": 1001
-- }
update ctp_affair set state=1, sub_state=1 where object_id = (select distinct object_id from ctp_affair where ID=1001) and activity_Id=1001;

-- statementId: colInfo.select
-- lookupStatementId: colInfo.select
-- source: common_sqlmap.xml
-- type: select
-- params: {
--   "affairId": 1001
-- }
select a.sub_object_id as workitemId,s.process_id as processId,s.case_Id as caseId, a.activity_Id as activityId,s.id as summaryId from ctp_affair a,col_summary s where a.object_id=s.id and a.id=1001;

-- statementId: getFormNameByTempleteNo.select
-- lookupStatementId: getFormNameByTempleteNo.select
-- source: common_sqlmap.xml
-- type: select
-- params: {
--   "templeteNumber": "VALUE_001"
-- }
SELECT T2.NAME AS FORMNAME FROM WF_PROCESS_TEMPLETE T1, FORM_DEFINITION T2, (SELECT S1.WORKFLOW_ID FROM CTP_TEMPLATE S1 WHERE S1.TEMPLETE_NUMBER = 'VALUE_001') T3 WHERE T3.WORKFLOW_ID = T1.ID AND T1.APPID = T2.ID and t2.id is not null;

-- statementId: getCap4FormNameByTempleteNo.select
-- lookupStatementId: getCap4FormNameByTempleteNo.select
-- source: common_sqlmap.xml
-- type: select
-- params: {
--   "templeteNumber": "VALUE_001"
-- }
SELECT T2.NAME AS FORMNAME FROM WF_PROCESS_TEMPLETE T1, CAP_FORM_DEFINITION T2, (SELECT S1.WORKFLOW_ID FROM CTP_TEMPLATE S1 WHERE S1.TEMPLETE_NUMBER = 'VALUE_001') T3 WHERE T3.WORKFLOW_ID = T1.ID AND T1.APPID = T2.ID and t2.id is not null;

-- statementId: getSonTableColType.select
-- lookupStatementId: getSonTableColType.select
-- source: common_sqlmap.xml
-- type: select
-- params: {
--   "sonTableName": "NAME_001",
--   "tableName": "NAME_001",
--   "field": "VALUE_001"
-- }
select VC_FIELDINPUTTYPE as fieldInputType,VC_FIELDREFID as fieldrefid from vm_formfield where VC_TABLENAME = 'NAME_001' and VC_OWNERTABLEID = 'NAME_001' and VC_FIELDNAME = 'VALUE_001';

-- statementId: getTableNameByFormName.select
-- lookupStatementId: getTableNameByFormName.select
-- source: common_sqlmap.xml
-- type: select
-- params: {
--   "mainTableName": "NAME_001",
--   "sonTableName": "NAME_001"
-- }
SELECT VC_TABLENAME AS tableName, VC_OWNERTABLEID AS ownerTableID FROM VM_FORMFIELD WHERE VC_FORMNAME = 'NAME_001' AND VC_TABLEDISPLAY = 'NAME_001' AND ROWNUM = 1;

-- statementId: getCap4TableNameByFormName.select
-- lookupStatementId: getCap4TableNameByFormName.select
-- source: common_sqlmap.xml
-- type: select
-- params: {
--   "mainTableName": "NAME_001"
-- }
SELECT id,field_info FROM cap_form_definition WHERE name = 'NAME_001';

-- statementId: getTableNameByFieldName.select
-- lookupStatementId: getTableNameByFieldName.select
-- source: common_sqlmap.xml
-- type: select
-- params: {
--   "tableName": "NAME_001",
--   "fieldName": "NAME_001"
-- }
SELECT DISTINCT vc_tablename AS tableName FROM vm_formfield t where vc_formName = 'NAME_001' and vc_fielddisplay = 'NAME_001';

-- statementId: getFieldDefByModuleId.select
-- lookupStatementId: getFieldDefByModuleId.select
-- source: common_sqlmap.xml
-- type: select
-- params: {
--   "moduleId": 1001
-- }
SELECT DISTINCT VMF.VC_FIELDNAME as fieldid, VMF.VC_FIELDDISPLAY as fieldshowname FROM VM_FORMFIELD VMF WHERE N_FORMID = (SELECT CCA.CONTENT_TEMPLATE_ID FROM CTP_CONTENT_ALL CCA WHERE MODULE_ID = 1001 AND ROWNUM = 1) AND VMF.VC_FIELDNAME LIKE 'field%' order by nvl(length(trim(vmf.VC_FIELDDISPLAY)),0) desc;

-- statementId: getChnVariableDeclareByModuleId.select
-- lookupStatementId: getChnVariableDeclareByModuleId.select
-- source: common_sqlmap.xml
-- type: select
-- params: {
--   "moduleId": 1001
-- }
SELECT businessName as "businessName", tableName as "tableName", viewName as "viewName", varName as "varName", varNewName as "varNewName", moduleId as "moduleId" FROM vm_chnVariableDeclare WHERE moduleId = 1001 and varNewName is not null;

-- statementId: getFieldDefByTempNo.select
-- lookupStatementId: getFieldDefByTempNo.select
-- source: common_sqlmap.xml
-- type: select
-- params: {
--   "templeteNumber": "VALUE_001"
-- }
SELECT t.VC_FORMNAME AS formName, t.VC_TEMPLATENUMBER AS templeteNumber, t.VC_TABLENAME AS tableName, t.VC_TABLETYPE AS tableType, t.VC_OWNERTABLEID AS ownerTableID, t.VC_FIELDNAME AS fieldName, t.VC_FIELDDISPLAY AS fieldDisplay, t.VC_FIELDINPUTTYPE AS fieldType, t.VC_FIELDREFID AS refEnumID FROM vm_formfield t WHERE 1=1 AND t.VC_TEMPLATENUMBER = 'VALUE_001';

-- statementId: getCap4FieldDefByTempNo.select
-- lookupStatementId: getCap4FieldDefByTempNo.select
-- source: common_sqlmap.xml
-- type: select
-- params: {
--   "templeteNumber": "VALUE_001"
-- }
SELECT T2.field_info as "fieldInfo", t2.name as "tableChName" FROM WF_PROCESS_TEMPLETE T1, cap_FORM_DEFINITION T2, (SELECT S1.WORKFLOW_ID FROM CTP_TEMPLATE S1 WHERE S1.TEMPLETE_NUMBER = 'VALUE_001') T3 WHERE T3.WORKFLOW_ID = T1.ID AND T1.APPID = T2.ID and t2.id is not null;

-- statementId: selectField.select
-- lookupStatementId: selectField.select
-- source: common_sqlmap.xml
-- type: select
-- params: {
--   "templateNumber": "VALUE_001",
--   "filedName": "NAME_001"
-- }
SELECT vc_fieldname AS fieldName FROM vm_formfield t where vc_templateNumber = 'VALUE_001' and vc_fielddisplay = 'NAME_001';

-- statementId: selectFieldByTableName.select
-- lookupStatementId: selectFieldByTableName.select
-- source: common_sqlmap.xml
-- type: select
-- params: {
--   "tableName": "NAME_001",
--   "filedName": "NAME_001"
-- }
SELECT DISTINCT vc_fieldname AS fieldName FROM vm_formfield t where vc_formName = 'NAME_001' and vc_fielddisplay = 'NAME_001' and vc_fieldname like '%field%';

-- statementId: selectFieldByTableNameSub.select
-- lookupStatementId: selectFieldByTableNameSub.select
-- source: common_sqlmap.xml
-- type: select
-- params: {
--   "tableName": "NAME_001",
--   "filedName": "NAME_001",
--   "ownerTableName": "NAME_001"
-- }
SELECT DISTINCT vc_fieldname AS fieldName FROM vm_formfield t where VC_TABLEDISPLAY = 'NAME_001' and vc_fielddisplay = 'NAME_001' and VC_OWNERTABLEID = 'NAME_001' and vc_fieldname like '%field%';

-- statementId: getBbsBoardId.select
-- lookupStatementId: getBbsBoardId.select
-- source: common_sqlmap.xml
-- type: select
-- params: {
--   "name": "NAME_001"
-- }
select id from bbs_board where name='NAME_001' and account_id = -1730833917365171641;

-- statementId: getInquiryBoardId.select
-- lookupStatementId: getInquiryBoardId.select
-- source: common_sqlmap.xml
-- type: select
-- params: {
--   "name": "NAME_001"
-- }
select id from inquiry_surveytype where type_name='NAME_001' and account_id = -1730833917365171641;

-- statementId: getInterfaceConfigByTemplateId.select
-- lookupStatementId: getInterfaceConfigByTemplateId.select
-- source: common_sqlmap.xml
-- type: select
-- params: {
--   "mainTable": "demo_table",
--   "formTemplateID": 1001
-- }
SELECT T2.SHOWVALUE AS INTERSWITCH, T1.FIELD0012 AS INTERDEFAULT FROM demo_table T1 LEFT JOIN CTP_ENUM_ITEM T2 ON T2.ID = T1.FIELD0013 WHERE T1.FIELD0001 = 1001;

-- statementId: affairInstruct.select
-- lookupStatementId: affairInstruct.select
-- source: common_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select field0006 from formson_2230 where field0004 = 'VALUE_001';

-- statementId: getFlowConfig.select
-- lookupStatementId: getFlowConfig.select
-- source: common_sqlmap.xml
-- type: select
-- params: {
--   "sonTable": "demo_table",
--   "mainTable": "demo_table",
--   "formTemplateID": 1001
-- }
SELECT A1.FIELDNAME, A1.FIELDID, A2.SHOWVALUE AS SWITCHWAY, A1.SWITCHRULE, A3.SHOWVALUE AS ISMUST FROM (SELECT S1.FIELD0014 AS FIELDNAME, S1.FIELD0015 AS FIELDID, S1.FIELD0016 AS SWITCHWAY, S1.FIELD0017 AS SWITCHRULE, S1.FIELD0018 AS ISMUST FROM demo_table S1, (SELECT T1.ID FROM demo_table T1 WHERE T1.FIELD0001 = 1001) S2 WHERE S1.FORMMAIN_ID = S2.ID) A1 LEFT JOIN CTP_ENUM_ITEM A2 ON A1.SWITCHWAY = A2.ID LEFT JOIN CTP_ENUM_ITEM A3 ON A1.ISMUST = A3.ID;

-- statementId: messageRecord.insert
-- lookupStatementId: messageRecord.insert
-- source: common_sqlmap.xml
-- type: insert
-- params: {
--   "id": 1001,
--   "sender": "VALUE_001",
--   "receiver": "VALUE_001",
--   "content": "VALUE_001",
--   "receive": "VALUE_001",
--   "date": "2026-05-14",
--   "reply": "VALUE_001"
-- }
insert into fg_message_record (N_RECID, VC_SENDER, VC_RECEIVER, C_CONTENT, VC_RECEIVE, D_SENDDATE,C_REPLY) values (1001, 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', to_date('2026-05-14','YYYY-MM-DD hh24:mi:ss'),'VALUE_001');

-- statementId: logInfo.select
-- lookupStatementId: logInfo.select
-- source: common_sqlmap.xml
-- type: select
-- params: {
--   "id": 1001
-- }
select id as ID, dbms_lob.substr(FIELD0007) as DATA, FIELD0003 as FUNCTION, FIELD0001 as SYSTEM, FIELD0002 as RECORDMOUDLE from formmain_1541 where id = 1001;

-- statementId: logInfo.insert
-- lookupStatementId: logInfo.insert
-- source: common_sqlmap.xml
-- type: insert
-- params: {
--   "id": 1001,
--   "system": "VALUE_001",
--   "model": "VALUE_001",
--   "function": "VALUE_001",
--   "type": "VALUE_001",
--   "state": 1,
--   "count": 1,
--   "data": "VALUE_001",
--   "remark": "VALUE_001"
-- }
INSERT INTO formmain_1541 ( ID ,STATE ,START_MEMBER_ID ,START_DATE , APPROVE_MEMBER_ID , APPROVE_DATE,FINISHEDFLAG ,RATIFYFLAG ,RATIFY_MEMBER_ID , RATIFY_DATE , SORT ,MODIFY_MEMBER_ID ,MODIFY_DATE , FIELD0001 , FIELD0002 ,FIELD0003,FIELD0004,FIELD0005,FIELD0006,FIELD0007,FIELD0008 ) VALUES(1001,1,-6760911671874597139,SYSDATE,0,SYSDATE, 0,0,0,null,0,-6760911671874597139,SYSDATE, 'VALUE_001','VALUE_001','VALUE_001','VALUE_001',1,1,'VALUE_001','VALUE_001');

-- statementId: logInfo.update
-- lookupStatementId: logInfo.update
-- source: common_sqlmap.xml
-- type: update
-- params: {
--   "state": 1,
--   "remark": "VALUE_001",
--   "logId": 1001
-- }
update formmain_1541 set FIELD0005=1, FIELD0006=FIELD0006+1, FIELD0008='VALUE_001' where　id=1001;

-- statementId: loggerInfoFailNew.select
-- lookupStatementId: loggerInfoFailNew.select
-- source: common_sqlmap.xml
-- type: select
-- params: {
--   "state": 1,
--   "ifHandle": "VALUE_001",
--   "startDay": "VALUE_001"
-- }
select count(1) from vm_log_record where operateState=1 and ifHandle='VALUE_001' and to_char(START_DATE, 'yyyy-mm-dd') between 'VALUE_001' and to_char(sysDate, 'yyyy-mm-dd');

-- statementId: logInfoNew.insert
-- lookupStatementId: logInfoNew.insert
-- source: common_sqlmap.xml
-- type: insert
-- params: {
--   "id": 1001,
--   "system": "VALUE_001",
--   "model": "VALUE_001",
--   "functionName": "NAME_001",
--   "functionDesc": "VALUE_001",
--   "type": "VALUE_001",
--   "state": 1,
--   "count": 1,
--   "data": "VALUE_001",
--   "remark": "VALUE_001",
--   "ifHandle": "VALUE_001",
--   "serviceRespond": "VALUE_001"
-- }
INSERT INTO vm_log_record ( ID ,STATE ,START_MEMBER_ID ,START_DATE , APPROVE_MEMBER_ID , APPROVE_DATE,FINISHEDFLAG ,RATIFYFLAG ,RATIFY_MEMBER_ID , RATIFY_DATE , SORT ,MODIFY_MEMBER_ID ,MODIFY_DATE , systemName , modelName ,functionName,functionDesc,operateType,operateState,operateTimes,dataRecord,returnDate,logCreateTime,logUpdateTime,ifHandle,serviceRespond ) VALUES(1001,1,-6760911671874597139,SYSDATE,0,SYSDATE, 0,0,0,null,0,-6760911671874597139,SYSDATE, 'VALUE_001','VALUE_001','NAME_001','VALUE_001','VALUE_001',1,1,'VALUE_001','VALUE_001',SYSDATE,SYSDATE,'VALUE_001','VALUE_001');

-- statementId: refreshParam.select
-- lookupStatementId: refreshParam.select
-- source: common_sqlmap.xml
-- type: select
-- params: {
--   "moduleId": 1001
-- }
SELECT content_template_id as formid,module_type as moduletype FROM ctp_content_all WHERE module_id = 1001;

-- statementId: refreshData.select.count
-- lookupStatementId: refreshData.select.count
-- source: common_sqlmap.xml
-- type: select
-- params: {
--   "formId": 1001
-- }
SELECT count(*) FROM ctp_content_all WHERE content_template_id = 1001 AND module_template_id!=-1;

-- statementId: refreshData.select
-- lookupStatementId: refreshData.select
-- source: common_sqlmap.xml
-- type: select
-- params: {
--   "formId": 1001
-- }
SELECT content_data_id as dataid FROM ctp_content_all WHERE content_template_id = 1001 AND module_template_id!=-1;

-- statementId: logContent.insert
-- lookupStatementId: logContent.insert
-- source: common_sqlmap.xml
-- type: insert
-- params: {
--   "id": 1001,
--   "formId": 1001
-- }
INSERT INTO CTP_CONTENT_ALL( ID , CREATE_ID , CREATE_DATE , MODIFY_ID , MODIFY_DATE , MODULE_TYPE , MODULE_ID , MODULE_TEMPLATE_ID , CONTENT_TYPE , CONTENT , CONTENT_DATA_ID , CONTENT_TEMPLATE_ID , TITLE , SORT ) VALUES(1001,-6760911671874597139,SYSDATE, -6760911671874597139,SYSDATE,37,1001,-2502453340916791461, 20,null,1001,-1012645829320425254,'日志信息',0);

-- statementId: nodeConfigInfo.select
-- lookupStatementId: nodeConfigInfo.select
-- source: common_sqlmap.xml
-- type: select
-- params: {
--   "id": 1001,
--   "activityId": 1001,
--   "templeteId": 1001,
--   "dataName": "NAME_001",
--   "dataNamePrefix": "NAME_001",
--   "dataNameSuffix": "NAME_001",
--   "dataNameAll": "NAME_001"
-- }
select n_recid as id, vc_activityid as activityid, vc_dataname as dataname ,vc_datavalue as datavalue from fg_node_config where vc_status = 1 AND n_recid = 1001 AND vc_activityid = 1001 AND vc_templeteid = 1001 AND vc_dataname = 'NAME_001' AND vc_dataname like 'NAME_001' || '%' AND vc_dataname like '%' || 'NAME_001' AND vc_dataname like '%' || 'NAME_001' || '%';

-- statementId: nodeConfigInfo.insert
-- lookupStatementId: nodeConfigInfo.insert
-- source: common_sqlmap.xml
-- type: insert
-- params: {
--   "id": 1001,
--   "activityId": 1001,
--   "dataname": "NAME_001",
--   "datavalue": "VALUE_001",
--   "templeteId": 1001
-- }
insert into fg_node_config(n_recid,vc_status,vc_activityid,vc_dataname,vc_datavalue,vc_templeteid) values(1001,1,1001,'NAME_001','VALUE_001',1001);

-- statementId: nodeConfigInfo.update
-- lookupStatementId: nodeConfigInfo.update
-- source: common_sqlmap.xml
-- type: update
-- params: {
--   "dataname": "NAME_001",
--   "datavalue": "VALUE_001",
--   "id": 1001,
--   "activityId": 1001,
--   "status": 1,
--   "templeteId": 1001
-- }
update fg_node_config set vc_dataname = 'NAME_001',vc_datavalue='VALUE_001' where n_recid = 1001 and vc_activityid = 1001 and vc_status = 1 and vc_templeteid = 1001;

-- statementId: nodeConfigStatus.update
-- lookupStatementId: nodeConfigStatus.update
-- source: common_sqlmap.xml
-- type: update
-- params: {
--   "status": 1,
--   "activityId": 1001,
--   "templeteId": 1001
-- }
update fg_node_config set vc_status = 1 where vc_activityid = 1001 and vc_templeteid = 1001;

-- statementId: nodeParam.insert
-- lookupStatementId: nodeParam.insert
-- source: common_sqlmap.xml
-- type: insert
-- params: {
--   "id": 1001,
--   "token": "VALUE_001",
--   "activityId": 1001,
--   "key": "VALUE_001",
--   "value": "VALUE_001"
-- }
INSERT INTO fg_node_param ( ID ,vc_token,vc_activityId,vc_key,vc_value ) VALUES(1001,'VALUE_001',1001,'VALUE_001','VALUE_001');

-- statementId: nodeParam.select
-- lookupStatementId: nodeParam.select
-- source: common_sqlmap.xml
-- type: select
-- params: {
--   "token": "VALUE_001",
--   "activityId": 1001,
--   "key": "VALUE_001"
-- }
select vc_value from fg_node_param where vc_token = 'VALUE_001' and vc_activityId = 1001 and vc_key = 'VALUE_001';

-- statementId: groovyFunction.select
-- lookupStatementId: groovyFunction.select
-- source: common_sqlmap.xml
-- type: select
-- params: {
--   "formName": "NAME_001"
-- }
SELECT t1.function_name AS functionname,t1.function_param AS param,t1.code_text as code FROM form_custom_function t1,form_definition t2 WHERE t2.name='NAME_001' and t2.id=t1.form_id;

-- statementId: sonTable.delete
-- lookupStatementId: sonTable.delete
-- source: common_sqlmap.xml
-- type: delete
-- params: {
--   "tableName": "demo_table",
--   "formId": 1001
-- }
delete demo_table where formmain_id = 1001;

-- statementId: checkSuperNodeInfo.select
-- lookupStatementId: checkSuperNodeInfo.select
-- source: common_sqlmap.xml
-- type: select
-- params: {
--   "timeLimit": 7
-- }
SELECT id as taskid, subject as taskname,ca.sub_object_id as workitemid FROM ctp_affair ca WHERE ca.sub_object_id in (SELECT wsc.workitem_id FROM wf_supernode_control wsc WHERE wsc.invoke_time IS NOT NULL AND wsc.return_time IS NOT NULL AND wsc.member_id <>util_user.getMemIdByLoginName('flowbot') AND ca.member_id in (SELECT ID FROM org_member) AND wsc.invoke_time > SYSDATE - 7 ) and state = 3;

-- statementId: checkTaskCoun.select
-- lookupStatementId: checkTaskCoun.select
-- source: common_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select count(taskid) from vm_checkSuperNode where taskid = 'VALUE_001';

-- statementId: errorSuperNode.insert
-- lookupStatementId: errorSuperNode.insert
-- source: common_sqlmap.xml
-- type: insert
-- params: {
--   "taskId": 1001,
--   "firstErrorDate": "2026-05-14",
--   "taskName": "NAME_001"
-- }
insert into vm_checkSuperNode (id, taskid, firsterrordate, taskname, dealstatus) values(util_common.getID, 1001, '2026-05-14', 'NAME_001', util_common.getEnumIdByShow('-675442050070198336','未处理'));

-- statementId: checkColIds.select
-- lookupStatementId: checkColIds.select
-- source: common_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id from col_summary where form_recordid = 'VALUE_001' order by create_date desc;

-- statementId: colSumasyID.select
-- lookupStatementId: colSumasyID.select
-- source: common_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select * from col_summary where form_recordid = 'VALUE_001' and case_id is not null;

-- statementId: DC_InternalRep_T001.select
-- lookupStatementId: DC_InternalRep_T001.select
-- source: common_sqlmap.xml
-- type: select
-- params: {
--   "startDate": "2026-05-14",
--   "endDate": "2026-05-14"
-- }
select templateId, id, reportcode, reportsubject, launchdate, reportdate, propose,proposecode, agentmember, agentmembercode, department, departmentcode,finish_date from ( select 'DC_InternalRep_T001' as templateId,v1.id as id, reportcode, reportsubject, launchdate, reportdate, propose,proposecode, agentmember, agentmembercode, department, departmentcode,v2.finish_date from vm_generalreport v1 left join col_summary v2 on v1.id = v2.form_recordid and v2.finish_date is not null union all select 'DC_InternalRep_4_001' as templateId,v1.id as id, reportcode, reportsubject, launchdate, reportdate, propose,proposecode, agentmember, agentmembercode, department, departmentcode,v2.finish_date from vm_generalreport_cap4 v1 left join col_summary v2 on v1.id = v2.form_recordid and v2.finish_date is not null ) v where 1=1 AND v.finish_date >=to_date('2026-05-14','YYYY-MM-DD') AND v.finish_date <=to_date('2026-05-14','YYYY-MM-DD') order by v.finish_date desc;

-- statementId: DC_InternalRep_T001.select.count
-- lookupStatementId: DC_InternalRep_T001.select.count
-- source: common_sqlmap.xml
-- type: select
-- params: {
--   "startDate": "2026-05-14",
--   "endDate": "2026-05-14"
-- }
select count('x') from( select templateId, id, reportcode, reportsubject, launchdate, reportdate, propose,proposecode, agentmember, agentmembercode, department, departmentcode,finish_date from ( select 'DC_InternalRep_T001' as templateId,v1.id as id, reportcode, reportsubject, launchdate, reportdate, propose,proposecode, agentmember, agentmembercode, department, departmentcode,v2.finish_date from vm_generalreport v1 left join col_summary v2 on v1.id = v2.form_recordid union all select 'DC_InternalRep_4_001' as templateId,v1.id as id, reportcode, reportsubject, launchdate, reportdate, propose,proposecode, agentmember, agentmembercode, department, departmentcode,v2.finish_date from vm_generalreport_cap4 v1 left join col_summary v2 on v1.id = v2.form_recordid ) v where 1=1 AND v.finish_date >=to_date('2026-05-14','YYYY-MM-DD') AND v.finish_date <=to_date('2026-05-14','YYYY-MM-DD') order by v.finish_date desc );

-- statementId: CG_ProductChange_T001.select
-- lookupStatementId: CG_ProductChange_T001.select
-- source: common_sqlmap.xml
-- type: select
-- params: {
--   "productCode": "CODE_001",
--   "productName": "NAME_001",
--   "subjectMatter": "TITLE_001",
--   "startDate": "2026-05-14",
--   "endDate": "2026-05-14",
--   "sendUser": "VALUE_001",
--   "flowStatus": 1,
--   "departCode": "'D001','D002'",
--   "order": "order by id desc"
-- }
select * from ( select 'CT_PFProChange_T001' as templateId, vp.id , vpc.productCode_detail as productcode, vpc.fundCode_detail as fundCode, vpc.productName_detail as productname, vp.changeTitle as subjectmatter, util_user.getMemberNameByMemId(vp.applyUser) as sendusername, util_org.getDeptNameByDeptId(vp.applyDepartMent) as senddepart, vp.applyDepartMent as departId, to_char(vp.applyDate, 'YYYY-MM-DD') senddate, vp.state as flowStatus, vp.applyUser as senduser from vm_product_changeson vpc left join vm_product_change vp on vpc.formmain_id = vp.id ) where 1 =1 AND productCode like '%'||'CODE_001'||'%' AND productName like '%'||'NAME_001'||'%' AND subjectMatter like '%'||'TITLE_001'||'%' AND to_date(senddate,'YYYY-MM-DD') >=to_date('2026-05-14','YYYY-MM-DD') AND to_date(senddate,'YYYY-MM-DD') <=to_date('2026-05-14','YYYY-MM-DD') AND sendUser = 'VALUE_001' AND flowStatus = 1 AND util_org.getDeptCodeByDeptId(departId) in ('D001','D002') order by id desc;

-- statementId: PDM_ProdReview_T001V1.select
-- lookupStatementId: PDM_ProdReview_T001V1.select
-- source: common_sqlmap.xml
-- type: select
-- params: {
--   "productCode": "CODE_001",
--   "productName": "NAME_001",
--   "subjectMatter": "TITLE_001",
--   "startDate": "2026-05-14",
--   "endDate": "2026-05-14",
--   "sendUser": "VALUE_001",
--   "flowStatus": 1,
--   "departCode": "'D001','D002'",
--   "order": "order by id desc"
-- }
select * from (select distinct 'PDM_ProdReview_T001' as templateId,formmain_id as id, productcode, prdcode as fundcode, productname, subjectmatter, util_user.getMemberNameByMemId(senduser) as sendusername, util_org.getDeptNameByDeptId(senddepart) as senddepart, senddepart as departId, to_char(senddate,'YYYY-MM-DD')senddate,flowstatus,senduser from vm_fundproductinfo t left join vm_prodreviewson t1 on pirid = productcode left join vm_prodreview t2 on t1.formmain_id = t2.id where pirid = productcode and t1.formmain_id = t2.id union all select distinct 'CT_Project_T001' as templateId,s.id id, s.productcode productcode, s.fundcode fundcode, s.productname productname, c.subject || s.productname subjectmatter, util_user.getMemberNameByMemId(s.senduser) as sendusername, util_org.getDeptNameByDeptId(s.senddepart) as senddepart, senddepart as departId, to_char(s.senddate,'YYYY-MM-DD') senddate, s.flowstatus,s.senduser from vm_singleproject s ,col_summary c where s.id = c.form_recordid and c.case_id is not null union all select distinct 'CT_MProject_T001' as templateId, s.id id, s.productcode productcode, s.fundcode fundcode, s.productname productname, c.subject || s.productname subjectmatter, util_user.getMemberNameByMemId(s.senduser) as sendusername, util_org.getDeptNameByDeptId(s.senddepart) as senddepart, senddepart as departId, to_char(s.senddate,'YYYY-MM-DD') senddate, s.flowstatus,s.senduser from vm_doubleproject s ,col_summary c where s.id = c.form_recordid and c.case_id is not null union all select case when oldproadditional = 1 or oldprofeereduce = 1 then 'CT_PFProject_T006' else 'CT_PFProject_T001' end templateId, id, productcode productcode, fundcode fundcode, productname productname, subjectmatter, sendusername, senddepart, departId, to_char(senddate, 'YYYY-MM-DD') senddate, flowstatus, senduser from vm_establishmentofpublicfunds union all select 'CT_MProjectNew_T001' as templateId, id, productcode, fundcode, productname, subjectmatter, util_user.getMemberNameByMemId(senduser) as sendusername, util_org.getDeptNameByDeptId(senddepart) as senddepart, senddepart as departId, to_char(senddate, 'YYYY-MM-DD') senddate, flowstatus,senduser from vm_MProjectNew union all select 'CT_ProjectNew_T001' as templateId, id, productcode, fundcode, productname, subjectmatter, util_user.getMemberNameByMemId(senduser) as sendusername, util_org.getDeptNameByDeptId(senddepart) as senddepart, senddepart as departId, to_char(senddate, 'YYYY-MM-DD') senddate, flowstatus,senduser from vm_sProjectNew union all select distinct 'PD_publicCheck_T001' as templateId, t.id, productcode, fundcode, productname, subjectmatter, util_user.getMemberNameByMemId(senduser) as sendusername, util_org.getDeptNameByDeptId(senddepart) as senddepart, senddepart as departId, to_char(senddate,'YYYY-MM-DD')senddate,flowstatus,senduser from vm_productcheckcap4 t left join vm_productcheckCap4_son t1 on t1.formmain_id = t.id union all select distinct 'PDM_ProdReview_cap4' as templateId, formmain_id as id, wcp.productcode, wcp.fundcode, wcp.productname, wc.subjectMatter, util_user.getMemberNameByMemId(senduser) as sendusername, util_org.getDeptNameByDeptId(senddepart) as senddepart, senddepart as departId, to_char(senddate,'YYYY-MM-DD')senddate, FINISHEDFLAG flowstatus, senduser from VM_CAP_WF_PRODREVIEW wc left join VM_CAP_PRODUCTAPPROVESON wcp on wc.id = wcp.formmain_id where state = 1 union all select distinct 'PD_Anual_NJ_cap4' as templateId, formmain_id as id, pas.productcode, pas.fundcode, pas.productname, pa.subjectMatter, util_user.getMemberNameByMemId(senduser) as sendusername, util_org.getDeptNameByDeptId(senddepart) as senddepart, senddepart as departId, to_char(senddate,'YYYY-MM-DD')senddate, FINISHEDFLAG flowstatus, senduser from vm_cap_pension_approve pa left join vm_cap_pension_approveson pas on pa.id = pas.formmain_id where state = 1 ) where 1 =1 AND productCode like '%'||'CODE_001'||'%' AND productName like '%'||'NAME_001'||'%' AND subjectMatter like '%'||'TITLE_001'||'%' AND to_date(senddate,'YYYY-MM-DD') >=to_date('2026-05-14','YYYY-MM-DD') AND to_date(senddate,'YYYY-MM-DD') <=to_date('2026-05-14','YYYY-MM-DD') AND sendUser = 'VALUE_001' AND flowStatus = 1 AND util_org.getDeptCodeByDeptId(departId) in ('D001','D002') order by id desc;

-- statementId: CT_Approve_0001V1.select.count
-- lookupStatementId: CT_Approve_0001V1.select.count
-- source: common_sqlmap.xml
-- type: select
-- params: {
--   "contractNo": "VALUE_001",
--   "snCode": "CODE_001",
--   "order": "order by id desc"
-- }
select count('x') from ( select va.id, vt.sn snCode, va.contractNo contractNo, util_common.getEnumShowById(va.contractType) contractType, util_user.getMemberNameByMemId(va.approveUserName) approveUserName, util_user.getMemCodeByMemId(va.approveUserName) as approveUserCode, util_org.getDeptNameByDeptId(va.approveUserDept) approveUserDept, util_org.getDeptCodeByDeptId(va.approveUserDept) as approveUserDeptCode, va.counterpartyName counterpartyName, va.title title, to_char(va.contractBeginDate, 'yyyy-mm-dd') contractBeginDate, to_char(va.contractEndDate, 'yyyy-mm-dd') contractEndDate, va.amount amount from VM_APPROVE_OLD va left join vm_assetdocument vt on vt.contractCode = va.contractNo union all select va.id, vt.sn snCode, va.contractNo contractNo, util_common.getEnumShowById(va.contractType) contractType, util_user.getMemberNameByMemId(va.approveUserName) approveUserName, util_user.getMemCodeByMemId(va.approveUserName) as approveUserCode, util_org.getDeptNameByDeptId(va.approveUserDept) approveUserDept, util_org.getDeptCodeByDeptId(va.approveUserDept) as approveUserDeptCode, va.counterpartyName counterpartyName, va.title title, to_char(va.contractBeginDate, 'yyyy-mm-dd') contractBeginDate, to_char(va.contractEndDate, 'yyyy-mm-dd') contractEndDate, va.amount amount from VM_APPROVE_NEW va left join vm_assetdocument vt on vt.contractCode = va.contractNo ) where 1 =1 AND contractNo = 'VALUE_001' AND snCode = 'CODE_001' order by id desc;

-- statementId: CT_Approve_0001V1.select
-- lookupStatementId: CT_Approve_0001V1.select
-- source: common_sqlmap.xml
-- type: select
-- params: {
--   "contractNo": "VALUE_001",
--   "snCode": "CODE_001",
--   "order": "order by id desc"
-- }
select id, snCode, contractNo, contractType, approveUserName, approveUserCode, approveUserDept, approveUserDeptCode, counterpartyName, title, contractBeginDate, contractEndDate, amount from ( select va.id, vt.sn snCode, va.contractNo contractNo, util_common.getEnumShowById(va.contractType) contractType, util_user.getMemberNameByMemId(va.approveUserName) approveUserName, util_user.getMemCodeByMemId(va.approveUserName) as approveUserCode, util_org.getDeptNameByDeptId(va.approveUserDept) approveUserDept, util_org.getDeptCodeByDeptId(va.approveUserDept) as approveUserDeptCode, va.counterpartyName counterpartyName, va.title title, to_char(va.contractBeginDate, 'yyyy-mm-dd') contractBeginDate, to_char(va.contractEndDate, 'yyyy-mm-dd') contractEndDate, va.amount amount from VM_APPROVE_OLD va left join vm_assetdocument vt on vt.contractCode = va.contractNo union all select va.id, vt.sn snCode, va.contractNo contractNo, util_common.getEnumShowById(va.contractType) contractType, util_user.getMemberNameByMemId(va.approveUserName) approveUserName, util_user.getMemCodeByMemId(va.approveUserName) as approveUserCode, util_org.getDeptNameByDeptId(va.approveUserDept) approveUserDept, util_org.getDeptCodeByDeptId(va.approveUserDept) as approveUserDeptCode, va.counterpartyName counterpartyName, va.title title, to_char(va.contractBeginDate, 'yyyy-mm-dd') contractBeginDate, to_char(va.contractEndDate, 'yyyy-mm-dd') contractEndDate, va.amount amount from VM_APPROVE_NEW va left join vm_assetdocument vt on vt.contractCode = va.contractNo ) where 1 =1 AND contractNo = 'VALUE_001' AND snCode = 'CODE_001' order by id desc;

-- statementId: AS_Asset_0001V1.select.count
-- lookupStatementId: AS_Asset_0001V1.select.count
-- source: common_sqlmap.xml
-- type: select
-- params: {
--   "snCode": "CODE_001",
--   "startDate": "2026-05-14",
--   "endDate": "2026-05-14",
--   "order": "order by id desc"
-- }
select count('x') from ( select id,to_char(MODIFY_DATE, 'yyyy-mm-dd') as modifyDate, sn as snCode, assetsCode as assetsCode, util_common.getEnumShowById(assetCategory) as assetCategory, util_common.getEnumShowById(assetsName) as assetsName, to_char(buyTime, 'yyyy-mm-dd') as buyTime, util_org.getDeptNameByDeptId(useDepart) as useDepart, util_org.getDeptCodeByDeptId(useDepart) as useDepartCode, util_user.getMemCodeByMemId(useMember) as useMemberCode, util_user.getMemberNameByMemId(useMember) as useMember from vm_assetdocument ) where 1 =1 AND snCode = 'CODE_001' AND to_date(modifyDate,'YYYY-MM-DD') >=to_date('2026-05-14','YYYY-MM-DD') AND to_date(modifyDate,'YYYY-MM-DD') <=to_date('2026-05-14','YYYY-MM-DD') order by id desc;

-- statementId: AS_Asset_0001V1.select
-- lookupStatementId: AS_Asset_0001V1.select
-- source: common_sqlmap.xml
-- type: select
-- params: {
--   "snCode": "CODE_001",
--   "startDate": "2026-05-14",
--   "endDate": "2026-05-14",
--   "order": "order by id desc"
-- }
select id, modifyDate, snCode, assetsCode, assetCategory, assetsName, buyTime, useDepart, useDepartCode, useMemberCode, useMember from ( select id,to_char(MODIFY_DATE, 'yyyy-mm-dd') as modifyDate, sn as snCode, assetsCode as assetsCode, util_common.getEnumShowById(assetCategory) as assetCategory, util_common.getEnumShowById(assetsName) as assetsName, to_char(buyTime, 'yyyy-mm-dd') as buyTime, util_org.getDeptNameByDeptId(useDepart) as useDepart, util_org.getDeptCodeByDeptId(useDepart) as useDepartCode, util_user.getMemCodeByMemId(useMember) as useMemberCode, util_user.getMemberNameByMemId(useMember) as useMember from vm_assetdocument ) where 1 =1 AND snCode = 'CODE_001' AND to_date(modifyDate,'YYYY-MM-DD') >=to_date('2026-05-14','YYYY-MM-DD') AND to_date(modifyDate,'YYYY-MM-DD') <=to_date('2026-05-14','YYYY-MM-DD') order by id desc;

-- statementId: CG_ProductChange_T001.select.count
-- lookupStatementId: CG_ProductChange_T001.select.count
-- source: common_sqlmap.xml
-- type: select
-- params: {
--   "productCode": "CODE_001",
--   "productName": "NAME_001",
--   "subjectMatter": "TITLE_001",
--   "startDate": "2026-05-14",
--   "endDate": "2026-05-14",
--   "sendUser": "VALUE_001",
--   "flowStatus": 1,
--   "departCode": "'D001','D002'",
--   "order": "order by id desc"
-- }
select count('x') from ( select 'CT_PFProChange_T001' as templateId, vp.id , vpc.productCode_detail as productcode, vpc.fundCode_detail as fundCode, vpc.productName_detail as productname, vp.changeTitle as subjectmatter, util_user.getMemberNameByMemId(vp.applyUser) as sendusername, util_org.getDeptNameByDeptId(vp.applyDepartMent) as senddepart, vp.applyDepartMent as departId, to_char(vp.applyDate, 'YYYY-MM-DD') senddate, vp.state as flowStatus, vp.applyUser as senduser from vm_product_changeson vpc left join vm_product_change vp on vpc.formmain_id = vp.id ) where 1 =1 AND productCode like '%'||'CODE_001'||'%' AND productName like '%'||'NAME_001'||'%' AND subjectMatter like '%'||'TITLE_001'||'%' AND to_date(senddate,'YYYY-MM-DD') >=to_date('2026-05-14','YYYY-MM-DD') AND to_date(senddate,'YYYY-MM-DD') <=to_date('2026-05-14','YYYY-MM-DD') AND sendUser = 'VALUE_001' AND flowStatus = 1 AND util_org.getDeptCodeByDeptId(departId) in ('D001','D002') order by id desc;

-- statementId: PDM_ProdReview_T001V1.select.count
-- lookupStatementId: PDM_ProdReview_T001V1.select.count
-- source: common_sqlmap.xml
-- type: select
-- params: {
--   "productCode": "CODE_001",
--   "productName": "NAME_001",
--   "subjectMatter": "TITLE_001",
--   "startDate": "2026-05-14",
--   "endDate": "2026-05-14",
--   "sendUser": "VALUE_001",
--   "flowStatus": 1,
--   "departCode": "'D001','D002'",
--   "order": "order by id desc"
-- }
select count('x') from ( select distinct formmain_id as id, productcode, prdcode as fundcode, productname, subjectmatter, util_user.getMemberNameByMemId(senduser) as sendusername, util_org.getDeptNameByDeptId(senddepart) as senddepart, senddepart as departId, to_char(senddate,'YYYY-MM-DD')senddate,flowstatus,senduser from vm_fundproductinfo t left join vm_prodreviewson t1 on pirid = productcode left join vm_prodreview t2 on t1.formmain_id = t2.id where pirid = productcode and t1.formmain_id = t2.id union all select distinct s.id id, s.productcode productcode, s.fundcode fundcode, s.productname productname, c.subject || s.productname subjectmatter, util_user.getMemberNameByMemId(s.senduser) as sendusername, util_org.getDeptNameByDeptId(s.senddepart) as senddepart, senddepart as departId, to_char(s.senddate,'YYYY-MM-DD') senddate, s.flowstatus,s.senduser from vm_singleproject s ,col_summary c where s.id = c.form_recordid and c.case_id is not null union all select distinct s.id id , s.productcode productcode, s.fundcode fundcode, s.productname productname, c.subject || s.productname subjectmatter, util_user.getMemberNameByMemId(s.senduser) as sendusername, util_org.getDeptNameByDeptId(s.senddepart) as senddepart, senddepart as departId, to_char(s.senddate,'YYYY-MM-DD') senddate, s.flowstatus,s.senduser from vm_doubleproject s ,col_summary c where s.id = c.form_recordid and c.case_id is not null union all select id, productcode productcode, fundcode fundcode, productname productname, subjectmatter, sendusername, senddepart, departId, to_char(senddate,'YYYY-MM-DD') senddate, flowstatus,senduser from vm_establishmentofpublicfunds union all select id, productcode, fundcode, productname, subjectmatter, util_user.getMemberNameByMemId(senduser) as sendusername, util_org.getDeptNameByDeptId(senddepart) as senddepart, senddepart as departId, to_char(senddate, 'YYYY-MM-DD') senddate, flowstatus,senduser from vm_MProjectNew union all select id, productcode, fundcode, productname, subjectmatter, util_user.getMemberNameByMemId(senduser) as sendusername, util_org.getDeptNameByDeptId(senddepart) as senddepart, senddepart as departId, to_char(senddate, 'YYYY-MM-DD') senddate, flowstatus,senduser from vm_sProjectNew union all select distinct t.id, productcode, fundcode, productname, subjectmatter, util_user.getMemberNameByMemId(senduser) as sendusername, util_org.getDeptNameByDeptId(senddepart) as senddepart, senddepart as departId, to_char(senddate,'YYYY-MM-DD')senddate,flowstatus,senduser from vm_productcheckcap4 t left join vm_productcheckCap4_son t1 on t1.formmain_id = t.id union all select distinct formmain_id as id, wcp.productcode, wcp.fundcode, wcp.productname, wc.subjectMatter, util_user.getMemberNameByMemId(senduser) as sendusername, util_org.getDeptNameByDeptId(senddepart) as senddepart, senddepart as departId, to_char(senddate,'YYYY-MM-DD')senddate, FINISHEDFLAG flowstatus, senduser from VM_CAP_WF_PRODREVIEW wc left join VM_CAP_PRODUCTAPPROVESON wcp on wc.id = wcp.formmain_id where state = 1 union all select distinct formmain_id as id, pas.productcode, pas.fundcode, pas.productname, pa.subjectMatter, util_user.getMemberNameByMemId(senduser) as sendusername, util_org.getDeptNameByDeptId(senddepart) as senddepart, senddepart as departId, to_char(senddate,'YYYY-MM-DD')senddate, FINISHEDFLAG flowstatus, senduser from vm_cap_pension_approve pa left join vm_cap_pension_approveson pas on pa.id = pas.formmain_id where state = 1 ) where 1 =1 AND productCode like '%'||'CODE_001'||'%' AND productName like '%'||'NAME_001'||'%' AND subjectMatter like '%'||'TITLE_001'||'%' AND to_date(senddate,'YYYY-MM-DD') >=to_date('2026-05-14','YYYY-MM-DD') AND to_date(senddate,'YYYY-MM-DD') <=to_date('2026-05-14','YYYY-MM-DD') AND sendUser = 'VALUE_001' AND flowStatus = 1 AND util_org.getDeptCodeByDeptId(departId) in ('D001','D002') order by id desc;

-- statementId: PDM_ProdReview_T001.select
-- lookupStatementId: PDM_ProdReview_T001.select
-- source: common_sqlmap.xml
-- type: select
-- params: {
--   "productCode": "CODE_001",
--   "productName": "NAME_001",
--   "subjectMatter": "TITLE_001",
--   "startDate": "2026-05-14",
--   "endDate": "2026-05-14",
--   "sendUser": "VALUE_001",
--   "flowStatus": 1,
--   "departCode": "'D001','D002'",
--   "order": "order by id desc"
-- }
select distinct 'PDM_ProdReview_T001' as templateId, formmain_id as id,productcode,prdcode as fundcode,productname,subjectmatter, util_user.getMemberNameByMemId(senduser) as sendusername, util_org.getDeptNameByDeptId(senddepart) as senddepart, to_char(senddate,'YYYY-MM-DD')senddate,flowstatus, senddepart ad departId from vm_fundproductinfo t left join vm_prodreviewson t1 on pirid = productcode left join vm_prodreview t2 on t1.formmain_id = t2.id where pirid = productcode and t1.formmain_id = t2.id AND productCode like '%'||'CODE_001'||'%' AND productName like '%'||'NAME_001'||'%' AND subjectMatter like '%'||'TITLE_001'||'%' AND senddate >=to_date('2026-05-14','YYYY-MM-DD') AND senddate <=to_date('2026-05-14','YYYY-MM-DD') AND sendUser = 'VALUE_001' AND flowStatus = 1 AND util_org.getDeptCodeByDeptId(departId) in ('D001','D002') order by id desc;

-- statementId: PDM_ProdReview_T001.select.count
-- lookupStatementId: PDM_ProdReview_T001.select.count
-- source: common_sqlmap.xml
-- type: select
-- params: {
--   "productCode": "CODE_001",
--   "productName": "NAME_001",
--   "subjectMatter": "TITLE_001",
--   "startDate": "2026-05-14",
--   "endDate": "2026-05-14",
--   "sendUser": "VALUE_001",
--   "flowStatus": 1,
--   "departCode": "'D001','D002'",
--   "order": "order by id desc"
-- }
select count('x') from (select distinct formmain_id as id,productcode,prdcode as fundcode,productname,subjectmatter, util_user.getMemberNameByMemId(senduser) as sendusername, util_org.getDeptNameByDeptId(senddepart) as senddepart, to_char(senddate,'YYYY-MM-DD')senddate,flowstatus senddepart ad departId from vm_fundproductinfo t left join vm_prodreviewson t1 on pirid = productcode left join vm_prodreview t2 on t1.formmain_id = t2.id where pirid = productcode and t1.formmain_id = t2.id AND productCode like '%'||'CODE_001'||'%' AND productName like '%'||'NAME_001'||'%' AND subjectMatter like '%'||'TITLE_001'||'%' AND senddate >=to_date('2026-05-14','YYYY-MM-DD') AND senddate <=to_date('2026-05-14','YYYY-MM-DD') AND sendUser = 'VALUE_001' AND flowStatus = 1 ) AND util_org.getDeptCodeByDeptId(departId) in ('D001','D002') order by id desc;

-- statementId: CT_Approve_T006.select
-- lookupStatementId: CT_Approve_T006.select
-- source: common_sqlmap.xml
-- type: select
-- params: {
--   "productCode": "CODE_001",
--   "productName": "NAME_001",
--   "subjectMatter": "TITLE_001",
--   "startDate": "2026-05-14",
--   "endDate": "2026-05-14",
--   "sendUser": "VALUE_001",
--   "flowStatus": 1,
--   "departCode": "'D001','D002'",
--   "order": "order by id desc"
-- }
select id, templateId, productcode, fundcode, productname, contracttitle, sendusername, contractcode, anagoguename, contracttype, senddate, flowstatus, senddepart, senddepart as departId from (select distinct formmain_id as id,'CT_Approve_T006' as templateId, productcode,prdcode as fundcode, productname, subjectMatter, subjectMatter as contracttitle, util_user.getMemberNameByMemId(senduser) as sendusername, sendUser, contractcode, anagoguename, util_common.getEnumShowById(contracttype) as contracttype, to_char(senddate,'YYYY-MM-DD')senddate, flowstatus, util_org.getDeptNameByDeptId(departId) as senddepart, departId from vm_fundproductinfo t left join vm_ApproveSon t1 on pirid = productcode left join vm_Approve t2 on t1.formmain_id = t2.id where pirid = productcode and t1.formmain_id = t2.id and 1=1 union all select distinct t.id, 'PD_publicContract_01' as templateId, productcode, fundcode, productname, contracttitle subjectMatter, contracttitle, util_user.getMemberNameByMemId(senduser) as sendusername, sendUser, contractcode, anagoguename, util_common.getEnumShowById(contracttype) as contracttype, to_char(senddate,'YYYY-MM-DD') senddate, flowstatus, util_org.getDeptNameByDeptId(senddepart) as senddepart, senddepart as departId from vm_productcontractcap4 t left join vm_productContractCap4_son t1 on t.id = formmain_id union all select distinct formmain_id as id, 'CT_Approve_cap4' as templateId, productcode, fundcode, productname, contracttitle subjectMatter, contracttitle, util_user.getMemberNameByMemId(senduser) as sendusername, sendUser, contractcode, anagoguename, util_common.getEnumShowById(contracttype) as contracttype, to_char(senddate, 'YYYY-MM-DD') senddate, FINISHEDFLAG flowstatus, util_org.getDeptNameByDeptId(senddepart) as senddepart, senddepart departId from VM_CAP_WF_PRODCONTRACT wc left join VM_CAP_APPROVESON wcp on wc.id = wcp.formmain_id where state = 1 union all select distinct formmain_id as id, 'CT_Anual_NJ_cap4' as templateId, productcode, fundcode, productname, contracttitle subjectMatter, contracttitle, util_user.getMemberNameByMemId(senduser) as sendusername, sendUser, contractcode, anagoguename, util_common.getEnumShowById(contracttype) as contracttype, to_char(senddate, 'YYYY-MM-DD') senddate, FINISHEDFLAG flowstatus, util_org.getDeptNameByDeptId(senddepart) as senddepart, senddepart departId from vm_cap_pension_contract pc left join vm_cap_pension_contractson pcs on pc.id = pcs.formmain_id where state = 1 ) where 1 = 1 AND productCode like '%'||'CODE_001'||'%' AND productName like '%'||'NAME_001'||'%' AND subjectMatter like '%'||'TITLE_001'||'%' AND to_date(senddate,'YYYY-MM-DD') >=to_date('2026-05-14','YYYY-MM-DD') AND to_date(senddate,'YYYY-MM-DD') <=to_date('2026-05-14','YYYY-MM-DD') AND sendUser = 'VALUE_001' AND flowStatus = 1 AND util_org.getDeptCodeByDeptId(departId) in ('D001','D002') order by id desc;

-- statementId: CT_Approve_T006.select.count
-- lookupStatementId: CT_Approve_T006.select.count
-- source: common_sqlmap.xml
-- type: select
-- params: {
--   "productCode": "CODE_001",
--   "productName": "NAME_001",
--   "subjectMatter": "TITLE_001",
--   "startDate": "2026-05-14",
--   "endDate": "2026-05-14",
--   "sendUser": "VALUE_001",
--   "flowStatus": 1,
--   "departCode": "'D001','D002'",
--   "order": "order by id desc"
-- }
select count('x') from (select distinct formmain_id as id, productcode,prdcode as fundcode, productname, subjectMatter, subjectMatter as contracttitle, util_user.getMemberNameByMemId(senduser) as sendusername, sendUser, contractcode, anagoguename, util_common.getEnumShowById(contracttype) as contracttype, to_char(senddate,'YYYY-MM-DD')senddate, flowstatus, util_org.getDeptNameByDeptId(departId) as senddepart, departId from vm_fundproductinfo t left join vm_ApproveSon t1 on pirid = productcode left join vm_Approve t2 on t1.formmain_id = t2.id where pirid = productcode and t1.formmain_id = t2.id union all select distinct t.id, productcode, fundcode, productname, contracttitle subjectMatter, contracttitle, util_user.getMemberNameByMemId(senduser) as sendusername, sendUser, contractcode, anagoguename, util_common.getEnumShowById(contracttype) as contracttype, to_char(senddate,'YYYY-MM-DD') senddate, flowstatus, util_org.getDeptNameByDeptId(senddepart) as senddepart, senddepart as departId from vm_productcontractcap4 t left join vm_productContractCap4_son t1 on t.id = formmain_id union all select distinct formmain_id as id, productcode, fundcode, productname, contracttitle subjectMatter, contracttitle, util_user.getMemberNameByMemId(senduser) as sendusername, sendUser, contractcode, anagoguename, util_common.getEnumShowById(contracttype) as contracttype, to_char(senddate, 'YYYY-MM-DD') senddate, FINISHEDFLAG flowstatus, util_org.getDeptNameByDeptId(senddepart) as senddepart, senddepart departId from VM_CAP_WF_PRODCONTRACT wc left join VM_CAP_APPROVESON wcp on wc.id = wcp.formmain_id where state = 1 union all select distinct formmain_id as id, productcode, fundcode, productname, contracttitle subjectMatter, contracttitle, util_user.getMemberNameByMemId(senduser) as sendusername, sendUser, contractcode, anagoguename, util_common.getEnumShowById(contracttype) as contracttype, to_char(senddate, 'YYYY-MM-DD') senddate, FINISHEDFLAG flowstatus, util_org.getDeptNameByDeptId(senddepart) as senddepart, senddepart departId from vm_cap_pension_contract pc left join vm_cap_pension_contractson pcs on pc.id = pcs.formmain_id where state = 1 ) where 1 = 1 AND productCode like '%'||'CODE_001'||'%' AND productName like '%'||'NAME_001'||'%' AND subjectMatter like '%'||'TITLE_001'||'%' AND to_date(senddate,'YYYY-MM-DD') >=to_date('2026-05-14','YYYY-MM-DD') AND to_date(senddate,'YYYY-MM-DD') <=to_date('2026-05-14','YYYY-MM-DD') AND sendUser = 'VALUE_001' AND flowStatus = 1 AND util_org.getDeptCodeByDeptId(departId) in ('D001','D002') order by id desc;

-- statementId: DC_External_T002.select
-- lookupStatementId: DC_External_T002.select
-- source: common_sqlmap.xml
-- type: select
-- params: {
--   "productCode": "CODE_001",
--   "productName": "NAME_001",
--   "subjectMatter": "TITLE_001",
--   "startDate": "2026-05-14",
--   "endDate": "2026-05-14",
--   "sendUser": "VALUE_001",
--   "flowStatus": 1,
--   "departCode": "'D001','D002'",
--   "order": "order by id desc"
-- }
select id, templateId, productcode, fundcode, productname, doccode, doctitle, sendusername, senddepart, senddate, flowstatus from ( select distinct formmain_id as id,'DC_External_T002' as templateId, productcode, prdcode as fundcode, productname, doccode, subjectMatter as doctitle, util_user.getMemberNameByMemId(senduser) as sendusername, sendUser, util_org.getDeptNameByDeptId(senddepart) as senddepart, to_char(senddate,'YYYY-MM-DD')senddate, flowstatus from vm_fundproductinfo t left join vm_DCExternalSon t1 on pirid = productcode left join vm_DCExternal t2 on t1.formmain_id = t2.id where pirid = productcode and docflowtype = '产品管理' and t1.formmain_id = t2.id UNION ALL select distinct formmain_id as id,'DC_External4_T002' as templateId, productcode, prdcode as fundcode, productname, doccode, subjectMatter as doctitle, util_user.getMemberNameByMemId(senduser) as sendusername, sendUser, util_org.getDeptNameByDeptId(senddepart) as senddepart, to_char(senddate,'YYYY-MM-DD')senddate, flowstatus from vm_fundproductinfoCap4 t left join vm_DCExternalSon_cap4 t1 on pirid = productcode left join vm_DCExternal_cap4 t2 on t1.formmain_id = t2.id where pirid = productcode and docflowtype = '产品管理' and t1.formmain_id = t2.id ) where 1 =1 AND productCode like '%'||'CODE_001'||'%' AND productName like '%'||'NAME_001'||'%' AND doctitle like '%'||'TITLE_001'||'%' AND to_date(senddate,'YYYY-MM-DD') >=to_date('2026-05-14','YYYY-MM-DD') AND to_date(senddate,'YYYY-MM-DD') <=to_date('2026-05-14','YYYY-MM-DD') AND sendUser = 'VALUE_001' AND flowStatus = 1 AND util_org.getDeptCodeByDeptId(senddepart) in ('D001','D002') order by id desc;

-- statementId: DC_External_T002.select.count
-- lookupStatementId: DC_External_T002.select.count
-- source: common_sqlmap.xml
-- type: select
-- params: {
--   "productCode": "CODE_001",
--   "productName": "NAME_001",
--   "subjectMatter": "TITLE_001",
--   "startDate": "2026-05-14",
--   "endDate": "2026-05-14",
--   "sendUser": "VALUE_001",
--   "flowStatus": 1,
--   "departCode": "'D001','D002'",
--   "order": "order by id desc"
-- }
select count('x') from ( select id, templateId, productcode, fundcode, productname, doccode, doctitle, sendusername, senddepart, senddate, flowstatus from ( select distinct formmain_id as id,'DC_External_T002' as templateId, productcode, prdcode as fundcode, productname, doccode, subjectMatter as doctitle, util_user.getMemberNameByMemId(senduser) as sendusername, sendUser, util_org.getDeptNameByDeptId(senddepart) as senddepart, to_char(senddate,'YYYY-MM-DD')senddate, flowstatus from vm_fundproductinfo t left join vm_DCExternalSon t1 on pirid = productcode left join vm_DCExternal t2 on t1.formmain_id = t2.id where pirid = productcode and docflowtype = '产品管理' and t1.formmain_id = t2.id UNION ALL select distinct formmain_id as id,'DC_External4_T002' as templateId, productcode, prdcode as fundcode, productname, doccode, subjectMatter as doctitle, util_user.getMemberNameByMemId(senduser) as sendusername, sendUser, util_org.getDeptNameByDeptId(senddepart) as senddepart, to_char(senddate,'YYYY-MM-DD')senddate, flowstatus from vm_fundproductinfoCap4 t left join vm_DCExternalSon_cap4 t1 on pirid = productcode left join vm_DCExternal_cap4 t2 on t1.formmain_id = t2.id where pirid = productcode and docflowtype = '产品管理' and t1.formmain_id = t2.id ) where 1 =1 AND productCode like '%'||'CODE_001'||'%' AND productName like '%'||'NAME_001'||'%' AND doctitle like '%'||'TITLE_001'||'%' AND to_date(senddate,'YYYY-MM-DD') >=to_date('2026-05-14','YYYY-MM-DD') AND to_date(senddate,'YYYY-MM-DD') <=to_date('2026-05-14','YYYY-MM-DD') AND sendUser = 'VALUE_001' AND flowStatus = 1 AND util_org.getDeptCodeByDeptId(senddepart) in ('D001','D002') order by id desc );

-- statementId: SL_Apply_T001V1.select
-- lookupStatementId: SL_Apply_T001V1.select
-- source: common_sqlmap.xml
-- type: select
-- params: {
--   "productCode": "CODE_001",
--   "productName": "NAME_001",
--   "subjectMatter": "TITLE_001",
--   "startDate": "2026-05-14",
--   "endDate": "2026-05-14",
--   "sendUser": "VALUE_001",
--   "flowStatus": 1,
--   "departCode": "'D001','D002'",
--   "order": "order by id desc"
-- }
select * from ( select distinct formmain_id as id,'SL_Apply_T001' as templateId, productcode, prdcode as fundcode, productname, subjectMatter, util_user.getMemberNameByMemId(senduser) as sendusername, to_char(senddate,'YYYY-MM-DD') senddate, flowstatus, senduser, util_org.getDeptNameByDeptId(senddepart) as senddepart, senddepart as departId from vm_fundproductinfo t left join vm_PDMProdReviewson t1 on pirid = productcode left join vm_PDMProdReview t2 on t1.formmain_id = t2.id where pirid = productcode and sealtype = util_common.getEnumIdByRefName('用章业务','产品管理业务') and subdivision != -9172006034010128312 and t1.formmain_id = t2.id UNION ALL select distinct s.id id, decode (s.type, '-4623859796867068930', 'CT_OProject_T001', 'CT_OProject_T002') as templateId, s.productcode productcode, s.fundcode fundcode, s.productname productname, c.subject || s.productname subjectmatter, util_user.getMemberNameByMemId(s.senduser) as sendusername, to_char(s.senddate,'YYYY-MM-DD') senddate, s.flowstatus,senduser, util_org.getDeptNameByDeptId(senddepart) as senddepart, senddepart as departId from vm_checkproject s ,col_summary c where s.id = c.form_recordid and c.case_id is not null UNION ALL select distinct t1.id, templateId, productcode, prdcode as fundcode, productname , subjectmatter, sendusername, senddate, flowstatus, senduser, senddepart, departId from vm_wfLOFPFPronect t1 left join vm_fundproductinfo t2 on t1.productcode = t2.pirid union all select distinct id, templateId, productcode, fundcode, productname , subjectmatter, sendusername, senddate, flowstatus, senduser, senddepart, departId from vw_PublicOffering_Reported union all select distinct id, templateId, productcode, fundcode, productname , subjectmatter, sendusername, senddate, flowstatus, senduser, senddepart, departId from vw_PublicOffering_Supplement ) where 1 =1 AND productCode like '%'||'CODE_001'||'%' AND productName like '%'||'NAME_001'||'%' AND subjectMatter like '%'||'TITLE_001'||'%' AND to_date(senddate,'yyyy-mm-dd') >=to_date('2026-05-14','YYYY-MM-DD') AND to_date(senddate,'yyyy-mm-dd') <=to_date('2026-05-14','YYYY-MM-DD') AND sendUser = 'VALUE_001' AND flowStatus = 1 AND util_org.getDeptCodeByDeptId(departId) in ('D001','D002') order by id desc;

-- statementId: SL_Apply_T001V1.select.count
-- lookupStatementId: SL_Apply_T001V1.select.count
-- source: common_sqlmap.xml
-- type: select
-- params: {
--   "productCode": "CODE_001",
--   "productName": "NAME_001",
--   "subjectMatter": "TITLE_001",
--   "startDate": "2026-05-14",
--   "endDate": "2026-05-14",
--   "sendUser": "VALUE_001",
--   "flowStatus": 1,
--   "departCode": "'D001','D002'",
--   "order": "order by id desc"
-- }
select count('x') from( select distinct formmain_id as id, 'SL_Apply_T001' as templateId, productcode, prdcode as fundcode, subjectMatter, productname, util_user.getMemberNameByMemId(senduser) as sendusername, to_char(senddate,'YYYY-MM-DD') senddate, flowstatus, senduser, util_org.getDeptNameByDeptId(senddepart) as senddepart, senddepart as departId from vm_fundproductinfo t left join vm_PDMProdReviewson t1 on pirid = productcode left join vm_PDMProdReview t2 on t1.formmain_id = t2.id where pirid = productcode and sealtype = util_common.getEnumIdByRefName('用章业务','产品管理业务') and subdivision != -9172006034010128312 and t1.formmain_id = t2.id UNION ALL select distinct s.id id,'CT_OProject_T001' as templateId, s.productcode productcode, s.fundcode fundcode, s.productname productname, c.subject || s.productname subjectmatter, util_user.getMemberNameByMemId(s.senduser) as sendusername, to_char(s.senddate,'YYYY-MM-DD') senddate, s.flowstatus,senduser, util_org.getDeptNameByDeptId(senddepart) as senddepart, senddepart as departId from vm_checkproject s ,col_summary c where s.id = c.form_recordid and c.case_id is not null UNION ALL select distinct t1.id, templateId, productcode, prdcode as fundcode, productname , subjectmatter, sendusername, senddate, flowstatus, senduser, senddepart, departId from vm_wfLOFPFPronect t1 left join vm_fundproductinfo t2 on t1.productcode = t2.pirid union all select distinct id, templateId, productcode, fundcode, productname , subjectmatter, sendusername, senddate, flowstatus, senduser, senddepart, departId from vw_PublicOffering_Reported union all select distinct id, templateId, productcode, fundcode, productname , subjectmatter, sendusername, senddate, flowstatus, senduser, senddepart, departId from vw_PublicOffering_Supplement) where 1 =1 AND productCode like '%'||'CODE_001'||'%' AND productName like '%'||'NAME_001'||'%' AND subjectMatter like '%'||'TITLE_001'||'%' AND to_date(senddate,'YYYY-MM-DD') >=to_date('2026-05-14','YYYY-MM-DD') AND to_date(senddate,'YYYY-MM-DD') <=to_date('2026-05-14','YYYY-MM-DD') AND sendUser = 'VALUE_001' AND flowStatus = 1 AND util_org.getDeptCodeByDeptId(departId) in ('D001','D002') order by id desc;

-- statementId: SL_Apply_T001.select
-- lookupStatementId: SL_Apply_T001.select
-- source: common_sqlmap.xml
-- type: select
-- params: {
--   "productCode": "CODE_001",
--   "productName": "NAME_001",
--   "subjectMatter": "TITLE_001",
--   "startDate": "2026-05-14",
--   "endDate": "2026-05-14",
--   "sendUser": "VALUE_001",
--   "flowStatus": 1,
--   "departCode": "'D001','D002'",
--   "order": "order by id desc"
-- }
select distinct formmain_id as id, productcode, prdcode as fundcode, productname, subjectMatter, util_user.getMemberNameByMemId(senduser) as sendusername, to_char(senddate,'YYYY-MM-DD')senddate, flowstatus, util_org.getDeptNameByDeptId(senddepart) as senddepart, senddepart as departId from vm_fundproductinfo t left join vm_PDMProdReviewson t1 on pirid = productcode left join vm_PDMProdReview t2 on t1.formmain_id = t2.id where pirid = productcode and sealtype = util_common.getEnumIdByRefName('用章业务','产品管理业务') and t1.formmain_id = t2.id AND productCode like '%'||'CODE_001'||'%' AND productName like '%'||'NAME_001'||'%' AND subjectMatter like '%'||'TITLE_001'||'%' AND senddate >=to_date('2026-05-14','YYYY-MM-DD') AND senddate <=to_date('2026-05-14','YYYY-MM-DD') AND sendUser = 'VALUE_001' AND flowStatus = 1 AND util_org.getDeptCodeByDeptId(departId) in ('D001','D002') order by id desc;

-- statementId: SL_Apply_T001.select.count
-- lookupStatementId: SL_Apply_T001.select.count
-- source: common_sqlmap.xml
-- type: select
-- params: {
--   "productCode": "CODE_001",
--   "productName": "NAME_001",
--   "subjectMatter": "TITLE_001",
--   "startDate": "2026-05-14",
--   "endDate": "2026-05-14",
--   "sendUser": "VALUE_001",
--   "flowStatus": 1,
--   "departCode": "'D001','D002'",
--   "order": "order by id desc"
-- }
select count('x') from(select distinct formmain_id as id, productcode, prdcode as fundcode, productname, subjectMatter, util_user.getMemberNameByMemId(senduser) as sendusername, to_char(senddate,'YYYY-MM-DD')senddate, flowstatus, util_org.getDeptNameByDeptId(senddepart) as senddepart, senddepart as departId from vm_fundproductinfo t left join vm_PDMProdReviewson t1 on pirid = productcode left join vm_PDMProdReview t2 on t1.formmain_id = t2.id where pirid = productcode and sealtype = util_common.getEnumIdByRefName('用章业务','产品管理业务') and t1.formmain_id = t2.id AND productCode like '%'||'CODE_001'||'%' AND productName like '%'||'NAME_001'||'%' AND subjectMatter like '%'||'TITLE_001'||'%' AND senddate >=to_date('2026-05-14','YYYY-MM-DD') AND senddate <=to_date('2026-05-14','YYYY-MM-DD') AND sendUser = 'VALUE_001' AND flowStatus = 1 AND util_org.getDeptCodeByDeptId(departId) in ('D001','D002') order by id desc );

-- statementId: CT_PFProject_T001.select
-- lookupStatementId: CT_PFProject_T001.select
-- source: common_sqlmap.xml
-- type: select
-- params: {
--   "productCode": "CODE_001",
--   "productName": "NAME_001",
--   "subjectMatter": "TITLE_001",
--   "startDate": "2026-05-14",
--   "endDate": "2026-05-14",
--   "sendUser": "VALUE_001",
--   "flowStatus": 1,
--   "departCode": "'D001','D002'",
--   "order": "order by id desc"
-- }
select id, 'CT_PFProject_T001' as templateId, sendusername, fundcode, to_char(senddate,'YYYY-MM-DD') senddate, subjectmatter, productcode, productname, flowstatus, senddepart, departId from vm_establishmentofpublicfunds where 1=1 AND productCode like '%'||'CODE_001'||'%' AND productName like '%'||'NAME_001'||'%' AND subjectMatter like '%'||'TITLE_001'||'%' AND senddate >=to_date('2026-05-14','YYYY-MM-DD') AND senddate <=to_date('2026-05-14','YYYY-MM-DD') AND sendUser = 'VALUE_001' AND flowStatus = 1 AND util_org.getDeptCodeByDeptId(departId) in ('D001','D002') order by id desc;

-- statementId: CT_PFProject_T001.select.count
-- lookupStatementId: CT_PFProject_T001.select.count
-- source: common_sqlmap.xml
-- type: select
-- params: {
--   "productCode": "CODE_001",
--   "productName": "NAME_001",
--   "subjectMatter": "TITLE_001",
--   "startDate": "2026-05-14",
--   "endDate": "2026-05-14",
--   "sendUser": "VALUE_001",
--   "flowStatus": 1,
--   "order": "order by id desc"
-- }
select count('x') from vm_establishmentofpublicfunds where 1=1 AND productCode like '%'||'CODE_001'||'%' AND productName like '%'||'NAME_001'||'%' AND subjectMatter like '%'||'TITLE_001'||'%' AND senddate >=to_date('2026-05-14','YYYY-MM-DD') AND senddate <=to_date('2026-05-14','YYYY-MM-DD') AND sendUser = 'VALUE_001' AND flowStatus = 1 order by id desc;

-- statementId: getFlowSearchConfig.select
-- lookupStatementId: getFlowSearchConfig.select
-- source: common_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select flowtype,fieldname,fieldid,switchway,switchrule,ismust from vm_flowSearchConfig where flowtype = 'VALUE_001';

-- statementId: getFlowTaskSearchConfig.select
-- lookupStatementId: getFlowTaskSearchConfig.select
-- source: common_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select flowtype,fieldname,fieldid,switchway,switchrule,ismust from vm_flowTaskSearchConfig where flowtype = 'VALUE_001';

-- statementId: SL_Apply_T001FlowTask.select
-- lookupStatementId: SL_Apply_T001FlowTask.select
-- source: common_sqlmap.xml
-- type: select
-- params: {
--   "userID": 1001,
--   "order": "order by id desc"
-- }
SELECT ca.id as id,om.name as senderLoginName, ca.SUBJECT as subject, nvl(op.login_name, 'flowbot') sendername, ca.MEMBER_ID as memberId, ca.OBJECT_ID as objectId, ca.ACTIVITY_ID as activityId, to_char(ca.RECEIVE_TIME, 'yyyymmdd') as receiveTime, ca.STATE as state, ca.is_delete as isDelete, ca.TEMPLETE_ID as templeteId, cs.PROCESS_ID as processId from CTP_AFFAIR ca left join org_principal op on ca.sender_id = op.member_id left join org_member om on ca.sender_id = om.id left join col_summary cs on ca.object_id = cs.id left join vm_pdmprodreview t1 on t1.id = cs.form_recordid where ca.app in (1) and t1.sealtype = util_common.getEnumIdByRefName('用章业务', '产品管理业务') and ca.state in (3,7,8) and ca.member_id = 1001 order by id desc;

-- statementId: PDM_ProdReview_T001FlowTask.select
-- lookupStatementId: PDM_ProdReview_T001FlowTask.select
-- source: common_sqlmap.xml
-- type: select
-- params: {
--   "templateId": 1001,
--   "userID": 1001,
--   "order": "order by id desc"
-- }
SELECT ca.id as id,om.name as senderLoginName, ca.SUBJECT as subject, nvl(op.login_name, 'flowbot') sendername, ca.MEMBER_ID as memberId, ca.OBJECT_ID as objectId, ca.ACTIVITY_ID as activityId, to_char(ca.RECEIVE_TIME, 'yyyymmdd') as receiveTime, ca.STATE as state, ca.is_delete as isDelete, ca.TEMPLETE_ID as templeteId, cs.PROCESS_ID as processId from CTP_AFFAIR ca left join org_principal op on ca.sender_id = op.member_id left join org_member om on ca.sender_id = om.id left join col_summary cs on ca.object_id = cs.id where ca.app in (1) and ca.state in (3,7,8) and ca.templete_id = 1001 and ca.member_id = 1001 order by id desc;

-- statementId: CT_Approve_T006FlowTask.select
-- lookupStatementId: CT_Approve_T006FlowTask.select
-- source: common_sqlmap.xml
-- type: select
-- params: {
--   "templateId": 1001,
--   "userID": 1001,
--   "order": "order by id desc"
-- }
SELECT ca.id as id,om.name as senderLoginName, ca.SUBJECT as subject, nvl(op.login_name, 'flowbot') sendername, ca.MEMBER_ID as memberId, ca.OBJECT_ID as objectId, ca.ACTIVITY_ID as activityId, to_char(ca.RECEIVE_TIME, 'yyyymmdd') as receiveTime, ca.STATE as state, ca.is_delete as isDelete, ca.TEMPLETE_ID as templeteId, cs.PROCESS_ID as processId from CTP_AFFAIR ca left join org_principal op on ca.sender_id = op.member_id left join org_member om on ca.sender_id = om.id left join col_summary cs on ca.object_id = cs.id where ca.app in (1) and ca.state in (3,7,8) and ca.templete_id = 1001 and ca.member_id = 1001 order by id desc;

-- statementId: DC_External_T002FlowTask.select
-- lookupStatementId: DC_External_T002FlowTask.select
-- source: common_sqlmap.xml
-- type: select
-- params: {
--   "templateId": 1001,
--   "userID": 1001,
--   "order": "order by id desc"
-- }
SELECT ca.id as id,om.name as senderLoginName, ca.SUBJECT as subject, nvl(op.login_name, 'flowbot') sendername, ca.MEMBER_ID as memberId, ca.OBJECT_ID as objectId, ca.ACTIVITY_ID as activityId, to_char(ca.RECEIVE_TIME, 'yyyymmdd') as receiveTime, ca.STATE as state, ca.is_delete as isDelete, ca.TEMPLETE_ID as templeteId, cs.PROCESS_ID as processId from CTP_AFFAIR ca left join org_principal op on ca.sender_id = op.member_id left join org_member om on ca.sender_id = om.id left join col_summary cs on ca.object_id = cs.id where ca.app in (1) and ca.state in (3,7,8) and ca.templete_id = 1001 and ca.member_id = 1001 order by id desc;

-- statementId: getFormBindInfo.select
-- lookupStatementId: getFormBindInfo.select
-- source: common_sqlmap.xml
-- type: select
-- params: {}
select field0007 as key,field0008 as value from formmain_3537;

-- statementId: findFormOperationId.select
-- lookupStatementId: findFormOperationId.select
-- source: common_sqlmap.xml
-- type: select
-- params: {
--   "viewName": "NAME_001",
--   "tableName": "NAME_001"
-- }
SELECT to_char(replace(wm_concat(t.name || '.' || t.value),',','_')) as id FROM (select '/QueryList/Query[@name="' || 'NAME_001' || '"]/ShowsThrough/Colum' XPATH, f.* from form_definition f where f.name = 'NAME_001') f, xmltable(f.XPATH passing xmltype(nvl(f.query_info, '<root/>')) columns "NAME" path '@name', "VALUE" path '@value') t;

-- statementId: findTemplatedByBingName.select
-- lookupStatementId: findTemplatedByBingName.select
-- source: common_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select c.templete_number from ctp_template c where subject = 'VALUE_001' and c.templete_number is not null;

-- statementId: findRptDesignIdByRptDesignName.select
-- lookupStatementId: findRptDesignIdByRptDesignName.select
-- source: common_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select vr.id from VREPORT_RECORD vr where vr.record_subject = 'VALUE_001';

-- statementId: findMeetingRoomManagerById.select
-- lookupStatementId: findMeetingRoomManagerById.select
-- source: common_sqlmap.xml
-- type: select
-- params: {
--   "currentUserId": 1001
-- }
select OFF_ADMIN from MEETING_ROOM where OFF_ADMIN=1001;

-- statementId: findConfereesByMeetingId.select
-- lookupStatementId: findConfereesByMeetingId.select
-- source: common_sqlmap.xml
-- type: select
-- params: {
--   "meetingId": 1001
-- }
select CONFEREES from meeting where id=1001;

-- statementId: findMemeberNameByDepartmentId.select
-- lookupStatementId: findMemeberNameByDepartmentId.select
-- source: common_sqlmap.xml
-- type: select
-- params: {
--   "departmentId": 1001
-- }
select name from ORG_MEMBER where ORG_DEPARTMENT_ID=1001 and IS_ENABLE='1' and STATE='1' and IS_DELETED='0';

-- statementId: findMemeberNameByMemberId.select
-- lookupStatementId: findMemeberNameByMemberId.select
-- source: common_sqlmap.xml
-- type: select
-- params: {
--   "memberId": 1001
-- }
select name from ORG_MEMBER where id=1001 and IS_ENABLE='1' and STATE='1' and IS_DELETED='0';

-- statementId: findMemeberNameByAccountId.select
-- lookupStatementId: findMemeberNameByAccountId.select
-- source: common_sqlmap.xml
-- type: select
-- params: {
--   "accountId": 1
-- }
select name from ORG_MEMBER where ORG_ACCOUNT_ID=1 and IS_ENABLE='1' and STATE='1' and IS_DELETED='0';

-- statementId: getWhiteRightId.select
-- lookupStatementId: getWhiteRightId.select
-- source: common_sqlmap.xml
-- type: select
-- params: {}
select RIGHTID from VM_WHITERIGHTID_FORM;

-- statementId: fieldMap.select
-- lookupStatementId: fieldMap.select
-- source: common_sqlmap.xml
-- type: select
-- params: "VALUE_001"
SELECT T.* FROM (SELECT T2.Field_Info FROM FORM_DEFINITION T2 WHERE T2.name='VALUE_001') S1, XMLTABLE('TableList/Table/FieldList/Field' PASSING XMLTYPE(S1.Field_Info) COLUMNS "name" VARCHAR2(50) PATH '@name', "display" VARCHAR2(50) PATH '@display') T;

-- statementId: getNodeConfigurarion.select
-- lookupStatementId: getNodeConfigurarion.select
-- source: common_sqlmap.xml
-- type: select
-- params: {
--   "activityId": 1001,
--   "workFlowId": 1001
-- }
select extractvalue(xmltype(w.workflow), '/ps/p/n[@d][@i="' || 1001 || '"]/@d') as d from wf_process_templete w where id = 1001;

-- statementId: templateInfoByTemplateId.select
-- lookupStatementId: templateInfoByTemplateId.select
-- source: common_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select cp.workflow_id, cp.form_appid from ctp_template cp where id = 'VALUE_001';

-- statementId: formNameByFormAppId.select
-- lookupStatementId: formNameByFormAppId.select
-- source: common_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select name from form_definition where id = 'VALUE_001';

-- statementId: getCapFormDefNameById.select
-- lookupStatementId: getCapFormDefNameById.select
-- source: common_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select name from cap_form_definition where id = 'VALUE_001';

-- statementId: findFieldMap.select
-- lookupStatementId: findFieldMap.select
-- source: common_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select distinct vc_fieldname,vc_fielddisplay from vm_formfield where n_formid= 'VALUE_001';

-- statementId: DT_DirectorManager_T001.select
-- lookupStatementId: DT_DirectorManager_T001.select
-- source: common_sqlmap.xml
-- type: select
-- params: {
--   "isResume": "RAW_VALUE",
--   "name": "NAME_001",
--   "orgId": 1001,
--   "idType": 1001,
--   "idNumber": 1001,
--   "status": 1
-- }
select id, util_common.getEnumValueById(org_id) as org_id, name, util_common.getEnumValueById(gender) as gender, util_common.getEnumValueById(post) as post, education, positional_title, decode(RAW_VALUE,'1',nvl('',present_post_desc)) as present_post_desc , util_common.getEnumValueById(id_type) as id_type, id_number, util_common.getEnumValueById(status) as status, to_char(date_of_appoint,'YYYY-MM-DD') as date_of_appoint, to_char(date_of_depart,'YYYY-MM-DD') as date_of_depart, remark, decode(RAW_VALUE,'1',nvl('',presvious_post_desc)) as presvious_post_desc , serial_number from vm_company_directors_info where 1=1 and name like '%' || 'NAME_001'||'%' and util_common.getEnumValueById(org_id) = 1001 and util_common.getEnumValueById(id_type) = 1001 and id_number like '%' || 1001||'%' and util_common.getEnumValueById(status) = 1;

-- statementId: DT_DirectorManager_T001.select.count
-- lookupStatementId: DT_DirectorManager_T001.select.count
-- source: common_sqlmap.xml
-- type: select
-- params: {
--   "name": "NAME_001",
--   "orgId": 1001,
--   "idType": 1001,
--   "idNumber": 1001,
--   "status": 1
-- }
select count(*) from vm_company_directors_info where 1=1 and name like '%' || 'NAME_001'||'%' and util_common.getEnumValueById(org_id) = 1001 and util_common.getEnumValueById(id_type) = 1001 and id_number like '%' || 1001||'%' and util_common.getEnumValueById(status) = 1;

-- statementId: memberIdByPostCode.select
-- lookupStatementId: memberIdByPostCode.select
-- source: common_sqlmap.xml
-- type: select
-- params: {
--   "code": "CODE_001",
--   "accounId": 1001
-- }
select o.source_id from org_relationship o where o.objective1_id = (select id from org_post o where o.code = 'CODE_001' and o.org_account_id = 1001);

-- statementId: ExtendedAttributesByTemplateNumber.select
-- lookupStatementId: ExtendedAttributesByTemplateNumber.select
-- source: common_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select field0007 as attrNum,field0008 as nodeNum,field0009 attrName,field0010 attrValue,field0011 as attrRemark from formson_2231 a left join formmain_2229 b on a.formmain_id=b.id where b.field0001 ='VALUE_001';

-- statementId: CL_EXPORTCOM_T001.select
-- lookupStatementId: CL_EXPORTCOM_T001.select
-- source: common_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select grade,mainpoints,referenceevaluationmethod,specificAssessment,util_common.getEnumShowById( assessmentResult) as assessmentResult ,correctivePlanAndAction,util_user.getMemberNameByMemId(designatedcontactperson) as designatedcontactperson,ctp_attachment.fileName as noteTheFile,remark from vm_selfEvaluationChildInfo left join ctp_attachment on vm_selfEvaluationChildInfo.noteTheFile =ctp_attachment.sub_reference where formmainId='VALUE_001' order by grade;

-- statementId: CL_EXPORTCOM_T002.select
-- lookupStatementId: CL_EXPORTCOM_T002.select
-- source: common_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select grade as grade_exp,mainpoints as mainpoints_exp,referenceevaluationmethod as referenceevaluationmethod_exp,util_user.getMemberNameByMemId(designatedcontactperson) as designatedcontactperson_exp,specificAssessment as specificAssessment_exp,util_common.getEnumShowById( assessmentResult) as assessmentResult_exp ,correctivePlanAndAction as correctivePlanAndAction_exp ,ctp_attachment.fileName as noteTheFile_exp, remark as remark_exp,util_common.getEnumShowById(reviewOpinion) as reviewOpinion_exp ,theFactDescription as theFactDescription_exp,reviewRsultConfirmOpinions as reviewRsultConfirmOpinions_exp from vm_selfEvaluationChildInfo left join ctp_attachment on vm_selfEvaluationChildInfo.noteTheFile =ctp_attachment.sub_reference where formmainId='VALUE_001' order by grade;

-- statementId: CL_POPM_T001.select
-- lookupStatementId: CL_POPM_T001.select
-- source: common_sqlmap.xml
-- type: select
-- params: {
--   "topic": "TITLE_001",
--   "applyUser": "VALUE_001",
--   "createDateBegin": "2026-05-14",
--   "createDateEnd": "2026-05-14",
--   "order": "order by id desc"
-- }
select * from ( select id,(CASE msg WHEN '0' THEN '1' WHEN '1' THEN '2' ELSE '其他' END) as type,msg, util_user.getMemberNameByMemId(applyUser) as apply_user ,applyUser, to_char(applyDate,'YYYY-MM-DD') as create_date , applyDate,state, topic,mail,title, (CASE WHEN mail = '1' THEN lmpcontent WHEN msg = '1' THEN lmpcontent||msgContent ELSE lmpcontent||'其他' END) as lmpcontent from vm_launchMaterialProcess vm where finishedflag =1 union all select id,(CASE msg WHEN '0' THEN '1' WHEN '1' THEN '2' ELSE '其他' END) as type,msg, util_user.getMemberNameByMemId(applyUser) as apply_user ,applyUser, to_char(applyDate,'YYYY-MM-DD') as create_date ,applyDate, state, topic,mail,title, (CASE WHEN mail = '1' THEN lmpcontent WHEN msg = '1' THEN lmpcontent||msgContent ELSE lmpcontent||'其他' END) as lmpcontent from vm_customerserviceprocess where finishedflag =1 union all select id,(CASE msg WHEN '0' THEN '1' WHEN '1' THEN '2' ELSE '其他' END) as type,msg, util_user.getMemberNameByMemId(applyUser) as apply_user ,applyUser, to_char(applyDate,'YYYY-MM-DD') as create_date ,applyDate, state, topic,mail,title, (CASE WHEN mail = '1' THEN lmpcontent WHEN msg = '1' THEN lmpcontent||msgContent ELSE lmpcontent||'其他' END) as lmpcontent from vm_customerserviceprocess_cap4 where finishedflag =1 union all select id,(CASE msg WHEN '0' THEN '1' WHEN '1' THEN '2' ELSE '其他' END) as type,msg, util_user.getMemberNameByMemId(applyUser) as apply_user ,applyUser, to_char(applyDate,'YYYY-MM-DD') as create_date , applyDate,state, topic,mail,title, (CASE WHEN mail = '1' THEN lmpcontent WHEN msg = '1' THEN lmpcontent||msgContent ELSE lmpcontent||'其他' END) as lmpcontent from vm_launchMaterialProcess_cap4 where finishedflag =1 ) where 1 = 1 and util_user.getMemberNameByMemId(applyUser) like '%' || 'VALUE_001' || '%' and to_date('2026-05-14','yyyy-mm-dd') <= trunc(applyDate) and to_date('2026-05-14','yyyy-mm-dd') >= trunc(applyDate) order by id desc;

-- statementId: CL_POPM_T001.select.count
-- lookupStatementId: CL_POPM_T001.select.count
-- source: common_sqlmap.xml
-- type: select
-- params: {
--   "topic": "TITLE_001",
--   "applyUser": "VALUE_001",
--   "createDateBegin": "2026-05-14",
--   "createDateEnd": "2026-05-14",
--   "order": "order by id desc"
-- }
select count(*) from ( select id,(CASE msg WHEN '0' THEN '1' WHEN '1' THEN '2' ELSE '其他' END) as type,msg, util_user.getMemberNameByMemId(applyUser) as apply_user ,applyUser, to_char(applyDate,'YYYY-MM-DD') as create_date , applyDate,state, topic,mail,title, (CASE WHEN mail = '1' THEN lmpcontent WHEN msg = '1' THEN lmpcontent||msgContent ELSE lmpcontent||'其他' END) as lmpcontent from vm_launchMaterialProcess vm where finishedflag =1 union all select id,(CASE msg WHEN '0' THEN '1' WHEN '1' THEN '2' ELSE '其他' END) as type,msg, util_user.getMemberNameByMemId(applyUser) as apply_user ,applyUser, to_char(applyDate,'YYYY-MM-DD') as create_date ,applyDate, state, topic,mail,title, (CASE WHEN mail = '1' THEN lmpcontent WHEN msg = '1' THEN lmpcontent||msgContent ELSE lmpcontent||'其他' END) as lmpcontent from vm_customerserviceprocess where finishedflag =1 union all select id,(CASE msg WHEN '0' THEN '1' WHEN '1' THEN '2' ELSE '其他' END) as type,msg, util_user.getMemberNameByMemId(applyUser) as apply_user ,applyUser, to_char(applyDate,'YYYY-MM-DD') as create_date ,applyDate, state, topic,mail,title, (CASE WHEN mail = '1' THEN lmpcontent WHEN msg = '1' THEN lmpcontent||msgContent ELSE lmpcontent||'其他' END) as lmpcontent from vm_customerserviceprocess_cap4 where finishedflag =1 union all select id,(CASE msg WHEN '0' THEN '1' WHEN '1' THEN '2' ELSE '其他' END) as type,msg, util_user.getMemberNameByMemId(applyUser) as apply_user ,applyUser, to_char(applyDate,'YYYY-MM-DD') as create_date , applyDate,state, topic,mail,title, (CASE WHEN mail = '1' THEN lmpcontent WHEN msg = '1' THEN lmpcontent||msgContent ELSE lmpcontent||'其他' END) as lmpcontent from vm_launchMaterialProcess_cap4 where finishedflag =1 ) where 1=1 and util_user.getMemberNameByMemId(applyUser) like '%' || 'VALUE_001' || '%' and to_date('2026-05-14','yyyy-mm-dd') <= trunc(applyDate) and to_date('2026-05-14','yyyy-mm-dd') >= trunc(applyDate) order by id desc;

-- statementId: formContent.insert
-- lookupStatementId: formContent.insert
-- source: common_sqlmap.xml
-- type: insert
-- params: {
--   "type": "VALUE_001",
--   "formId": 1001,
--   "module_template_id": 1001,
--   "content_template_id": 1001,
--   "title": "TITLE_001"
-- }
insert into ctp_content_all (ID, CREATE_ID, CREATE_DATE, MODIFY_ID, MODIFY_DATE, MODULE_TYPE, MODULE_ID, MODULE_TEMPLATE_ID, CONTENT_TYPE, CONTENT, CONTENT_DATA_ID, CONTENT_TEMPLATE_ID, TITLE, SORT) values (util_common.getAbsID, '-6760911671874597139', sysdate, '-6760911671874597139', sysdate, 'VALUE_001', 1001, 1001, '20', '', 1001, 1001, 'TITLE_001', '0');

-- statementId: h5Source.select
-- lookupStatementId: h5Source.select
-- source: common_sqlmap.xml
-- type: select
-- params: {}
select TEMPLATE_CODE, TEMPLATE_ID, APP_ID,TABLE_NAME from vm_h5paramconfig;

-- statementId: allPrivRoleMenu.select
-- lookupStatementId: allPrivRoleMenu.select
-- source: common_sqlmap.xml
-- type: select
-- params: {}
select menuid from PRIV_ROLE_MENU;

-- statementId: cap4BtnConfigByFormId.select
-- lookupStatementId: cap4BtnConfigByFormId.select
-- source: common_sqlmap.xml
-- type: select
-- params: {
--   "formId": 1001,
--   "buttonName": "NAME_001"
-- }
select customBtnName tableName, bindId, implClassPath, implClassBeanName, extendField, functionDesc from vm_customBtnConfig where bindId = 1001 and customBtnName = 'NAME_001';

-- statementId: CL_RoadShow0001_R001V1.select
-- lookupStatementId: CL_RoadShow0001_R001V1.select
-- source: common_sqlmap.xml
-- type: select
-- params: {
--   "applyDateStart": "2026-05-14",
--   "applyDateEnd": "2026-05-14",
--   "deptCode": "CODE_001",
--   "applierCode": "CODE_001",
--   "title": "TITLE_001",
--   "fundername": "NAME_001",
--   "way": "VALUE_001"
-- }
select 'CL_RoadShow0001_R001' as templateId, id, applierCode, applierName, applyDeptCode, applyOrgName, applyDate, title, way, startTime, endTime, wfStatus, prodCodeJoin, prodNameJoin, funderNameJoin, FundCodeJoin, customerName, stage, custid from vm_wf_CL_RoadShow0001_R001 v1 where util_org.inDepartmentGroup(util_org.getDeptIdByDeptCode(applyDeptCode), 'structLine') = 1 AND to_date(v1.applyDate ,'yyyy-mm-dd') >=to_date('2026-05-14','yyyy-mm-dd') AND to_date(v1.applyDate ,'yyyy-mm-dd') <=to_date('2026-05-14','yyyy-mm-dd') AND applyDeptCode = 'CODE_001' AND applierCode = 'CODE_001' AND title like '%'||'TITLE_001'||'%' AND fundernamejoin like '%'||'NAME_001'||'%' AND way like '%'||'VALUE_001'||'%' order by applyDate desc;

-- statementId: CL_RoadShow0001_R001V1.select.count
-- lookupStatementId: CL_RoadShow0001_R001V1.select.count
-- source: common_sqlmap.xml
-- type: select
-- params: {
--   "applyDateStart": "2026-05-14",
--   "applyDateEnd": "2026-05-14",
--   "deptCode": "CODE_001",
--   "applierCode": "CODE_001",
--   "title": "TITLE_001",
--   "fundername": "NAME_001",
--   "way": "VALUE_001"
-- }
select count(*) from vm_wf_CL_RoadShow0001_R001 v1 where util_org.inDepartmentGroup(util_org.getDeptIdByDeptCode(applyDeptCode), 'structLine') = 1 AND to_date(v1.applyDate ,'yyyy-mm-dd') >=to_date('2026-05-14','yyyy-mm-dd') AND to_date(v1.applyDate ,'yyyy-mm-dd') <=to_date('2026-05-14','yyyy-mm-dd') AND applyDeptCode = 'CODE_001' AND applierCode = 'CODE_001' AND title like '%'||'TITLE_001'||'%' AND fundernamejoin like '%'||'NAME_001'||'%' AND way like '%'||'VALUE_001'||'%';

-- statementId: getHolidayCalendar.select
-- lookupStatementId: getHolidayCalendar.select
-- source: common_sqlmap.xml
-- type: select
-- params: {
--   "year": "VALUE_001",
--   "includeWeekend": "VALUE_001"
-- }
select to_char(datenum,'yyyy-mm-dd') datenum, isrest, datememo from table(util_common.getHolidays('VALUE_001','VALUE_001'));

-- statementId: deleteTableContent.delete
-- lookupStatementId: deleteTableContent.delete
-- source: common_sqlmap.xml
-- type: delete
-- params: {
--   "module_template_id": 1001,
--   "content_template_id": 1001,
--   "formId": 1001
-- }
delete from ctp_content_all c where module_template_id = 1001 and content_template_id = 1001 AND CONTENT_DATA_ID = 1001;

-- statementId: getUserInfoByCode.select
-- lookupStatementId: getUserInfoByCode.select
-- source: common_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select org.name as name, org.ext_attr_1 as cellPhone, org.ext_attr_2 as email, org.ext_attr_3 as tel, (select ext_attr_2 from org_unit where id = org.org_account_id) as address, vm.usertitle as userTitle, (select ext_attr_7 from org_unit where id = org.org_account_id) as url, (select name from org_unit where id = org.org_account_id) as company, org.org_account_id as accountId, vm.id as mainId, vm.traditionalName as traditionalName from org_member org left join vm_member vm on (org.code = vm.kmCode) where org.code = 'VALUE_001' and org.is_deleted = 0 and org.is_enable = 1;

-- statementId: getUserInfoByVmId.select
-- lookupStatementId: getUserInfoByVmId.select
-- source: common_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select org.name as name, org.ext_attr_1 as cellPhone, org.ext_attr_2 as email, org.ext_attr_3 as tel, (select ext_attr_2 from org_unit where id = org.org_account_id) as address, vm.usertitle as userTitle, (select ext_attr_7 from org_unit where id = org.org_account_id) as url, (select name from org_unit where id = org.org_account_id) as company, vm.id as mainId from org_member org left join vm_member vm on (org.code = vm.kmCode) where vm.id = 'VALUE_001' and org.is_deleted = 0 and org.is_enable = 1;

-- statementId: getUserInfoById.select
-- lookupStatementId: getUserInfoById.select
-- source: common_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select org.name as name, org.ext_attr_1 as cellPhone, org.ext_attr_2 as email, org.ext_attr_3 as tel, (select ext_attr_2 from org_unit where id = org.org_account_id) as address, vm.usertitle as userTitle, (select ext_attr_7 from org_unit where id = org.org_account_id) as url, (select name from org_unit where id = org.org_account_id) as company, org.org_account_id as companyId, vm.id as mainId from org_member org left join vm_member vm on (org.code = vm.kmCode) where org.id = 'VALUE_001' and org.is_deleted = 0 and org.is_enable = 1;

-- statementId: getAllUserCode.select
-- lookupStatementId: getAllUserCode.select
-- source: common_sqlmap.xml
-- type: select
-- params: {}
select kmCode from vm_member where kmCode is not null and status = '在职';

-- statementId: getDownloadUserInfoById.select
-- lookupStatementId: getDownloadUserInfoById.select
-- source: common_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select (select file_url from CTP_ATTACHMENT where SUB_REFERENCE = qrcode) as imgId from vm_member where kmCode is not null and id = 'VALUE_001';

-- statementId: getAllQrCodeId.select
-- lookupStatementId: getAllQrCodeId.select
-- source: common_sqlmap.xml
-- type: select
-- params: {}
select (select file_url from CTP_ATTACHMENT where SUB_REFERENCE = qrcode) as imgId, util_user.getMemberNameByMemCode(kmcode) name, hrid from vm_member where qrCode is not null and status = '在职';

-- statementId: getMemberNameById.select
-- lookupStatementId: getMemberNameById.select
-- source: common_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select (select name from org_member where id = userId) name from vm_member where id = 'VALUE_001';

-- statementId: Product_Element_T001.select
-- lookupStatementId: Product_Element_T001.select
-- source: common_sqlmap.xml
-- type: select
-- params: {
--   "productCode": "CODE_001",
--   "productName": "NAME_001",
--   "startDate": "2026-05-14",
--   "endDate": "2026-05-14",
--   "sendUser": "VALUE_001",
--   "flowStatus": 1,
--   "departCode": "'D001','D002'",
--   "order": "order by id desc"
-- }
select * from( select productName,/*产品名称*/ productCode,/*产品编号*/ id, send_date senddate, state flowStatus, util_user.getMemCodeByMemId(send_user) sendUser, util_org.getDeptCodeByDeptId(send_depart) departCode, util_user.getMemberNameByMemId(send_user) send_user, /*申请人 */ to_char(send_date, 'yyyy-mm-dd') send_date, /* 申请日期 */ util_org.getDeptNameByDeptId(send_depart) send_depart, /*申请部门 */ util_common.getEnumValueById(product_category) product_category, /*集合计划类型*/ product_fullname, /*产品全称 */ util_user.getMemberNameByMemIds(sales_member) sales_member, /*项目负责销售人员*/ util_user.getMemberNameByMemIds(investment_manager) investment_manager, /*投资经理 */ trustee_member, /*托管人名称 */ util_common.getEnumValueById(main_investment_strategy) main_investment_strategy, /*主要投资策略 */ administrative_fee, /*年管理费率 */ util_common.getEnumValueById(is_performance_reward) is_performance_reward, /*是否有业绩报酬 */ per_reward_percentage, /*业绩报酬计提比例 */ trustee_fee, /*年托管费率 */ duration, /*计划存续期限 */ util_common.getEnumValueById(is_fof) is_fof, /*是否为FOF产品 */ util_common.getEnumValueById(is_qdii) is_qdii, /*是否为QDII产品 */ util_common.getEnumValueById(settlement_mode) settlement_mode, /*结算模式 */ investment_scope, /* 投资范围 */ special_investment_target, /* 拟实际运用的特殊投资标的*/ investment_restriction, /* 投资限制 */ position_deadline, /*建仓期 */ performance_benchmark, /*业绩比较基准*/ util_common.getEnumValueById(is_warn_stop_loss_line) is_warn_stop_loss_line, /*有无预警止损条款*/ warn_line, /*预警线 */ stop_loss_line, /*止损线 */ util_common.getEnumValueById(is_income_distribute) is_income_distribute, /*是否进行收益分配 */ util_common.getEnumValueById(bond_valuation_method) bond_valuation_method, /*估值方法 */ util_common.getEnumValueById(valuation_check) valuation_check, /*估值日 */ util_common.getEnumValueById(product_investment_type) product_investment_type, /*产品投资类型*/ investment_objective, /*投资目标 */ client_fullname, /*委托人名称及数量*/ util_common.getEnumValueById(launch_confirmation_day) launch_confirmation_day, /*参与退出确认日 */ util_common.getEnumValueById(is_use_elect_sig) is_use_elect_sig, /*是否采用电子合同 */ per_reward_benchmark, /*业绩报酬绝对计提基准年化收益率*/ util_common.getEnumValueById(duration_unit) duration_unit, /*计划存续期限单位 */ debt_limit_lower, /*存款债券等债权类资产的比例占资产管理计划总资产下限 */ debt_limit_upper, /*存款债券等债权类资产的比例占资产管理计划总资产上限 */ stock_limit_lower, /*投资于股票等股权类资产占资产管理计划总资产的比例下限*/ stock_limit_upper, /*投资于股票等股权类资产占资产管理计划总资产的比例上限*/ shop_derivative_limit_lower, /*投资于商品及金融衍生品的持仓合约价值占资产管理计划总资产的比例下限*/ shop_derivative_limit_upper, /*投资于商品及金融衍生品的持仓合约价值占资产管理计划总资产的比例上限*/ derivative_limit_lower, /*衍生品账户权益占资产管理计划总资产的比例下限 */ derivative_limit_upper, /*衍生品账户权益占资产管理计划总资产的比例上限 */ p_opening_frequency, /*产品开放频率值*/ decode(p_opening_frequency, 1, p_open_frequency1_param1, 2, p_open_frequency2_param1, 3, p_open_frequency3_param1, 4, p_open_frequency4_param2, 5, p_open_frequency5_param1,6,'',7,'',0,'') p_opening_frequency_param1, decode(p_opening_frequency, 1, '', 2, util_common.getEnumShowById(p_open_frequency2_param2), 3, p_open_frequency3_param3, 4, '', 5, p_open_frequency5_param4,6,'',7,'',0,'') p_opening_frequency_param2, decode(p_opening_frequency, 1, '', 2, p_open_frequency2_param4, 3, '', 4, '', 5, p_open_frequency5_param3,6,'',7,'',0,'') p_opening_frequency_param3 from vm_wf_product_element_Double union all select productName,/*产品名称*/ productCode,/*产品编号*/ id, send_date senddate, state flowStatus, util_user.getMemCodeByMemId(send_user) sendUser, util_org.getDeptCodeByDeptId(send_depart) departCode, util_user.getMemberNameByMemId(send_user) send_user, /*申请人 */ to_char(send_date, 'yyyy-mm-dd') send_date, /* 申请日期 */ util_org.getDeptNameByDeptId(send_depart) send_depart, /*申请部门 */ util_common.getEnumValueById(product_category) product_category, /*集合计划类型*/ product_fullname, /*产品全称 */ util_user.getMemberNameByMemIds(sales_member) sales_member, /*项目负责销售人员*/ util_user.getMemberNameByMemIds(investment_manager) investment_manager, /*投资经理 */ trustee_member, /*托管人名称 */ util_common.getEnumValueById(main_investment_strategy) main_investment_strategy, /*主要投资策略 */ administrative_fee, /*年管理费率 */ util_common.getEnumValueById(is_performance_reward) is_performance_reward, /*是否有业绩报酬 */ per_reward_percentage, /*业绩报酬计提比例 */ trustee_fee, /*年托管费率 */ to_char(duration) duration, /*计划存续期限 */ util_common.getEnumValueById(is_fof) is_fof, /*是否为FOF产品 */ util_common.getEnumValueById(is_qdii) is_qdii, /*是否为QDII产品 */ util_common.getEnumValueById(settlement_mode) settlement_mode, /*结算模式 */ investment_scope, /* 投资范围 */ special_investment_target, /* 拟实际运用的特殊投资标的*/ investment_restriction, /* 投资限制 */ position_deadline, /*建仓期 */ performance_benchmark, /*业绩比较基准*/ util_common.getEnumValueById(is_warn_stop_loss_line) is_warn_stop_loss_line, /*有无预警止损条款*/ warn_line, /*预警线 */ stop_loss_line, /*止损线 */ util_common.getEnumValueById(is_income_distribute) is_income_distribute, /*是否进行收益分配 */ util_common.getEnumValueById(bond_valuation_method) bond_valuation_method, /*估值方法 */ util_common.getEnumValueById(valuation_check) valuation_check, /*估值日 */ util_common.getEnumValueById(product_investment_type) product_investment_type, /*产品投资类型*/ investment_objective, /*投资目标 */ client_fullname, /*委托人名称及数量*/ util_common.getEnumValueById(launch_confirmation_day) launch_confirmation_day, /*参与退出确认日 */ util_common.getEnumValueById(is_use_elect_sig) is_use_elect_sig, /*是否采用电子合同 */ per_reward_benchmark, /*业绩报酬绝对计提基准年化收益率*/ util_common.getEnumValueById(duration_unit) duration_unit, /*计划存续期限单位 */ debt_limit_lower, /*存款债券等债权类资产的比例占资产管理计划总资产下限 */ debt_limit_upper, /*存款债券等债权类资产的比例占资产管理计划总资产上限 */ stock_limit_lower, /*投资于股票等股权类资产占资产管理计划总资产的比例下限*/ stock_limit_upper, /*投资于股票等股权类资产占资产管理计划总资产的比例上限*/ shop_derivative_limit_lower, /*投资于商品及金融衍生品的持仓合约价值占资产管理计划总资产的比例下限*/ shop_derivative_limit_upper, /*投资于商品及金融衍生品的持仓合约价值占资产管理计划总资产的比例上限*/ derivative_limit_lower, /*衍生品账户权益占资产管理计划总资产的比例下限 */ derivative_limit_upper, /*衍生品账户权益占资产管理计划总资产的比例上限 */ p_opening_frequency, /*产品开放频率值*/ decode(p_opening_frequency, 1, '', 2, p_opening_frequency2_param2, 3, '') p_opening_frequency_param1, decode(p_opening_frequency, 1, '', 2, p_opening_frequency2_param4, 3, ''), decode(p_opening_frequency, 1, '', 2, p_opening_frequency2_param5, 3, '') p_opening_frequency_param3 from vm_wf_product_element_Single) t where 1=1 AND productCode like '%'||'CODE_001'||'%' AND productName like '%'||'NAME_001'||'%' AND senddate >=to_date('2026-05-14','YYYY-MM-DD') AND senddate <=to_date('2026-05-14','YYYY-MM-DD') AND sendUser = 'VALUE_001' AND flowStatus = 1 AND departCode in ('D001','D002') order by id desc;

-- statementId: Product_Element_T001.select.count
-- lookupStatementId: Product_Element_T001.select.count
-- source: common_sqlmap.xml
-- type: select
-- params: {
--   "productCode": "CODE_001",
--   "productName": "NAME_001",
--   "startDate": "2026-05-14",
--   "endDate": "2026-05-14",
--   "sendUser": "VALUE_001",
--   "flowStatus": 1,
--   "departCode": "'D001','D002'",
--   "order": "order by id desc"
-- }
select count('x') from( select productName,/*产品名称*/ productCode,/*产品编号*/ id, send_date senddate, state flowStatus, util_user.getMemCodeByMemId(send_user) sendUser, util_org.getDeptCodeByDeptId(send_depart) departCode, util_user.getMemberNameByMemId(send_user) send_user, /*申请人 */ to_char(send_date, 'yyyy-mm-dd') send_date, /* 申请日期 */ util_org.getDeptNameByDeptId(send_depart) send_depart, /*申请部门 */ util_common.getEnumValueById(product_category) product_category, /*集合计划类型*/ product_fullname, /*产品全称 */ util_user.getMemberNameByMemIds(sales_member) sales_member, /*项目负责销售人员*/ util_user.getMemberNameByMemIds(investment_manager) investment_manager, /*投资经理 */ trustee_member, /*托管人名称 */ util_common.getEnumValueById(main_investment_strategy) main_investment_strategy, /*主要投资策略 */ administrative_fee, /*年管理费率 */ util_common.getEnumValueById(is_performance_reward) is_performance_reward, /*是否有业绩报酬 */ per_reward_percentage, /*业绩报酬计提比例 */ trustee_fee, /*年托管费率 */ duration, /*计划存续期限 */ util_common.getEnumValueById(is_fof) is_fof, /*是否为FOF产品 */ util_common.getEnumValueById(is_qdii) is_qdii, /*是否为QDII产品 */ util_common.getEnumValueById(settlement_mode) settlement_mode, /*结算模式 */ investment_scope, /* 投资范围 */ special_investment_target, /* 拟实际运用的特殊投资标的*/ investment_restriction, /* 投资限制 */ position_deadline, /*建仓期 */ performance_benchmark, /*业绩比较基准*/ util_common.getEnumValueById(is_warn_stop_loss_line) is_warn_stop_loss_line, /*有无预警止损条款*/ warn_line, /*预警线 */ stop_loss_line, /*止损线 */ util_common.getEnumValueById(is_income_distribute) is_income_distribute, /*是否进行收益分配 */ util_common.getEnumValueById(bond_valuation_method) bond_valuation_method, /*估值方法 */ util_common.getEnumValueById(valuation_check) valuation_check, /*估值日 */ util_common.getEnumValueById(product_investment_type) product_investment_type, /*产品投资类型*/ investment_objective, /*投资目标 */ client_fullname, /*委托人名称及数量*/ util_common.getEnumValueById(launch_confirmation_day) launch_confirmation_day, /*参与退出确认日 */ util_common.getEnumValueById(is_use_elect_sig) is_use_elect_sig, /*是否采用电子合同 */ per_reward_benchmark, /*业绩报酬绝对计提基准年化收益率*/ util_common.getEnumValueById(duration_unit) duration_unit, /*计划存续期限单位 */ debt_limit_lower, /*存款债券等债权类资产的比例占资产管理计划总资产下限 */ debt_limit_upper, /*存款债券等债权类资产的比例占资产管理计划总资产上限 */ stock_limit_lower, /*投资于股票等股权类资产占资产管理计划总资产的比例下限*/ stock_limit_upper, /*投资于股票等股权类资产占资产管理计划总资产的比例上限*/ shop_derivative_limit_lower, /*投资于商品及金融衍生品的持仓合约价值占资产管理计划总资产的比例下限*/ shop_derivative_limit_upper, /*投资于商品及金融衍生品的持仓合约价值占资产管理计划总资产的比例上限*/ derivative_limit_lower, /*衍生品账户权益占资产管理计划总资产的比例下限 */ derivative_limit_upper, /*衍生品账户权益占资产管理计划总资产的比例上限 */ p_opening_frequency, /*产品开放频率值*/ decode(p_opening_frequency, 1, p_open_frequency1_param1, 2, p_open_frequency2_param1, 3, p_open_frequency3_param1, 4, p_open_frequency4_param2, 5, p_open_frequency5_param1,6,'',7,'',0,'') p_opening_frequency_param1, decode(p_opening_frequency, 1, '', 2, util_common.getEnumShowById(p_open_frequency2_param2), 3, p_open_frequency3_param3, 4, '', 5, p_open_frequency5_param4,6,'',7,'',0,'') p_opening_frequency_param2, decode(p_opening_frequency, 1, '', 2, p_open_frequency2_param4, 3, '', 4, '', 5, p_open_frequency5_param3,6,'',7,'',0,'') p_opening_frequency_param3 from vm_wf_product_element_Double union all select productName,/*产品名称*/ productCode,/*产品编号*/ id, send_date senddate, state flowStatus, util_user.getMemCodeByMemId(send_user) sendUser, util_org.getDeptCodeByDeptId(send_depart) departCode, util_user.getMemberNameByMemId(send_user) send_user, /*申请人 */ to_char(send_date, 'yyyy-mm-dd') send_date, /* 申请日期 */ util_org.getDeptNameByDeptId(send_depart) send_depart, /*申请部门 */ util_common.getEnumValueById(product_category) product_category, /*集合计划类型*/ product_fullname, /*产品全称 */ util_user.getMemberNameByMemIds(sales_member) sales_member, /*项目负责销售人员*/ util_user.getMemberNameByMemIds(investment_manager) investment_manager, /*投资经理 */ trustee_member, /*托管人名称 */ util_common.getEnumValueById(main_investment_strategy) main_investment_strategy, /*主要投资策略 */ administrative_fee, /*年管理费率 */ util_common.getEnumValueById(is_performance_reward) is_performance_reward, /*是否有业绩报酬 */ per_reward_percentage, /*业绩报酬计提比例 */ trustee_fee, /*年托管费率 */ to_char(duration) duration, /*计划存续期限 */ util_common.getEnumValueById(is_fof) is_fof, /*是否为FOF产品 */ util_common.getEnumValueById(is_qdii) is_qdii, /*是否为QDII产品 */ util_common.getEnumValueById(settlement_mode) settlement_mode, /*结算模式 */ investment_scope, /* 投资范围 */ special_investment_target, /* 拟实际运用的特殊投资标的*/ investment_restriction, /* 投资限制 */ position_deadline, /*建仓期 */ performance_benchmark, /*业绩比较基准*/ util_common.getEnumValueById(is_warn_stop_loss_line) is_warn_stop_loss_line, /*有无预警止损条款*/ warn_line, /*预警线 */ stop_loss_line, /*止损线 */ util_common.getEnumValueById(is_income_distribute) is_income_distribute, /*是否进行收益分配 */ util_common.getEnumValueById(bond_valuation_method) bond_valuation_method, /*估值方法 */ util_common.getEnumValueById(valuation_check) valuation_check, /*估值日 */ util_common.getEnumValueById(product_investment_type) product_investment_type, /*产品投资类型*/ investment_objective, /*投资目标 */ client_fullname, /*委托人名称及数量*/ util_common.getEnumValueById(launch_confirmation_day) launch_confirmation_day, /*参与退出确认日 */ util_common.getEnumValueById(is_use_elect_sig) is_use_elect_sig, /*是否采用电子合同 */ per_reward_benchmark, /*业绩报酬绝对计提基准年化收益率*/ util_common.getEnumValueById(duration_unit) duration_unit, /*计划存续期限单位 */ debt_limit_lower, /*存款债券等债权类资产的比例占资产管理计划总资产下限 */ debt_limit_upper, /*存款债券等债权类资产的比例占资产管理计划总资产上限 */ stock_limit_lower, /*投资于股票等股权类资产占资产管理计划总资产的比例下限*/ stock_limit_upper, /*投资于股票等股权类资产占资产管理计划总资产的比例上限*/ shop_derivative_limit_lower, /*投资于商品及金融衍生品的持仓合约价值占资产管理计划总资产的比例下限*/ shop_derivative_limit_upper, /*投资于商品及金融衍生品的持仓合约价值占资产管理计划总资产的比例上限*/ derivative_limit_lower, /*衍生品账户权益占资产管理计划总资产的比例下限 */ derivative_limit_upper, /*衍生品账户权益占资产管理计划总资产的比例上限 */ p_opening_frequency, /*产品开放频率值*/ decode(p_opening_frequency, 1, '', 2, p_opening_frequency2_param2, 3, '') p_opening_frequency_param1, decode(p_opening_frequency, 1, '', 2, p_opening_frequency2_param4, 3, ''), decode(p_opening_frequency, 1, '', 2, p_opening_frequency2_param5, 3, '') p_opening_frequency_param3 from vm_wf_product_element_Single) t where 1=1 AND productCode like '%'||'CODE_001'||'%' AND productName like '%'||'NAME_001'||'%' AND senddate >=to_date('2026-05-14','YYYY-MM-DD') AND senddate <=to_date('2026-05-14','YYYY-MM-DD') AND sendUser = 'VALUE_001' AND flowStatus = 1 AND departCode in ('D001','D002') order by id desc;

-- statementId: OAUserHelpConfig.select
-- lookupStatementId: OAUserHelpConfig.select
-- source: common_sqlmap.xml
-- type: select
-- params: {}
select id, flowNumber, xpath, helpDesc, helpUrl, urlSHowType, showType, fullText, helpEnableUrl from vm_oauserhelpconfig where isenable = -3841538853571705149;

-- statementId: findNeedSendAlertAffair.select
-- lookupStatementId: findNeedSendAlertAffair.select
-- source: common_sqlmap.xml
-- type: select
-- params: "VALUE_001"
VALUE_001;

-- statementId: browserInfo.insert
-- lookupStatementId: browserInfo.insert
-- source: common_sqlmap.xml
-- type: update
-- params: {
--   "formId": 1001,
--   "loginMember": "VALUE_001",
--   "loginDate": "2026-05-14",
--   "browserType": "VALUE_001",
--   "otherInfo": "VALUE_001",
--   "sourceMenuId": 1001,
--   "taskId": 1001,
--   "masterDateId": "2026-05-14"
-- }
insert into vm_memberLoginInfo (id, state, start_member_id, start_date, approve_member_id, approve_date, finishedflag, ratifyflag, ratify_member_id, ratify_date, sort, modify_member_id, modify_date, loginMember, loginDate, browserType, otherInfo, sourceMenuId, taskId, masterDateId ) values (1001, 1, -6760911671874597139, sysdate, 0, sysdate, 0, 0, 0, null, 0, -6760911671874597139, sysdate, 'VALUE_001', '2026-05-14', 'VALUE_001', 'VALUE_001', 1001, 1001, '2026-05-14' );

-- statementId: portalCustomizeMenu.select
-- lookupStatementId: portalCustomizeMenu.select
-- source: common_sqlmap.xml
-- type: select
-- params: {}
select id from portal_customize_menu;

-- statementId: portalIds.select
-- lookupStatementId: portalIds.select
-- source: common_sqlmap.xml
-- type: select
-- params: {}
select distinct portal_id from portal_nav where nav_type = 'menu';

-- statementId: getWorkFlowInfoByActivityId.select
-- lookupStatementId: getWorkFlowInfoByActivityId.select
-- source: common_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select form_id as "formId", form_name as "formName", wf_template_id as "wfTemplateId", wf_process_name as "wfProcessName", wf_activity_id as "wfActivityId", wf_activity_name as "wfActivityName", wf_activity_desc as "wfActivityDesc", wf_activity_extend_param as "wfActivityExtendParam", wf_activity_performer_type as "wfActivityPerformerType", wf_activity_performer_value as "wfActivityPerformerValue", wf_activity_performer_desc as "wfActivityPerformerDesc", wf_activity_performer_account as "wfActivityPerformerAccount", wf_activity_right_code as "wfActivityRightCode", wf_activity_right_name as "wfActivityRightName" from VM_WFACTIVITYINFO where wf_activity_id = 'VALUE_001';

-- statementId: getBulDateById.select
-- lookupStatementId: getBulDateById.select
-- source: common_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id as "id", title as "title", type_id as "typeId", publish_scope as "publishScope", publish_department_id as "publishDepartmentId", brief as "brief", keywords as "keywords", data_format as "dataFormat", create_date as "createDate", create_user as "createUser", audit_date as "auditDate", audit_user_id as "auditUserId", audit_advice as "auditAdvice", publish_date as "publishDate", publish_user_id as "publishUserId", pigeonhole_date as "pigeonholeDate", pigeonhole_user_id as "pigeonholeUserId", pigeonhole_path as "pigeonholePath", update_date as "updateDate", update_user as "updateUser", read_count as "readCount", top_order as "topOrder", state as "state", deleted_flag as "deletedFlag", accountid as "accountid", ext1 as "ext1", ext2 as "ext2", ext3 as "ext3", ext4 as "ext4", ext5 as "ext5", att_flag as "attFlag", show_publish_user_flag as "showPublishUserFlag", spacetype as "spacetype", publish_choose as "publishChoose", write_publish as "writePublish", open_record_read as "openRecordRead", short_content as "shortContent", hide_publish_scope_flag as "hidePublishScopeFlag", expire_date as "expireDate", top_number_group as "topNumberGroup", top_number_unit as "topNumberUnit", audit_type as "auditType", ceb_type as "cebType", out_permit as "outPermit" from bul_data where id = 'VALUE_001';

-- statementId: overdueNodeConfig.select
-- lookupStatementId: overdueNodeConfig.select
-- source: common_sqlmap.xml
-- type: select
-- params: {}
select id, templateNo, tableName, configNo, title, content, pushConditions, pushMember, configDisplay, isuse from vm_overduenoteconfig where isuse = -3841538853571705149;

-- statementId: postMemberByTaskName.select
-- lookupStatementId: postMemberByTaskName.select
-- source: common_sqlmap.xml
-- type: select
-- params: {
--   "businessModel": "VALUE_001",
--   "taskName": "NAME_001"
-- }
select f.mainmember || ',' || f.submember from VM_DEPTPOST f where util_common.getEnumShowById(f.busimodel)='VALUE_001' and f.questname='NAME_001';

-- statementId: rabbitMqFlowConf.select
-- lookupStatementId: rabbitMqFlowConf.select
-- source: common_sqlmap.xml
-- type: select
-- params: {}
select flowName, flowCode, flowBean, onStartFunctionName, onCancelFunctionName, onStopFunctionName, onStepBackFunctionName, onFinishedFunctionName, onWorkitemFunctionName, workitemNode, enable from vm_rabbitMqFlowConf where enable = -3841538853571705149;

-- statementId: rabbitMqConf.select
-- lookupStatementId: rabbitMqConf.select
-- source: common_sqlmap.xml
-- type: select
-- params: {}
select functionName, functionCode, exchangeName, enable from vm_rabbitMqConf where enable = -3841538853571705149;

-- statementId: rabbitMqQueueConf.select
-- lookupStatementId: rabbitMqQueueConf.select
-- source: common_sqlmap.xml
-- type: select
-- params: {}
select mqe.exchangeName as "exchangeName", mqe.exchangeType as "exchangeType", mqes.queueName as "queueName", mqes.routingkey as "routingkey", mqes.threshold as "threshold", mqes.percentage as "percentage", mqes.receiverFWork as "receiverFWork", mqes.finalThreshold as "finalThreshold" from vm_mq_exchange mqe left join vm_mq_exchange_son mqes on mqes.formmainId = mqe.id where mqes.isSendMessage = '-3841538853571705149';

-- statementId: queryQueueNameByFormmainId.select
-- lookupStatementId: queryQueueNameByFormmainId.select
-- source: common_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select mqes.queueName as "queueName" from vm_mq_exchange_son mqes left join vm_mq_exchange mqe on mqes.formmainId = mqe.id where mqes.formmainId = 'VALUE_001';

-- statementId: queryExchangeNameByDataId.select
-- lookupStatementId: queryExchangeNameByDataId.select
-- source: common_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select mqe.id as "id", mqe.exchangeName as "exchangeName", mqe.exchangeType as "exchangeType" from vm_mq_exchange mqe where mqe.id = 'VALUE_001';

-- statementId: insertQueueByExchangeName.insert
-- lookupStatementId: insertQueueByExchangeName.insert
-- source: common_sqlmap.xml
-- type: insert
-- params: {
--   "formmainId": 1001,
--   "queueName": "NAME_001",
--   "routingkey": "VALUE_001"
-- }
insert into vm_mq_exchange_son( id, formmainId, queueName, routingkey) values( util_common.getAbsID, 1001, 'NAME_001', 'VALUE_001' );

-- statementId: fgOnlineEditNoCallBack.select
-- lookupStatementId: fgOnlineEditNoCallBack.select
-- source: common_sqlmap.xml
-- type: select
-- params: {}
select to_char(id) "id", templateNo "templateNo", isCallBack "isCallBack", to_char(nvl(failRetryCount, '0')) "failRetryCount", contractFile "contractFile", totalContractAmount "totalContractAmount", counterparty "counterparty", contractAmountUpperForShort "contractAmountUpperForShort" from vm_onlineDocEdit f where f.isCallBack = -1089048568118490234 and (f.failRetryCount < 5 or f.failRetryCount is null);

-- statementId: getPushFailedTask.select
-- lookupStatementId: getPushFailedTask.select
-- source: common_sqlmap.xml
-- type: select
-- params: {}
select vfp.id as "id", vfp.url as "url", vfp.callType as "callType", vfp.lambdaFunction as "lambdaFunction", vfp.json as "json", vfm.beanName as "beanName", vfm.methedName as "methedName" from vm_fg_feature_push vfp left join vm_fg_feature_manage vfm on vfm.feature = vfp.feature where util_common.getEnumValueById(vfm.isOpen) = '1' and (vfp.status is null or util_common.getEnumValueById(vfp.status) = '1') and util_common.getEnumValueById(vfp.isNeedPush) = '1' order by util_common.getEnumValueById(vfm.priority) desc;

-- statementId: getPushFailedTaskById.select
-- lookupStatementId: getPushFailedTaskById.select
-- source: common_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select vfp.id as "id", vfp.url as "url", vfp.callType as "callType", vfp.lambdaFunction as "lambdaFunction", vfp.json as "json", vfm.beanName as "beanName", vfm.methedName as "methedName" from vm_fg_feature_push vfp left join vm_fg_feature_manage vfm on vfm.feature = vfp.feature where util_common.getEnumValueById(vfm.isOpen) = '1' and (vfp.status is null or util_common.getEnumValueById(vfp.status) = '1') and util_common.getEnumValueById(vfp.isNeedPush) = '1' and vfp.id = 'VALUE_001';

-- statementId: insertCtpContentAll.insert
-- lookupStatementId: insertCtpContentAll.insert
-- source: common_sqlmap.xml
-- type: insert
-- params: {
--   "moduleTemplateId": 1001,
--   "contentTemplateId": 1001,
--   "title": "TITLE_001",
--   "tableName": "demo_table"
-- }
insert into ctp_content_all (ID, CREATE_ID, CREATE_DATE, MODIFY_ID, MODIFY_DATE, MODULE_TYPE, MODULE_ID, MODULE_TEMPLATE_ID, CONTENT_TYPE, CONTENT, CONTENT_DATA_ID, CONTENT_TEMPLATE_ID, TITLE, SORT) select util_common.getAbsID, '-6760911671874597139', sysdate, '-6760911671874597139', sysdate, 42, id, 1001, '20', '', id, 1001, 'TITLE_001', '0' from demo_table vm where id not in(select content_data_id from ctp_content_all c where c.content_template_id = 1001 and content_data_id is not null);

-- statementId: insertCtp4ContentAll.insert
-- lookupStatementId: insertCtp4ContentAll.insert
-- source: common_sqlmap.xml
-- type: insert
-- params: {
--   "formId": 1001
-- }
insert into ctp_content_all (ID, CREATE_ID, CREATE_DATE, MODIFY_ID, MODIFY_DATE, MODULE_TYPE, MODULE_ID, MODULE_TEMPLATE_ID, CONTENT_TYPE, CONTENT, CONTENT_DATA_ID, CONTENT_TEMPLATE_ID, TITLE, SORT) ( select util_common.getAbsID, '-6760911671874597139', sysdate, '-6760911671874597139', sysdate, 42, id, moduleTemplateId, '20', '', id, contentTemplateId, 'CAP4-日志记录', '0' from vm_log_record vm where id =1001 );

-- statementId: findFGSQLFlowExecuteInfoByFlowInfo
-- lookupStatementId: findFGSQLFlowExecuteInfoByFlowInfo
-- source: common_sqlmap.xml
-- type: select
-- params: {
--   "templateCode": "CODE_001",
--   "eventType": "VALUE_001",
--   "eventName": [
--     "EVENT_A",
--     "EVENT_B"
--   ]
-- }
select to_char(fces.eventType) eventType, fces.SQLContent, eventname, to_char(fces.executeSort) executeSort from vm_cap4_eventDataDoc fed join vm_cap4_eventDataDocSon fces on fed.id = fces.formmain_id where fed.flowTemplateCode = 'CODE_001' and fces.eventType = 'VALUE_001' and fces.eventName IN ('EVENT_A','EVENT_B');

-- statementId: executeEventSQLByFlowInfo.update
-- lookupStatementId: executeEventSQLByFlowInfo.update
-- source: common_sqlmap.xml
-- type: update
-- params: "VALUE_001"
VALUE_001;

-- statementId: fgOnlineSonByMainId.select
-- lookupStatementId: fgOnlineSonByMainId.select
-- source: common_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id "id", formmain_id "formmain_id", paymentBatch "paymentBatch", paymentAmount "paymentAmount", expectedPaymentDate "expectedPaymentDate", percentage "percentage", paymentTerms "paymentTerms", remarks "remarks", paymentAmountUpperForShort "paymentAmountUpperForShort" from vm_fgonlinedocSon where formmain_id = 'VALUE_001';

-- statementId: dataUnloadByCode.select
-- lookupStatementId: dataUnloadByCode.select
-- source: common_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select writeDate, dataFileName, to_char(fileNameWithTime) fileNameWithTime, to_char(isNeedAttachment) isNeedAttachment, to_char(isZip) isZip, fileOutPath, dataUnloadCode from vm_dataUnloadConfig where dataUnloadCode = 'VALUE_001';

-- statementId: queryDepartPostRecord.select
-- lookupStatementId: queryDepartPostRecord.select
-- source: common_sqlmap.xml
-- type: select
-- params: {
--   "name": "NAME_001",
--   "modelId": 1001
-- }
select id "id", modifydate "modifydate", dept "dept", busimodel "busimodel", questname "questname", postscope "postscope", mainmember "mainmember", submember "submember" from vm_deptpost where 1 = 1 and questName = 'NAME_001' and busimodel = 1001;

-- statementId: findMenuNameById.select
-- lookupStatementId: findMenuNameById.select
-- source: common_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select distinct name,tableName from (select id,nvl(ext7, name) name,'priv_menu' tableName from priv_menu union all select id, show_name as name, 'portal_customize_menu' tableName from portal_customize_menu) where id = 'VALUE_001';

-- statementId: allEnableFilterMenu.select
-- lookupStatementId: allEnableFilterMenu.select
-- source: common_sqlmap.xml
-- type: select
-- params: {}
select to_char(filterType) filterType, menuName, to_char(menuId) menuId, to_char(enable) enable from vm_enumFilterConfigCap4 where enable = -3841538853571705149;

-- statementId: config.selectAllEnabled
-- lookupStatementId: config.selectAllEnabled
-- source: common_sqlmap.xml
-- type: select
-- params: {}
SELECT d.sysCode "sysCode", d.sourceHost "sourceHost", d.targetHost "targetHost", to_char(i.enable) "enable", i.interfaceCode "interfaceCode", to_char(i.startQingzhou) "startQingzhou", i.interfacePath "interfacePath", to_char(d.startQingzhouHost) "startQingzhouHost" FROM vm_qingzhou_domain d LEFT JOIN vm_qingzhou_interface_config i ON d.sysCode = i.sysCode WHERE i.enable = -3841538853571705149;

-- statementId: config.selectBySysCode
-- lookupStatementId: config.selectBySysCode
-- source: common_sqlmap.xml
-- type: select
-- params: "VALUE_001"
SELECT d.sysCode "sysCode", d.sourceHost "sourceHost", d.targetHost "targetHost", to_char(i.enable) "enable", i.interfaceCode "interfaceCode", to_char(i.startQingzhou) "startQingzhou", i.interfacePath "interfacePath", to_char(d.startQingzhouHost) "startQingzhouHost" FROM vm_qingzhou_domain d LEFT JOIN vm_qingzhou_interface_config i ON d.sysCode = i.sysCode WHERE d.sysCode = 'VALUE_001' AND i.enable = -3841538853571705149;

-- statementId: config.selectByInterfaceCode
-- lookupStatementId: config.selectByInterfaceCode
-- source: common_sqlmap.xml
-- type: select
-- params: "VALUE_001"
SELECT d.sysCode "sysCode", d.sourceHost "sourceHost", d.targetHost "targetHost", to_char(i.enable) "enable", i.interfaceCode "interfaceCode", to_char(i.startQingzhou) "startQingzhou", i.interfacePath "interfacePath", to_char(d.startQingzhouHost) "startQingzhouHost" FROM vm_qingzhou_domain d LEFT JOIN vm_qingzhou_interface_config i ON d.sysCode = i.sysCode WHERE i.interfaceCode = 'VALUE_001' AND i.enable = -3841538853571705149;

-- statementId: interfaceConfig.selectInterfaceCodesBySysCode
-- lookupStatementId: interfaceConfig.selectInterfaceCodesBySysCode
-- source: common_sqlmap.xml
-- type: select
-- params: "VALUE_001"
SELECT interfaceCode FROM vm_qingzhou_interface_config WHERE sysCode = 'VALUE_001' AND enable = -3841538853571705149;

-- statementId: mwork.selectAllPushConfigs
-- lookupStatementId: mwork.selectAllPushConfigs
-- source: common_sqlmap.xml
-- type: select
-- params: {}
SELECT p.id as id, p.matching_rule as matchingRule, p.channel_code as channelCode, p.is_enabled as isEnabled, p.regex_match as regexMatch, p.template_id as templateId, c.app_id as appId, c.app_secret as appSecret, c.title_prefix_config as titlePrefixConfig FROM vm_rich_work_push_config p LEFT JOIN vm_mwork_channel_config c ON p.channel_code = c.channel_code WHERE p.is_enabled = -3841538853571705149 /* 只查询启用的配置 */;

-- statementId: mwork.selectPushConfigById
-- lookupStatementId: mwork.selectPushConfigById
-- source: common_sqlmap.xml
-- type: select
-- params: "VALUE_001"
SELECT p.id as id, p.matching_rule as matchingRule, p.channel_code as channelCode, p.is_enabled as isEnabled, p.regex_match as regexMatch, p.template_id as templateId, c.app_id as appId, c.app_secret as appSecret, c.title_prefix_config as titlePrefixConfig FROM vm_rich_work_push_config p LEFT JOIN vm_mwork_channel_config c ON p.channel_code = c.channel_code WHERE p.id = 'VALUE_001';

-- statementId: mwork.selectPushConfigsByChannelCode
-- lookupStatementId: mwork.selectPushConfigsByChannelCode
-- source: common_sqlmap.xml
-- type: select
-- params: "VALUE_001"
SELECT p.id as id, p.matching_rule as matchingRule, p.channel_code as channelCode, p.is_enabled as isEnabled, p.regex_match as regexMatch, p.template_id as templateId, c.app_id as appId, c.app_secret as appSecret, c.title_prefix_config as titlePrefixConfig FROM vm_rich_work_push_config p LEFT JOIN vm_mwork_channel_config c ON p.channel_code = c.channel_code WHERE p.channel_code = 'VALUE_001' AND p.is_enabled = -3841538853571705149 /* 根据通道编码查询且启用的配置 */;

-- statementId: addNewActivity.insert
-- lookupStatementId: addNewActivity.insert
-- source: laborunion_sqlmap.xml
-- type: insert
-- params: {
--   "urlpreffix": "VALUE_001",
--   "boardId": [
--     "EVENT_A",
--     "EVENT_B"
--   ],
--   "preDays": "VALUE_001"
-- }
insert into vm_laborUnionActivity(id, state , start_member_id , start_date , approve_member_id , approve_date , finishedflag , ratifyflag , ratify_member_id , ratify_date , sort , modify_member_id , modify_date , activityName,activityChargeMember,articleDate,clubName,clubchargeMember, defaultNumber,articleUrl,articleId,replyKeywords,signedNumber,keyWords) select util_common.getAbsID(), 1,-6760911671874597139,SYSDATE,0,SYSDATE,0,0,0,null,0,-6760911671874597139,SYSDATE, atc.article_name, atc.issue_user_id, atc.issue_time, luc.clubName, luc.chargeMember, luc.defaultNumber, 'VALUE_001'||atc.id, atc.id, luc.replyKeywords, 0, luc.keyWords from BBS_ARTICLE atc left join vm_laborUnionClub luc on atc.article_name like '%' || (luc.keyWords) || '%' where atc.v3x_bbs_board_id is not null and atc.v3x_bbs_board_id in ('EVENT_A','EVENT_B') and not exists(select 1 from vm_laborUnionActivity lua where lua.articleId = atc.id ) and luc.status = -4520706962260276520 and (atc.state = 0 or atc.state = 2) and atc.issue_time > (sysdate - 'VALUE_001');

-- statementId: addNewActivityContentAll.insert
-- lookupStatementId: addNewActivityContentAll.insert
-- source: laborunion_sqlmap.xml
-- type: insert
-- params: {}
insert into ctp_content_all (ID, CREATE_ID, CREATE_DATE, MODIFY_ID, MODIFY_DATE, MODULE_TYPE, MODULE_ID, MODULE_TEMPLATE_ID, CONTENT_TYPE, CONTENT, CONTENT_DATA_ID, CONTENT_TEMPLATE_ID, TITLE, SORT) select util_common.getAbsID, '-6760911671874597139', sysdate, '-6760911671874597139', sysdate, 37, lua.id, '6512334920732788514', '20', '', lua.id, '-9151066781654103757', '工会俱乐部活动_管理', '0' from vm_laborUnionActivity lua where not exists ( select 1 from ctp_content_all cca where cca.content_data_id = lua.id );

-- statementId: addNewActivityDetail.insert
-- lookupStatementId: addNewActivityDetail.insert
-- source: laborunion_sqlmap.xml
-- type: insert
-- params: {}
insert into vm_activityDetail( id, state , start_member_id , start_date , approve_member_id , approve_date , finishedflag , ratifyflag , ratify_member_id , ratify_date , sort , modify_member_id , modify_date , activityName, articleId, articleDate, activityChargeMember, clubchargeMember, articleUrl, member, memberDept, signDate, signSeq, isvalid, isattend, manualStatus, clubName, activityId, replyId ) select id, state , start_member_id , start_date , approve_member_id , approve_date , finishedflag , ratifyflag , ratify_member_id , ratify_date , sort , modify_member_id , modify_date , activityName, articleId, articleDate, activityChargeMember, clubchargeMember, articleUrl, reply_user_id as member, memberDept, signDate, signSeq, isvalid, isattend, manualStatus, clubName, activityId, replyId from ( select row_number() over(partition by articleId,reply_user_id order by signDate) as row_num ,t.* from ( select util_common.getAbsID() as id, 1 as state, -6760911671874597139 as start_member_id, SYSDATE as start_date, 0 as approve_member_id, SYSDATE as approve_date, 0 as finishedflag, 0 as ratifyflag, 0 as ratify_member_id, null as ratify_date, 0 as sort, -6760911671874597139 as modify_member_id, SYSDATE as modify_date, ba.article_name as activityName, ba.id as articleId, ba.issue_time articleDate, ba.issue_user_id as activityChargeMember, vc.chargeMember as clubchargeMember, lua.articleUrl, bar.reply_user_id, om.org_department_id as memberDept, bar.reply_time as signDate, null as signSeq, -1089048568118490234 as isvalid, -1089048568118490234 as isattend, '0' as manualStatus, vc.clubName, lua.id activityId, bar.id replyId from bbs_article ba,BBS_ARTICLE_REPLY bar,vm_laborunionclub vc,vm_laborUnionActivity lua,org_member om where (ba.state=0/*正常*/ or ba.state=2/*结贴*/) and bar.state=0/*正常*/ and ba.id=bar.v3x_bbs_article_id and ba.article_name like '%' || vc.keyWords || '%' and (vc.replyKeywords is null or dbms_lob.instr(bar.content,vc.replyKeywords)>0) and lua.articleId=bar.v3x_bbs_article_id and om.id=bar.reply_user_id ) t ) where row_num=1 and (articleId,reply_user_id) not in (select ad.articleId,ad.member from vm_activityDetail ad);

-- statementId: addNewActivityDetailContentAll.insert
-- lookupStatementId: addNewActivityDetailContentAll.insert
-- source: laborunion_sqlmap.xml
-- type: insert
-- params: {}
insert into ctp_content_all (ID, CREATE_ID, CREATE_DATE, MODIFY_ID, MODIFY_DATE, MODULE_TYPE, MODULE_ID, MODULE_TEMPLATE_ID, CONTENT_TYPE, CONTENT, CONTENT_DATA_ID, CONTENT_TEMPLATE_ID, TITLE, SORT) select util_common.getAbsID, '-6760911671874597139', sysdate, '-6760911671874597139', sysdate, 37, ad.id, '-937912537866547341', '20', '', ad.id, '9216606476516151238', '工会俱乐部活动报名', '0' from vm_activityDetail ad where not exists ( select 1 from ctp_content_all cca where cca.content_data_id = ad.id );

-- statementId: setActivityDetailSeq.update
-- lookupStatementId: setActivityDetailSeq.update
-- source: laborunion_sqlmap.xml
-- type: update
-- params: {
--   "preDays": "VALUE_001"
-- }
update vm_activityDetail ads set ads.validSeq = (select b.rowno from (select row_number() over(partition by t.articleId order by t.signDate asc) rowno, rowid browid from vm_activityDetail t where t.manualStatus = '0' and t.articleId in (select id from bbs_article a where a.issue_time > sysdate - 'VALUE_001')) b where b.browid = ads.rowid), ads.signSeq = (select b.rowno from (select row_number() over(partition by t.articleId order by t.signDate asc) rowno, rowid browid from vm_activityDetail t where t.articleId in (select id from bbs_article a where a.issue_time > sysdate - 'VALUE_001')) b where b.browid = ads.rowid) where ads.articleId in (select id from bbs_article a where a.issue_time > sysdate - 'VALUE_001') and (ads.signSeq is null and ads.validSeq is null or ads.activityId in (select distinct activityId from vm_activityDetail where manualstatus = '1' and articleId in (select id from bbs_article a where a.issue_time > sysdate - 'VALUE_001')));

-- statementId: resetActivityDetailValid.update
-- lookupStatementId: resetActivityDetailValid.update
-- source: laborunion_sqlmap.xml
-- type: update
-- params: {}
update vm_activityDetail ads set ads.isValid = -1089048568118490234 where ads.manualStatus = '0' or ads.isattend = -1089048568118490234;

-- statementId: setActivityDetailValid.update
-- lookupStatementId: setActivityDetailValid.update
-- source: laborunion_sqlmap.xml
-- type: update
-- params: {}
update vm_activityDetail ads set ads.isValid = -3841538853571705149 where ads.validSeq <= ( select lua.defaultNumber-(select count(*) from vm_activityDetail ad where ad.activityId = lua.id and ad.isvalid=-3841538853571705149 and ad.manualStatus = '1') from vm_laborUnionActivity lua where lua.id = ads.activityId );

-- statementId: removeNoRecordReply.delete
-- lookupStatementId: removeNoRecordReply.delete
-- source: laborunion_sqlmap.xml
-- type: delete
-- params: {}
delete from vm_activityDetail ad where ad.replyId in (select id from bbs_article_reply where state = 1 );

-- statementId: updateMemberLimit.update
-- lookupStatementId: updateMemberLimit.update
-- source: laborunion_sqlmap.xml
-- type: update
-- params: {
--   "memberLimit": "VALUE_001",
--   "idList": [
--     "EVENT_A",
--     "EVENT_B"
--   ]
-- }
update vm_laborUnionActivity lua set lua.defaultNumber = 'VALUE_001' where lua.id in ('EVENT_A','EVENT_B');

-- statementId: getOverLimitActivivyInfo.select
-- lookupStatementId: getOverLimitActivivyInfo.select
-- source: laborunion_sqlmap.xml
-- type: select
-- params: {
--   "idList": [
--     "EVENT_A",
--     "EVENT_B"
--   ]
-- }
select lua.activityName as "activityName", lua.defaultNumber as "defaultNumber", adValid.validCount as "validCount" from vm_laborUnionActivity lua left join (select ad.articleId,count(ad.articleId) validCount from vm_activityDetail ad where ad.isvalid = -3841538853571705149 group by ad.articleId) adValid on lua.articleId = adValid.articleId where lua.id in ('EVENT_A','EVENT_B');

-- statementId: updateClubChargeMember.update
-- lookupStatementId: updateClubChargeMember.update
-- source: laborunion_sqlmap.xml
-- type: update
-- params: {
--   "clubChargeMember": "VALUE_001",
--   "id": 1001
-- }
update vm_laborUnionActivity lua set lua.clubchargeMember = 'VALUE_001' where lua.clubName = (select luc.clubName from vm_laborUnionClub luc where luc.id = 1001 );

-- statementId: updateClubChargeMemberDetail.update
-- lookupStatementId: updateClubChargeMemberDetail.update
-- source: laborunion_sqlmap.xml
-- type: update
-- params: {
--   "clubChargeMember": "VALUE_001",
--   "id": 1001
-- }
update vm_activityDetail ad set ad.clubchargeMember = 'VALUE_001' where ad.clubName = (select luc.clubName from vm_laborUnionClub luc where luc.id = 1001 );

-- statementId: updateActivitySignedNumber.update
-- lookupStatementId: updateActivitySignedNumber.update
-- source: laborunion_sqlmap.xml
-- type: update
-- params: {}
update vm_laborUnionActivity lua set lua.signedNumber = ( select count(1) from vm_activityDetail ad where ad.articleId = lua.articleId );

-- statementId: productInfo.insert
-- lookupStatementId: productInfo.insert
-- source: productinfo_sqlmap.xml
-- type: insert
-- params: {
--   "id": 1001,
--   "pirId": 1001,
--   "prdCode": "CODE_001",
--   "fdShotnm": "VALUE_001",
--   "prdName": "NAME_001",
--   "status": 1,
--   "fundKind": "VALUE_001"
-- }
insert into vm_fundproductinfo (id, state, start_member_id, start_date, approve_member_id, approve_date, finishedflag, ratifyflag, ratify_member_id, ratify_date, sort, modify_member_id, modify_date, pirid, prdcode, fdShotnm, prdName, status, fundKind,isDeleted) values(1001, 1,-6760911671874597139,sysdate,0,sysdate,0,0,0,null,0,-6760911671874597139,sysdate, 1001,'CODE_001','VALUE_001','NAME_001',nvl(util_common.getEnumIdByRefName('产品状态',1),-6028337094634094342), nvl(util_common.getEnumIdByRefName('产品类别','VALUE_001'),2544872862693016953),'-1089048568118490234');

-- statementId: productIndoContentAll.insert
-- lookupStatementId: productIndoContentAll.insert
-- source: productinfo_sqlmap.xml
-- type: insert
-- params: "VALUE_001"
INSERT INTO CTP_CONTENT_ALL( ID , CREATE_ID , CREATE_DATE , MODIFY_ID , MODIFY_DATE , MODULE_TYPE , MODULE_ID , MODULE_TEMPLATE_ID , CONTENT_TYPE , CONTENT , CONTENT_DATA_ID , CONTENT_TEMPLATE_ID , TITLE , SORT ) VALUES(util_common.getID,-6760911671874597139,SYSDATE, -6760911671874597139,SYSDATE,37,'VALUE_001',913592139807475444, 20,null,'VALUE_001',-4665446821315130163,'产品信息',0);

-- statementId: productInfo.update
-- lookupStatementId: productInfo.update
-- source: productinfo_sqlmap.xml
-- type: update
-- params: {
--   "prdCode": "CODE_001",
--   "fdShotnm": "VALUE_001",
--   "prdName": "NAME_001",
--   "status": 1,
--   "fundKind": "VALUE_001",
--   "pirId": 1001
-- }
update vm_fundproductinfo set prdCode = 'CODE_001', fdShotnm = 'VALUE_001', prdName = 'NAME_001', isDeleted = '-1089048568118490234', status = nvl(util_common.getEnumIdByRefName('产品状态',1),-6028337094634094342), fundKind = nvl(util_common.getEnumIdByRefName('产品类别','VALUE_001'),2544872862693016953) where pirId = 1001;

-- statementId: productinfoByPirId.select
-- lookupStatementId: productinfoByPirId.select
-- source: productinfo_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id from vm_fundproductinfo where pirid = 'VALUE_001';

-- statementId: productManager.delete
-- lookupStatementId: productManager.delete
-- source: productinfo_sqlmap.xml
-- type: delete
-- params: "VALUE_001"
delete vm_fundproductinfoson where formmain_id = 'VALUE_001';

-- statementId: productManager.insert
-- lookupStatementId: productManager.insert
-- source: productinfo_sqlmap.xml
-- type: insert
-- params: {
--   "id": 1001,
--   "userId": 1001,
--   "sort": 1
-- }
insert into vm_fundproductinfoson(id,formmain_id,fundmanagername,sortid) values(util_common.getID,1001,1001,1);

-- statementId: applyManagerMeetingTime.select
-- lookupStatementId: applyManagerMeetingTime.select
-- source: productinfo_sqlmap.xml
-- type: select
-- params: {
--   "applyStartTime": "2026-05-14 10:00:00",
--   "applyEndTime": "2026-05-14 10:00:00",
--   "managerId": 1001
-- }
select to_char(begin_date,'yyyy-mm-dd hh24:mi') begin_date,to_char(end_date,'yyyy-mm-dd hh24:mi')end_date from meeting m where ( ('2026-05-14 10:00:00' between m.begin_date and m.end_date) or ('2026-05-14 10:00:00' between m.begin_date and m.end_date) or (m.begin_date between '2026-05-14 10:00:00' and '2026-05-14 10:00:00' and m.end_date between '2026-05-14 10:00:00' and '2026-05-14 10:00:00') ) and ( m.emcee_id = 1001 or m.recorder_id = 1001 or dbms_lob.instr(m.conferees,'Member|' || 1001)>0 );

-- statementId: applyManagerRoadShowTime.select
-- lookupStatementId: applyManagerRoadShowTime.select
-- source: productinfo_sqlmap.xml
-- type: select
-- params: {
--   "managerId": 1001
-- }
select to_char(starttime,'yyyy-mm-dd hh24:mi')as starttime,to_char(endtime,'yyyy-mm-dd hh24:mi')as endtime from vm_internalcooperationroadshow m where (select state from col_summary c where c.form_recordid = m.id)=3 and (m.manager1 = 1001 or m.manager2 = 1001 or m.manager3 = 1001);

-- statementId: applyManagerLeaveTime.select
-- lookupStatementId: applyManagerLeaveTime.select
-- source: productinfo_sqlmap.xml
-- type: select
-- params: {
--   "managerId": 1001
-- }
select to_char(trunc(t.beginDate)+decode( t.startTime,770469099444389055,0/24,3338464713283357441,12/24),'yyyy-mm-dd hh24:mi') starttime,to_char(trunc(t.endDate)+decode( t.endTime,770469099444389055,12/24,3338464713283357441,1),'yyyy-mm-dd hh24:mi') endtime from vm_userApplyForLeave t where t.beginDate>trunc(sysdate)-30 and t.applyUser=1001;

-- statementId: applyManagerEvectionTime.select
-- lookupStatementId: applyManagerEvectionTime.select
-- source: productinfo_sqlmap.xml
-- type: select
-- params: {
--   "managerId": 1001
-- }
select to_char(e.begindate,'yyyy-mm-dd hh24:mi')begindate, to_char(e.enddate + 1,'yyyy-mm-dd hh24:mi')enddate from vm_evations e where beginDate>trunc(sysdate)-30 and createmember = 1001;

-- statementId: msgSendMemberGet.select
-- lookupStatementId: msgSendMemberGet.select
-- source: productinfo_sqlmap.xml
-- type: select
-- params: {}
select seriesNum, to_char(starttime,'yyyy-mm-dd hh24:mi')as starttime, applyUser,manager1,join1, manager2,jion2, manager3,join3, customerName, demandType, demandTheme, msgSendStatus from vm_internalcooperationroadshow m where (sysdate+1/48) > startTime and msgSendStatus = 0 and sysdate <= startTime and (select state from col_summary c where c.form_recordid = m.id)=3;

-- statementId: msgSendStatusUpdate.update
-- lookupStatementId: msgSendStatusUpdate.update
-- source: productinfo_sqlmap.xml
-- type: update
-- params: "VALUE_001"
update vm_internalcooperationroadshow set msgSendStatus = 1 where seriesNum = 'VALUE_001';

-- statementId: fundAdmin.update
-- lookupStatementId: fundAdmin.update
-- source: productinfo_sqlmap.xml
-- type: update
-- params: {
--   "userId": 1001,
--   "id": 1001
-- }
update VM_ACCOUNTANT_GROUP set fundAdmin = 1001 where id = 1001;

-- statementId: findFundAdminByFundCode.select
-- lookupStatementId: findFundAdminByFundCode.select
-- source: productinfo_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id from VM_ACCOUNTANT_GROUP where fundCode = 'VALUE_001';

-- statementId: updateFundProductExtraInfo.update
-- lookupStatementId: updateFundProductExtraInfo.update
-- source: productinfo_sqlmap.xml
-- type: update
-- params: {
--   "productManager": "VALUE_001",
--   "fundAdmin": "VALUE_001",
--   "saleManager": "VALUE_001",
--   "taOperateManager": "VALUE_001",
--   "productID": 1001
-- }
update vm_fundproductinfo vm set vm.productManager = 'VALUE_001', vm.fundAdmin = 'VALUE_001', vm.saleManager = 'VALUE_001', vm.taOperateManager = 'VALUE_001' where vm.pirId = 1001 and (vm.productManager != 'VALUE_001' or vm.fundAdmin != 'VALUE_001' or vm.saleManager != 'VALUE_001' or vm.taOperateManager != 'VALUE_001' or vm.productManager is null or vm.fundAdmin is null or vm.saleManager is null or vm.taOperateManager is null);

-- statementId: findAbleSampleContractByProductId.select
-- lookupStatementId: findAbleSampleContractByProductId.select
-- source: productinfo_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select sampleNo as "sampleNo", writer as "writer", writeDept as "writeDept", writeDate as "writeDate", sampleState as "sampleState", productId as "productId", productName as "productName", productCatagory as "productCatagory", contractSampleFile as "contractSampleFile", remark as "remark", to_char(fileUpdateTime,'yyyy-mm-dd') as "fileUpdateTime", extraContractCount as "extraContractCount", contractSampleName as "contractSampleName", contractSampleFileId as "contractSampleFileId" from vm_one2manyContractAddSample where productId = 'VALUE_001' and sampleState = '752262829221953767';

-- statementId: updateSampleContractState.update
-- lookupStatementId: updateSampleContractState.update
-- source: productinfo_sqlmap.xml
-- type: update
-- params: {
--   "ableState": 1,
--   "productID": 1001
-- }
update vm_one2manyContractAddSample set sampleState = 1 where productId = 1001;

-- statementId: insertSampleContractState.insert
-- lookupStatementId: insertSampleContractState.insert
-- source: productinfo_sqlmap.xml
-- type: insert
-- params: {
--   "id": 1001,
--   "sampleNo": "VALUE_001",
--   "writer": "VALUE_001",
--   "writeDept": "VALUE_001",
--   "sampleState": 1,
--   "productID": 1001,
--   "productName": "NAME_001",
--   "productCatagory": "VALUE_001",
--   "contractSampleFile": "VALUE_001",
--   "fileUpdateTime": "2026-05-14",
--   "contractSampleName": "NAME_001",
--   "contractSampleFileId": 1001
-- }
insert into vm_one2manyContractAddSample( id, state, start_member_id, start_date, approve_member_id, approve_date, finishedflag, ratifyflag, ratify_member_id, ratify_date, sort, modify_member_id, modify_date, sampleNo, writer, writeDept, writeDate, sampleState, productId, productName, productCatagory, contractSampleFile, fileUpdateTime, contractSampleName, contractSampleFileId ) values( 1001, 1,-6760911671874597139,sysdate,0,sysdate,0,0,0,null,0,-6760911671874597139,sysdate, 'VALUE_001', 'VALUE_001', 'VALUE_001', sysdate, 1, 1001, 'NAME_001', 'VALUE_001', 'VALUE_001', '2026-05-14', 'NAME_001', 1001 );

-- statementId: getProductInfoByProductIds.select
-- lookupStatementId: getProductInfoByProductIds.select
-- source: productinfo_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id as "id", pirid as "pirid", fundkind as "fundkind", prdcode as "prdcode", prdname as "prdname", fdshotnm as "fdshotnm", status as "status", productManager as "productManager", fundAdmin as "fundAdmin", saleManager as "saleManager", regularMember as "regularMember", productTypeMonthly as "productTypeMonthly" from vm_fundproductinfo where pirid in (VALUE_001);

-- statementId: productInfoCAP4ByProductIds.select
-- lookupStatementId: productInfoCAP4ByProductIds.select
-- source: productinfo_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id, pirid, to_char(fundkind) fundkind, prdcode, prdname, fdshotnm, status, productManager, fundAdmin, saleManager, regularMember, to_char(productTypeMonthly) productTypeMonthly, taOperateManager, investType, fundType, mgrNameList, prdInvestType, mixTypeDirect, to_char(customType) customType, dutiesNameList as "dutiesNameList" from vm_cap4_fundproductinfo where pirid in (VALUE_001);

-- statementId: getProductByProductIdsAndDutiesIds.select
-- lookupStatementId: getProductByProductIdsAndDutiesIds.select
-- source: productinfo_sqlmap.xml
-- type: select
-- params: {
--   "productIds": "RAW_VALUE",
--   "filterDutiesIds": "RAW_VALUE"
-- }
select fm.fundManager as "fundManager" from vm_cap4_fundmanagers fm left join vm_cap4_fundproductinfo fp on fp.id = fm.formmain_id where fp.pirid in (RAW_VALUE) and fm.duties in (RAW_VALUE);

-- statementId: getProductInfoSonByFormId.select
-- lookupStatementId: getProductInfoSonByFormId.select
-- source: productinfo_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id as "id", formmain_id as "formmainId", fundmanagername as "fundManager" from vm_fundproductinfoson where formmain_id = 'VALUE_001' and fundmanagername is not null;

-- statementId: getDeptManagerByDeptId.select
-- lookupStatementId: getDeptManagerByDeptId.select
-- source: productinfo_sqlmap.xml
-- type: select
-- params: "VALUE_001"
SELECT SOURCE_ID FROM ORG_RELATIONSHIP RL WHERE RL.OBJECTIVE0_ID='VALUE_001' AND RL.TYPE = 'Member_Role' AND RL.OBJECTIVE1_ID IN (SELECT ID FROM ORG_ROLE R WHERE R.NAME = '部门经理');

-- statementId: updateProductCheckFlowBySerialNo.update
-- lookupStatementId: updateProductCheckFlowBySerialNo.update
-- source: productinfo_sqlmap.xml
-- type: update
-- params: {
--   "counterSigner": 1,
--   "whoKnows": "VALUE_001",
--   "affairId": 1001
-- }
update vm_wf_prodreview set counterSigner = 1, whoKnows = 'VALUE_001', superNodeState = 1 where flowId = 1001;

-- statementId: updateProductContractFlowBySerialNo.update
-- lookupStatementId: updateProductContractFlowBySerialNo.update
-- source: productinfo_sqlmap.xml
-- type: update
-- params: {
--   "counterSigner": 1,
--   "whoKnows": "VALUE_001",
--   "affairId": 1001
-- }
update VM_APPROVE set counterSigner = 1, whoKnows = 'VALUE_001', superNodeState = 1 where flowId = 1001;

-- statementId: queryAllFundProductId.select
-- lookupStatementId: queryAllFundProductId.select
-- source: productinfo_sqlmap.xml
-- type: select
-- params: {}
select pirid from vm_fundproductinfo;

-- statementId: updateFundProductRegularMember.update
-- lookupStatementId: updateFundProductRegularMember.update
-- source: productinfo_sqlmap.xml
-- type: update
-- params: {
--   "regularMember": "VALUE_001",
--   "productID": 1001
-- }
update vm_fundproductinfo set regularMember = 'VALUE_001' where pirid = 1001;

-- statementId: getLineInvestFixedConfig.select
-- lookupStatementId: getLineInvestFixedConfig.select
-- source: productinfo_sqlmap.xml
-- type: select
-- params: {
--   "configCode": "CODE_001"
-- }
select field0082 as "investFixedManager", field0083 as "investFixedDept" from formmain_6041 where field0048 = 'CODE_001';

-- statementId: updateFundManagersMain.update
-- lookupStatementId: updateFundManagersMain.update
-- source: productinfo_sqlmap.xml
-- type: update
-- params: {
--   "fundManagers": "VALUE_001",
--   "formId": 1001
-- }
update vm_fundproductinfo vm set vm.fundManagers = 'VALUE_001' where id = 1001;

-- statementId: getProductNoticeConfigByIdenNo.select
-- lookupStatementId: getProductNoticeConfigByIdenNo.select
-- source: productinfo_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select institutionBusiDepts as "institutionBusiDepts", eCommerceDepts as "eCommerceDepts", institutionServDepts as "institutionServDepts" from vm_productNoticeConfig where idenNo = 'VALUE_001';

-- statementId: getEstablishFlowInfoBySerialNo.select
-- lookupStatementId: getEstablishFlowInfoBySerialNo.select
-- source: productinfo_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select serialNo as "serialNo", proposedInvestManager as "proposedInvestManager", investDept1 as "investDept1", investDept2 as "investDept2", investDept3 as "investDept3", investManager1 as "investManager1", investManager2 as "investManager2", investManager3 as "investManager3", otherInvestManager1 as "otherInvestManager1", otherInvestManager2 as "investManager2", otherInvestManager3 as "investManager3", orgBusinessMember as "orgBusinessMember", retailerBusinessMember as "retailerBusinessMember", digitalFianceBusinessMember as "digitalFianceBusinessMember", regularCheckMember as "regularCheckMember" from vm_wf_publicfundapproval where serialNo = 'VALUE_001';

-- statementId: getConfigInfoSerialNo.select
-- lookupStatementId: getConfigInfoSerialNo.select
-- source: productinfo_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id as "id", createTime as "createTime", to_char(dm_mcsy_Regular) as "dm_mcsy_regular", to_char(dm_mcsy_Risk) as "dm_mcsy_risk", to_char(dm_mcsy_investRegularTeam) as "dm_mcsy_investRegularTeam", to_char(dm_mcsy_investMiddleTeam) as "dm_mcsy_investMiddleTeam", to_char(dm_mcsy_centralTrad) as "dm_mcsy_centralTrad", to_char(dm_mcsy_fixedIncomeTrad) as "dm_mcsy_fixedIncomeTrad", to_char(dm_mcsy_orgBusinessLine) as "dm_mcsy_orgBusinessLine", to_char(dm_mcsy_orgBusiness) as "dm_mcsy_orgBusiness", to_char(dm_mcsy_socialBankBusiness) as "dm_mcsy_socialBankBusiness", to_char(dm_mcsy_brokerBusiness) as "dm_mcsy_brokerBusiness", to_char(dm_mcsy_retailerBusiness) as "dm_mcsy_retailerBusiness", to_char(dm_mcsy_digitalFianceBusiness) as "dm_mcsy_digitalFianceBusiness", to_char(dm_mcsy_Operation) as "dm_mcsy_operation", to_char(dm_mcsy_informationTechnic) as "dm_mcsy_informationTechnic", to_char(dm_mcsy_humanResourses) as "dm_mcsy_humanResourses", to_char(dm_mcsy_planFinance) as "dm_mcsy_planFinance", to_char(dm_mcsy_customerservice) as "dm_mcsy_customerservice", to_char(dm_mcsy_comprehensive) as "dm_mcsy_comprehensive", to_char(dm_mcsy_marketmanager) as "dm_mcsy_marketmanager", to_char(hp_mcsy_Regular) as "hp_mcsy_regular", to_char(hp_mcsy_Risk) as "hp_mcsy_risk", to_char(hp_mcsy_investRegularTeam) as "hp_mcsy_investRegularTeam", to_char(hp_mcsy_investMiddleTeam) as "hp_mcsy_investMiddleTeam", to_char(hp_mcsy_centralTrad) as "hp_mcsy_centralTrad", to_char(hp_mcsy_fixedIncomeTrad) as "hp_mcsy_fixedIncomeTrad", to_char(hp_mcsy_orgBusinessLine) as "hp_mcsy_orgBusinessLine", to_char(hp_mcsy_orgBusiness) as "hp_mcsy_orgBusiness", to_char(hp_mcsy_socialBankBusiness) as "hp_mcsy_socialBankBusiness", to_char(hp_mcsy_brokerBusiness) as "hp_mcsy_brokerBusiness", to_char(hp_mcsy_retailerBusiness) as "hp_mcsy_retailerBusiness", to_char(hp_mcsy_digitalFianceBusiness) as "hp_mcsy_digitalFianceBusiness", to_char(hp_mcsy_Operation) as "hp_mcsy_operation", to_char(hp_mcsy_informationTechnic) as "hp_mcsy_informationTechnic", to_char(hp_mcsy_humanResourses) as "hp_mcsy_humanResourses", to_char(hp_mcsy_planFinance) as "hp_mcsy_planFinance", to_char(hp_mcsy_customerservice) as "hp_mcsy_customerservice", to_char(hp_mcsy_comprehensive) as "hp_mcsy_comprehensive", to_char(hp_mcsy_marketmanager) as "hp_mcsy_marketmanager", to_char(dm_rlmr_Regular) as "dm_rlmr_regular", to_char(dm_rlmr_Risk) as "dm_rlmr_risk", to_char(dm_rlmr_investRegularTeam) as "dm_rlmr_investRegularTeam", to_char(dm_rlmr_investMiddleTeam) as "dm_rlmr_investMiddleTeam", to_char(dm_rlmr_centralTrad) as "dm_rlmr_centralTrad", to_char(dm_rlmr_fixedIncomeTrad) as "dm_rlmr_fixedIncomeTrad", to_char(dm_rlmr_orgBusinessLine) as "dm_rlmr_orgBusinessLine", to_char(dm_rlmr_orgBusiness) as "dm_rlmr_orgBusiness", to_char(dm_rlmr_socialBankBusiness) as "dm_rlmr_socialBankBusiness", to_char(dm_rlmr_brokerBusiness) as "dm_rlmr_brokerBusiness", to_char(dm_rlmr_retailerBusiness) as "dm_rlmr_retailerBusiness", to_char(dm_rlmr_digitalFianceBusiness) as "dm_rlmr_digitalFianceBusiness", to_char(dm_rlmr_Operation) as "dm_rlmr_operation", to_char(dm_rlmr_informationTechnic) as "dm_rlmr_informationTechnic", to_char(dm_rlmr_humanResourses) as "dm_rlmr_humanResourses", to_char(dm_rlmr_planFinance) as "dm_rlmr_planFinance", to_char(dm_rlmr_customerservice) as "dm_rlmr_customerservice", to_char(dm_rlmr_comprehensive) as "dm_rlmr_comprehensive", to_char(dm_rlmr_marketmanager) as "dm_rlmr_marketmanager", to_char(hp_rlmr_Regular) as "hp_rlmr_regular", to_char(hp_rlmr_Risk) as "hp_rlmr_risk", to_char(hp_rlmr_investRegularTeam) as "hp_rlmr_investRegularTeam", to_char(hp_rlmr_investMiddleTeam) as "hp_rlmr_investMiddleTeam", to_char(hp_rlmr_centralTrad) as "hp_rlmr_centralTrad", to_char(hp_rlmr_fixedIncomeTrad) as "hp_rlmr_fixedIncomeTrad", to_char(hp_rlmr_orgBusinessLine) as "hp_rlmr_orgBusinessLine", to_char(hp_rlmr_orgBusiness) as "hp_rlmr_orgBusiness", to_char(hp_rlmr_socialBankBusiness) as "hp_rlmr_socialBankBusiness", to_char(hp_rlmr_brokerBusiness) as "hp_rlmr_brokerBusiness", to_char(hp_rlmr_retailerBusiness) as "hp_rlmr_retailerBusiness", to_char(hp_rlmr_digitalFianceBusiness) as "hp_rlmr_digitalFianceBusiness", to_char(hp_rlmr_Operation) as "hp_rlmr_operation", to_char(hp_rlmr_informationTechnic) as "hp_rlmr_informationTechnic", to_char(hp_rlmr_humanResourses) as "hp_rlmr_humanResourses", to_char(hp_rlmr_planFinance) as "hp_rlmr_planFinance", to_char(hp_rlmr_customerservice) as "hp_rlmr_customerservice", to_char(hp_rlmr_comprehensive) as "hp_rlmr_comprehensive", to_char(hp_rlmr_marketmanager) as "hp_rlmr_marketmanager", to_char(otherApproveMr) as "otherApproveMr", to_char(otherNoteMr) as "otherNoteMr", to_char(dm_approve_Regular) as "dm_approve_regular", to_char(dm_note_Regular) as "dm_note_regular", to_char(dm_approve_Risk) as "dm_approve_risk", to_char(dm_note_Risk) as "dm_note_risk", to_char(dm_approve_investRegularTeam) as "dm_approve_investRegularTeam", to_char(dm_note_investRegularTeam) as "dm_note_investRegularTeam", to_char(dm_approve_investLine) as "dm_approve_investLine", to_char(dm_note_investLine) as "dm_note_investLine", to_char(dm_approve_investMiddleTeam) as "dm_approve_investMiddleTeam", to_char(dm_note_investMiddleTeam) as "dm_note_investMiddleTeam", to_char(dm_approve_centralTrad) as "dm_approve_centralTrad", to_char(dm_note_centralTrad) as "dm_note_centralTrad", to_char(dm_approve_fixedIncomeTrad) as "dm_approve_fixedIncomeTrad", to_char(dm_note_fixedIncomeTrad) as "dm_note_fixedIncomeTrad", to_char(dm_approve_orgBusinessLine) as "dm_approve_orgBusinessLine", to_char(dm_note_orgBusinessLine) as "dm_note_orgBusinessLine", to_char(dm_approve_orgBusiness) as "dm_approve_orgBusiness", to_char(dm_note_orgBusiness) as "dm_note_orgBusiness", to_char(dm_approve_socialBankBusiness) as "dm_approve_socialBankBusiness", to_char(dm_note_socialBankBusiness) as "dm_note_socialBankBusiness", to_char(dm_approve_brokerBusiness) as "dm_approve_brokerBusiness", to_char(dm_note_brokerBusiness) as "dm_note_brokerBusiness", to_char(dm_approve_retailerBusiness) as "dm_approve_retailerBusiness", to_char(dm_note_retailerBusiness) as "dm_note_retailerBusiness", to_char(dm_approve_digitalFianceBusiness) as "dm_approve_digitalFianceBusiness", to_char(dm_note_digitalFianceBusiness) as "dm_note_digitalFianceBusiness", to_char(dm_approve_Operation) as "dm_approve_operation", to_char(dm_note_Operation) as "dm_note_operation", to_char(dm_approve_informationTechnic) as "dm_approve_informationTechnic", to_char(dm_note_informationTechnic) as "dm_note_informationTechnic", to_char(dm_approve_humanResourses) as "dm_approve_humanResourses", to_char(dm_note_humanResourses) as "dm_note_humanResourses", to_char(dm_approve_planFinance) as "dm_approve_planFinance", to_char(dm_note_planFinance) as "dm_note_planFinance", to_char(dm_approve_customerservice) as "dm_approve_customerservice", to_char(dm_note_customerservice) as "dm_note_customerservice", to_char(dm_approve_comprehensive) as "dm_approve_comprehensive", to_char(dm_note_comprehensive) as "dm_note_comprehensive", to_char(dm_approve_marketmanager) as "dm_approve_marketmanager", to_char(dm_note_marketmanager) as "dm_note_marketmanager", to_char(hp_approve_Regular) as "hp_approve_regular", to_char(hp_note_Regular) as "hp_note_regular", to_char(hp_approve_Risk) as "hp_approve_risk", to_char(hp_note_Risk) as "hp_note_risk", to_char(hp_approve_investRegularTeam) as "hp_approve_investRegularTeam", to_char(hp_note_investRegularTeam) as "hp_note_investRegularTeam", to_char(hp_approve_investLine) as "hp_approve_investLine", to_char(hp_note_investLine) as "hp_note_investLine", to_char(hp_approve_investMiddleTeam) as "hp_approve_investMiddleTeam", to_char(hp_note_investMiddleTeam) as "hp_note_investMiddleTeam", to_char(hp_approve_centralTrad) as "hp_approve_centralTrad", to_char(hp_note_centralTrad) as "hp_note_centralTrad", to_char(hp_approve_fixedIncomeTrad) as "hp_approve_fixedIncomeTrad", to_char(hp_note_fixedIncomeTrad) as "hp_note_fixedIncomeTrad", to_char(hp_approve_orgBusinessLine) as "hp_approve_orgBusinessLine", to_char(hp_note_orgBusinessLine) as "hp_note_orgBusinessLine", to_char(hp_approve_orgBusiness) as "hp_approve_orgBusiness", to_char(hp_note_orgBusiness) as "hp_note_orgBusiness", to_char(hp_approve_socialBankBusiness) as "hp_approve_socialBankBusiness", to_char(hp_note_socialBankBusiness) as "hp_note_socialBankBusiness", to_char(hp_approve_brokerBusiness) as "hp_approve_brokerBusiness", to_char(hp_note_brokerBusiness) as "hp_note_brokerBusiness", to_char(hp_approve_retailerBusiness) as "hp_approve_retailerBusiness", to_char(hp_note_retailerBusiness) as "hp_note_retailerBusiness", to_char(hp_approve_digitalFianceBusiness) as "hp_approve_digitalFianceBusiness", to_char(hp_note_digitalFianceBusiness) as "hp_note_digitalFianceBusiness", to_char(hp_approve_Operation) as "hp_approve_operation", to_char(hp_note_Operation) as "hp_note_operation", to_char(hp_approve_informationTechnic) as "hp_approve_informationTechnic", to_char(hp_note_informationTechnic) as "hp_note_informationTechnic", to_char(hp_approve_humanResourses) as "hp_approve_humanResourses", to_char(hp_note_humanResourses) as "hp_note_humanResourses", to_char(hp_approve_planFinance) as "hp_approve_planFinance", to_char(hp_note_planFinance) as "hp_note_planFinance", to_char(hp_approve_customerservice) as "hp_approve_customerservice", to_char(hp_note_customerservice) as "hp_note_customerservice", to_char(hp_approve_comprehensive) as "hp_approve_comprehensive", to_char(hp_note_comprehensive) as "hp_note_comprehensive", to_char(hp_approve_marketmanager) as "hp_approve_marketmanager", to_char(hp_note_marketmanager) as "hp_note_marketmanager", to_char(note) as "note", to_char(serialNum) as "serialNum", to_char(dm_rlmr_orgservice) as "dm_rlmr_orgservice", to_char(dm_mcsy_orgservice) as "dm_mcsy_orgservice", to_char(dm_approve_orgservice) as "dm_approve_orgservice", to_char(dm_note_orgservice) as "dm_note_orgservice", to_char(hp_mcsy_orgservice) as "hp_mcsy_orgservice", to_char(hp_rlmr_orgservice) as "hp_rlmr_orgservice", to_char(hp_approve_orgservice) as "hp_approve_orgservice", to_char(hp_note_orgservice) as "hp_note_orgservice", to_char(etfApproveMember) as "etfApproveMember", to_char(dm_mcsy_comAlgTrad) as "dm_mcsy_comAlgTrad", to_char(dm_rlmr_comAlgTrad) as "dm_rlmr_comAlgTrad", to_char(dm_approve_comAlgTrad) as "dm_approve_comAlgTrad", to_char(dm_note_comAlgTrad) as "dm_note_comAlgTrad", to_char(hp_mcsy_comAlgTrad) as "hp_mcsy_comAlgTrad", to_char(hp_rlmr_comAlgTrad) as "hp_rlmr_comAlgTrad", to_char(hp_approve_comAlgTrad) as "hp_approve_comAlgTrad", to_char(hp_note_comAlgTrad) as "hp_note_comAlgTrad" from vm_approvenoteconfig where serialNum = 'VALUE_001';

-- statementId: getFlowConfigInfoSerialNo.select
-- lookupStatementId: getFlowConfigInfoSerialNo.select
-- source: productinfo_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id as "id", createTime as "createTime", to_char(dm_mcsy_Regular) as "dm_mcsy_regular", to_char(dm_mcsy_Risk) as "dm_mcsy_risk", to_char(dm_mcsy_investRegularTeam) as "dm_mcsy_investRegularTeam", to_char(dm_mcsy_investMiddleTeam) as "dm_mcsy_investMiddleTeam", to_char(dm_mcsy_centralTrad) as "dm_mcsy_centralTrad", to_char(dm_mcsy_fixedIncomeTrad) as "dm_mcsy_fixedIncomeTrad", to_char(dm_mcsy_orgBusinessLine) as "dm_mcsy_orgBusinessLine", to_char(dm_mcsy_orgBusiness) as "dm_mcsy_orgBusiness", to_char(dm_mcsy_socialBankBusiness) as "dm_mcsy_socialBankBusiness", to_char(dm_mcsy_brokerBusiness) as "dm_mcsy_brokerBusiness", to_char(dm_mcsy_retailerBusiness) as "dm_mcsy_retailerBusiness", to_char(dm_mcsy_digitalFianceBusiness) as "dm_mcsy_digitalFianceBusiness", to_char(dm_mcsy_Operation) as "dm_mcsy_operation", to_char(dm_mcsy_informationTechnic) as "dm_mcsy_informationTechnic", to_char(dm_mcsy_humanResourses) as "dm_mcsy_humanResourses", to_char(dm_mcsy_planFinance) as "dm_mcsy_planFinance", to_char(dm_mcsy_customerservice) as "dm_mcsy_customerservice", to_char(dm_mcsy_comprehensive) as "dm_mcsy_comprehensive", to_char(dm_mcsy_marketmanager) as "dm_mcsy_marketmanager", to_char(hp_mcsy_Regular) as "hp_mcsy_regular", to_char(hp_mcsy_Risk) as "hp_mcsy_risk", to_char(hp_mcsy_investRegularTeam) as "hp_mcsy_investRegularTeam", to_char(hp_mcsy_investMiddleTeam) as "hp_mcsy_investMiddleTeam", to_char(hp_mcsy_centralTrad) as "hp_mcsy_centralTrad", to_char(hp_mcsy_fixedIncomeTrad) as "hp_mcsy_fixedIncomeTrad", to_char(hp_mcsy_orgBusinessLine) as "hp_mcsy_orgBusinessLine", to_char(hp_mcsy_orgBusiness) as "hp_mcsy_orgBusiness", to_char(hp_mcsy_socialBankBusiness) as "hp_mcsy_socialBankBusiness", to_char(hp_mcsy_brokerBusiness) as "hp_mcsy_brokerBusiness", to_char(hp_mcsy_retailerBusiness) as "hp_mcsy_retailerBusiness", to_char(hp_mcsy_digitalFianceBusiness) as "hp_mcsy_digitalFianceBusiness", to_char(hp_mcsy_Operation) as "hp_mcsy_operation", to_char(hp_mcsy_informationTechnic) as "hp_mcsy_informationTechnic", to_char(hp_mcsy_humanResourses) as "hp_mcsy_humanResourses", to_char(hp_mcsy_planFinance) as "hp_mcsy_planFinance", to_char(hp_mcsy_customerservice) as "hp_mcsy_customerservice", to_char(hp_mcsy_comprehensive) as "hp_mcsy_comprehensive", to_char(hp_mcsy_marketmanager) as "hp_mcsy_marketmanager", to_char(dm_rlmr_Regular) as "dm_rlmr_regular", to_char(dm_rlmr_Risk) as "dm_rlmr_risk", to_char(dm_rlmr_investRegularTeam) as "dm_rlmr_investRegularTeam", to_char(dm_rlmr_investMiddleTeam) as "dm_rlmr_investMiddleTeam", to_char(dm_rlmr_centralTrad) as "dm_rlmr_centralTrad", to_char(dm_rlmr_fixedIncomeTrad) as "dm_rlmr_fixedIncomeTrad", to_char(dm_rlmr_orgBusinessLine) as "dm_rlmr_orgBusinessLine", to_char(dm_rlmr_orgBusiness) as "dm_rlmr_orgBusiness", to_char(dm_rlmr_socialBankBusiness) as "dm_rlmr_socialBankBusiness", to_char(dm_rlmr_brokerBusiness) as "dm_rlmr_brokerBusiness", to_char(dm_rlmr_retailerBusiness) as "dm_rlmr_retailerBusiness", to_char(dm_rlmr_digitalFianceBusiness) as "dm_rlmr_digitalFianceBusiness", to_char(dm_rlmr_Operation) as "dm_rlmr_operation", to_char(dm_rlmr_informationTechnic) as "dm_rlmr_informationTechnic", to_char(dm_rlmr_humanResourses) as "dm_rlmr_humanResourses", to_char(dm_rlmr_planFinance) as "dm_rlmr_planFinance", to_char(dm_rlmr_customerservice) as "dm_rlmr_customerservice", to_char(dm_rlmr_comprehensive) as "dm_rlmr_comprehensive", to_char(dm_rlmr_marketmanager) as "dm_rlmr_marketmanager", to_char(hp_rlmr_Regular) as "hp_rlmr_regular", to_char(hp_rlmr_Risk) as "hp_rlmr_risk", to_char(hp_rlmr_investRegularTeam) as "hp_rlmr_investRegularTeam", to_char(hp_rlmr_investMiddleTeam) as "hp_rlmr_investMiddleTeam", to_char(hp_rlmr_centralTrad) as "hp_rlmr_centralTrad", to_char(hp_rlmr_fixedIncomeTrad) as "hp_rlmr_fixedIncomeTrad", to_char(hp_rlmr_orgBusinessLine) as "hp_rlmr_orgBusinessLine", to_char(hp_rlmr_orgBusiness) as "hp_rlmr_orgBusiness", to_char(hp_rlmr_socialBankBusiness) as "hp_rlmr_socialBankBusiness", to_char(hp_rlmr_brokerBusiness) as "hp_rlmr_brokerBusiness", to_char(hp_rlmr_retailerBusiness) as "hp_rlmr_retailerBusiness", to_char(hp_rlmr_digitalFianceBusiness) as "hp_rlmr_digitalFianceBusiness", to_char(hp_rlmr_Operation) as "hp_rlmr_operation", to_char(hp_rlmr_informationTechnic) as "hp_rlmr_informationTechnic", to_char(hp_rlmr_humanResourses) as "hp_rlmr_humanResourses", to_char(hp_rlmr_planFinance) as "hp_rlmr_planFinance", to_char(hp_rlmr_customerservice) as "hp_rlmr_customerservice", to_char(hp_rlmr_comprehensive) as "hp_rlmr_comprehensive", to_char(hp_rlmr_marketmanager) as "hp_rlmr_marketmanager", to_char(otherApproveMr) as "otherApproveMr", to_char(otherNoteMr) as "otherNoteMr", to_char(dm_approve_Regular) as "dm_approve_regular", to_char(dm_note_Regular) as "dm_note_regular", to_char(dm_approve_Risk) as "dm_approve_risk", to_char(dm_note_Risk) as "dm_note_risk", to_char(dm_approve_investRegularTeam) as "dm_approve_investRegularTeam", to_char(dm_note_investRegularTeam) as "dm_note_investRegularTeam", to_char(dm_approve_investLine) as "dm_approve_investLine", to_char(dm_note_investLine) as "dm_note_investLine", to_char(dm_approve_investMiddleTeam) as "dm_approve_investMiddleTeam", to_char(dm_note_investMiddleTeam) as "dm_note_investMiddleTeam", to_char(dm_approve_centralTrad) as "dm_approve_centralTrad", to_char(dm_note_centralTrad) as "dm_note_centralTrad", to_char(dm_approve_fixedIncomeTrad) as "dm_approve_fixedIncomeTrad", to_char(dm_note_fixedIncomeTrad) as "dm_note_fixedIncomeTrad", to_char(dm_approve_orgBusinessLine) as "dm_approve_orgBusinessLine", to_char(dm_note_orgBusinessLine) as "dm_note_orgBusinessLine", to_char(dm_approve_orgBusiness) as "dm_approve_orgBusiness", to_char(dm_note_orgBusiness) as "dm_note_orgBusiness", to_char(dm_approve_socialBankBusiness) as "dm_approve_socialBankBusiness", to_char(dm_note_socialBankBusiness) as "dm_note_socialBankBusiness", to_char(dm_approve_brokerBusiness) as "dm_approve_brokerBusiness", to_char(dm_note_brokerBusiness) as "dm_note_brokerBusiness", to_char(dm_approve_retailerBusiness) as "dm_approve_retailerBusiness", to_char(dm_note_retailerBusiness) as "dm_note_retailerBusiness", to_char(dm_approve_digitalFianceBusiness) as "dm_approve_digitalFianceBusiness", to_char(dm_note_digitalFianceBusiness) as "dm_note_digitalFianceBusiness", to_char(dm_approve_Operation) as "dm_approve_operation", to_char(dm_note_Operation) as "dm_note_operation", to_char(dm_approve_informationTechnic) as "dm_approve_informationTechnic", to_char(dm_note_informationTechnic) as "dm_note_informationTechnic", to_char(dm_approve_humanResourses) as "dm_approve_humanResourses", to_char(dm_note_humanResourses) as "dm_note_humanResourses", to_char(dm_approve_planFinance) as "dm_approve_planFinance", to_char(dm_note_planFinance) as "dm_note_planFinance", to_char(dm_approve_customerservice) as "dm_approve_customerservice", to_char(dm_note_customerservice) as "dm_note_customerservice", to_char(dm_approve_comprehensive) as "dm_approve_comprehensive", to_char(dm_note_comprehensive) as "dm_note_comprehensive", to_char(dm_approve_marketmanager) as "dm_approve_marketmanager", to_char(dm_note_marketmanager) as "dm_note_marketmanager", to_char(hp_approve_Regular) as "hp_approve_regular", to_char(hp_note_Regular) as "hp_note_regular", to_char(hp_approve_Risk) as "hp_approve_risk", to_char(hp_note_Risk) as "hp_note_risk", to_char(hp_approve_investRegularTeam) as "hp_approve_investRegularTeam", to_char(hp_note_investRegularTeam) as "hp_note_investRegularTeam", to_char(hp_approve_investLine) as "hp_approve_investLine", to_char(hp_note_investLine) as "hp_note_investLine", to_char(hp_approve_investMiddleTeam) as "hp_approve_investMiddleTeam", to_char(hp_note_investMiddleTeam) as "hp_note_investMiddleTeam", to_char(hp_approve_centralTrad) as "hp_approve_centralTrad", to_char(hp_note_centralTrad) as "hp_note_centralTrad", to_char(hp_approve_fixedIncomeTrad) as "hp_approve_fixedIncomeTrad", to_char(hp_note_fixedIncomeTrad) as "hp_note_fixedIncomeTrad", to_char(hp_approve_orgBusinessLine) as "hp_approve_orgBusinessLine", to_char(hp_note_orgBusinessLine) as "hp_note_orgBusinessLine", to_char(hp_approve_orgBusiness) as "hp_approve_orgBusiness", to_char(hp_note_orgBusiness) as "hp_note_orgBusiness", to_char(hp_approve_socialBankBusiness) as "hp_approve_socialBankBusiness", to_char(hp_note_socialBankBusiness) as "hp_note_socialBankBusiness", to_char(hp_approve_brokerBusiness) as "hp_approve_brokerBusiness", to_char(hp_note_brokerBusiness) as "hp_note_brokerBusiness", to_char(hp_approve_retailerBusiness) as "hp_approve_retailerBusiness", to_char(hp_note_retailerBusiness) as "hp_note_retailerBusiness", to_char(hp_approve_digitalFianceBusiness) as "hp_approve_digitalFianceBusiness", to_char(hp_note_digitalFianceBusiness) as "hp_note_digitalFianceBusiness", to_char(hp_approve_Operation) as "hp_approve_operation", to_char(hp_note_Operation) as "hp_note_operation", to_char(hp_approve_informationTechnic) as "hp_approve_informationTechnic", to_char(hp_note_informationTechnic) as "hp_note_informationTechnic", to_char(hp_approve_humanResourses) as "hp_approve_humanResourses", to_char(hp_note_humanResourses) as "hp_note_humanResourses", to_char(hp_approve_planFinance) as "hp_approve_planFinance", to_char(hp_note_planFinance) as "hp_note_planFinance", to_char(hp_approve_customerservice) as "hp_approve_customerservice", to_char(hp_note_customerservice) as "hp_note_customerservice", to_char(hp_approve_comprehensive) as "hp_approve_comprehensive", to_char(hp_note_comprehensive) as "hp_note_comprehensive", to_char(hp_approve_marketmanager) as "hp_approve_marketmanager", to_char(hp_note_marketmanager) as "hp_note_marketmanager", to_char(dm_rlmr_orgservice) as "dm_rlmr_orgservice", to_char(dm_mcsy_orgservice) as "dm_mcsy_orgservice", to_char(dm_approve_orgservice) as "dm_approve_orgservice", to_char(dm_note_orgservice) as "dm_note_orgservice", to_char(hp_mcsy_orgservice) as "hp_mcsy_orgservice", to_char(hp_rlmr_orgservice) as "hp_rlmr_orgservice", to_char(hp_approve_orgservice) as "hp_approve_orgservice", to_char(hp_note_orgservice) as "hp_note_orgservice", to_char(etfApproveMember) as "etfApproveMember", to_char(dm_mcsy_comAlgTrad) as "dm_mcsy_comAlgTrad", to_char(dm_rlmr_comAlgTrad) as "dm_rlmr_comAlgTrad", to_char(dm_approve_comAlgTrad) as "dm_approve_comAlgTrad", to_char(dm_note_comAlgTrad) as "dm_note_comAlgTrad", to_char(hp_mcsy_comAlgTrad) as "hp_mcsy_comAlgTrad", to_char(hp_rlmr_comAlgTrad) as "hp_rlmr_comAlgTrad", to_char(hp_approve_comAlgTrad) as "hp_approve_comAlgTrad", to_char(hp_note_comAlgTrad) as "hp_note_comAlgTrad", to_char(dm_rlmr_investLine) as "dm_rlmr_investLine", to_char(hp_rlmr_investLine) as "hp_rlmr_investLine" from vm_Wf_productApprove where id = 'VALUE_001';

-- statementId: memberConfigInfoByTableName.select
-- lookupStatementId: memberConfigInfoByTableName.select
-- source: productinfo_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select name, field_info from cap_form_definition where name = 'VALUE_001';

-- statementId: memberConfigInfo.select
-- lookupStatementId: memberConfigInfo.select
-- source: productinfo_sqlmap.xml
-- type: select
-- params: "VALUE_001"
VALUE_001;

-- statementId: cap4SpecialAccountData.select
-- lookupStatementId: cap4SpecialAccountData.select
-- source: productinfo_sqlmap.xml
-- type: select
-- params: {}
select id as "id", serialnumber as "serialnumber", specialaccountflow as "specialaccountflow", isqdii as "isqdii", type as "type", flowtype as "flowtype", flowstartdate as "flowstartdate", initiator as "initiator", initiatdept as "initiatdept", investmentmanager as "investmentmanager", salesmanager as "salesmanager", riskreviewers as "riskreviewers", compliancereviewers as "compliancereviewers", flowName as "flowName", to_char(modify_date, 'yyyy-mm-dd HH24:mi:ss') as "modifyTime" from vm_specialaccount_cap3 f where f.serialnumber not in (select serialnumber from vm_specialaccount_cap4);

-- statementId: findAllSpecialAccount.select
-- lookupStatementId: findAllSpecialAccount.select
-- source: productinfo_sqlmap.xml
-- type: select
-- params: {}
select id, serialnumber, specialaccountflow, isqdii, type, flowtype, flowstartdate, initiator, initiatdept, investmentmanager, salesmanager, riskreviewers, compliancereviewers, flowName, modifyTime from vm_specialaccount_cap4;

-- statementId: findNeedUpdateSpecialAccount.select
-- lookupStatementId: findNeedUpdateSpecialAccount.select
-- source: productinfo_sqlmap.xml
-- type: select
-- params: {}
select f1.id, f1.serialnumber, f1.specialaccountflow, f1.isqdii, f1.type, f1.flowtype, f1.flowstartdate, f1.initiator, f1.initiatdept, f1.investmentmanager, f1.salesmanager, f1.riskreviewers, f1.compliancereviewers, f1.flowName, to_char(f1.modify_date, 'yyyy-mm-dd HH24:mi:ss') modifyTime from vm_specialaccount_cap3 f1 inner join vm_specialaccount_cap4 f2 on f2.id = f1.id where to_char(f1.modify_date, 'yyyy-mm-dd HH24:mi:ss') > f2.modifyTime;

-- statementId: specialaccount.update
-- lookupStatementId: specialaccount.update
-- source: productinfo_sqlmap.xml
-- type: update
-- params: {
--   "serialnumber": "VALUE_001",
--   "specialaccountflow": 1,
--   "isqdii": "VALUE_001",
--   "type": "VALUE_001",
--   "flowtype": "VALUE_001",
--   "flowstartdate": "2026-05-14",
--   "initiator": "VALUE_001",
--   "initiatdept": "VALUE_001",
--   "investmentmanager": "VALUE_001",
--   "salesmanager": "VALUE_001",
--   "riskreviewers": "VALUE_001",
--   "compliancereviewers": "VALUE_001",
--   "flowName": "NAME_001",
--   "modifyTime": "2026-05-14 10:00:00",
--   "id": 1001
-- }
update vm_specialaccount_cap4 set serialnumber = 'VALUE_001', specialaccountflow = 1, isqdii = 'VALUE_001', type = 'VALUE_001', flowtype = 'VALUE_001', flowstartdate = '2026-05-14', initiator = 'VALUE_001', initiatdept = 'VALUE_001', investmentmanager = 'VALUE_001', salesmanager = 'VALUE_001', riskreviewers = 'VALUE_001', compliancereviewers = 'VALUE_001', flowName = 'NAME_001', modifyTime = '2026-05-14 10:00:00' where id=1001;

-- statementId: cap4ChangeFlow.select
-- lookupStatementId: cap4ChangeFlow.select
-- source: productinfo_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select investDeptManagerStr "investDeptManagerStr", investManagerStr "investManagerStr", orgBusinessMember "orgBusinessMember", retailerBusinessMember "retailerBusinessMember", digitalFianceBusinessMember "digitalFianceBusinessMember", regularCheckMember as "regularCheckMember" from vm_cap4ProductChange where serialNum = 'VALUE_001';

-- statementId: findFundProductByPIRID.select
-- lookupStatementId: findFundProductByPIRID.select
-- source: productinfo_sqlmap.xml
-- type: select
-- params: {}
select to_char(id)id, PRDCODE, util_common.getEnumShowById(FUNDKIND) FUNDKIND, PIRID, util_common.getEnumShowById(STATUS) STATUS, PRDNAME, FDSHOTNM, to_char(productManager) productManager, to_char(saleManager) saleManager, to_char(fundAdmin) fundAdmin, to_char(taOperateManager) taOperateManager, util_common.getEnumShowById(investType) investType, util_common.getEnumShowById(fundType) fundType, util_common.getEnumShowById(prdInvestType) prdInvestType, util_common.getEnumShowById(mixTypeDirect) mixTypeDirect, to_char(regularMember) regularMember, util_common.getEnumShowById(productTypeMonthly) productTypeMonthly, mgrNameList, util_common.getEnumShowById(customType) customType, util_common.getEnumShowById(proReleaseFrequency) proReleaseFrequency, util_common.getEnumShowById(fundShareOperMode) fundShareOperMode, util_common.getEnumShowById(isETFFund) isETFFund, dutiesNameList, productAbbreviation, productAdministrator from vm_fundproductinfoCap4;

-- statementId: findFundProductSonInfo.select
-- lookupStatementId: findFundProductSonInfo.select
-- source: productinfo_sqlmap.xml
-- type: select
-- params: {}
select vfp.PIRID as "PIRID", vcf.fundManager as "fundManager", vcf.duties as "duties" from vm_fundproductinfoCap4 vfp left join vm_cap4_fundmanagers vcf on vcf.formmain_id = vfp.id;

-- statementId: getAssetColSummaryIdById.select
-- lookupStatementId: getAssetColSummaryIdById.select
-- source: productinfo_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id from col_summary where form_recordid = 'VALUE_001' and case_id is not null;

-- statementId: getAssetOperationId.select
-- lookupStatementId: getAssetOperationId.select
-- source: productinfo_sqlmap.xml
-- type: select
-- params: {
--   "viewName": "NAME_001",
--   "tableName": "NAME_001"
-- }
SELECT to_char(replace(wm_concat(t.name || '.' || t.value),',','_')) as id FROM (select '/QueryList/Query[@name="' || 'NAME_001' || '"]/ShowsThrough/Colum' XPATH, f.* from form_definition f where f.name = 'NAME_001') f, xmltable(f.XPATH passing xmltype(nvl(f.query_info, '<root/>')) columns "NAME" path '@name', "VALUE" path '@value') t;

-- statementId: getSingleAssetAccountQuery.select
-- lookupStatementId: getSingleAssetAccountQuery.select
-- source: productinfo_sqlmap.xml
-- type: select
-- params: {}
select vcf.id as "flowId", vs.id as "id", vs.flowtype as "flowtype" from vm_specialaccount_cap4 vs left join formmain_5083 vcf on vcf.field0001 = vs.serialnumber where vs.flowUrl is null and vcf.id is not null;

-- statementId: getCollectiveAssetAccountQuery.select
-- lookupStatementId: getCollectiveAssetAccountQuery.select
-- source: productinfo_sqlmap.xml
-- type: select
-- params: {}
select vcf.id as "flowId", vs.id as "id", vs.flowtype as "flowtype" from vm_specialaccount_cap4 vs left join formmain_5108 vcf on vcf.field0001 = vs.serialnumber where vs.flowUrl is null and vcf.id is not null;

-- statementId: updateAssetFlowUrlField.update
-- lookupStatementId: updateAssetFlowUrlField.update
-- source: productinfo_sqlmap.xml
-- type: update
-- params: {
--   "flowUrl": "VALUE_001",
--   "id": 1001
-- }
update vm_specialaccount_cap4 set flowUrl='VALUE_001' where id=1001;

-- statementId: updateSpecialAccountFlowState.update
-- lookupStatementId: updateSpecialAccountFlowState.update
-- source: productinfo_sqlmap.xml
-- type: update
-- params: {}
UPDATE vm_specialaccount_cap4 a SET a.isFlowFinish = -3841538853571705149 where exists( SELECT 'x' FROM vm_specialaccount_cap3 b WHERE a.serialnumber = b.serialnumber and (a.isFlowFinish <> -3841538853571705149 or a.isFlowFinish is null) and b.isFlowFinish = -3841538853571705149 );

-- statementId: insertFundProductInfo.insert
-- lookupStatementId: insertFundProductInfo.insert
-- source: productinfo_sqlmap.xml
-- type: insert
-- params: {
--   "id": 1001,
--   "PRDCODE": "CODE_001",
--   "FUNDKIND": "VALUE_001",
--   "PIRID": 1001,
--   "PRDNAME": "NAME_001",
--   "FDSHOTNM": "VALUE_001",
--   "STATUS": 1,
--   "productManager": "VALUE_001",
--   "fundAdmin": "VALUE_001",
--   "saleManager": "VALUE_001",
--   "regularMember": "VALUE_001",
--   "productTypeMonthly": "VALUE_001",
--   "taOperateManager": "VALUE_001",
--   "investType": "VALUE_001",
--   "fundType": "VALUE_001",
--   "mgrNameList": "NAME_001",
--   "prdInvestType": "VALUE_001",
--   "mixTypeDirect": "VALUE_001",
--   "customType": "VALUE_001",
--   "fundManages": "VALUE_001",
--   "proReleaseFrequency": "VALUE_001",
--   "fundShareOperMode": "VALUE_001",
--   "isETFFund": "VALUE_001",
--   "isDeleted": "VALUE_001",
--   "dutiesNameList": "NAME_001"
-- }
insert into vm_cap4_fundproductinfo( ID, STATE, START_MEMBER_ID, START_DATE, APPROVE_MEMBER_ID, APPROVE_DATE, FINISHEDFLAG, RATIFYFLAG, RATIFY_MEMBER_ID, RATIFY_DATE, SORT, MODIFY_MEMBER_ID, MODIFY_DATE, prdcode, fundkind, pirid, prdname, fdshotnm, status, productManager, fundAdmin, saleManager, regularMember, productTypeMonthly, taOperateManager, investType, fundType, mgrNameList, prdInvestType, mixTypeDirect, customType, fundManages, proReleaseFrequency, fundShareOperMode, isETFFund, isDeleted, dutiesNameList ) VALUES( 1001, 1, null, sysdate, null, sysdate, 0, 0, 0, sysdate, 0, null, sysdate, 'CODE_001', 'VALUE_001', 1001, 'NAME_001', 'VALUE_001', 1, 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'NAME_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'NAME_001' );

-- statementId: updateFundProductInfo.update
-- lookupStatementId: updateFundProductInfo.update
-- source: productinfo_sqlmap.xml
-- type: update
-- params: {
--   "PIRID": 1001,
--   "FUNDKIND": "VALUE_001",
--   "PRDCODE": "CODE_001",
--   "PRDNAME": "NAME_001",
--   "FDSHOTNM": "VALUE_001",
--   "STATUS": 1,
--   "productManager": "VALUE_001",
--   "fundAdmin": "VALUE_001",
--   "saleManager": "VALUE_001",
--   "regularMember": "VALUE_001",
--   "productTypeMonthly": "VALUE_001",
--   "taOperateManager": "VALUE_001",
--   "investType": "VALUE_001",
--   "fundType": "VALUE_001",
--   "mgrNameList": "NAME_001",
--   "prdInvestType": "VALUE_001",
--   "mixTypeDirect": "VALUE_001",
--   "customType": "VALUE_001",
--   "fundManages": "VALUE_001",
--   "proReleaseFrequency": "VALUE_001",
--   "fundShareOperMode": "VALUE_001",
--   "isETFFund": "VALUE_001",
--   "isDeleted": "VALUE_001",
--   "dutiesNameList": "NAME_001",
--   "productAbbreviation": "VALUE_001",
--   "productAdministrator": "VALUE_001",
--   "id": 1001
-- }
update vm_cap4_fundproductinfo set pirid = 1001, fundkind = 'VALUE_001', prdcode = 'CODE_001', prdname = 'NAME_001', fdshotnm = 'VALUE_001', status = 1, productManager = 'VALUE_001', fundAdmin = 'VALUE_001', saleManager = 'VALUE_001', regularMember = 'VALUE_001', productTypeMonthly = 'VALUE_001', taOperateManager = 'VALUE_001', investType = 'VALUE_001', fundType = 'VALUE_001', mgrNameList = 'NAME_001', prdInvestType = 'VALUE_001', mixTypeDirect = 'VALUE_001', customType = 'VALUE_001', fundManages = 'VALUE_001', proReleaseFrequency = 'VALUE_001', fundShareOperMode = 'VALUE_001', isETFFund = 'VALUE_001', isDeleted = 'VALUE_001', dutiesNameList = 'NAME_001', productAbbreviation = 'VALUE_001', productAdministrator = 'VALUE_001' where ID = 1001;

-- statementId: insertFundProductSonInfo.insert
-- lookupStatementId: insertFundProductSonInfo.insert
-- source: productinfo_sqlmap.xml
-- type: insert
-- params: {
--   "formmainid": 1001,
--   "fundManager": "VALUE_001",
--   "duties": "VALUE_001"
-- }
insert into vm_cap4_fundmanagers values(util_common.getAbsID, 1001, 'VALUE_001', 'VALUE_001');

-- statementId: deleteFundProductSonInfo.delete
-- lookupStatementId: deleteFundProductSonInfo.delete
-- source: productinfo_sqlmap.xml
-- type: delete
-- params: {
--   "id": 1001
-- }
delete vm_cap4_fundmanagers where formmain_id = 1001;

-- statementId: getFormInfoSearchCfgByTemplateNo.select
-- lookupStatementId: getFormInfoSearchCfgByTemplateNo.select
-- source: forminfosearch_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select main.id as "id", main.templateNo as "templateNo", main.mainTable as "mainTable", main.createDate as "createDate", main.isEnable as "isEnable", main.priKeyName as "priKeyName", main.pageSize as "pageSize", main.mainSql as "mainSql", main.extraQryParam as "extraQryParam", main.needApproveLog as "needApproveLog", main.needDetailUrl as "needDetailUrl", main.openTotal as "openTotal", to_char(util_common.getEnumValueById(dateParamType)) as "dateParamType", son.sonTable as "sonTable", son.sonSql as "sonSql", son.rtnName as "rtnName" from vm_cap_commonFlowInfoSearchCfg main left join vm_cap_commonFlowInfoSearchCfg_son son on main.id = son.formmain_id where main.cfgKey = 'VALUE_001';

-- statementId: commonSelectSql.select
-- lookupStatementId: commonSelectSql.select
-- source: forminfosearch_sqlmap.xml
-- type: select
-- params: "VALUE_001"
VALUE_001;

-- statementId: getApprovalCheckLogs.select
-- lookupStatementId: getApprovalCheckLogs.select
-- source: forminfosearch_sqlmap.xml
-- type: select
-- params: {
--   "templateNo": "VALUE_001",
--   "id": 1001
-- }
select distinct o.code as "approverCode", o.name as "approverName", c.Ext_Att4 as "approveResult", to_char(c.content) as "approveOpinion", a.node_name as "nodeName", to_char(c.create_date,'yyyy-MM-dd hh24:mi:ss') as "approveTime", a.id as "affairID" from ctp_affair a right join CTP_COMMENT_ALL c on c.affair_id = a.id left join org_member o on o.id = a.member_id where a.templete_id = (select id from ctp_template where templete_number = 'VALUE_001') and a.form_recordid = 1001;

-- statementId: getAffairIdByRecordId.select
-- lookupStatementId: getAffairIdByRecordId.select
-- source: forminfosearch_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id as "affairId", templete_id as "templateId" from ctp_affair where form_recordId = 'VALUE_001' and node_policy = 'newCol';

-- statementId: fileInfo.select
-- lookupStatementId: fileInfo.select
-- source: file_sqlmap.xml
-- type: select
-- params: {
--   "id": 1001,
--   "name": "NAME_001"
-- }
select ID as FILEURL, FILENAME, MIME_TYPE, FILE_SIZE, to_char(create_date,'yyyy-mm-dd') as create_date from ctp_file where ID = 1001;

-- statementId: attachmentInfo.select
-- lookupStatementId: attachmentInfo.select
-- source: file_sqlmap.xml
-- type: select
-- params: {
--   "formName": "RAW_VALUE",
--   "fieldName": "RAW_VALUE",
--   "attachIds": [
--     "EVENT_A",
--     "EVENT_B"
--   ],
--   "sort": 7
-- }
select file_url as fieldid ,to_char( ca.createdate,'yyyy-mm-dd') as createdate from ctp_attachment ca left join RAW_VALUE f1 on f1.id = ca.att_reference where ca.sub_reference = RAW_VALUE and ca.sub_reference IN ('EVENT_A','EVENT_B') order by 7;

-- statementId: attachmentInfo.select.simple
-- lookupStatementId: attachmentInfo.select.simple
-- source: file_sqlmap.xml
-- type: select
-- params: {
--   "attachId": 1001,
--   "name": "NAME_001"
-- }
select id, filename,file_url,mime_type, attachment_size,to_char(createdate,'yyyy-mm-dd') as createdate from ctp_attachment where 1=1 and sub_reference = 1001 and FILENAME like '%' || 'NAME_001' || '%';

-- statementId: attachmentInfo.select.count
-- lookupStatementId: attachmentInfo.select.count
-- source: file_sqlmap.xml
-- type: select
-- params: {
--   "formName": "RAW_VALUE",
--   "fieldName": "RAW_VALUE",
--   "attachIds": [
--     "EVENT_A",
--     "EVENT_B"
--   ]
-- }
select count(*) from ctp_attachment ca left join RAW_VALUE f1 on f1.id = ca.att_reference where ca.sub_reference = RAW_VALUE and ca.sub_reference IN ('EVENT_A','EVENT_B');

-- statementId: attachmentInfo.insert
-- lookupStatementId: attachmentInfo.insert
-- source: file_sqlmap.xml
-- type: insert
-- params: {
--   "id": 1001,
--   "formId": 1001,
--   "subId": 1001,
--   "category": "VALUE_001",
--   "type": "VALUE_001",
--   "fileName": "NAME_001",
--   "fileUrl": "VALUE_001",
--   "mimeType": "VALUE_001",
--   "createDate": "2026-05-14",
--   "fileSize": "VALUE_001"
-- }
insert into ctp_attachment (ID, ATT_REFERENCE, SUB_REFERENCE, CATEGORY, TYPE, FILENAME, FILE_URL, MIME_TYPE, CREATEDATE, ATTACHMENT_SIZE, DESCRIPTION, GENESIS_ID, SORT, SECRET_LEVEL) values (1001, 1001, 1001, 'VALUE_001', 'VALUE_001', 'NAME_001', 'VALUE_001', 'VALUE_001', to_date('2026-05-14', 'yyyy-MM-dd'), 'VALUE_001', null, null, 0, null );

-- statementId: attachmentInfo.delete
-- lookupStatementId: attachmentInfo.delete
-- source: file_sqlmap.xml
-- type: delete
-- params: {
--   "fileId": 1001,
--   "attachId": 1001
-- }
delete ctp_attachment ca where 1=1 and ca.file_url = 1001 and ca.sub_reference = 1001;

-- statementId: docResourceInfo.select
-- lookupStatementId: docResourceInfo.select
-- source: file_sqlmap.xml
-- type: select
-- params: {
--   "frName": "NAME_001",
--   "parentId": 1001
-- }
select * from doc_resources dc where dc.fr_name = 'NAME_001' and dc.parent_fr_id = 1001;

-- statementId: docNewFolder.insert
-- lookupStatementId: docNewFolder.insert
-- source: file_sqlmap.xml
-- type: insert
-- params: {
--   "id": 1001,
--   "docLibId": 1001,
--   "frName": "NAME_001",
--   "frDesc": "VALUE_001",
--   "frType": "VALUE_001",
--   "frOrder": "VALUE_001",
--   "parentFrId": 1001,
--   "createUserId": 1001,
--   "logicPath": "VALUE_001",
--   "mimeOrder": "VALUE_001"
-- }
insert into doc_resources (ID, DOC_LIB_ID, FR_NAME, FR_DESC, FR_TYPE, FR_ORDER, PARENT_FR_ID, FR_SIZE, SOURCE_ID, IS_FOLDER, SUBFOLDER_ENABLED, COMMENT_ENABLED, COMMENT_COUNT, ACCESS_COUNT, CREATE_USER_ID, CREATE_TIME, LAST_USER_ID, LAST_UPDATE, STATUS, STATUS_DATE, LOGICAL_PATH, MIME_TYPE_ID, IS_CHECK_OUT, CHECK_OUT_USER_ID, CHECK_OUT_TIME, KEY_WORDS, HAS_ATTACHMENTS, IS_LEARNING_DOC, MIME_ORDER, THIRD_HASPINGHOLE, VERSION_ENABLED, VERSION_COMMENT, PIGEONHOLE_TYPE, SOURCE_TYPE, RECOMMEND_ENABLE, RECOMMEND_COUNT, COLLECT_COUNT,DOWNLOAD_COUNT,SCORE_COUNT, TOTAL_SCORE, FAVORITE_SOURCE, OPEN_SQUARE_TIME, IS_PIGEONHOLE_ARCHIVE) values (1001, 1001, 'NAME_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 1001, 0, null, 1, 1, 1, 0, 0, 1001, sysdate, 1001, sysdate, 2, sysdate, 'VALUE_001', 'VALUE_001', 0, null, null, null, 0, 0, 'VALUE_001', 0, 0, null, null, null, 1, 0, 0, 0, 0, 0, null, sysdate, 0);

-- statementId: docNewFile.insert
-- lookupStatementId: docNewFile.insert
-- source: file_sqlmap.xml
-- type: insert
-- params: {
--   "id": 1001,
--   "docLibId": 1001,
--   "frName": "NAME_001",
--   "frDesc": "VALUE_001",
--   "frType": "VALUE_001",
--   "frOrder": "VALUE_001",
--   "parentFrId": 1001,
--   "frSize": "VALUE_001",
--   "frSource": "VALUE_001",
--   "createUserId": 1001,
--   "logicPath": "VALUE_001",
--   "mimeOrder": "VALUE_001"
-- }
insert into doc_resources (ID, DOC_LIB_ID, FR_NAME, FR_DESC, FR_TYPE, FR_ORDER, PARENT_FR_ID, FR_SIZE, SOURCE_ID, IS_FOLDER, SUBFOLDER_ENABLED, COMMENT_ENABLED, COMMENT_COUNT, ACCESS_COUNT, CREATE_USER_ID, CREATE_TIME, LAST_USER_ID, LAST_UPDATE, STATUS, STATUS_DATE, LOGICAL_PATH, MIME_TYPE_ID, IS_CHECK_OUT, CHECK_OUT_USER_ID, CHECK_OUT_TIME, KEY_WORDS, HAS_ATTACHMENTS, IS_LEARNING_DOC, MIME_ORDER, THIRD_HASPINGHOLE, VERSION_ENABLED, VERSION_COMMENT, PIGEONHOLE_TYPE, SOURCE_TYPE, RECOMMEND_ENABLE, RECOMMEND_COUNT, COLLECT_COUNT,DOWNLOAD_COUNT,SCORE_COUNT, TOTAL_SCORE, FAVORITE_SOURCE, OPEN_SQUARE_TIME, IS_PIGEONHOLE_ARCHIVE) values (1001, 1001, 'NAME_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 1001, 'VALUE_001', 'VALUE_001', 0, 0, 1, 0, 0, 1001, sysdate, 1001, sysdate, 2, sysdate, 'VALUE_001', 'VALUE_001', 0, null, null, null, 0, 0, 'VALUE_001', 0, 0, null, null, null, 1, 0, 0, 0, 0, 0, null, sysdate, 0);

-- statementId: getFrOrder.select
-- lookupStatementId: getFrOrder.select
-- source: file_sqlmap.xml
-- type: select
-- params: {
--   "docLibId": 1001,
--   "parentFrId": 1001
-- }
select min(fr_order) as FRMIN from doc_resources dc where dc.doc_lib_id = 1001 and dc.parent_fr_id = 1001;

-- statementId: protocolInfo.select
-- lookupStatementId: protocolInfo.select
-- source: file_sqlmap.xml
-- type: select
-- params: {
--   "id": 1001
-- }
select field0001 as IP, field0002 as PORT, field0003 as USR, field0004 as PSSW, field0005 as TYPE from formmain_1115 where field0006=1001;

-- statementId: attachFileInfo.select
-- lookupStatementId: attachFileInfo.select
-- source: file_sqlmap.xml
-- type: select
-- params: {
--   "id": 1001
-- }
select id, field0001 as connectValue, field0002 as fileName, field0003 as filePath, field0004 as fileState, field0006 as typeId, field0007 as connectType, field0009 as tableName, field0008 as connectField, field0010 as fieldName , START_MEMBER_ID from formmain_0909 where field0004=2620725725532802393 AND id in (1001);

-- statementId: attachFileInfo.update
-- lookupStatementId: attachFileInfo.update
-- source: file_sqlmap.xml
-- type: update
-- params: {
--   "fileState": 1,
--   "remark": "VALUE_001",
--   "id": 1001
-- }
update formmain_0909 set field0004=1, field0005='VALUE_001' where id=1001;

-- statementId: docCenterFile.delete
-- lookupStatementId: docCenterFile.delete
-- source: file_sqlmap.xml
-- type: delete
-- params: "VALUE_001"
delete doc_resources where fr_desc = 'VALUE_001';

-- statementId: findDocCenterFileId.select
-- lookupStatementId: findDocCenterFileId.select
-- source: file_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id from doc_resources where fr_desc = 'VALUE_001';

-- statementId: authorToDocCenter.insert
-- lookupStatementId: authorToDocCenter.insert
-- source: file_sqlmap.xml
-- type: insert
-- params: {
--   "user_id": 1001,
--   "user_type": "VALUE_001",
--   "startdate": "2026-05-14",
--   "enddate": "2026-05-14",
--   "doc_resources_id": 1001
-- }
insert into doc_acl ( ID, USER_ID, USER_TYPE, SHARETYPE, OWNER_ID, SDATE, EDATE, DOC_RESOURCE_ID, IS_ALERT, DOC_ALERT_ID, LEN_POTENT, ACL_ORDER, POTENT,doc_POTENT ) values ( util_common.getAbsID,1001, 'VALUE_001', '1', '0','2026-05-14','2026-05-14',1001, '0', '', '-1', '0', '0011100','0110000100' );

-- statementId: findTableValues
-- lookupStatementId: findTableValues
-- source: file_sqlmap.xml
-- type: select
-- params: {
--   "fieldName": "RAW_VALUE",
--   "tableName": "demo_table",
--   "formId": 1001
-- }
select RAW_VALUE from demo_table where formmain_id = 1001;

-- statementId: fileIdByRefAndSubRef.select
-- lookupStatementId: fileIdByRefAndSubRef.select
-- source: file_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select distinct(c.file_url) as fieldId from ctp_attachment c where c.sub_reference = 'VALUE_001';

-- statementId: fileIdByRefAndSubRefAndColId.select
-- lookupStatementId: fileIdByRefAndSubRefAndColId.select
-- source: file_sqlmap.xml
-- type: select
-- params: {
--   "attachmentId": 1001,
--   "colSummaryId": 1001
-- }
select distinct(c.file_url) as fieldId from ctp_attachment c where c.sub_reference = 1001 and c.att_reference = 1001;

-- statementId: insertFormAssociation.insert
-- lookupStatementId: insertFormAssociation.insert
-- source: file_sqlmap.xml
-- type: insert
-- params: {
--   "destMainTableId": 1001,
--   "sourceTableColId": 1001,
--   "field": "VALUE_001"
-- }
insert into form_relation_record (id,FROM_MASTERDATA_ID,TO_MASTERDATA_ID,STATE,FIELD_NAME,FORM_TYPE,TYPE,MEMBER_ID,FROM_SUBDATA_ID,TO_SUBDATA_ID) values (util_common.getAbsID,1001,1001,1,'VALUE_001',null,1,-6760911671874597139,0,0);

-- statementId: updateBorrowTime.update
-- lookupStatementId: updateBorrowTime.update
-- source: file_sqlmap.xml
-- type: update
-- params: {
--   "doc_resources_id": 1001
-- }
update doc_resources set acl_create_time=sysdate where id=1001;

-- statementId: attachmentInfoByRef.select
-- lookupStatementId: attachmentInfoByRef.select
-- source: file_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select f.id as "id",f.att_reference "attReference",f.sub_reference "subReference",f.file_url "fileUrl",f.filename "fileName" from ctp_attachment f where f.sub_reference = 'VALUE_001';

-- statementId: initConfig.select
-- lookupStatementId: initConfig.select
-- source: flowdata_sqlmap.xml
-- type: select
-- params: {
--   "activityId": 1001,
--   "templeteId": 1001
-- }
SELECT VC_ACTIVITYID AS ACTIVITYID, (SELECT VM1.VC_FORMNAME FROM VM_FORMFIELD VM1 WHERE VM1.VC_TABLENAME = F1.VC_SOURCEFORMMAIN AND ROWNUM = 1) AS SOURCEFORMMAIN, (SELECT VM8.VC_TABLEDISPLAY FROM VM_FORMFIELD VM8 WHERE VM8.vc_ownertableid = F1.VC_SOURCEFORMMAIN and vm8.VC_TABLENAME = f1.vc_sourceformson AND ROWNUM = 1) AS SOURCEFORMSON, (SELECT VM2.VC_FORMNAME FROM VM_FORMFIELD VM2 WHERE VM2.VC_TABLENAME = F1.VC_AIMFORMMAIN AND ROWNUM = 1) AS AIMFORMMAIN, (SELECT VM3.VC_TABLEDISPLAY FROM VM_FORMFIELD VM3 WHERE VM3.VC_TABLENAME = F1.VC_AIMFORMSON AND ROWNUM = 1) AS AIMFORMSON, (NVL((SELECT VM6.VC_FIELDDISPLAY FROM VM_FORMFIELD VM6 WHERE VM6.VC_FIELDNAME = F1.VC_SOURCEFIELD AND VM6.VC_TABLENAME = F1.VC_SOURCEFORMMAIN AND ROWNUM = 1), (SELECT VM6.VC_FIELDDISPLAY FROM VM_FORMFIELD VM6 WHERE VM6.VC_FIELDNAME = F1.VC_SOURCEFIELD AND VM6.VC_OWNERTABLEID = F1.VC_SOURCEFORMMAIN AND ROWNUM = 1))) AS SOURCEFIELD, (SELECT VM7.VC_FIELDDISPLAY FROM VM_FORMFIELD VM7 WHERE VM7.VC_FIELDNAME = F1.VC_AIMFIELD AND (VM7.VC_TABLENAME = F1.VC_AIMFORMMAIN OR VM7.VC_TABLENAME = F1.VC_AIMFORMSON) AND ROWNUM = 1) AS AIMFIELD, f1.n_type as type FROM FG_FLOW_DATA_INIT F1 where f1.VC_ACTIVITYID = 1001 and f1.VC_TEMPLETEID = 1001 order by n_type;

-- statementId: initNodeConfig.select
-- lookupStatementId: initNodeConfig.select
-- source: flowdata_sqlmap.xml
-- type: select
-- params: {
--   "activityId": 1001,
--   "templeteId": 1001
-- }
SELECT VC_ACTIVITYID AS activityid, VC_SOURCEFORMMAIN as sourceformmain, VC_SOURCEFORMson as sourceformson, VC_AIMFORMMAIN as aimformmain, VC_AIMFORMSON as aimformson, VC_SOURCEFIELD as sourcefield, VC_AIMFIELD as aimfield, n_type as type FROM FG_FLOW_DATA_INIT where VC_ACTIVITYID = 1001 and VC_TEMPLETEID = 1001 order by n_type;

-- statementId: flowDateInitConfig.delete
-- lookupStatementId: flowDateInitConfig.delete
-- source: flowdata_sqlmap.xml
-- type: delete
-- params: {
--   "activityId": 1001,
--   "templeteId": 1001
-- }
delete FG_FLOW_DATA_INIT WHERE vc_activityid = 1001 and VC_TEMPLETEID = 1001;

-- statementId: flowDateInitConfig.insert
-- lookupStatementId: flowDateInitConfig.insert
-- source: flowdata_sqlmap.xml
-- type: insert
-- params: {
--   "id": 1001,
--   "activityId": 1001,
--   "templeteId": 1001,
--   "sourceFormmain": "VALUE_001",
--   "sourceFormson": "VALUE_001",
--   "aimFormmain": "VALUE_001",
--   "aimFormson": "VALUE_001",
--   "sourceField": "VALUE_001",
--   "aimField": "VALUE_001",
--   "type": "VALUE_001"
-- }
INSERT INTO FG_FLOW_DATA_INIT (N_RECID,VC_ACTIVITYID,VC_TEMPLETEID,VC_SOURCEFORMMAIN,vc_sourceformson,VC_AIMFORMMAIN,VC_AIMFORMSON,VC_SOURCEFIELD,VC_AIMFIELD,n_type) VALUES (1001, 1001,1001, (select vc_tablename from vm_formfield where vc_formname='VALUE_001' and vc_tabletype='master' and rownum=1), (select vc_tablename from vm_formfield where vc_formname='VALUE_001' and vc_tabledisplay='VALUE_001' and rownum=1), (select vc_tablename from vm_formfield where vc_formname='VALUE_001' and vc_tabletype='master' and rownum=1), (select vc_tablename from vm_formfield where vc_formname='VALUE_001' and vc_tabledisplay='VALUE_001' and rownum=1), (select vc_fieldname from vm_formfield where vc_formname='VALUE_001' and vc_fielddisplay='VALUE_001' and rownum=1), (select vc_fieldname from vm_formfield where vc_formname='VALUE_001' and vc_fielddisplay='VALUE_001' and rownum=1), 'VALUE_001');

-- statementId: flowDateInit.select
-- lookupStatementId: flowDateInit.select
-- source: flowdata_sqlmap.xml
-- type: select
-- params: {
--   "selectData": "RAW_VALUE",
--   "sourceForm": "RAW_VALUE",
--   "aimForm": "RAW_VALUE",
--   "condition": "RAW_VALUE"
-- }
select RAW_VALUE from RAW_VALUE t1, RAW_VALUE t2 where RAW_VALUE order by t1.modify_date;

-- statementId: sonFlowDateInit.delete
-- lookupStatementId: sonFlowDateInit.delete
-- source: flowdata_sqlmap.xml
-- type: delete
-- params: {
--   "aimFormson": "RAW_VALUE",
--   "formmainId": 1001
-- }
delete RAW_VALUE where formmain_id=1001;

-- statementId: sonFlowDateInit.insert
-- lookupStatementId: sonFlowDateInit.insert
-- source: flowdata_sqlmap.xml
-- type: insert
-- params: {
--   "aimFormson": "RAW_VALUE",
--   "field": "RAW_VALUE",
--   "id": 1001,
--   "formmainId": 1001,
--   "sort": 1,
--   "value": "RAW_VALUE"
-- }
insert into RAW_VALUE (id,formmain_id,sort,RAW_VALUE) values (1001,1001,1,RAW_VALUE);

-- statementId: getFormmainFieldNameList.select
-- lookupStatementId: getFormmainFieldNameList.select
-- source: flowdata_sqlmap.xml
-- type: select
-- params: {
--   "mainTableName": "NAME_001"
-- }
SELECT DISTINCT vc_fieldname AS fieldid,vc_fielddisplay AS fieldname FROM vm_formfield WHERE vc_formname = 'NAME_001' and vc_tabletype = 'master' AND vc_fieldname like 'field%' order by vc_fieldname;

-- statementId: getFormsonFieldNameList.select
-- lookupStatementId: getFormsonFieldNameList.select
-- source: flowdata_sqlmap.xml
-- type: select
-- params: {
--   "mainTableName": "NAME_001",
--   "sonTableName": "NAME_001"
-- }
SELECT DISTINCT vc_fieldname AS fieldid,vc_fielddisplay AS fieldname FROM vm_formfield WHERE vc_formname = 'NAME_001' and vc_tabledisplay = 'NAME_001' and vc_tabletype = 'slave' AND vc_fieldname like 'field%' order by vc_fieldname;

-- statementId: complianceTip.selelct
-- lookupStatementId: complianceTip.selelct
-- source: flowSend_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id, complianceCode, sendUserNo, noteTitle, noteContent, attacheId, complianceType, sendDepartment,noteMember,noteDepart,noteCompa,noteRemoveMember from imy_complictip where id = 'VALUE_001';

-- statementId: complianceTipCap4.selelct
-- lookupStatementId: complianceTipCap4.selelct
-- source: flowSend_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id, complianceCode, sendUserNo, noteTitle, noteContent, attacheId, complianceType, sendDepartment,noteMember,noteDepart,noteCompa,noteRemoveMember from imy_complictip_cap4 where id = 'VALUE_001';

-- statementId: complianceTipFlow.selelct
-- lookupStatementId: complianceTipFlow.selelct
-- source: flowSend_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id, complianceCode, sendUserNo, noteTitle, noteContent, attacheId, complianceType, sendDepartment,noteMember,noteDepart,noteCompa,noteRemoveMember from imy_complictip_flow where id = 'VALUE_001';

-- statementId: complianceTipFlowCap4.selelct
-- lookupStatementId: complianceTipFlowCap4.selelct
-- source: flowSend_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id, complianceCode, sendUserNo, noteTitle, noteContent, attacheId, complianceType, sendDepartment,noteMember,noteDepart,noteCompa,noteRemoveMember from imy_complictip_flow_cap4 where id = 'VALUE_001';

-- statementId: compFlowData.select
-- lookupStatementId: compFlowData.select
-- source: flowSend_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id, compliancecode, senduserno, notetitle, notecontent, attacheid, compliancetype, attachemark, notedepart, notemember, finishedflag from wf_complictip w where w.compliancecode = 'VALUE_001';

-- statementId: compFlowDataCap4.select
-- lookupStatementId: compFlowDataCap4.select
-- source: flowSend_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id, compliancecode, senduserno, notetitle, notecontent, attacheid, compliancetype, attachemark, notedepart, notemember, finishedflag from wf_complictip_cap4 w where w.compliancecode = 'VALUE_001';

-- statementId: complianceTipNoFinish.selelct
-- lookupStatementId: complianceTipNoFinish.selelct
-- source: flowSend_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id, compliancecode, senduserno, notetitle, notecontent, attacheid, compliancetype, attachemark, notedepart, notemember, finishedflag from wf_complictip w where w.compliancecode = 'VALUE_001';

-- statementId: complianceTipNoFinishCap4.selelct
-- lookupStatementId: complianceTipNoFinishCap4.selelct
-- source: flowSend_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id, compliancecode, senduserno, notetitle, notecontent, attacheid, compliancetype, attachemark, notedepart, notemember, finishedflag from wf_complictip_cap4 w where w.compliancecode = 'VALUE_001';

-- statementId: compcpTrainFlowData.select
-- lookupStatementId: compcpTrainFlowData.select
-- source: flowSend_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id, finishedflag, traincode, senduserno, senddate, jointranmembe, jointrandepar, trainsubject, traincontent, note, attacheid, senddepart, isfinishstudy, contactdepart, attachmark, flowid from wf_compcptrain w where w.traincode = 'VALUE_001';

-- statementId: compcpTrainFlowDataCap4.select
-- lookupStatementId: compcpTrainFlowDataCap4.select
-- source: flowSend_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id, finishedflag, traincode, senduserno, senddate, jointranmembe, jointrandepar, trainsubject, traincontent, note, attacheid, senddepart, isfinishstudy, contactdepart, attachmark, flowid from wf_compcptrain_cap4 w where w.traincode = 'VALUE_001';

-- statementId: updateComplianceTipsResultById.update
-- lookupStatementId: updateComplianceTipsResultById.update
-- source: flowSend_sqlmap.xml
-- type: update
-- params: "VALUE_001"
update imy_complictipson i1 set i1.signedmember = (select decode(i1.signedmember, null, w.notemember, i1.signedmember || ',' || w.notemember) from wf_complictip w, imy_complictip i, imy_complictipson s where w.compliancecode = i.compliancecode and i.id = s.formmainid and w.notedepart = s.signdep and i1.signdep = w.notedepart and i.id = i1.formmainid and i.id = 'VALUE_001'), i1.signmember = (select replace(i1.signmember, w.notemember, '') from wf_complictip w, imy_complictip i, imy_complictipson s where w.compliancecode = i.compliancecode and i.id = s.formmainid and w.notedepart = s.signdep and i1.signdep = w.notedepart and i.id = i1.formmainid and i.id = 'VALUE_001') where exists (select 1 from wf_complictip w, imy_complictip i, imy_complictipson s where w.compliancecode = i.compliancecode and i.id = s.formmainid and w.notedepart = s.signdep and i.id = i1.formmainid and i1.signdep = w.notedepart and i.id = 'VALUE_001');

-- statementId: getCap3ReceiveCorrespondInfo.select
-- lookupStatementId: getCap3ReceiveCorrespondInfo.select
-- source: correspondence_sqlmap.xml
-- type: select
-- params: {}
select vcf.id as "flowId", vci.serialNum as "serialNum" from vm_cap3ReceiveCorrespond_Info vci left join vm_cap3ReceiveCorrespond_flow vcf on vcf.serialNum = vci.serialNum where vci.flowUrl is null;

-- statementId: getCap4ReceiveCorrespondInfo.select
-- lookupStatementId: getCap4ReceiveCorrespondInfo.select
-- source: correspondence_sqlmap.xml
-- type: select
-- params: {}
select vcf.id as "flowId", vci.serialNum as "serialNum" from vm_cap3ReceiveCorrespond_Info vci left join vm_cap4ReceiveCorrespond_flow vcf on vcf.serialNum = vci.serialNum where vci.flowUrl is null;

-- statementId: updateCap3ReceiveFlowUrlField.update
-- lookupStatementId: updateCap3ReceiveFlowUrlField.update
-- source: correspondence_sqlmap.xml
-- type: update
-- params: {
--   "flowUrl": "VALUE_001",
--   "serialNum": "VALUE_001"
-- }
update vm_cap3ReceiveCorrespond_Info set flowUrl='VALUE_001' where serialNum='VALUE_001';

-- statementId: updateCap4ReceiveFlowUrlField.update
-- lookupStatementId: updateCap4ReceiveFlowUrlField.update
-- source: correspondence_sqlmap.xml
-- type: update
-- params: {
--   "flowUrl": "VALUE_001",
--   "serialNum": "VALUE_001"
-- }
update vm_cap4ReceiveCorrespond_Info set flowUrl='VALUE_001' where serialNum='VALUE_001';

-- statementId: getCap3SendCorrespondInfo.select
-- lookupStatementId: getCap3SendCorrespondInfo.select
-- source: correspondence_sqlmap.xml
-- type: select
-- params: {}
select vcf.id as "flowId", vci.serialNum as "serialNum" from vm_cap3SendCorrespond_Info vci left join vm_cap3SendCorrespond_flow vcf on vcf.serialNum = vci.serialNum where vci.flowUrl is null;

-- statementId: getCap4SendCorrespondInfo.select
-- lookupStatementId: getCap4SendCorrespondInfo.select
-- source: correspondence_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select vcf.id as "flowId", vci.serialNum as "serialNum" from vm_cap3SendCorrespond_Info vci left join VALUE_001 vcf on vcf.serialNum = vci.serialNum where vci.flowUrl is null;

-- statementId: updateCap3SendFlowUrlField.update
-- lookupStatementId: updateCap3SendFlowUrlField.update
-- source: correspondence_sqlmap.xml
-- type: update
-- params: {
--   "flowUrl": "VALUE_001",
--   "serialNum": "VALUE_001"
-- }
update vm_cap3SendCorrespond_Info set flowUrl='VALUE_001' where serialNum='VALUE_001';

-- statementId: updateCap4SendFlowUrlField.update
-- lookupStatementId: updateCap4SendFlowUrlField.update
-- source: correspondence_sqlmap.xml
-- type: update
-- params: {
--   "flowUrl": "VALUE_001",
--   "serialNum": "VALUE_001"
-- }
update vm_cap4SendCorrespond_Info set flowUrl='VALUE_001' where serialNum='VALUE_001';

-- statementId: personSonOnlyPerSon.insert
-- lookupStatementId: personSonOnlyPerSon.insert
-- source: person_sqlmap.xml
-- type: insert
-- params: {
--   "table_name": "demo_table",
--   "subField": "RAW_VALUE",
--   "formmain_id": 1001,
--   "sort": 1,
--   "person": "VALUE_001"
-- }
insert into demo_table ( id,formmain_id,sort,RAW_VALUE ) values ( util_common.getAbsID,1001,1,'VALUE_001' );

-- statementId: personSonNoDepart.insert
-- lookupStatementId: personSonNoDepart.insert
-- source: person_sqlmap.xml
-- type: insert
-- params: {
--   "table_name": "demo_table",
--   "subField": "RAW_VALUE",
--   "typeField": "RAW_VALUE",
--   "formmain_id": 1001,
--   "sort": 1,
--   "person": "VALUE_001",
--   "type": "VALUE_001"
-- }
insert into demo_table ( id,formmain_id,sort,RAW_VALUE,RAW_VALUE ) values ( util_common.getAbsID,1001,1,'VALUE_001','VALUE_001' );

-- statementId: personSonNoType.insert
-- lookupStatementId: personSonNoType.insert
-- source: person_sqlmap.xml
-- type: insert
-- params: {
--   "table_name": "demo_table",
--   "subField": "RAW_VALUE",
--   "departField": "RAW_VALUE",
--   "formmain_id": 1001,
--   "sort": 1,
--   "person": "VALUE_001",
--   "depart": "VALUE_001"
-- }
insert into demo_table ( id,formmain_id,sort,RAW_VALUE,RAW_VALUE ) values ( util_common.getAbsID,1001,1,'VALUE_001','VALUE_001' );

-- statementId: personSonAll.insert
-- lookupStatementId: personSonAll.insert
-- source: person_sqlmap.xml
-- type: insert
-- params: {
--   "table_name": "demo_table",
--   "subField": "RAW_VALUE",
--   "departField": "RAW_VALUE",
--   "typeField": "RAW_VALUE",
--   "formmain_id": 1001,
--   "sort": 1,
--   "person": "VALUE_001",
--   "depart": "VALUE_001",
--   "type": "VALUE_001"
-- }
insert into demo_table ( id,formmain_id,sort,RAW_VALUE,RAW_VALUE,RAW_VALUE ) values ( util_common.getAbsID,1001,1,'VALUE_001','VALUE_001','VALUE_001' );

-- statementId: personSon.insert
-- lookupStatementId: personSon.insert
-- source: person_sqlmap.xml
-- type: insert
-- params: {
--   "table_name": "demo_table",
--   "formmain_id": 1001
-- }
insert into demo_table ( id,formmain_id,sort ) values ( util_common.getAbsID,1001,1 );

-- statementId: personSonOnlyPerSon.update
-- lookupStatementId: personSonOnlyPerSon.update
-- source: person_sqlmap.xml
-- type: update
-- params: {
--   "table_name": "demo_table",
--   "subField": "RAW_VALUE",
--   "person": "VALUE_001",
--   "formmain_id": 1001,
--   "sort": 1
-- }
update demo_table set RAW_VALUE = 'VALUE_001' where formmain_id = 1001 AND sort = 1;

-- statementId: personSonNoDepart.update
-- lookupStatementId: personSonNoDepart.update
-- source: person_sqlmap.xml
-- type: update
-- params: {
--   "table_name": "demo_table",
--   "subField": "RAW_VALUE",
--   "person": "VALUE_001",
--   "typeField": "RAW_VALUE",
--   "type": "VALUE_001",
--   "formmain_id": 1001,
--   "sort": 1
-- }
update demo_table set RAW_VALUE = 'VALUE_001',RAW_VALUE = 'VALUE_001' where formmain_id = 1001 AND sort = 1;

-- statementId: personSonNoType.update
-- lookupStatementId: personSonNoType.update
-- source: person_sqlmap.xml
-- type: update
-- params: {
--   "table_name": "demo_table",
--   "subField": "RAW_VALUE",
--   "person": "VALUE_001",
--   "departField": "RAW_VALUE",
--   "depart": "VALUE_001",
--   "formmain_id": 1001,
--   "sort": 1
-- }
update demo_table set RAW_VALUE = 'VALUE_001',RAW_VALUE = 'VALUE_001' where formmain_id = 1001 AND sort = 1;

-- statementId: personSonAll.update
-- lookupStatementId: personSonAll.update
-- source: person_sqlmap.xml
-- type: update
-- params: {
--   "table_name": "demo_table",
--   "subField": "RAW_VALUE",
--   "person": "VALUE_001",
--   "departField": "RAW_VALUE",
--   "depart": "VALUE_001",
--   "typeField": "RAW_VALUE",
--   "type": "VALUE_001",
--   "formmain_id": 1001,
--   "sort": 1
-- }
update demo_table set RAW_VALUE = 'VALUE_001',RAW_VALUE = 'VALUE_001',RAW_VALUE = 'VALUE_001' where formmain_id = 1001 AND sort = 1;

-- statementId: personSon.select.count
-- lookupStatementId: personSon.select.count
-- source: person_sqlmap.xml
-- type: select
-- params: {
--   "table_name": "demo_table",
--   "formmain_id": 1001,
--   "subField": "RAW_VALUE"
-- }
SELECT count(*) FROM demo_table WHERE formmain_id = 1001 AND RAW_VALUE is not null;

-- statementId: personSonOnlyPerSon.select.count
-- lookupStatementId: personSonOnlyPerSon.select.count
-- source: person_sqlmap.xml
-- type: select
-- params: {
--   "table_name": "demo_table",
--   "formmain_id": 1001,
--   "subField": "RAW_VALUE",
--   "person": "VALUE_001"
-- }
SELECT count(*) FROM demo_table WHERE formmain_id = 1001 AND RAW_VALUE = 'VALUE_001';

-- statementId: personSonNoDepart.select.count
-- lookupStatementId: personSonNoDepart.select.count
-- source: person_sqlmap.xml
-- type: select
-- params: {
--   "table_name": "demo_table",
--   "formmain_id": 1001,
--   "subField": "RAW_VALUE",
--   "person": "VALUE_001",
--   "typeField": "RAW_VALUE",
--   "type": "VALUE_001"
-- }
SELECT count(*) FROM demo_table WHERE formmain_id = 1001 AND RAW_VALUE = 'VALUE_001' AND RAW_VALUE = 'VALUE_001';

-- statementId: personSon.delete
-- lookupStatementId: personSon.delete
-- source: person_sqlmap.xml
-- type: delete
-- params: {
--   "table_name": "demo_table",
--   "formmain_id": 1001
-- }
delete demo_table where formmain_id = 1001;

-- statementId: voteById.select
-- lookupStatementId: voteById.select
-- source: vote_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id, voteStatus, accountIds, employeeSupervisorNumber, util_user.getMemCodeByMemId(sendUser) as sendUserNo, sendDepart, sendDate, beginDate, endDate, voter, voteTopic, voteSelectedNote, maxChoices, minChoices, voteNote from vm_employeeSupervisorVote where id = 'VALUE_001';

-- statementId: memberByAccount.select
-- lookupStatementId: memberByAccount.select
-- source: vote_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id from org_member m where m.is_deleted = 0 and m.state=1 and m.org_department_id != -1 and m.is_internal = 1 and m.org_account_id in(VALUE_001);

-- statementId: wfvote.insert
-- lookupStatementId: wfvote.insert
-- source: vote_sqlmap.xml
-- type: insert
-- params: "VALUE_001"
insert into vm_wfselectvoteson (id,formmain_id,sort,selected,selectContent,line) select util_common.getAbsID, v1.id, v2.sort, v2.selected, v2.selectContent, v2.line from vm_wfselectvote v1 left join vm_employeeSupervisorVote v3 on v1.voteFlag = v3.id || v3.voteTopic left join vm_employeeSupervisorVoteSon v2 on v2.formmain_id = v3.id where v3.id = 'VALUE_001';

-- statementId: voteByFlg.delete
-- lookupStatementId: voteByFlg.delete
-- source: vote_sqlmap.xml
-- type: delete
-- params: {}
delete vm_wfselectvoteson vm where vm.selectContent is null;

-- statementId: archiving.select.count
-- lookupStatementId: archiving.select.count
-- source: archiving_sqlmap.xml
-- type: select
-- params: {
--   "sql": "update demo_table set status = 1"
-- }
update demo_table set status = 1;

-- statementId: archiving.insert
-- lookupStatementId: archiving.insert
-- source: archiving_sqlmap.xml
-- type: insert
-- params: {
--   "sql": "update demo_table set status = 1"
-- }
update demo_table set status = 1;

-- statementId: archiving.update
-- lookupStatementId: archiving.update
-- source: archiving_sqlmap.xml
-- type: update
-- params: {
--   "sql": "update demo_table set status = 1"
-- }
update demo_table set status = 1;

-- statementId: universalData.select
-- lookupStatementId: universalData.select
-- source: archiving_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select timeTaskName ,executeSequence ,IFSQL ,TRUESQL ,FALSESQL from vm_universalProcessConfig vm where vm.timeTaskName = 'VALUE_001' order by executeSequence;

-- statementId: executeIfSql.select
-- lookupStatementId: executeIfSql.select
-- source: archiving_sqlmap.xml
-- type: select
-- params: {
--   "sql": "update demo_table set status = 1"
-- }
update demo_table set status = 1;

-- statementId: executeIfSqlUniversalProcess.select
-- lookupStatementId: executeIfSqlUniversalProcess.select
-- source: archiving_sqlmap.xml
-- type: select
-- params: {
--   "sql": "update demo_table set status = 1"
-- }
update demo_table set status = 1;

-- statementId: executeSql.update
-- lookupStatementId: executeSql.update
-- source: archiving_sqlmap.xml
-- type: update
-- params: {
--   "sql": "update demo_table set status = 1"
-- }
update demo_table set status = 1;

-- statementId: getBlockToken.select
-- lookupStatementId: getBlockToken.select
-- source: flow_sqlmap.xml
-- type: select
-- params: {
--   "summaryid": 1001,
--   "dataid": "RAW_VALUE"
-- }
select sc.id, to_char(sc.invoke_time,'yyyy-MM-dd HH24:mi:ss') time, sc.form_app_id formid,de.name name from wf_supernode_control sc LEFT JOIN WF_SUPERNODE_CONTROL_DETAIL scson on SC.ID=SCSON.CONTROL_ID left join form_definition de on de.id =sc.form_app_id where process_id = (select process_id from col_summary where id = 1001) and scson.data_id like chr(60)||'data%' and xmltype(nvl(scson.data_id,chr(60)||'data/'||chr(62))).extract('/data/init/nodecode/text()').getStringVal() in (RAW_VALUE) order by time asc;

-- statementId: getDeptPath.select
-- lookupStatementId: getDeptPath.select
-- source: flow_sqlmap.xml
-- type: select
-- params: {
--   "depart": "RAW_VALUE"
-- }
select path from org_unit where id in (RAW_VALUE);

-- statementId: getDepId.select
-- lookupStatementId: getDepId.select
-- source: flow_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id from org_unit where path like 'VALUE_001%' and org_unit.is_enable = 1 and org_unit.is_internal = 1;

-- statementId: getMemberId.select
-- lookupStatementId: getMemberId.select
-- source: flow_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id from org_member where is_enable = 1 and org_department_id in (VALUE_001);

-- statementId: getMemberName.select
-- lookupStatementId: getMemberName.select
-- source: flow_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select login_name from org_principal where member_id in (VALUE_001);

-- statementId: getBlockIngNodeInfo.select
-- lookupStatementId: getBlockIngNodeInfo.select
-- source: flow_sqlmap.xml
-- type: select
-- params: {
--   "isOpen": "VALUE_001",
--   "blockType": "VALUE_001"
-- }
select formName as "formName", tableName as "tableName", templateNo as "templateNo", token as "token", flowId as "flowId" from vm_blockAndActiveInfo where isOpen != 'VALUE_001' and blockType = 'VALUE_001';

-- statementId: getBlockNodeConfig.select
-- lookupStatementId: getBlockNodeConfig.select
-- source: flow_sqlmap.xml
-- type: select
-- params: {}
select templateNo as "templateNo", activeConditions as "activeConditions" from vm_blockAndActiveConfig;

-- statementId: projectCloudDeskInfo.select
-- lookupStatementId: projectCloudDeskInfo.select
-- source: outsourcemanager_sqlmap.xml
-- type: select
-- params: {
--   "flowId": 1001
-- }
select v3.id, v1.belongTeam, LDAPRoot, DNS, authCode, userInitPassword, DNSAdmin, DNSAdminPassword, DNSUrl, cacertLocation, cacertPassword, cloudDeskMod, resourceId, host, run_position, disk, storage, network, policyGroup, cloudDeskAdmin, cloudDeskPassword, policyGroupName, v2.flowID, v3.entryMember, v3.fullSpellingOfName, v3.email from vm_cap_cloudDeskConfig v1 left join vm_projectEntrance v2 on v1.belongTeam = v2.belongTeam left join vm_projectEntranceSon v3 on v2.id =v3.formmain_id where flowid = 1001;

-- statementId: projectLeaveInfoByFlowId.select
-- lookupStatementId: projectLeaveInfoByFlowId.select
-- source: outsourcemanager_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select v1.belongTeam, LDAPRoot, DNS, authCode, userInitPassword, DNSAdmin, DNSAdminPassword, DNSUrl, cacertLocation, cacertPassword, cloudDeskMod, resourceId, host, run_position, disk, storage, network, policyGroup, cloudDeskAdmin, cloudDeskPassword, policyGroupName, v2.flowID, v3.email, util_user.getLoginNameByMemId(v2.sendUser) sendUserLoginName, v3.userDN from vm_cap_cloudDeskConfig v1 left join vm_projectleave v2 on v1.belongTeam = v2.belongTeam left join projectleaveson v3 on v2.id =v3.formmain_id where isRecallResource = -3841538853571705149 and flowid = 'VALUE_001';

-- statementId: cloudDeskInfo.select
-- lookupStatementId: cloudDeskInfo.select
-- source: outsourcemanager_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select v1.belongTeam, LDAPRoot, DNS, authCode, userInitPassword, DNSAdmin, DNSAdminPassword, DNSUrl, cacertLocation, cacertPassword, cloudDeskMod, resourceId, host, run_position, disk, storage, network, policyGroup, cloudDeskAdmin, cloudDeskPassword, policyGroupName, v2.flowID, v2.entryMember, v2.sn, v2.givenName, v2.fullSpellingOfName, v2.email, v2.DNSOpenDetail, v2.cloudOpenDetail, v2.vmId from vm_cap_cloudDeskConfig v1 left join vm_capwf_coordinationEntry v2 on v1.belongTeam = v2.belongTeam where flowid = 'VALUE_001';

-- statementId: cloudDeskInfoByBelongTeam.select
-- lookupStatementId: cloudDeskInfoByBelongTeam.select
-- source: outsourcemanager_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select * from vm_cap_cloudDeskConfig where belongTeam = 'VALUE_001';

-- statementId: addLogDetail.insert
-- lookupStatementId: addLogDetail.insert
-- source: outsourcemanager_sqlmap.xml
-- type: insert
-- params: {
--   "id": 1001,
--   "userName": "NAME_001",
--   "userAccount": 1,
--   "taskId": 1001,
--   "taskName": "NAME_001",
--   "taskType": "VALUE_001",
--   "taskState": 1,
--   "startDate": "2026-05-14",
--   "endDate": "2026-05-14",
--   "finishedDate": "2026-05-14",
--   "targetDate": "2026-05-14",
--   "costs": "VALUE_001",
--   "expectedCost": "VALUE_001",
--   "requirementId": 1001,
--   "requirementName": "NAME_001",
--   "requirementStage": "VALUE_001",
--   "pm": "VALUE_001",
--   "userTeam": "VALUE_001",
--   "teamLeader": "VALUE_001",
--   "calcMonth": "VALUE_001"
-- }
insert into vm_zentaologdetail ( id, userName, userAccount, taskId, taskName, taskType, taskState, startDate, endDate, finishedDate, targetDate, costs, expectedCost, requirementId, requirementName, requirementStage, pm, userTeam, teamLeader, calcMonth ) values ( 1001, 'NAME_001', 1, 1001, 'NAME_001', 'VALUE_001', 1, to_date('2026-05-14','yyyy/MM/dd HH24:mi'), to_date('2026-05-14','yyyy/MM/dd HH24:mi'), to_date('2026-05-14','yyyy/MM/dd HH24:mi'), '2026-05-14', 'VALUE_001', 'VALUE_001', 1001, 'NAME_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', to_date('VALUE_001','yyyy-MM') );

-- statementId: removeLogSum.delete
-- lookupStatementId: removeLogSum.delete
-- source: outsourcemanager_sqlmap.xml
-- type: delete
-- params: {
--   "tyear": "VALUE_001",
--   "tmonth": "VALUE_001"
-- }
delete from vm_zentaologSum where tyear = 'VALUE_001' and tmonth = 'VALUE_001';

-- statementId: addLogSum.insert
-- lookupStatementId: addLogSum.insert
-- source: outsourcemanager_sqlmap.xml
-- type: insert
-- params: {
--   "id": 1001,
--   "tname": "NAME_001",
--   "spell": "VALUE_001",
--   "tyear": "VALUE_001",
--   "tmonth": "VALUE_001",
--   "manhour": "VALUE_001",
--   "avgday": "VALUE_001",
--   "team": "VALUE_001",
--   "day01": "VALUE_001",
--   "day02": "VALUE_001",
--   "day03": "VALUE_001",
--   "day04": "VALUE_001",
--   "day05": "VALUE_001",
--   "day06": "VALUE_001",
--   "day07": "VALUE_001",
--   "day08": "VALUE_001",
--   "day09": "VALUE_001",
--   "day10": "VALUE_001",
--   "day11": "VALUE_001",
--   "day12": "VALUE_001",
--   "day13": "VALUE_001",
--   "day14": "VALUE_001",
--   "day15": "VALUE_001",
--   "day16": "VALUE_001",
--   "day17": "VALUE_001",
--   "day18": "VALUE_001",
--   "day19": "VALUE_001",
--   "day20": "VALUE_001",
--   "day21": "VALUE_001",
--   "day22": "VALUE_001",
--   "day23": "VALUE_001",
--   "day24": "VALUE_001",
--   "day25": "VALUE_001",
--   "day26": "VALUE_001",
--   "day27": "VALUE_001",
--   "day28": "VALUE_001",
--   "day29": "VALUE_001",
--   "day30": "VALUE_001",
--   "day31": "VALUE_001",
--   "currentSupplier": "VALUE_001",
--   "memberPrice": "VALUE_001",
--   "memberLevel": "VALUE_001"
-- }
insert into vm_zentaologSum ( id, tname, spell, tyear, tmonth, manhour, avgday, team, day1, day2, day3, day4, day5, day6, day7, day8, day9, day10, day11, day12, day13, day14, day15, day16, day17, day18, day19, day20, day21, day22, day23, day24, day25, day26, day27, day28, day29, day30, day31, currentSupplier, memberPrice, memberLevel ) values ( 1001, 'NAME_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001' );

-- statementId: removeAttendSum.delete
-- lookupStatementId: removeAttendSum.delete
-- source: outsourcemanager_sqlmap.xml
-- type: delete
-- params: "VALUE_001"
delete from vm_ddclockinSum where to_char(calcMonth,'yyyy-MM') = 'VALUE_001';

-- statementId: addAttendSum.insert
-- lookupStatementId: addAttendSum.insert
-- source: outsourcemanager_sqlmap.xml
-- type: insert
-- params: {
--   "id": 1001,
--   "member": "VALUE_001",
--   "team": "VALUE_001",
--   "attendTarget": "VALUE_001",
--   "attendDays": "VALUE_001",
--   "workoverDays": "VALUE_001",
--   "calcMonth": "VALUE_001",
--   "supplier": "VALUE_001",
--   "memberPrice": "VALUE_001",
--   "memberLevel": "VALUE_001"
-- }
insert into vm_ddclockinSum ( id, member, team, attendTarget, attendDays, workoverDays, calcMonth, supplier, memberprice, memberlevel ) values ( 1001, 'VALUE_001', util_common.getEnumIdByShow(1822868929259851192,'VALUE_001'), 'VALUE_001', 'VALUE_001', 'VALUE_001', to_date('VALUE_001','yyyy-MM-dd'), 'VALUE_001', 'VALUE_001', 'VALUE_001' );

-- statementId: removeLogDetail.delete
-- lookupStatementId: removeLogDetail.delete
-- source: outsourcemanager_sqlmap.xml
-- type: delete
-- params: "VALUE_001"
delete from vm_zentaologdetail where to_char(calcMonth,'yyyy-MM') = 'VALUE_001';

-- statementId: queryLogDetail.select
-- lookupStatementId: queryLogDetail.select
-- source: outsourcemanager_sqlmap.xml
-- type: select
-- params: {
--   "team": "VALUE_001",
--   "calcMonth": "VALUE_001"
-- }
select to_char(userName) as userName, to_char(userAccount) as userAccount, to_char(taskId) as taskId, to_char(taskName) as taskName, to_char(taskType) as taskType, to_char(taskState) as taskState, to_char(startDate,'yyyy/mm/dd') as startDate, to_char(endDate,'yyyy/mm/dd') as endDate, to_char(finishedDate,'yyyy/mm/dd') as finishedDate, to_char(targetDate) as targetDate, to_char(costs) as costs, to_char(expectedCost) as expectedCost, to_char(requirementId) as requirementId, to_char(requirementName) as requirementName, to_char(requirementStage) as requirementStage, util_user.getMemberNameByMemId(pm) as pm, to_char(userTeam) as userTeam, util_user.getMemberNameByMemId(teamLeader) as teamLeader from vm_zentaologdetail where 1=1 and userTeam = util_common.getEnumIdByShow(1822868929259851192,'VALUE_001') and to_char(calcMonth,'yyyy-mm') = 'VALUE_001';

-- statementId: queryLogSum.select
-- lookupStatementId: queryLogSum.select
-- source: outsourcemanager_sqlmap.xml
-- type: select
-- params: {
--   "tyear": "VALUE_001",
--   "tmonth": "VALUE_001",
--   "team": "VALUE_001"
-- }
select to_char(id) as id, to_char(tname) as tname, to_char(spell) as spell, to_char(tyear) as tyear, to_char(tmonth) as tmonth, to_char(manhour) as manhour, to_char(avgday) as avgday, to_char(team) as team, to_char(day1) as day1, to_char(day2) as day2, to_char(day3) as day3, to_char(day4) as day4, to_char(day5) as day5, to_char(day6) as day6, to_char(day7) as day7, to_char(day8) as day8, to_char(day9) as day9, to_char(day10) as day10, to_char(day11) as day11, to_char(day12) as day12, to_char(day13) as day13, to_char(day14) as day14, to_char(day15) as day15, to_char(day16) as day16, to_char(day17) as day17, to_char(day18) as day18, to_char(day19) as day19, to_char(day20) as day20, to_char(day21) as day21, to_char(day22) as day22, to_char(day23) as day23, to_char(day24) as day24, to_char(day25) as day25, to_char(day26) as day26, to_char(day27) as day27, to_char(day28) as day28, to_char(day29) as day29, to_char(day30) as day30, to_char(day31) as day31 from vm_zentaologSum where 1=1 and tyear = 'VALUE_001' and tmonth = 'VALUE_001' and team = util_common.getEnumIdByShow(1822868929259851192,'VALUE_001');

-- statementId: outSourceDoc.select
-- lookupStatementId: outSourceDoc.select
-- source: outsourcemanager_sqlmap.xml
-- type: select
-- params: {
--   "calcDate": "2026-05-14"
-- }
select id, ontrialdays, billingdata, memberState, MEMBER, TEAM, teamManager, TEAMLEaDER, to_char(leaveDate,'yyyy-mm-dd') leaveDate, SUPPLIER from vm_cap_outsourcemanagerdoc c where 1=1 AND to_date(to_char(c.leaveDate, 'yyyy-mm'), 'yyyy-mm') >= to_date('2026-05-14', 'yyyy-mm') or c.leaveDate is null;

-- statementId: punchRecord.delete
-- lookupStatementId: punchRecord.delete
-- source: outsourcemanager_sqlmap.xml
-- type: delete
-- params: "VALUE_001"
delete from vm_cap_clockinrecord where to_char(punchDate,'yyyy-MM') = 'VALUE_001';

-- statementId: punchRecord.insert
-- lookupStatementId: punchRecord.insert
-- source: outsourcemanager_sqlmap.xml
-- type: insert
-- params: {
--   "id": 1001,
--   "state": 1,
--   "start_member_id": 1001,
--   "start_date": "2026-05-14",
--   "approve_member_id": 1001,
--   "approve_date": "2026-05-14",
--   "finishedflag": 1,
--   "ratifyflag": 1,
--   "ratify_member_id": 1001,
--   "ratify_date": "2026-05-14",
--   "member": "VALUE_001",
--   "account": 1,
--   "belongTeam": "VALUE_001",
--   "teamManager": "VALUE_001",
--   "teamLender": "VALUE_001",
--   "punchDate": "2026-05-14",
--   "punchStartTime": "2026-05-14 10:00:00",
--   "punchEndTime": "2026-05-14 10:00:00",
--   "amPunchResult": "VALUE_001",
--   "pmPunchResult": "VALUE_001",
--   "punchCount": 1,
--   "chargeCase": "VALUE_001",
--   "isWorkDay": "VALUE_001",
--   "isWorkOverTime": "2026-05-14 10:00:00",
--   "note": "VALUE_001"
-- }
insert into vm_cap_clockinrecord (id, STATE, START_MEMBER_ID, START_DATE, APPROVE_MEMBER_ID, APPROVE_DATE, FINISHEDFLAG, RATIFYFLAG, RATIFY_MEMBER_ID, RATIFY_DATE, SORT, MODIFY_MEMBER_ID, MODIFY_DATE, member, account, belongTeam, teamManager, teamLender, punchDate, punchStartTime, punchEndTime, amPunchResult, pmPunchResult, punchCount, chargeCase, isWorkDay, isWorkOverTime, note) values( 1001, 1, 1001, '2026-05-14', 1001, '2026-05-14', 1, 1, 1001, '2026-05-14', 0, 0, sysdate, 'VALUE_001', 1, 'VALUE_001', util_user.getMemberNameByMemId('VALUE_001'), 'VALUE_001', to_date('2026-05-14','yyyy-MM-dd'), '2026-05-14 10:00:00', '2026-05-14 10:00:00', 'VALUE_001', 'VALUE_001', 1, 'VALUE_001', 'VALUE_001', '2026-05-14 10:00:00', 'VALUE_001' );

-- statementId: addRequireDis.insert
-- lookupStatementId: addRequireDis.insert
-- source: outsourcemanager_sqlmap.xml
-- type: insert
-- params: {
--   "id": 1001,
--   "requireId": 1001,
--   "requireName": "NAME_001",
--   "requireDept": "VALUE_001",
--   "requireDate": "2026-05-14",
--   "requireState": 1,
--   "requirePm": "VALUE_001",
--   "operatorPm": "VALUE_001",
--   "operator": "VALUE_001",
--   "operatorAccount": 1,
--   "operatorCost": "VALUE_001",
--   "calcDate": "2026-05-14",
--   "requireType": "VALUE_001",
--   "team": "VALUE_001",
--   "memberPrice": "VALUE_001",
--   "operatorPrice": "VALUE_001",
--   "supplier": "VALUE_001"
-- }
insert into vm_cap_requiredistribution (id, requireId, requireName, requireDept, createDate, requireState, requirePm, operatorPm, operator, operatorAccount, operatorCost, calcDate, requireType, team, memberPrice, operatorPrice, supplier) values( 1001, 1001, 'NAME_001', 'VALUE_001', to_date('2026-05-14','yyyy/MM/dd HH24:mi'), 1, 'VALUE_001', 'VALUE_001', 'VALUE_001', 1, 'VALUE_001', to_date('2026-05-14','yyyy-MM'), 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001' );

-- statementId: queryRequireDis.select
-- lookupStatementId: queryRequireDis.select
-- source: outsourcemanager_sqlmap.xml
-- type: select
-- params: {
--   "calcMonth": "VALUE_001",
--   "team": "VALUE_001"
-- }
select to_char(id) as id, to_char(requireId) as requireId, to_char(requireName) as requireName, to_char(requireDept) as requireDept, to_char(createDate,'yyyy-mm-dd') as createDate, to_char(requireState) as requireState, to_char(requirePm) as requirePm, to_char(operatorPm) as operatorPm, to_char(operator) as operator, to_char(operatorAccount) as operatorAccount, to_char(operatorCost) as operatorCost, to_char(calcDate,'yyyy-mm') as calcDate, to_char(requireType) as requireType, to_char(team) as team, to_char(memberPrice) as memberPrice, to_char(operatorPrice) as operatorPrice, to_char(supplier) as supplier from vm_cap_requiredistribution where to_char(calcDate,'yyyy-MM') = 'VALUE_001' and team = util_common.getEnumIdByShow(1822868929259851192,'VALUE_001');

-- statementId: removeRequireDis.delete
-- lookupStatementId: removeRequireDis.delete
-- source: outsourcemanager_sqlmap.xml
-- type: delete
-- params: "VALUE_001"
delete from vm_cap_requiredistribution where to_char(calcDate,'yyyy-MM') = 'VALUE_001';

-- statementId: queryAttendDetail.select
-- lookupStatementId: queryAttendDetail.select
-- source: outsourcemanager_sqlmap.xml
-- type: select
-- params: {
--   "calcMonth": "VALUE_001",
--   "team": "VALUE_001"
-- }
select to_char(member) as member, to_char(account) as account, to_char(belongTeam) as belongTeam, to_char(teamManager) as teamManager, util_common.getEnumShowById(teamLender) as teamLender, to_char(punchDate,'yyyy-mm-dd') as punchDate, to_char(punchStartTime) as punchStartTime, to_char(punchEndTime) as punchEndTime, to_char(amPunchResult) as amPunchResult, to_char(pmPunchResult) as pmPunchResult, to_char(punchCount) as punchCount, to_char(chargeCase) as chargeCase, to_char(isWorkDay) as isWorkDay, to_char(isWorkOverTime) as isWorkOverTime, to_char(note) as note from vm_cap_clockinrecord where 1=1 and to_char(punchDate,'yyyy-MM') = 'VALUE_001' and belongTeam = 'VALUE_001' order by member,punchDate;

-- statementId: queryAttendSum.select
-- lookupStatementId: queryAttendSum.select
-- source: outsourcemanager_sqlmap.xml
-- type: select
-- params: {
--   "calcMonth": "VALUE_001",
--   "team": "VALUE_001"
-- }
select to_char(id) as id, to_char(member) as member, util_common.getEnumShowById(team) as team, to_char(attendTarget) as attendTarget, to_char(attendDays) as attendDays, to_char(workoverDays) as workoverDays, to_char(calcMonth,'yyyy/MM/dd') as calcMonth from vm_ddclockinSum where 1=1 and 'VALUE_001' = to_char(calcMonth,'yyyy-MM') and 'VALUE_001' = util_common.getEnumShowById(team) order by member;

-- statementId: addRequireMonthly.insert
-- lookupStatementId: addRequireMonthly.insert
-- source: outsourcemanager_sqlmap.xml
-- type: insert
-- params: {
--   "id": 1001,
--   "productId": 1001,
--   "productName": "NAME_001",
--   "zentaoRequireId": 1001,
--   "requireName": "NAME_001",
--   "creator": "VALUE_001",
--   "calcMonth": "VALUE_001",
--   "createDate": "2026-05-14",
--   "expectHour": "VALUE_001",
--   "logHour": "VALUE_001",
--   "team": "VALUE_001",
--   "requireState": 1,
--   "completeType": "VALUE_001"
-- }
insert into vm_requiremonthly (id, productId, productName, zentaoRequireId, requireName, creator, calcMonth, createDate, expectHour, logHour, team, requireState, completeType ) values( 1001, 1001, 'NAME_001', 1001, 'NAME_001', 'VALUE_001', 'VALUE_001', to_date('2026-05-14','yyyy/MM/dd hh24:mi'), 'VALUE_001', 'VALUE_001', 'VALUE_001', 1, 'VALUE_001' );

-- statementId: queryRequireMonthly.select
-- lookupStatementId: queryRequireMonthly.select
-- source: outsourcemanager_sqlmap.xml
-- type: select
-- params: {
--   "team": "VALUE_001",
--   "calcMonth": "VALUE_001",
--   "completeType": "VALUE_001"
-- }
select to_char(id) as id, to_char(productId) as productId, to_char(productName) as productName, to_char(zentaoRequireId) as zentaoRequireId, to_char(requireName) as requireName, to_char(creator) as creator, to_char(calcMonth) as calcMonth, to_char(createDate,'yyyy/mm/dd') as createDate, to_char(expectHour) as expectHour, to_char(logHour) as logHour, util_common.getEnumIdByShow(1822868929259851192,'VALUE_001') as team, requireState, completeType from vm_requiremonthly where 1=1 and 'VALUE_001' = calcMonth and util_common.getEnumIdByShow(1822868929259851192,'VALUE_001') = team and completetype = 'VALUE_001';

-- statementId: removeRequireMonthly.delete
-- lookupStatementId: removeRequireMonthly.delete
-- source: outsourcemanager_sqlmap.xml
-- type: delete
-- params: "VALUE_001"
delete from vm_requiremonthly where calcMonth = 'VALUE_001';

-- statementId: addAdjustPrice.insert
-- lookupStatementId: addAdjustPrice.insert
-- source: outsourcemanager_sqlmap.xml
-- type: insert
-- params: {
--   "id": 1001,
--   "adjustDate": "2026-05-14",
--   "supplier": "VALUE_001",
--   "pm": "VALUE_001",
--   "team": "VALUE_001",
--   "member": "VALUE_001",
--   "adjustType": "VALUE_001",
--   "entryDate": "2026-05-14",
--   "monthlyPrice": "VALUE_001",
--   "adjustPrice": "VALUE_001",
--   "explain": "VALUE_001",
--   "pmConfirm": "VALUE_001",
--   "signature": "VALUE_001",
--   "adjustReason": "VALUE_001",
--   "remark": "VALUE_001",
--   "memberLevel": "VALUE_001"
-- }
insert into vm_cap_adjustprice ( id, adjustDate, supplier, pm, team, member, adjustType, entryDate, monthlyPrice, adjustPrice, explain, pmConfirm, signature, adjustReason, remark, memberLevel ) values ( 1001, to_date('2026-05-14','yyyy-MM-dd'), 'VALUE_001', 'VALUE_001', util_common.getEnumIdByShow(1822868929259851192,'VALUE_001'), 'VALUE_001', 'VALUE_001', to_date('2026-05-14','yyyy-MM-dd'), 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001' );

-- statementId: queryAdjustPrice.select
-- lookupStatementId: queryAdjustPrice.select
-- source: outsourcemanager_sqlmap.xml
-- type: select
-- params: {
--   "calcMonth": "VALUE_001",
--   "team": "VALUE_001"
-- }
select id, adjustDate, supplier, pm, team, member, adjustType, entryDate, monthlyPrice, adjustPrice, explain, pmConfirm, signature, adjustReason, remark from vm_cap_adjustPrice where 1=1 and 'VALUE_001' = to_char(calcMonth,'yyyy-MM') and 'VALUE_001' = team;

-- statementId: removeAdjustPrice.delete
-- lookupStatementId: removeAdjustPrice.delete
-- source: outsourcemanager_sqlmap.xml
-- type: delete
-- params: "VALUE_001"
delete vm_cap_adjustprice c where to_char(c.adjustDate ,'yyyy-mm') = 'VALUE_001';

-- statementId: queryMemberTeamRela.select
-- lookupStatementId: queryMemberTeamRela.select
-- source: outsourcemanager_sqlmap.xml
-- type: select
-- params: {}
select util_user.getMemberNameByMemId(field0003) NAME,field0004 TEAM from formmain_500190;

-- statementId: queryOutsourceAdjust.select
-- lookupStatementId: queryOutsourceAdjust.select
-- source: outsourcemanager_sqlmap.xml
-- type: select
-- params: {
--   "probation": "VALUE_001",
--   "calcMonth": "VALUE_001"
-- }
select id, formmain_id, sort, membername, pm, team, entryDate, offDate, adjustcontent, currentlevel, adjusttype, adjustdate, chargedate, currentsupplier, adjustreason, currentjob, chargeenddate, memberprice, confidential, surroundingsec, contract from vm_cap_outsourceadjust where ((util_common.getEnumShowById(adjustType) = '入场' and substr(util_common.getNextWorkDay(entryDate,'VALUE_001'),0,6) = 'VALUE_001') and (to_number(offDate - entryDate) >= 30 or offdate is null)) or (util_common.getEnumShowById(adjustType) = '退场' and to_char(offDate,'yyyyMM') = 'VALUE_001');

-- statementId: queryIsZeroFee.select
-- lookupStatementId: queryIsZeroFee.select
-- source: outsourcemanager_sqlmap.xml
-- type: select
-- params: {
--   "calcMonth": "VALUE_001",
--   "memberName": "NAME_001"
-- }
select memberName from vm_cap_outsourceadjust where offdate is not null and to_char(offdate,'yyyy-mm') = 'VALUE_001' and membername = 'NAME_001' and to_number(offDate - entryDate) < 30 and util_common.getEnumShowById(adjustType) = '退场';

-- statementId: queryOutsourceDesc.select
-- lookupStatementId: queryOutsourceDesc.select
-- source: outsourcemanager_sqlmap.xml
-- type: select
-- params: {
--   "calcMonth": "VALUE_001"
-- }
select id, formmain_id, sort, membername, pm, team, entryDate, adjustcontent, currentlevel, adjusttype, adjustdate, chargedate, currentsupplier, adjustreason, currentjob, chargeenddate, memberprice, confidential, surroundingsec, contract from vm_cap_outsourceadjust a where (chargedate <= to_date('VALUE_001','yyyy-MM-dd') or to_char(chargedate,'yyyy-mm') = substr('VALUE_001',1,7)) and (offdate is null or offdate >= to_date('VALUE_001','yyyy-MM-dd')) and (entrydate <= to_date('VALUE_001','yyyy-MM-dd') or to_char(entrydate,'yyyy-mm') = substr('VALUE_001',1,7)) order by chargedate desc;

-- statementId: removeMeritsRecord.delete
-- lookupStatementId: removeMeritsRecord.delete
-- source: outsourcemanager_sqlmap.xml
-- type: delete
-- params: "VALUE_001"
delete from vm_cap_meritsinsert where to_char(meritsDate,'yyyy/MM') = 'VALUE_001';

-- statementId: addMeritsRecord.insert
-- lookupStatementId: addMeritsRecord.insert
-- source: outsourcemanager_sqlmap.xml
-- type: insert
-- params: {
--   "id": 1001,
--   "formmain_id": 1001,
--   "meritsDate": "2026-05-14",
--   "rate": "VALUE_001",
--   "rateMoney": "VALUE_001",
--   "PMEva": "VALUE_001",
--   "evaSupplier": "VALUE_001",
--   "note": "VALUE_001",
--   "pm": "VALUE_001",
--   "sort": 1
-- }
insert into vm_cap_meritsinsert ( id, formmain_id , meritsDate, /*评优时间*/ rate, /*评级*/ rateMoney, /*绩效金额*/ PMEva, /*PM评语*/ evaSupplier, /*绩效发放供应商*/ note, /*备注*/ pm, sort ) values( 1001, 1001, to_date('2026-05-14','yyyy/MM/dd'), 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 1 );

-- statementId: meritsNullRecord.delete
-- lookupStatementId: meritsNullRecord.delete
-- source: outsourcemanager_sqlmap.xml
-- type: delete
-- params: {}
DELETE from vm_cap_meritsinsert c where c.evaSupplier is null;

-- statementId: mertisData.select
-- lookupStatementId: mertisData.select
-- source: outsourcemanager_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select c2.member, util_common.getEnumShowById(c2.team) as team, meritsDate, rate, rateMoney, PMEva, evaSupplier, pm from vm_cap_meritsinsert c1 left join vm_cap_outsourcemanagerdoc c2 on c1.formmain_id = c2.id where to_char(meritsDate,'yyyy-MM') = 'VALUE_001' and ratemoney is not null;

-- statementId: capSupplier.select
-- lookupStatementId: capSupplier.select
-- source: outsourcemanager_sqlmap.xml
-- type: select
-- params: {
--   "name": "NAME_001"
-- }
select name from Vm_cap_supplierInfo where 1=1 AND name = 'NAME_001';

-- statementId: outManagerTeam.select
-- lookupStatementId: outManagerTeam.select
-- source: outsourcemanager_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select util_common.getEnumShowById(belongTeam)from vm_cap_outSourceTeam where 1=1 AND util_common.getEnumShowById(Belongteam) = 'VALUE_001';

-- statementId: allSupplierInfo.select
-- lookupStatementId: allSupplierInfo.select
-- source: outsourcemanager_sqlmap.xml
-- type: select
-- params: {}
select * from vm_cap_supplierinfo;

-- statementId: adjust.select
-- lookupStatementId: adjust.select
-- source: outsourcemanager_sqlmap.xml
-- type: select
-- params: {
--   "adjustdate": "2026-05-14",
--   "supplier": "VALUE_001"
-- }
select count(adjusttype) from vm_cap_adjustprice where to_char(adjustdate,'yyyy-MM') = '2026-05-14' and supplier = 'VALUE_001' and adjusttype ='外勤';

-- statementId: outsourceadjust.select
-- lookupStatementId: outsourceadjust.select
-- source: outsourcemanager_sqlmap.xml
-- type: select
-- params: {
--   "team": "VALUE_001",
--   "supplier": "VALUE_001",
--   "date": "2026-05-14"
-- }
select count(*) from vm_cap_outsourceadjust d where membername not in (select membername from vm_cap_outsourceadjust c where util_common.getEnumShowById(c.team) = 'VALUE_001' and c.currentsupplier = 'VALUE_001' and c.adjusttype = -1706323472835391995 and to_date(to_char(c.adjustdate, 'yyyy-MM'), 'yyyy-MM') < to_date('2026-05-14', 'yyyy-MM')) and (util_common.getEnumShowById(d.team) = 'VALUE_001' and d.currentsupplier = 'VALUE_001');

-- statementId: supplierPriceAdjust.select
-- lookupStatementId: supplierPriceAdjust.select
-- source: outsourcemanager_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select to_char(adjustDate, 'yyyy-MM-dd') as eventDate, to_char(adjustdate, 'yyyy-MM-dd') as adjustdate, supplier, pm, util_common.getEnumShowById(team) as team, member, adjusttype, to_char(entrydate, 'yyyy-MM-dd') as entrydate, monthlyprice, decode(pmconfirm,'同意',nvl(adjustprice,'-0.00'),'-0.00')adjustprice, explain, pmconfirm, signature, adjustreason, remark from vm_cap_adjustprice where to_char(adjustDate, 'yyyy-MM') = 'VALUE_001' order by team;

-- statementId: queryWorkloadInfo.select
-- lookupStatementId: queryWorkloadInfo.select
-- source: outsourcemanager_sqlmap.xml
-- type: select
-- params: {
--   "calcMonth": "VALUE_001",
--   "team": "VALUE_001"
-- }
select mem.id as id, mem.member as member, to_char(mem.teamLeader) as teamLeader, zt.avgday as avgday, zt.memberLevel as memberLevel, dd.attenddays as attendDays, dd.attendtarget as attendTarget, dd.supplier as supplier, dd.memberprice as memberprice, dd.workoverdays as workoverdays from vm_ddclockinSum dd left join vm_zentaologSum zt on (dd.member = zt.tname and dd.supplier = zt.currentsupplier and dd.memberprice = zt.memberprice and dd.memberLevel = zt.memberLevel and to_number(to_char(dd.calcmonth,'yyyy')) = zt.tyear and to_number(to_char(dd.calcmonth,'MM')) = zt.tmonth and zt.team = dd.team) left join vm_cap_outsourcemanagerdoc mem on dd.member = mem.member where to_char(dd.calcmonth,'yyyy/MM') = 'VALUE_001' and dd.team = util_common.getEnumIdByShow(1822868929259851192,'VALUE_001');

-- statementId: queryAdjustInfo.select
-- lookupStatementId: queryAdjustInfo.select
-- source: outsourcemanager_sqlmap.xml
-- type: select
-- params: {
--   "member": "VALUE_001",
--   "startDate": "2026-05-14",
--   "endDate": "2026-05-14"
-- }
select membername, pm, team, entrydate, adjusttype, adjustdate, chargedate, currentsupplier, currentLevel, chargeenddate, memberprice from vm_cap_outsourceadjust where membername = 'VALUE_001' and chargedate between to_date('2026-05-14','yyyy-MM-dd') and to_date('2026-05-14','yyyy-MM-dd') order by chargeDate asc;

-- statementId: queryAdjustOffDate.select
-- lookupStatementId: queryAdjustOffDate.select
-- source: outsourcemanager_sqlmap.xml
-- type: select
-- params: {
--   "member": "VALUE_001",
--   "startDate": "2026-05-14",
--   "endDate": "2026-05-14"
-- }
select to_char(offDate,'yyyy-mm-dd') as offdate from vm_cap_outsourceadjust where membername = 'VALUE_001' and offdate between to_date('2026-05-14','yyyy-MM-dd') and to_date('2026-05-14','yyyy-MM-dd') and rownum = 1;

-- statementId: queryCurrentMemberAdjust.select
-- lookupStatementId: queryCurrentMemberAdjust.select
-- source: outsourcemanager_sqlmap.xml
-- type: select
-- params: {
--   "member": "VALUE_001",
--   "calcMonth": "VALUE_001"
-- }
select * from ( select membername, pm, team, entrydate, adjusttype, adjustdate, chargedate, currentsupplier, currentLevel, chargeenddate, memberprice from vm_cap_outsourceadjust where membername = 'VALUE_001' and chargedate <= to_date('VALUE_001','yyyy-MM') order by chargedate desc) where rownum = 1;

-- statementId: queryMemberAdjustDate.select
-- lookupStatementId: queryMemberAdjustDate.select
-- source: outsourcemanager_sqlmap.xml
-- type: select
-- params: {
--   "member": "VALUE_001",
--   "calcMonth": "VALUE_001"
-- }
select * from ( select membername, pm, team, entrydate, adjusttype, adjustdate, chargedate, currentsupplier, currentLevel chargeenddate, memberprice from vm_cap_outsourceadjust where membername = 'VALUE_001' and chargedate <= to_date('VALUE_001','yyyy-MM-dd') order by chargedate desc) where rownum = 1;

-- statementId: queryRequireSum.select
-- lookupStatementId: queryRequireSum.select
-- source: outsourcemanager_sqlmap.xml
-- type: select
-- params: {
--   "team": "VALUE_001",
--   "calcDate": "2026-05-14"
-- }
select to_char(requireId) as requireId, to_char(requireName) as requireName, to_char(requireDept) as requireDept, to_char(requireType) as requireType, to_char(createDate,'yyyy/mm/dd') as createDate, to_char(requireState) as requireState, to_char(sum(operatorCost)) as operatorCost, to_char(sum(operatorPrice)) as operatorPrice from vm_cap_requiredistribution where requireId is not null and team = util_common.getEnumIdByShow(1822868929259851192,'VALUE_001') and to_char(calcDate,'yyyy-MM') = '2026-05-14' group by requireId,requireName,requireDept,requireType,createDate,requireState;

-- statementId: supplierPay.select
-- lookupStatementId: supplierPay.select
-- source: outsourcemanager_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select * from vm_cap_supplierPay vp left join vm_cap_supplierPayson vps on vp.id = vps.formmain_id where to_char(vp.paydate, 'yyyy-MM') = 'VALUE_001' order by member;

-- statementId: managerPriceTotal.select
-- lookupStatementId: managerPriceTotal.select
-- source: outsourcemanager_sqlmap.xml
-- type: select
-- params: {
--   "yearMonth": "VALUE_001",
--   "supplier": "VALUE_001"
-- }
select to_char(sum(adjustprice)) from vm_cap_adjustprice where to_char(adjustdate, 'yyyy-MM') = 'VALUE_001' and supplier = 'VALUE_001' and pmconfirm = '同意';

-- statementId: checkFieldPersonnel.select
-- lookupStatementId: checkFieldPersonnel.select
-- source: outsourcemanager_sqlmap.xml
-- type: select
-- params: {
--   "supplier": "VALUE_001",
--   "checkDate": "2026-05-14"
-- }
select team, /*团队 */ supplier, /*服务商 */ member, /*人员 */ to_char(checkDate, 'yyyy-mm-dd') checkDate, /*考勤日期 */ amDate, /*上班时间 */ amResult, /*上班打卡 */ pmDate, /*下班时间 */ pmResult, /*下班打卡 */ census, /*统计人天 */ checkResult, /*抽查结论 */ checkSign, /*抽查签字 */ note /*备注 */ from vm_cap_checkfieldpersonnel vc where vc.supplier = 'VALUE_001' and to_char(vc.checkDate,'yyyy-mm') = '2026-05-14';

-- statementId: queryRequireType.select
-- lookupStatementId: queryRequireType.select
-- source: outsourcemanager_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select taskType from vm_zentaologdetail where requirementid = 'VALUE_001' and rownum = 1;

-- statementId: addWorkloadMain.insert
-- lookupStatementId: addWorkloadMain.insert
-- source: outsourcemanager_sqlmap.xml
-- type: insert
-- params: {
--   "id": 1001,
--   "teamLeader": "VALUE_001",
--   "calcDate": "2026-05-14",
--   "calcPeriod": "VALUE_001",
--   "ddDailySum": "VALUE_001",
--   "logDailySum": "VALUE_001",
--   "workoverSum": "VALUE_001",
--   "calcFeeSum": "VALUE_001",
--   "team": "VALUE_001",
--   "remark": "VALUE_001",
--   "teamManager": "VALUE_001"
-- }
insert into vm_ctp_workcalc_main ( id, teamLeader, calcDate, calcPeriod, ddDailySum, logDailySum, workoverSum, calcFeeSum, team, remark, teamManager ) values ( 1001, util_user.getMemberNameByMemId('VALUE_001'), '2026-05-14', to_date('VALUE_001','yyyy-mm'), 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', util_common.getEnumIdByShow(1822868929259851192,'VALUE_001'), 'VALUE_001', 'VALUE_001' );

-- statementId: queryWorkloadMain.select
-- lookupStatementId: queryWorkloadMain.select
-- source: outsourcemanager_sqlmap.xml
-- type: select
-- params: {
--   "calcMonth": "VALUE_001",
--   "team": "VALUE_001"
-- }
select to_char(id) as id, to_char(teamLeader) as teamLeader, to_char(calcDate) as calcDate, to_char(calcPeriod,'yyyy-mm') as calcPeriod, to_char(ddDailySum) as ddDailySum, to_char(logDailySum) as logDailySum, to_char(workoverSum) as workoverSum, to_char(calcFeeSum) as calcFeeSum, to_char(team) as team, to_char(remark) as remark from vm_ctp_workcalc_main where to_char(calcPeriod,'yyyy-mm') = 'VALUE_001' and team = util_common.getEnumIdByShow(1822868929259851192,'VALUE_001');

-- statementId: removeWorkloadMain.delete
-- lookupStatementId: removeWorkloadMain.delete
-- source: outsourcemanager_sqlmap.xml
-- type: delete
-- params: {
--   "workLoadId": 1001
-- }
delete from vm_ctp_workcalc_main where id = 1001;

-- statementId: addWorkloadSub.insert
-- lookupStatementId: addWorkloadSub.insert
-- source: outsourcemanager_sqlmap.xml
-- type: insert
-- params: {
--   "id": 1001,
--   "formmain_id": 1001,
--   "member": "VALUE_001",
--   "supplier": "VALUE_001",
--   "ddDaily": "VALUE_001",
--   "logDaily": "VALUE_001",
--   "targetDaily": "VALUE_001",
--   "workover": "VALUE_001",
--   "memberPrice": "VALUE_001",
--   "calcPrice": "VALUE_001",
--   "memberLevel": "VALUE_001",
--   "pmAdjust": "VALUE_001",
--   "pmSign": "VALUE_001",
--   "pmRemark": "VALUE_001"
-- }
insert into vm_ctp_workcalc_sub ( id, formmain_id, member, supplier, ddDaily, logDaily, targetDaily, workover, memberPrice, calcPrice, memberLevel, pmAdjust, pmSign, pmRemark ) values ( 1001, 1001, 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001' );

-- statementId: queryWorkloadSub.select
-- lookupStatementId: queryWorkloadSub.select
-- source: outsourcemanager_sqlmap.xml
-- type: select
-- params: {
--   "id": 1001
-- }
select to_char(id) as id, to_char(formmain_id) as formmain_id, to_char(member) as member, to_char(supplier) as supplier, to_char(ddDaily) as ddDaily, to_char(logDaily) as logDaily, to_char(workover) as workover, to_char(memberPrice) as memberPrice, to_char(calcPrice) as calcPrice, to_char(memberLevel) as memberLevel, to_char(pmAdjust) as pmAdjust, to_char(pmSign) as pmSign, to_char(pmRemark) as pmRemark from vm_ctp_workcalc_sub where formmain_id = 1001 order by to_char(supplier);

-- statementId: removeWorkloadSub.delete
-- lookupStatementId: removeWorkloadSub.delete
-- source: outsourcemanager_sqlmap.xml
-- type: delete
-- params: {
--   "workLoadId": 1001
-- }
delete from vm_ctp_workcalc_sub where formmain_id = 1001;

-- statementId: queryAllTeam.select
-- lookupStatementId: queryAllTeam.select
-- source: outsourcemanager_sqlmap.xml
-- type: select
-- params: {}
select showvalue from ctp_enum_item where ref_enumid = 1822868929259851192;

-- statementId: supplierpayinfo.select
-- lookupStatementId: supplierpayinfo.select
-- source: outsourcemanager_sqlmap.xml
-- type: select
-- params: {
--   "calcDate": "2026-05-14"
-- }
select supplier, to_char(calcPeriod,'yyyy') calcyear, to_char(calcPeriod,'mm') CALCMONTH, util_common.getEnumShowById(team) team, teamManager, member, to_char(calcPeriod ,'yyyy-mm') calcPeriod, memberlevel, memberPrice, targetDaily, ddDaily, logDaily, workover, calcPrice from vm_ctp_workcalc_sub c1 left join vm_ctp_workcalc_main c2 on c1.formmain_id = c2.id where to_char(calcPeriod ,'yyyy-mm') = '2026-05-14';

-- statementId: adjustSupplier
-- lookupStatementId: adjustSupplier
-- source: outsourcemanager_sqlmap.xml
-- type: select
-- params: {
--   "calcDate": "2026-05-14"
-- }
select supplier, pm , util_common.getEnumShowById(team) team, member, adjusttype, adjustDate , entryDate , monthlyPrice , adjustPrice , explain , pmConfirm , signature , adjustReason , memberlevel, remark from vm_cap_adjustprice where to_char(adjustDate, 'yyyy-mm') = '2026-05-14';

-- statementId: supplierPayMain.delete
-- lookupStatementId: supplierPayMain.delete
-- source: outsourcemanager_sqlmap.xml
-- type: delete
-- params: "VALUE_001"
delete vm_cap_supplierpay c where to_char(c.paydate, 'yyyy-mm') = 'VALUE_001';

-- statementId: supplierPaySon.delete
-- lookupStatementId: supplierPaySon.delete
-- source: outsourcemanager_sqlmap.xml
-- type: delete
-- params: {
--   "year": "VALUE_001",
--   "month": "VALUE_001"
-- }
delete vm_cap_supplierpayson c where c.calcyear = 'VALUE_001' and c.calcmonth = 'VALUE_001';

-- statementId: addRequireCalcSub.insert
-- lookupStatementId: addRequireCalcSub.insert
-- source: outsourcemanager_sqlmap.xml
-- type: insert
-- params: {
--   "id": 1001,
--   "formmain_id": 1001,
--   "requireId": 1001,
--   "requireType": "VALUE_001",
--   "requireName": "NAME_001",
--   "requireDept": "VALUE_001",
--   "createDate": "2026-05-14",
--   "requireState": 1,
--   "operatorCost": "VALUE_001",
--   "operatorPrice": "VALUE_001"
-- }
insert into vm_cap_require_sub (ID, FORMMAIN_ID, requireId, requireType, requireName, requireDept, createDate, requireState, operatorCost, operatorPrice ) values ( 1001, 1001, 1001, 'VALUE_001', 'NAME_001', 'VALUE_001', '2026-05-14', 1, 'VALUE_001', 'VALUE_001' );

-- statementId: queryRequireCalcSub.select
-- lookupStatementId: queryRequireCalcSub.select
-- source: outsourcemanager_sqlmap.xml
-- type: select
-- params: {
--   "id": 1001
-- }
select to_char(requireId) as requireId, to_char(requireType) as requireType, to_char(requireName) as requireName, to_char(requireDept) as requireDept, to_char(createDate) as createDate, to_char(requireState) as requireState, to_char(operatorCost) as operatorCost, to_char(operatorPrice) as operatorPrice from vm_cap_require_sub where formmain_id = 1001;

-- statementId: removeRequireCalcSub.delete
-- lookupStatementId: removeRequireCalcSub.delete
-- source: outsourcemanager_sqlmap.xml
-- type: delete
-- params: {
--   "requireCalcId": 1001
-- }
delete from vm_cap_require_sub where formmain_id = 1001;

-- statementId: addRequireCalcMain.insert
-- lookupStatementId: addRequireCalcMain.insert
-- source: outsourcemanager_sqlmap.xml
-- type: insert
-- params: {
--   "id": 1001,
--   "team": "VALUE_001",
--   "costSum": "VALUE_001",
--   "priceSum": "VALUE_001",
--   "remark": "VALUE_001",
--   "pm": "VALUE_001",
--   "requireOperatorCost": "VALUE_001",
--   "requireOperatorPrice": "VALUE_001",
--   "bugOperatorCost": "VALUE_001",
--   "bugOperatorPrice": "VALUE_001",
--   "maintanceOperatorCost": "VALUE_001",
--   "maintanceOperatorPrice": "VALUE_001",
--   "otherOperatorCost": "VALUE_001",
--   "otherOperatorPrice": "VALUE_001",
--   "calcPeriod": "VALUE_001"
-- }
insert into vm_cap_require_main ( id, team, costSum, priceSum, remark, pm, requireOperatorCost, requireOperatorPrice, bugOperatorCost, bugOperatorPrice, maintanceOperatorCost, maintanceOperatorPrice, otherOperatorCost, otherOperatorPrice, calcPeriod ) values ( 1001, util_common.getEnumIdByShow(1822868929259851192,'VALUE_001'), 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001' );

-- statementId: queryRequireCalcMain.select
-- lookupStatementId: queryRequireCalcMain.select
-- source: outsourcemanager_sqlmap.xml
-- type: select
-- params: {
--   "calcMonth": "VALUE_001",
--   "team": "VALUE_001"
-- }
select to_char(id) as id, to_char(team) as team, to_char(calcPeriod) as calcPeriod, to_char(costSum) as costSum, to_char(priceSum) as priceSum, to_char(remark) as remark, to_char(pm) as pm, to_char(id) as id, to_char(requireOperatorCost) as requireOperatorCost, to_char(requireOperatorPrice) as requireOperatorPrice, to_char(bugOperatorCost) as bugOperatorCost, to_char(bugOperatorPrice) as bugOperatorPrice, to_char(maintanceOperatorCost) as maintanceOperatorCost, to_char(maintanceOperatorPrice) as maintanceOperatorPrice, to_char(otherOperatorCost) as otherOperatorCost, to_char(otherOperatorPrice) as otherOperatorPrice from vm_cap_require_main where calcPeriod = 'VALUE_001' and team = util_common.getEnumIdByShow(1822868929259851192,'VALUE_001');

-- statementId: removeRequireCalcMain.delete
-- lookupStatementId: removeRequireCalcMain.delete
-- source: outsourcemanager_sqlmap.xml
-- type: delete
-- params: {
--   "requireCalcId": 1001
-- }
delete from vm_cap_require_main where id = 1001;

-- statementId: suppplierPayMain.insert
-- lookupStatementId: suppplierPayMain.insert
-- source: outsourcemanager_sqlmap.xml
-- type: insert
-- params: 
insert into vm_cap_supplierpay (id, paydate , supplier , baseMoney , adjustMoney , payMoney , mainManday , maincheckday, mainlogday, mainworkovertimeday ) values （ 1001, '2026-05-14', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', '2026-05-14 10:00:00' );
-- error: org.opentest4j.AssertionFailedError: suppplierPayMain.insert generated SQL with extra closing parenthesis: insert into vm_cap_supplierpay (id, paydate , supplier , baseMoney , adjustMoney , payMoney , mainManday , maincheckday, mainlogday, mainworkovertimeday ) values （ 1001, '2026-05-14', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', '2026-05-14 10:00:00' ) ==> expected: <true> but was: <false>

-- statementId: supplierPaySon.insert
-- lookupStatementId: supplierPaySon.insert
-- source: outsourcemanager_sqlmap.xml
-- type: insert
-- params: {
--   "ID": 1001,
--   "FORMMAIN_ID": 1001,
--   "TEAM": "VALUE_001",
--   "TEAMMANAGER": "VALUE_001",
--   "MEMBER": "VALUE_001",
--   "CALCYEAR": "VALUE_001",
--   "CALCMONTH": "VALUE_001",
--   "MEMBERLEVEL": "VALUE_001",
--   "MEMBERPRICE": "VALUE_001",
--   "TARGETDAILY": "VALUE_001",
--   "DDDAILY": "VALUE_001",
--   "LOGDAILY": "VALUE_001",
--   "WORKOVER": "VALUE_001",
--   "CALCPRICE": "VALUE_001",
--   "ADJUSTPRICE": "VALUE_001",
--   "PAYPRICE": "VALUE_001",
--   "PM": "VALUE_001",
--   "ADJUSTTYPE": "VALUE_001"
-- }
insert into vm_cap_supplierpayson (ID, FORMMAIN_ID, team , teamManager, member , calcyear , calcmonth , memberlevel, memberPrice, targetDaily, ddDaily , logDaily, workover , calcPrice, adjustprice, payprice, pm , adjusttype) values (1001, 1001, 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001');

-- statementId: queryBugMaintanceOther.select
-- lookupStatementId: queryBugMaintanceOther.select
-- source: outsourcemanager_sqlmap.xml
-- type: select
-- params: {
--   "calcMonth": "VALUE_001",
--   "team": "VALUE_001"
-- }
select to_char(requirementid) as requirementid, to_char(requirementname) as requirementname, to_char(expectedcost) as expectedcost, to_char(username) as username, to_char(finishedDate,'yyyy-mm-dd') as finishedDate, to_char(startDate,'yyyy-mm-dd') as startDate, to_char(endDate,'yyyy-mm-dd') as endDate, to_char(tasktype) as tasktype from vm_zentaologdetail where tasktype != '需求' and to_char(calcmonth,'yyyy-mm') = 'VALUE_001' and userTeam = util_common.getEnumIdByShow(1822868929259851192,'VALUE_001');

-- statementId: queryOutsideMemCount.select
-- lookupStatementId: queryOutsideMemCount.select
-- source: outsourcemanager_sqlmap.xml
-- type: select
-- params: {
--   "calcMonth": "VALUE_001",
--   "team": "VALUE_001"
-- }
select member from vm_cap_clockinrecord where (AMPUNCHRESULT = '外勤' or PMPUNCHRESULT = '外勤') and to_char(punchdate,'yyyy-mm') = 'VALUE_001' and belongTeam = util_common.getEnumIdByShow(1822868929259851192,'VALUE_001') group by member;

-- statementId: queryOutsidePunchCount.select
-- lookupStatementId: queryOutsidePunchCount.select
-- source: outsourcemanager_sqlmap.xml
-- type: select
-- params: {
--   "calcMonth": "VALUE_001",
--   "team": "VALUE_001"
-- }
select sum( case when (AMPUNCHRESULT = '外勤' and PMPUNCHRESULT != '外勤') or (AMPUNCHRESULT != '外勤' and PMPUNCHRESULT = '外勤') then 0.5 else 1 end ) as sum from vm_cap_clockinrecord where (AMPUNCHRESULT = '外勤' or PMPUNCHRESULT = '外勤') and to_char(punchdate,'yyyy-mm') = 'VALUE_001' and belongTeam = util_common.getEnumIdByShow(1822868929259851192,'VALUE_001');

-- statementId: queryWorkoverSum.select
-- lookupStatementId: queryWorkoverSum.select
-- source: outsourcemanager_sqlmap.xml
-- type: select
-- params: {
--   "calcMonth": "VALUE_001",
--   "member": "VALUE_001"
-- }
select sum(workoverdays) as sum from vm_ddclockinSum where to_char(calcmonth,'yyyy') = 'VALUE_001' and member = 'VALUE_001' group by member;

-- statementId: queryNumberOfCheckField.select
-- lookupStatementId: queryNumberOfCheckField.select
-- source: outsourcemanager_sqlmap.xml
-- type: select
-- params: {
--   "team": "VALUE_001"
-- }
select count(1) from vm_cap_checkfieldpersonnel where team = 'VALUE_001' and to_char(checkdate,'yyyy-mm') = 'calcMonth';

-- statementId: getMonthlyAdjustMemberInfo.select
-- lookupStatementId: getMonthlyAdjustMemberInfo.select
-- source: outsourcemanager_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select membername, pm, team, entrydate, adjusttype, adjustdate, chargedate, currentsupplier, currentLevel, chargeenddate, memberprice from vm_cap_outsourceadjust where (adjustDate is not null and to_char(adjustDate,'yyyy-mm') = 'VALUE_001') or (chargeDate is not null and to_char(chargeDate,'yyyy-mm') = 'VALUE_001');

-- statementId: insertExternalChargeLong.insert
-- lookupStatementId: insertExternalChargeLong.insert
-- source: outsourcemanager_sqlmap.xml
-- type: insert
-- params: {
--   "id": 1001,
--   "memberId": 1001,
--   "operateName": "NAME_001",
--   "operateResult": "VALUE_001",
--   "logDetail": "VALUE_001"
-- }
insert into vm_cap_ExternalChargeLog (id, state , start_member_id , start_date , approve_member_id , approve_date , finishedflag , ratifyflag , ratify_member_id , ratify_date , sort , modify_member_id , modify_date , memberId, operateTime, operateName, operateResult, logDetail ) values ( 1001, 1, 1001, SYSDATE, 0, SYSDATE, 0, 0, 0, null, 0, -6760911671874597139, SYSDATE, 1001, sysdate, 'NAME_001', 'VALUE_001', 'VALUE_001' );

-- statementId: getOpinionMonitorExportData.select
-- lookupStatementId: getOpinionMonitorExportData.select
-- source: opinion_sqlmap.xml
-- type: select
-- params: {
--   "datas": "RAW_VALUE"
-- }
select util_common.getEnumShowById(vom.serviceType) as "风险类型", util_common.getEnumShowById(vom.platformCodes) as "渠道商", vom.url as "链接", vom.tag as "标记", vom.detectTime as "发现时间", vom.brandName as "品牌名称", util_common.getEnumShowById(vom.riskLevel) as "风险级别", vom.ip as "解析地址", vom.location as "地理位置", vom.asn as "asn", vom.carrier as "运营商", vom.abuseSubject as "侵权项", vom.evidence as "举证截图", vom.note as "备注", vom.platform as "平台名称", vom.fraudAccount as "欺诈账号", vom.accountID as "账号id", vom.title as "标题", vom.description as "描述", vom.processResult as "处理结果", vom.processSpecification as "处理说明", util_common.getEnumShowById(vom.pushStatus) as "推送状态", vom.flowId as "流水号" from vm_opinion_monitor_info vom where 1=1 AND vom.id in (RAW_VALUE);

-- statementId: getOpinionFileId.select
-- lookupStatementId: getOpinionFileId.select
-- source: opinion_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select to_char(f2.file_url) file_url from vm_opinion_monitor_info f1 left join ctp_attachment f2 on f1.evidence = f2.sub_reference where f1.evidence = 'VALUE_001';

-- statementId: getOpinionMonitorInfoById.select
-- lookupStatementId: getOpinionMonitorInfoById.select
-- source: opinion_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select vom.riskID as "riskID", vom.brandName as "brandName", vom.platformCodes as "platformCodes", vom.pushStatus as "pushStatus", vom.flowId as "flowId" from vm_opinion_monitor_push_son son left join vm_opinion_monitor_info vom on vom.flowId = son.flowId where son.formmain_id = 'VALUE_001';

-- statementId: getOpinionMonitorInfo.select
-- lookupStatementId: getOpinionMonitorInfo.select
-- source: opinion_sqlmap.xml
-- type: select
-- params: {}
select riskID as "riskID", brandName as "brandName", serviceType as "serviceType", riskLevel as "riskLevel", platformCodes as "platformCodes", pushStatus as "pushStatus", needPush as "needPush", flowId as "flowId" from vm_opinion_monitor_info;

-- statementId: getSpecOpinionMonitorInfo.select
-- lookupStatementId: getSpecOpinionMonitorInfo.select
-- source: opinion_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select riskID as "riskID", brandName as "brandName", serviceType as "serviceType", riskLevel as "riskLevel", platformCodes as "platformCodes", pushStatus as "pushStatus", needPush as "needPush", flowId as "flowId" from vm_opinion_monitor_info where to_date(to_char(sysDate, 'yyyy-mm-dd'), 'yyyy-mm-dd') = to_date(to_char(start_date, 'yyyy-mm-dd'), 'yyyy-mm-dd') and serviceType = 'VALUE_001';

-- statementId: updateOpinionMonitorPushStatus.update
-- lookupStatementId: updateOpinionMonitorPushStatus.update
-- source: opinion_sqlmap.xml
-- type: update
-- params: {
--   "pushStatus": 1,
--   "flowId": 1001
-- }
update vm_opinion_monitor_info set pushStatus=1 where flowId=1001;

-- statementId: updateOpinionMonitorInfoStatus.update
-- lookupStatementId: updateOpinionMonitorInfoStatus.update
-- source: opinion_sqlmap.xml
-- type: update
-- params: {
--   "pushStatus": 1,
--   "flowId": 1001
-- }
update vm_opinion_monitor_push_son set pushStatus=1 where flowId=1001;

-- statementId: insertOpinionMonitorPushSon.insert
-- lookupStatementId: insertOpinionMonitorPushSon.insert
-- source: opinion_sqlmap.xml
-- type: insert
-- params: {
--   "sendSerialNo": "VALUE_001",
--   "brandName": "NAME_001",
--   "riskID": 1001,
--   "serviceType": "VALUE_001",
--   "riskLevel": "VALUE_001",
--   "platformCodes": "CODE_001",
--   "pushStatus": 1,
--   "flowId": 1001
-- }
insert into vm_opinion_monitor_push_son( id, formmain_id, brandName, riskID, serviceType, riskLevel, platformCodes, pushStatus, flowId) values( util_common.getAbsID, (select id from vm_opinion_monitor_push where sendSerialNo = 'VALUE_001'), 'NAME_001', 1001, 'VALUE_001', 'VALUE_001', 'CODE_001', 1, 1001 );

-- statementId: stepBackFlowInfo.select
-- lookupStatementId: stepBackFlowInfo.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "flowId": 1001
-- }
SELECT field0044 AS flowId, field0004 AS memberId, field0005 AS staffName, field0007 AS kmAccount, field0010 AS deptId, field0009 AS place, field0012 AS post, field0050 AS papersType, field0049 AS papersNo, field0013 AS workPhone, field0014 AS telephone FROM formmain_1660 WHERE field0044 =1001;

-- statementId: leaveInDate.select
-- lookupStatementId: leaveInDate.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "absenceTableName": "demo_table",
--   "startDate": "2026-05-14",
--   "endDate": "2026-05-14",
--   "startDateMorN": "2026-05-14",
--   "endDateMorN": "2026-05-14",
--   "userId": [
--     "EVENT_A",
--     "EVENT_B"
--   ]
-- }
SELECT T.FIELD0001 AS LEAVEID, T.FIELD0002 AS APPLYUSER FROM demo_table T INNER JOIN ( SELECT T2.ID, T3.SHOWVALUE AS FIELD0015, T4.SHOWVALUE AS FIELD0017 FROM demo_table T2 LEFT JOIN CTP_ENUM_ITEM T3 ON T2.FIELD0015 = T3.ID LEFT JOIN CTP_ENUM_ITEM T4 ON T2.FIELD0017 = T4.ID ) S1 ON S1.ID = T.ID WHERE T.STATE = 1 AND ((TO_DATE('2026-05-14', 'YYYY-MM-DD') > T.FIELD0014 AND TO_DATE('2026-05-14', 'YYYY-MM-DD') < T.FIELD0016) OR (TO_DATE('2026-05-14', 'YYYY-MM-DD') > T.FIELD0014 AND TO_DATE('2026-05-14', 'YYYY-MM-DD') < T.FIELD0016) OR (TO_DATE('2026-05-14', 'YYYY-MM-DD') < T.FIELD0014 AND TO_DATE('2026-05-14', 'YYYY-MM-DD') > T.FIELD0016) OR (T.FIELD0014 = TO_DATE('2026-05-14', 'YYYY-MM-DD') AND S1.FIELD0015 = '2026-05-14') OR (T.FIELD0014 = TO_DATE('2026-05-14', 'YYYY-MM-DD') AND S1.FIELD0015 = DECODE('2026-05-14', '下午', '下午')) OR (T.FIELD0016 = TO_DATE('2026-05-14', 'YYYY-MM-DD') AND S1.FIELD0017 = '2026-05-14') OR (T.FIELD0016 = TO_DATE('2026-05-14', 'YYYY-MM-DD') AND S1.FIELD0017 = DECODE('2026-05-14', '上午', '上午')) OR (T.FIELD0014 = TO_DATE('2026-05-14', 'YYYY-MM-DD') AND S1.FIELD0015 = '2026-05-14') OR (T.FIELD0016 = TO_DATE('2026-05-14', 'YYYY-MM-DD') AND S1.FIELD0017 = '2026-05-14')) and T.FIELD0002 in ('EVENT_A','EVENT_B');

-- statementId: HKLeaveInDate.select
-- lookupStatementId: HKLeaveInDate.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "startDate": "2026-05-14",
--   "endDate": "2026-05-14",
--   "startDateMorN": "2026-05-14",
--   "endDateMorN": "2026-05-14",
--   "userId": [
--     "EVENT_A",
--     "EVENT_B"
--   ]
-- }
SELECT T.serialNo AS LEAVEID, T.applyUser AS APPLYUSER FROM vm_wf_hkLeaveApply T INNER JOIN ( SELECT T2.ID, T3.SHOWVALUE AS leaveStartHalfDay, T4.SHOWVALUE AS leaveEndHalfDay FROM vm_wf_hkLeaveApply T2 LEFT JOIN CTP_ENUM_ITEM T3 ON T2.leaveStartHalfDay = T3.ID LEFT JOIN CTP_ENUM_ITEM T4 ON T2.leaveEndHalfDay = T4.ID ) S1 ON S1.ID = T.ID WHERE T.STATE = 1 AND ((TO_DATE('2026-05-14', 'YYYY-MM-DD') > T.leaveStartDate AND TO_DATE('2026-05-14', 'YYYY-MM-DD') < T.leaveEndDate) OR (TO_DATE('2026-05-14', 'YYYY-MM-DD') > T.leaveStartDate AND TO_DATE('2026-05-14', 'YYYY-MM-DD') < T.leaveEndDate) OR (TO_DATE('2026-05-14', 'YYYY-MM-DD') < T.leaveStartDate AND TO_DATE('2026-05-14', 'YYYY-MM-DD') > T.leaveEndDate) OR (T.leaveStartDate = TO_DATE('2026-05-14', 'YYYY-MM-DD') AND S1.leaveStartHalfDay = '2026-05-14') OR (T.leaveStartDate = TO_DATE('2026-05-14', 'YYYY-MM-DD') AND S1.leaveStartHalfDay = DECODE('2026-05-14', '下午', '下午')) OR (T.leaveEndDate = TO_DATE('2026-05-14', 'YYYY-MM-DD') AND S1.leaveEndHalfDay = '2026-05-14') OR (T.leaveEndDate = TO_DATE('2026-05-14', 'YYYY-MM-DD') AND S1.leaveStartHalfDay = DECODE('2026-05-14', '上午', '上午')) OR (T.leaveStartDate = TO_DATE('2026-05-14', 'YYYY-MM-DD') AND S1.leaveStartHalfDay = '2026-05-14') OR (T.leaveEndDate = TO_DATE('2026-05-14', 'YYYY-MM-DD') AND S1.leaveEndHalfDay = '2026-05-14')) and T.applyUser in ('EVENT_A','EVENT_B');

-- statementId: cancelInDate.select
-- lookupStatementId: cancelInDate.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "absenceCancelTableName": "demo_table",
--   "leaveId": 1001,
--   "endDate": "2026-05-14",
--   "startDate": "2026-05-14",
--   "endDateHalf": "2026-05-14"
-- }
SELECT t1.id FROM demo_table t1 WHERE t1.field0006 = 1001 AND STATE = 1 AND ( to_date('2026-05-14', 'YYYY-MM-DD') < t1.field0015 OR to_date('2026-05-14', 'YYYY-MM-DD') > t1.field0017 OR (to_date('2026-05-14', 'YYYY-MM-DD') = t1.field0015 and util_common.getEnumShowById(field0016) = '下午' and '2026-05-14' = '上午') OR (to_date('2026-05-14', 'YYYY-MM-DD') = t1.field0017 and util_common.getEnumShowById(field0018) = '上午' and '2026-05-14' = '下午') OR t1.field0013 = '-2733701732180602896' ) and id in (select form_recordId from col_summary where state = 3 and templete_id = -7111560710701037197) ORDER BY t1.start_date DESC;

-- statementId: HKCancelInDate.select
-- lookupStatementId: HKCancelInDate.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "leaveId": 1001,
--   "endDate": "2026-05-14",
--   "startDate": "2026-05-14"
-- }
SELECT t1.id FROM vm_wf_hkLeaveBackApply t1 WHERE t1.leaveFlowSerialNo = 1001 AND STATE = 1 AND ( to_date('2026-05-14', 'YYYY-MM-DD') < t1.newLeaveStartDate OR to_date('2026-05-14', 'YYYY-MM-DD') > t1.newLeaveEndDate OR t1.leaveBackType = '-2733701732180602896' ) ORDER BY t1.start_date DESC;

-- statementId: getLivingResum.select
-- lookupStatementId: getLivingResum.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "absenceCancelTableName": "demo_table",
--   "flowId": 1001
-- }
SELECT t1.id FROM demo_table t1 WHERE t1.field0006 = 1001 AND STATE = 1;

-- statementId: getHKLivingResum.select
-- lookupStatementId: getHKLivingResum.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "flowId": 1001
-- }
SELECT t1.id FROM vm_wf_hkLeaveBackApply t1 WHERE t1.leaveFlowSerialNo = 1001 AND STATE = 1;

-- statementId: defaultInfo.select
-- lookupStatementId: defaultInfo.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "defaultInfoTableName": "demo_table",
--   "deptName": "NAME_001"
-- }
SELECT t1.FIELD0005 AS beforeMember FROM demo_table t1 WHERE t1.field0003 = 'NAME_001';

-- statementId: updateDefaultInfo.update
-- lookupStatementId: updateDefaultInfo.update
-- source: hr_sqlmap.xml
-- type: update
-- params: {
--   "defaultInfoTableName": "demo_table",
--   "curdate": "2026-05-14",
--   "totalMem": "VALUE_001",
--   "deptName": "NAME_001"
-- }
update demo_table t1 set t1.modify_date = CAST(to_date('2026-05-14', 'YYYY-MM-DD hh24:mi:ss') AS TIMESTAMP ), t1.field0005 = 'VALUE_001' where t1.field0003 = 'NAME_001';

-- statementId: insertStaffBasic.insert
-- lookupStatementId: insertStaffBasic.insert
-- source: hr_sqlmap.xml
-- type: insert
-- params: {
--   "staffBasicTableName": "demo_table",
--   "id": 1001,
--   "curdate": "2026-05-14",
--   "memberId": 1001,
--   "address": "VALUE_001",
--   "deptId": 1001,
--   "code": "CODE_001",
--   "staffHrNo": "VALUE_001",
--   "accountId": 1,
--   "chnname": "NAME_001"
-- }
INSERT INTO demo_table ( ID, STATE, START_MEMBER_ID, START_DATE, APPROVE_MEMBER_ID, APPROVE_DATE, FINISHEDFLAG, RATIFYFLAG, RATIFY_MEMBER_ID, RATIFY_DATE, SORT, MODIFY_MEMBER_ID, MODIFY_DATE, FIELD0001, FIELD0002, FIELD0003, FIELD0004, FIELD0005, FIELD0006, FIELD0007, FIELD0008, FIELD0014,field0015,field0016,field0051,field0036) VALUES (1001, 1, 0, CAST(to_date('2026-05-14', 'YYYY-MM-DD hh24:mi:ss') AS TIMESTAMP ), 0, CAST(to_date('2026-05-14', 'YYYY-MM-DD hh24:mi:ss') AS TIMESTAMP ), 0, 0, 0, NULL, 0, 0, CAST(to_date('2026-05-14', 'YYYY-MM-DD hh24:mi:ss') AS TIMESTAMP ), 1001, 'VALUE_001', NULL, '-812415069995905183', NULL, 0, NULL, 0, 1001,'CODE_001','VALUE_001', 1, 'NAME_001');

-- statementId: checkStaffInfoMain.select
-- lookupStatementId: checkStaffInfoMain.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "staffInfoTableName": "demo_table",
--   "code": "CODE_001"
-- }
SELECT t1.id FROM demo_table t1, org_member t2 WHERE t2.code = 'CODE_001' AND t1.field0001 = t2.id;

-- statementId: checkStaffYearInfo.select
-- lookupStatementId: checkStaffYearInfo.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "staffInfoSonName": "RAW_VALUE",
--   "formMainId": 1001,
--   "year": "VALUE_001"
-- }
SELECT t1.id FROM RAW_VALUE t1 WHERE t1.formmain_id = 1001 AND t1.field0009 = 'VALUE_001';

-- statementId: insertStaffInfoMain.insert
-- lookupStatementId: insertStaffInfoMain.insert
-- source: hr_sqlmap.xml
-- type: insert
-- params: {
--   "staffInfoTableName": "demo_table",
--   "id": 1001,
--   "curdate": "2026-05-14",
--   "userId": 1001,
--   "marriage": "VALUE_001",
--   "isFundManager": "VALUE_001",
--   "deptId": 1001
-- }
INSERT INTO demo_table ( ID, STATE, START_MEMBER_ID, START_DATE, APPROVE_MEMBER_ID, APPROVE_DATE, FINISHEDFLAG, RATIFYFLAG, RATIFY_MEMBER_ID, RATIFY_DATE, SORT, MODIFY_MEMBER_ID, MODIFY_DATE, FIELD0001, FIELD0002, FIELD0003, FIELD0004, FIELD0005, FIELD0006, FIELD0007, FIELD0008, FIELD0014) VALUES ( 1001, 1, 0, CAST(to_date('2026-05-14', 'YYYY-MM-DD hh24:mi:ss') AS TIMESTAMP ), 0, CAST(to_date('2026-05-14', 'YYYY-MM-DD hh24:mi:ss') AS TIMESTAMP ), 0, 0, 0, NULL, 0, 0, CAST(to_date('2026-05-14', 'YYYY-MM-DD hh24:mi:ss') AS TIMESTAMP ), 1001, NULL, 'VALUE_001', 'VALUE_001', NULL, 0, NULL, 0, 1001);

-- statementId: insertStaffInfoSon.insert
-- lookupStatementId: insertStaffInfoSon.insert
-- source: hr_sqlmap.xml
-- type: insert
-- params: {
--   "staffInfoSonName": "RAW_VALUE",
--   "id": 1001,
--   "formMainId": 1001,
--   "year": "VALUE_001",
--   "days": "VALUE_001"
-- }
INSERT INTO RAW_VALUE ( ID, formmain_id, SORT, field0009, field0010, field0011, field0012, field0013) VALUES ( 1001, 1001, 0, 'VALUE_001', 'VALUE_001', 0, 'VALUE_001', 0 );

-- statementId: updateStaffInfoMain.update
-- lookupStatementId: updateStaffInfoMain.update
-- source: hr_sqlmap.xml
-- type: update
-- params: {
--   "staffInfoTableName": "demo_table",
--   "curdate": "2026-05-14",
--   "marriage": "VALUE_001",
--   "isFundManager": "VALUE_001",
--   "deptId": 1001,
--   "loginName": "NAME_001",
--   "phone": "VALUE_001",
--   "ageLimit": "VALUE_001",
--   "chnname": "NAME_001",
--   "companyId": 1001,
--   "empStatus": 1,
--   "hrBadge": "VALUE_001",
--   "userId": 1001
-- }
update demo_table t1 set t1.modify_date = CAST(to_date('2026-05-14', 'YYYY-MM-DD hh24:mi:ss') AS TIMESTAMP ), t1.field0003 = 'VALUE_001', t1.field0004 = 'VALUE_001', t1.field0014 = 1001, t1.field0033 = 'NAME_001', t1.field0034 = 'VALUE_001', t1.field0035 = 'VALUE_001', t1.field0036 = 'NAME_001', t1.field0051 = 1001, t1.field0007 = 1, t1.field0016 = 'VALUE_001' where t1.field0001 = 1001;

-- statementId: updateStaffInfoSon.update
-- lookupStatementId: updateStaffInfoSon.update
-- source: hr_sqlmap.xml
-- type: update
-- params: {
--   "staffInfoSonName": "RAW_VALUE",
--   "days": "VALUE_001",
--   "formMainId": 1001,
--   "year": "VALUE_001"
-- }
update RAW_VALUE t2 set t2.field0010 = 'VALUE_001' ,t2.field0012=('VALUE_001' - t2.field0011) where 1001 = t2.formmain_id and t2.field0009 = 'VALUE_001';

-- statementId: getLeaveVerifyDate.select
-- lookupStatementId: getLeaveVerifyDate.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "staffInfoTableName": "demo_table",
--   "staffInfoSonName": "RAW_VALUE",
--   "year": "VALUE_001",
--   "userId": 1001
-- }
SELECT t4.showvalue AS ifManager, t1.field0005 AS firstMarriage, t1.field0006 AS usedMarriageDay, t1.field0008 AS appliedMarriageDay, nvl(t2.field0012, '0') AS restYearDay, t2.field0013 AS appliedYearDay, CASE t3.ext_attr_11 WHEN 1 THEN '男' WHEN 2 THEN '女' ELSE '' END AS sex FROM demo_table t1 LEFT JOIN RAW_VALUE t2 ON t1.id = t2.formmain_id AND t2.field0009 = 'VALUE_001' LEFT JOIN org_member t3 ON t3.id = t1.field0001 LEFT JOIN ctp_enum_item t4 ON t4.id = t1.field0004 WHERE t1.field0001 = 1001;

-- statementId: getHKLeaveVerifyDate.select
-- lookupStatementId: getHKLeaveVerifyDate.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "year": "VALUE_001",
--   "userId": 1001
-- }
SELECT t1.firstMarriage, t1.usedMarriageDay, t1.appliedMarriageDay, nvl(t2.remainAnnualLeaveDays, '0') AS restYearDay, t2.onOrderAnnualLeaveDays AS appliedYearDay, CASE t3.ext_attr_11 WHEN 1 THEN '男' WHEN 2 THEN '女' ELSE '' END AS sex FROM vm_cap_hkMemberLeaveInfo t1 LEFT JOIN vm_cap_hkMemberLeaveInfo_son t2 ON t1.id = t2.formmain_id AND t2.year = 'VALUE_001' LEFT JOIN org_member t3 ON t3.id = t1.memberId WHERE t1.memberId = 1001;

-- statementId: getLeaveMaxAndMinDay.select
-- lookupStatementId: getLeaveMaxAndMinDay.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "vacationTableName": "demo_table",
--   "leaveType": "VALUE_001",
--   "leaveDetailType": "VALUE_001"
-- }
select nvl(t1.field0006, '0') as leaveMaxDay ,nvl(t1.field0005 , '0') as leaveMinDay from demo_table t1 left join ctp_enum_item s1 on s1.id = t1.field0001 left join ctp_enum_item s2 on s2.id = t1.field0002 where t1.field0001 = 'VALUE_001';

-- statementId: getHKLeaveMaxAndMinDay.select
-- lookupStatementId: getHKLeaveMaxAndMinDay.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "leaveType": "VALUE_001"
-- }
select nvl(t1.maxvactiondays, '0') as leaveMaxDay ,nvl(t1.minvactiondays , '0') as leaveMinDay from vm_vacationbaseinfoHK t1 left join ctp_enum_item s1 on s1.id = t1.vactiontype where t1.vactiontype = 'VALUE_001';

-- statementId: leaveInfo.select
-- lookupStatementId: leaveInfo.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "formmain": "RAW_VALUE",
--   "formson": "RAW_VALUE",
--   "startDate": "2026-05-14",
--   "endDate": "2026-05-14"
-- }
SELECT TO_CHAR(T1.START_DATE, 'YYYY-MM-DD') AS LEAVE_FILEDATE, T1.ID AS LEAVEID, T3.NAME AS APPLY_NAME, NVL(T3.CODE, ' ') AS APPLY_NO, T4.NAME AS AGENT_NAME, NVL(T4.CODE, ' ') AS AGENT_NO, NVL(T5.CODE, ' ') AS APPLYDEPTNO, TO_CHAR(T1.FIELD0004, 'YYYY-MM-DD') AS LEAVE_APPLY_DATE, T6.ENUMVALUE AS LEAVE_TYPE, NVL(T7.ENUMVALUE, ' ') AS LEAVE_DETAIL_TYPE, TO_CHAR(T1.FIELD0010, 'YYYY-MM-DD') AS LEAVE_START_DATE, CASE T8.SHOWVALUE WHEN '上午' THEN 'AM' WHEN '下午' THEN 'PM' ELSE ' ' END AS LEAVE_STARTDATEAMORPM, TO_CHAR(T1.FIELD0012, 'YYYY-MM-DD') AS LEAVE_END_DATE, CASE T9.SHOWVALUE WHEN '上午' THEN 'AM' WHEN '下午' THEN 'PM' ELSE ' ' END AS LEAVE_ENDDATEAMORPM, T1.FIELD0014 AS LEAVE_DAY, T1.FIELD0016 AS LEAVE_REASON, CASE T10.SHOWVALUE WHEN '是' THEN 'T' WHEN '否' THEN 'F' ELSE ' ' END AS LEAVECOUNTRYFLAG, NVL(T1.FIELD0017, ' ') AS COUNTRY, NVL(TO_CHAR(T1.FIELD0019, 'YYYY-MM-DD'), ' ') AS EXIT_DATE, NVL(TO_CHAR(T1.FIELD0020, 'YYYY-MM-DD'), ' ') AS RETURN_DATE, T1.FIELD0018 AS STAY_DAY, NVL(TO_CHAR(T2.FIELD0032, 'YYYY-MM-DD'), ' ') AS CANCEL_FILEDATE, T2.ID AS CANCEL_ID, NVL(TO_CHAR(T2.FIELD0024, 'YYYY-MM-DD'), ' ') AS CANCEL_APPLY_DATE, NVL(T11.ENUMVALUE, ' ') AS CANCEL_APPLY_TYPE, NVL(TO_CHAR(T2.FIELD0025, 'YYYY-MM-DD'), ' ') AS CANCEL_START_DATE, CASE T12.SHOWVALUE WHEN '上午' THEN 'AM' WHEN '下午' THEN 'PM' ELSE ' ' END AS CANCEL_STARTDATEAMORPM, NVL(TO_CHAR(T2.FIELD0027, 'YYYY-MM-DD'), ' ') AS CANCEL_END_DATE, CASE T13.SHOWVALUE WHEN '上午' THEN 'AM' WHEN '下午' THEN 'PM' ELSE ' ' END AS CANCEL_ENDDATEAMORPM, NVL(T2.FIELD0030, ' ') AS CANCEL_REASON, T2.FIELD0029 AS CANCEL_DAY FROM RAW_VALUE T1 LEFT JOIN RAW_VALUE T2 ON T1.ID = T2.FORMMAIN_ID LEFT JOIN ORG_MEMBER T3 ON T1.FIELD0001 = T3.ID LEFT JOIN ORG_MEMBER T4 ON T1.FIELD0002 = T4.ID LEFT JOIN ORG_UNIT T5 ON T1.FIELD0003 = T5.ID LEFT JOIN CTP_ENUM_ITEM T6 ON T1.FIELD0008 = T6.ID LEFT JOIN CTP_ENUM_ITEM T7 ON T1.FIELD0009 = T7.ID LEFT JOIN CTP_ENUM_ITEM T8 ON T1.FIELD0011 = T8.ID LEFT JOIN CTP_ENUM_ITEM T9 ON T1.FIELD0013 = T9.ID LEFT JOIN CTP_ENUM_ITEM T10 ON T1.FIELD0015 = T10.ID LEFT JOIN CTP_ENUM_ITEM T11 ON T2.FIELD0023 = T11.ID LEFT JOIN CTP_ENUM_ITEM T12 ON T2.FIELD0026 = T12.ID LEFT JOIN CTP_ENUM_ITEM T13 ON T2.FIELD0028 = T13.ID WHERE T1.START_DATE BETWEEN TO_DATE('2026-05-14', 'YYYY-MM-DD') AND TO_DATE('2026-05-14', 'YYYY-MM-DD') OR T2.FIELD0032 BETWEEN TO_DATE('2026-05-14', 'YYYY-MM-DD') AND TO_DATE('2026-05-14', 'YYYY-MM-DD');

-- statementId: getFestival.select
-- lookupStatementId: getFestival.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "userId": 1001,
--   "startDate": "2026-05-14",
--   "endDate": "2026-05-14"
-- }
SELECT s1.DATE_NUM FROM worktime_specialday s1 WHERE s1.is_rest = '2' AND s1.org_account_id IN (SELECT a1.org_account_id FROM org_member a1 WHERE a1.id = 1001) AND (to_date(s1.date_num, 'YYYY-MM-DD') BETWEEN to_date('2026-05-14', 'YYYY-MM-DD') AND to_date('2026-05-14', 'YYYY-MM-DD'));

-- statementId: isOnlyFestDay.select
-- lookupStatementId: isOnlyFestDay.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "userId": 1001,
--   "checkDate": "2026-05-14"
-- }
SELECT s1.ID FROM worktime_specialday s1 WHERE s1.is_rest = '2' AND s1.org_account_id IN ( SELECT a1.org_account_id FROM org_member a1 WHERE a1.id = 1001) AND to_date(s1.date_num, 'YYYY-MM-DD') = to_date('2026-05-14', 'YYYY-MM-DD');

-- statementId: isOnlyRestDay.select
-- lookupStatementId: isOnlyRestDay.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "userId": 1001,
--   "checkDate": "2026-05-14"
-- }
SELECT s1.ID FROM worktime_specialday s1 WHERE s1.is_rest = '1' AND s1.org_account_id IN ( SELECT a1.org_account_id FROM org_member a1 WHERE a1.id = 1001) AND to_date(s1.date_num, 'YYYY-MM-DD') = to_date('2026-05-14', 'YYYY-MM-DD');

-- statementId: isRestDay.select
-- lookupStatementId: isRestDay.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "userId": 1001,
--   "checkDate": "2026-05-14"
-- }
SELECT s1.ID,s1.DATE_NUM FROM worktime_specialday s1 WHERE ( s1.is_rest = '2' OR s1.is_rest = '1') AND s1.org_account_id IN ( SELECT a1.org_account_id FROM org_member a1 WHERE a1.id = 1001) AND to_date(s1.date_num, 'YYYY-MM-DD') = to_date('2026-05-14', 'YYYY-MM-DD');

-- statementId: isCancelDay.select
-- lookupStatementId: isCancelDay.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "userId": 1001,
--   "date": "2026-05-14",
--   "dateMorN": "2026-05-14"
-- }
select vc.id,vc.leaveStartDate,vc.leaveStartDateMA,vc.leaveEndDate,vc.leaveEndDateMA,vu.applyUser from VM_CANCELLEAVEDAYSON_SICK vc left join VM_USERAPPLYFORLEAVE_SICK vu on vc.formmain_id = vu.id where vu.applyUser = 1001 and ( (to_date(to_char(vc.leaveStartDate, 'yyyy-MM-dd'), 'yyyy-MM-dd') < to_date('2026-05-14', 'yyyy-MM-dd') and to_date(to_char(vc.leaveEndDate, 'yyyy-MM-dd'), 'yyyy-MM-dd') > to_date('2026-05-14', 'yyyy-MM-dd')) or (to_date(to_char(vc.leaveStartDate, 'yyyy-MM-dd'), 'yyyy-MM-dd') = to_date('2026-05-14', 'yyyy-MM-dd') and to_date(to_char(vc.leaveEndDate, 'yyyy-MM-dd'), 'yyyy-MM-dd') = to_date('2026-05-14', 'yyyy-MM-dd') and (vc.leaveStartDateMA = '2026-05-14' or (vc.leaveStartDateMA = '770469099444389055' and vc.leaveEndDateMA = '3338464713283357441'))) or (to_date(to_char(vc.leaveStartDate, 'yyyy-MM-dd'), 'yyyy-MM-dd') = to_date('2026-05-14', 'yyyy-MM-dd') and to_date(to_char(vc.leaveEndDate, 'yyyy-MM-dd'), 'yyyy-MM-dd') != to_date('2026-05-14', 'yyyy-MM-dd') and (vc.leaveStartDateMA = '2026-05-14' or vc.leaveStartDateMA = '770469099444389055')) or (to_date(to_char(vc.leaveStartDate, 'yyyy-MM-dd'), 'yyyy-MM-dd') != to_date('2026-05-14', 'yyyy-MM-dd') and to_date(to_char(vc.leaveEndDate, 'yyyy-MM-dd'), 'yyyy-MM-dd') = to_date('2026-05-14', 'yyyy-MM-dd') and (vc.leaveEndDateMA = '2026-05-14' or vc.leaveEndDateMA = '3338464713283357441') ) );

-- statementId: isSickDay.select
-- lookupStatementId: isSickDay.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "userId": 1001,
--   "date": "2026-05-14",
--   "dateMorN": "2026-05-14"
-- }
select vu.id as "id", to_char(vc.leaveStartDate, 'yyyy-MM-dd') as "leaveStartDate", util_common.getEnumValueById(vc.leaveStartDateMA) as "leaveStartDateMA", to_char(vc.leaveEndDate, 'yyyy-MM-dd') as "leaveEndDate", util_common.getEnumValueById(vc.leaveEndDateMA) as "leaveEndDateMA", vc.leaveDay as "leaveDay", vc.leaveSerialNum as "leaveSerialNum" from VM_USERAPPLYFORLEAVE_SICK vu left join VM_CANCELLEAVEDAYSON_SICK vc on vc.formmain_id = vu.id where vu.applyUser = 1001 and vu.dayType = '-4565462988988594193' and ( (to_date(to_char(vu.beginDate, 'yyyy-MM-dd'), 'yyyy-MM-dd') < to_date('2026-05-14', 'yyyy-MM-dd') and to_date(to_char(vu.endDate, 'yyyy-MM-dd'), 'yyyy-MM-dd') > to_date('2026-05-14', 'yyyy-MM-dd')) or (to_date(to_char(vu.beginDate, 'yyyy-MM-dd'), 'yyyy-MM-dd') = to_date('2026-05-14', 'yyyy-MM-dd') and to_date(to_char(vu.endDate, 'yyyy-MM-dd'), 'yyyy-MM-dd') = to_date('2026-05-14', 'yyyy-MM-dd') and (vu.startTime = '2026-05-14' or (vu.startTime = '770469099444389055' and vu.endTime = '3338464713283357441'))) or (to_date(to_char(vu.beginDate, 'yyyy-MM-dd'), 'yyyy-MM-dd') = to_date('2026-05-14', 'yyyy-MM-dd') and to_date(to_char(vu.endDate, 'yyyy-MM-dd'), 'yyyy-MM-dd') != to_date('2026-05-14', 'yyyy-MM-dd') and (vu.startTime = '2026-05-14' or vu.startTime = '770469099444389055')) or (to_date(to_char(vu.beginDate, 'yyyy-MM-dd'), 'yyyy-MM-dd') != to_date('2026-05-14', 'yyyy-MM-dd') and to_date(to_char(vu.endDate, 'yyyy-MM-dd'), 'yyyy-MM-dd') = to_date('2026-05-14', 'yyyy-MM-dd') and (vu.endTime = '2026-05-14' or vu.endTime = '3338464713283357441') ) );

-- statementId: lowerDepartmentLevel.select
-- lookupStatementId: lowerDepartmentLevel.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "userId": 1001,
--   "roleName": "NAME_001"
-- }
SELECT min(length(u.path)) FROM org_relationship rs LEFT JOIN org_unit u ON u.id = rs.objective0_id WHERE rs.source_id = 1001 AND rs.objective1_id IN ( SELECT r.id FROM org_role r WHERE r.name = 'NAME_001');

-- statementId: lowerDepartmentManager.select
-- lookupStatementId: lowerDepartmentManager.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "checkRole": "VALUE_001",
--   "userId": 1001,
--   "roleName": "NAME_001",
--   "level": "VALUE_001"
-- }
SELECT rs1.source_id id FROM org_relationship rs1 LEFT JOIN org_relationship rs2 ON rs1.objective0_id = rs2.objective0_id LEFT JOIN org_unit u ON u.id = rs1.objective0_id WHERE rs1.objective1_id IN (SELECT r.id FROM org_role r WHERE r.name = 'VALUE_001') AND rs2.source_id = 1001 AND rs2.objective1_id IN ( SELECT r.id FROM org_role r WHERE r.name = 'NAME_001') AND length(u.path) = 'VALUE_001';

-- statementId: findLeaveDayByUserId.select
-- lookupStatementId: findLeaveDayByUserId.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "userId": 1001,
--   "ehrLeaveInfoTable": "demo_table",
--   "startDate": "2026-05-14",
--   "endDate": "2026-05-14"
-- }
SELECT id, 1001 AS STAFFID,(SELECT name FROM org_member t WHERE t.id = field0001) AS NAME, trunc(field0010) AS STARTDATE, util_common.getEnumShowById(q.field0011) AS STARTDATEMORN, trunc(field0012) AS ENDDATE, util_common.getEnumShowById(q.field0013) AS ENDDATEMORN, util_common.getEnumShowById(q.field0008) AS TYPE, 1 AS ISFINISHED FROM demo_table q WHERE (field0010 BETWEEN '2026-05-14' AND '2026-05-14' OR field0012 BETWEEN '2026-05-14' AND '2026-05-14' OR (field0010 < '2026-05-14' AND field0012 > '2026-05-14')) AND field0006 = util_common.getEnumIdByRefName('请假记录状态', '已请假') AND field0001 IN ( SELECT COLUMN_VALUE FROM TABLE(util_org.getUnderlingMemId(1001)) UNION SELECT m.id FROM org_member m WHERE m.is_internal = 1 AND m.is_virtual = 0 AND m.is_enable = 1 AND m.is_deleted = 0 AND EXISTS (SELECT 1 FROM org_member m WHERE m.id = 1001 AND m.org_department_id = util_org.getDeptIdByDeptCode('77715')));

-- statementId: findHkLeaveDayByUserId.select
-- lookupStatementId: findHkLeaveDayByUserId.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "startDate": "2026-05-14",
--   "endDate": "2026-05-14",
--   "userId": 1001
-- }
SELECT id, applyUser as STAFFID, (SELECT name FROM org_member t WHERE t.id = applyUser) AS NAME, trunc(leaveStartDate) AS STARTDATE, util_common.getEnumShowById(q.leaveStartHalfDay) AS STARTDATEMORN, trunc(leaveEndDate) AS ENDDATE, util_common.getEnumShowById(q.leaveEndHalfDay) AS ENDDATEMORN, util_common.getEnumShowById(q.leaveType) AS TYPE, 1 AS ISFINISHED FROM vm_cap_hkLeaveRecord q WHERE (leaveStartDate BETWEEN '2026-05-14' AND '2026-05-14' OR leaveEndDate BETWEEN '2026-05-14' AND '2026-05-14' OR (leaveStartDate < '2026-05-14' AND leaveEndDate > '2026-05-14')) AND recordState = util_common.getEnumIdByRefName('请假记录状态', '已请假') AND applyUser IN ( SELECT COLUMN_VALUE FROM TABLE(util_org.getUnderlingMemId(1001)) UNION SELECT m.id FROM org_member m WHERE m.is_internal = 1 AND m.is_virtual = 0 AND m.is_enable = 1 AND m.is_deleted = 0 AND EXISTS (SELECT 1 FROM org_member m WHERE m.id = 1001 AND (m.org_post_id = (select id from org_post where code = 'HKZGHROfficer' ) or m.org_post_id = (select id from org_post where code = 'HKZGCEO' ) or m.org_post_id = (select id from org_post where code = 'HKZGFinanceOfficer' ) )) UNION select to_number(memberId) from vm_cap_chargeMemberRelation where chargeMember = 1001 UNION select distinct(to_number(applyUser)) from vm_wf_hkLeaveApply where 1001 in (select * from util_common.split(noticeMembers,',')) );

-- statementId: findLeaveDayByUserId4Cancel.select
-- lookupStatementId: findLeaveDayByUserId4Cancel.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "userId": 1001,
--   "ehrLeaveCancelInfoTable": "demo_table",
--   "ehrLeaveInfoTable": "demo_table",
--   "startDate": "2026-05-14",
--   "endDate": "2026-05-14"
-- }
SELECT k1.id, 1001 AS STAFFID,(SELECT name FROM org_member t WHERE t.id = k1.field0001) NAME, STARTDATE, STARTDATEMORN, ENDDATE, ENDDATEMORN, 1 AS ISFINISHED, util_common.getEnumShowById(k1.field0008) AS TYPE FROM formmain_2157 k1 JOIN ( SELECT formmain_id, trunc(field0025) AS STARTDATE, util_common.getEnumShowById(q.field0026) AS STARTDATEMORN, trunc(field0027) AS ENDDATE, util_common.getEnumShowById(q.field0028) AS ENDDATEMORN FROM demo_table q WHERE field0023 =util_common.getEnumIdByRefName('销假类型', '部分销假') AND formmain_id IN ( SELECT ID FROM demo_table WHERE (field0010 BETWEEN '2026-05-14' AND '2026-05-14' OR field0012 BETWEEN '2026-05-14' AND '2026-05-14' OR (field0010<'2026-05-14' AND field0012>'2026-05-14')) AND field0006=util_common.getEnumIdByRefName('请假记录状态', '已销假') AND field0001 IN ( SELECT COLUMN_VALUE FROM TABLE (util_org.getUnderlingMemId(1001)) UNION SELECT m.id FROM org_member m WHERE m.is_internal=1 AND m.is_virtual=0 AND m.is_enable=1 AND m.is_deleted=0 AND EXISTS ( SELECT 1 FROM org_member m WHERE m.id = 1001 AND m.org_department_id=util_org.getDeptIdByDeptCode('77715') ) ) ) ) k2 ON k1.id = k2.formmain_id;

-- statementId: findHkLeaveDayByUserId4Cancel.select
-- lookupStatementId: findHkLeaveDayByUserId4Cancel.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "userId": 1001,
--   "startDate": "2026-05-14",
--   "endDate": "2026-05-14"
-- }
SELECT k1.id, 1001 AS STAFFID,(SELECT name FROM org_member t WHERE t.id = k1.applyUser) NAME, STARTDATE AS STARTDATE, STARTDATEMORN as STARTDATEMORN, ENDDATE as ENDDATE, ENDDATEMORN as ENDDATEMORN, 1 AS ISFINISHED, util_common.getEnumShowById(k1.leaveType) AS TYPE FROM vm_cap_hkLeaveRecord k1 JOIN ( SELECT formmainId, trunc(newLeaveStartDate) AS STARTDATE, util_common.getEnumShowById(q.newLeaveStartHalfDay) AS STARTDATEMORN, trunc(newLeaveEndDate) AS ENDDATE, util_common.getEnumShowById(q.newLeaveEndHalfDay) AS ENDDATEMORN FROM vm_cap_hkLeaveRecord_son q WHERE leaveBackType =util_common.getEnumIdByRefName('销假类型', '部分销假') AND formmainId IN ( SELECT ID FROM vm_cap_hkLeaveRecord WHERE (leaveStartDate BETWEEN '2026-05-14' AND '2026-05-14' OR leaveEndDate BETWEEN '2026-05-14' AND '2026-05-14' OR (leaveStartDate<'2026-05-14' AND leaveEndDate>'2026-05-14')) AND recordState=util_common.getEnumIdByRefName('请假记录状态', '已销假') AND applyUser IN ( SELECT COLUMN_VALUE FROM TABLE (util_org.getUnderlingMemId(1001)) UNION SELECT m.id FROM org_member m WHERE m.is_internal = 1 AND m.is_virtual = 0 AND m.is_enable = 1 AND m.is_deleted = 0 AND EXISTS (SELECT 1 FROM org_member m WHERE m.id = 1001 AND (m.org_post_id = (select id from org_post where code = 'HKZGHROfficer' ) or m.org_post_id = (select id from org_post where code = 'HKZGCEO' ) or m.org_post_id = (select id from org_post where code = 'HKZGFinanceOfficer' ) )) UNION select to_number(memberId) from vm_cap_chargeMemberRelation where chargeMember = 1001 ) ) ) k2 ON k1.id = k2.formmainId;

-- statementId: findUnfinishedLeaveDayByUserId.select
-- lookupStatementId: findUnfinishedLeaveDayByUserId.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "userId": 1001,
--   "leaveFlowTable": "demo_table",
--   "startDate": "2026-05-14",
--   "endDate": "2026-05-14"
-- }
SELECT csy.id as id, 1001 AS STAFFID,(SELECT name FROM org_member t WHERE t.id = field0002) AS NAME, trunc(field0014) AS STARTDATE, util_common.getEnumShowById(field0015) AS STARTDATEMORN, trunc(field0016) AS ENDDATE, util_common.getEnumShowById(field0017) AS ENDDATEMORN, 0 AS ISFINISHED, util_common.getEnumShowById(fm.field0010) AS TYPE from demo_table fm left join col_summary csy on csy.form_recordid=fm.id WHERE ( field0014 BETWEEN '2026-05-14' AND '2026-05-14' OR field0016 BETWEEN '2026-05-14' AND '2026-05-14' OR (field0014 < '2026-05-14' AND field0016 > '2026-05-14') ) AND fm.finishedflag = 0 AND fm.state = 1 AND field0002 IN ( SELECT COLUMN_VALUE FROM TABLE (util_org.getUnderlingMemId(1001)) UNION SELECT m.id FROM org_member m WHERE m.is_internal=1 AND m.is_virtual=0 AND m.is_enable=1 AND m.is_deleted=0 AND EXISTS ( SELECT 1 FROM org_member m WHERE m.id = 1001 AND m.org_department_id=util_org.getDeptIdByDeptCode('77715')));

-- statementId: findHkUnfinishedLeaveDayByUserId.select
-- lookupStatementId: findHkUnfinishedLeaveDayByUserId.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "userId": 1001,
--   "startDate": "2026-05-14",
--   "endDate": "2026-05-14"
-- }
SELECT fm.id as id, 1001 AS STAFFID,(SELECT name FROM org_member t WHERE t.id = applyUser) AS NAME, trunc(leaveStartDate) AS STARTDATE, util_common.getEnumShowById(leaveStartHalfDay) AS STARTDATEMORN, trunc(leaveEndDate) AS ENDDATE, util_common.getEnumShowById(leaveEndHalfDay) AS ENDDATEMORN, 0 AS ISFINISHED, util_common.getEnumShowById(fm.leaveType) AS TYPE from vm_wf_hkLeaveApply fm left join col_summary csy on csy.form_recordid=fm.id WHERE ( leaveStartDate BETWEEN '2026-05-14' AND '2026-05-14' OR leaveEndDate BETWEEN '2026-05-14' AND '2026-05-14' OR (leaveStartDate < '2026-05-14' AND leaveEndDate > '2026-05-14') ) AND fm.finishedflag = 0 AND fm.state = 1 AND applyUser IN ( SELECT COLUMN_VALUE FROM TABLE (util_org.getUnderlingMemId(1001)) UNION SELECT m.id FROM org_member m WHERE m.is_internal = 1 AND m.is_virtual = 0 AND m.is_enable = 1 AND m.is_deleted = 0 AND EXISTS (SELECT 1 FROM org_member m WHERE m.id = 1001 AND (m.org_post_id = (select id from org_post where code = 'HKZGHROfficer' ) or m.org_post_id = (select id from org_post where code = 'HKZGCEO' ) or m.org_post_id = (select id from org_post where code = 'HKZGFinanceOfficer' ) )) UNION select to_number(memberId) from vm_cap_chargeMemberRelation where chargeMember = 1001 UNION select distinct(to_number(applyUser)) from vm_wf_hkLeaveApply where 1001 in (select * from util_common.split(noticeMembers,',')) );

-- statementId: getOtherLeavingFlow.select
-- lookupStatementId: getOtherLeavingFlow.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "leaveFlowTable": "demo_table",
--   "currentFlow": "VALUE_001"
-- }
Select id as id,field0002 as applyuser,field0004 as applydept,trunc(field0014) as startdate,field0015 as startdatehalf, trunc(field0016) as enddate, field0017 as enddatehalf from demo_table where finishedflag = 0 and id <> 'VALUE_001' and state = 1;

-- statementId: getActualYearDay.select
-- lookupStatementId: getActualYearDay.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "monthFieldName": "RAW_VALUE",
--   "mainTable": "demo_table",
--   "sonTable": "demo_table",
--   "yearFieldName": "RAW_VALUE",
--   "year": "VALUE_001",
--   "userFieldName": "RAW_VALUE",
--   "user": "VALUE_001"
-- }
select RAW_VALUE as monthYearDay from demo_table t1,demo_table t2 where t1.id=t2.formmain_id and RAW_VALUE='VALUE_001' and RAW_VALUE='VALUE_001';

-- statementId: updateActualYearDay.update
-- lookupStatementId: updateActualYearDay.update
-- source: hr_sqlmap.xml
-- type: update
-- params: {
--   "sonTable": "demo_table",
--   "monthFieldName": "RAW_VALUE",
--   "monthYearDay": "VALUE_001",
--   "mainTable": "demo_table",
--   "userFieldName": "RAW_VALUE",
--   "user": "VALUE_001",
--   "yearFieldName": "RAW_VALUE",
--   "year": "VALUE_001"
-- }
update demo_table t2 set RAW_VALUE='VALUE_001' where t2.formmain_id= (select id from demo_table where RAW_VALUE='VALUE_001' and RAW_VALUE='VALUE_001');

-- statementId: getYearLeavePlan.select
-- lookupStatementId: getYearLeavePlan.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "year": "VALUE_001",
--   "memberList": [
--     "EVENT_A",
--     "EVENT_B"
--   ]
-- }
select t.member as member,t.yearday as yearday, t.planmonth_1 as m1p,t.actualmonth_1 as m1a,t.planmonth_2 as m2p,t.actualmonth_2 as m2a, t.planmonth_3 as m3p,t.actualmonth_3 as m3a,t.planmonth_4 as m4p,t.actualmonth_4 as m4a, t.planmonth_5 as m5p,t.actualmonth_5 as m5a,t.planmonth_6 as m6p,t.actualmonth_6 as m6a, t.planmonth_7 as m7p,t.actualmonth_7 as m7a,t.planmonth_8 as m8p,t.actualmonth_8 as m8a, t.planmonth_9 as m9p,t.actualmonth_9 as m9a,t.planmonth_10 as m10p,t.actualmonth_10 as m10a, t.planmonth_11 as m11p,t.actualmonth_11 as m11a,t.planmonth_12 as m12p,t.actualmonth_12 as m12a from vm_yearleaveday t where t.year='VALUE_001' and t.member in ('EVENT_A','EVENT_B');

-- statementId: initYearLeavePlan.insert
-- lookupStatementId: initYearLeavePlan.insert
-- source: hr_sqlmap.xml
-- type: insert
-- params: {
--   "tableName": "demo_table",
--   "id": 1001,
--   "formmain_id": 1001,
--   "sort": 1,
--   "member": "VALUE_001",
--   "yearDay": "VALUE_001",
--   "m1p": "VALUE_001",
--   "m1a": "VALUE_001",
--   "m2p": "VALUE_001",
--   "m2a": "VALUE_001",
--   "m3p": "VALUE_001",
--   "m3a": "VALUE_001",
--   "m4p": "VALUE_001",
--   "m4a": "VALUE_001",
--   "m5p": "VALUE_001",
--   "m5a": "VALUE_001",
--   "m6p": "VALUE_001",
--   "m6a": "VALUE_001",
--   "m7p": "VALUE_001",
--   "m7a": "VALUE_001",
--   "m8p": "VALUE_001",
--   "m8a": "VALUE_001",
--   "m9p": "VALUE_001",
--   "m9a": "VALUE_001",
--   "m10p": "VALUE_001",
--   "m10a": "VALUE_001",
--   "m11p": "VALUE_001",
--   "m11a": "VALUE_001",
--   "m12p": "VALUE_001",
--   "m12a": "VALUE_001"
-- }
INSERT INTO demo_table ( ID, formmain_id, SORT, field0011,field0012, field0013,field0014,field0015,field0016,field0017,field0018, field0020,field0021,field0022,field0023,field0024,field0025, field0027,field0028,field0029,field0030,field0031,field0032, field0034,field0035,field0036,field0037,field0038,field0039) VALUES ( 1001, 1001, 1, 'VALUE_001', 'VALUE_001', 'VALUE_001','VALUE_001','VALUE_001','VALUE_001','VALUE_001','VALUE_001', 'VALUE_001','VALUE_001','VALUE_001','VALUE_001','VALUE_001','VALUE_001', 'VALUE_001','VALUE_001','VALUE_001','VALUE_001','VALUE_001','VALUE_001', 'VALUE_001','VALUE_001','VALUE_001','VALUE_001','VALUE_001','VALUE_001');

-- statementId: getDeptListByAccountList.select
-- lookupStatementId: getDeptListByAccountList.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "orgAccount": [
--     "EVENT_A",
--     "EVENT_B"
--   ]
-- }
SELECT DISTINCT ou.code FROM org_unit ou, (SELECT '^'||PATH aPATH FROM org_unit WHERE NAME IN ('EVENT_A','EVENT_B') ) t WHERE regexp_like(ou.path,t.aPATH) AND regexp_like(ou.code,'^[0-9]+[0-9]$$') AND ou.NAME NOT LIKE '%高管部%' AND ou.TYPE = 'Department' AND is_internal=1 AND is_enable=1 AND is_deleted=0 AND CODE IS NOT NULL;

-- statementId: getLineLeaderList.select
-- lookupStatementId: getLineLeaderList.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "orgAccount": [
--     "EVENT_A",
--     "EVENT_B"
--   ]
-- }
select om.code from org_member om where id in( SELECT DISTINCT RL.SOURCE_ID FROM ORG_RELATIONSHIP RL WHERE RL.TYPE = 'Member_Role' AND RL.OBJECTIVE1_ID IN (SELECT ID FROM ORG_ROLE R WHERE R.NAME = '分管领导') and RL.objective0_id IN(SELECT DISTINCT ou.id FROM org_unit ou, (SELECT '^'||PATH aPATH FROM org_unit WHERE NAME IN ('EVENT_A','EVENT_B') ) t WHERE regexp_like(ou.path,t.aPATH) AND regexp_like(ou.code,'^[0-9]+[0-9]$$') AND ou.NAME NOT LIKE '%高管部%' AND ou.TYPE = 'Department' AND is_internal=1 AND is_enable=1 AND is_deleted=0 AND CODE IS NOT NULL));

-- statementId: clearActualYearLeaveDay.update
-- lookupStatementId: clearActualYearLeaveDay.update
-- source: hr_sqlmap.xml
-- type: update
-- params: {}
UPDATE vm_yearleaveday SET actualmonth_1 = 0,actualmonth_2 = 0,actualmonth_3 = 0,actualmonth_4 = 0, actualmonth_5 = 0,actualmonth_6 = 0,actualmonth_7 = 0,actualmonth_8 = 0, actualmonth_9 = 0,actualmonth_10 = 0,actualmonth_11 = 0,actualmonth_12 = 0;

-- statementId: getlineleaderdept.select
-- lookupStatementId: getlineleaderdept.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "leaderId": 1001
-- }
SELECT ou.id FROM org_unit ou WHERE ou.ID in(SELECT OBJECTIVE0_ID FROM ORG_RELATIONSHIP RL WHERE RL.SOURCE_ID=1001) and ou.TYPE = 'Department' AND is_internal=1 AND is_enable=1 AND regexp_like(ou.code,'^[0-9]+[0-9]$') AND ou.NAME NOT LIKE '%高管部%';

-- statementId: getDeptByDeptManager.select
-- lookupStatementId: getDeptByDeptManager.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "deptManager": "VALUE_001"
-- }
SELECT ID as dept FROM org_unit WHERE ID in(SELECT OBJECTIVE0_ID FROM ORG_RELATIONSHIP RL WHERE RL.SOURCE_ID='VALUE_001' AND RL.TYPE = 'Member_Role' AND RL.OBJECTIVE1_ID IN (SELECT ID FROM ORG_ROLE R WHERE R.NAME = '部门经理'));

-- statementId: getDeptYearLeavePlan.select
-- lookupStatementId: getDeptYearLeavePlan.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "dept": "VALUE_001",
--   "year": "VALUE_001"
-- }
SELECT DISTINCT dept, nvl(planmonth_1,0)+nvl(planmonth_2,0)+nvl(planmonth_3,0) as planquarter_1, nvl(actualmonth_1,0)+nvl(actualmonth_2,0)+nvl(actualmonth_3,0) as actualquarter_1, nvl(planmonth_4,0)+nvl(planmonth_5,0)+nvl(planmonth_6,0) as planquarter_2, nvl(actualmonth_4,0)+nvl(actualmonth_5,0)+nvl(actualmonth_6,0) as actualquarter_2, nvl(planmonth_7,0)+nvl(planmonth_8,0)+nvl(planmonth_9,0) as planquarter_3, nvl(actualmonth_7,0)+nvl(actualmonth_8,0)+nvl(actualmonth_9,0) as actualquarter_3, nvl(planmonth_10,0)+nvl(planmonth_11,0)+nvl(planmonth_12,0) as planquarter_4, nvl(actualmonth_10,0)+nvl(actualmonth_11,0)+nvl(actualmonth_12,0) as actualquarter_4 FROM vm_yearleaveday where dept='VALUE_001' and year='VALUE_001';

-- statementId: initDeptYearLeavePlan.insert
-- lookupStatementId: initDeptYearLeavePlan.insert
-- source: hr_sqlmap.xml
-- type: insert
-- params: {
--   "tableName": "demo_table",
--   "id": 1001,
--   "formmain_id": 1001,
--   "sort": 1,
--   "dept": "VALUE_001",
--   "planquarter_1": "VALUE_001",
--   "actualquarter_1": "VALUE_001",
--   "planquarter_2": "VALUE_001",
--   "actualquarter_2": "VALUE_001",
--   "planquarter_3": "VALUE_001",
--   "actualquarter_3": "VALUE_001"
-- }
INSERT INTO demo_table ( ID, formmain_id, SORT, field0042,field0043,field0044,field0046,field0047,field0049,field0050) VALUES ( 1001, 1001, 1, 'VALUE_001', 'VALUE_001','VALUE_001','VALUE_001','VALUE_001', 'VALUE_001','VALUE_001');

-- statementId: getActualYearLeaveDay.select
-- lookupStatementId: getActualYearLeaveDay.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "mainTable": "demo_table",
--   "sonTable": "demo_table",
--   "currentYear": "VALUE_001"
-- }
select t1.field0001 as member,t1.field0003 as dept,t1.field0008 as leavetype, to_char(t1.field0010,'yyyy-mm-dd') as startdate,(select s2.enumvalue from ctp_enum_item s2 where s2.id=t1.field0011) as startdatehalf, to_char(t1.field0012,'yyyy-mm-dd') as enddate,(select s3.enumvalue from ctp_enum_item s3 where s3.id=t1.field0013) as enddatehalf, (select s4.showvalue from ctp_enum_item s4 where s4.id=t2.field0023) as cancelleavetype, to_char(t2.field0025,'yyyy-mm-dd') as newstartdate,(select s5.enumvalue from ctp_enum_item s5 where s5.id=t2.field0026) as newstartdatehalf, to_char(t2.field0027,'yyyy-mm-dd') as newenddate,(select s6.enumvalue from ctp_enum_item s6 where s6.id=t2.field0028) as newenddatehalf, from demo_table t1,demo_table t2 where t1.id=t2.formmain_id and to_char(t1.field0010,'yyyy')='VALUE_001' and (select s1.showvalue from ctp_enum_item s1 where s1.id=t1.field0008) = '年假';

-- statementId: getLeaveInfo.select
-- lookupStatementId: getLeaveInfo.select
-- source: hr_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select distinct v.id, title, to_char(leavedate,'yyyy-mm-dd') as leavedate, leavemember, leavedepart, agentmember, memberaddress, note, authorinfo from vm_wfleaveinfo v, ctp_affair c where v.id = c.object_id(+) and (sysdate-15) > v.leavedate and v.id not in ( select v.id from vm_wfleaveinfo v, ctp_affair c where v.id = c.object_id(+) and (sysdate-15) > v.leavedate and c.activity_id = 'VALUE_001' );

-- statementId: getCap4LeaveInfo.select
-- lookupStatementId: getCap4LeaveInfo.select
-- source: hr_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select distinct v.id, c.activity_id, to_char(leavedate, 'yyyy-mm-dd') as leavedate, leaveUserId, deptCode, agentNo, workplace, remark, flowUrl, isCloseAccount from vm_wf_cap4leaveinfo v left join ctp_affair c on v.id = c.form_recordid where (sysdate - 15) > v.leavedate and c.activity_id = 'VALUE_001' and c.state = 3 and (v.isCloseAccount is null or v.isCloseAccount != -1089048568118490234) and (v.remark is null or v.remark not in ('派遣人员转正式员工', '母子公司调动')) and v.leaveUserId not in (select staffNo from vm_wf_vm_RevokeSysAccCAP4);

-- statementId: getNoteById.select
-- lookupStatementId: getNoteById.select
-- source: hr_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id from formmain_3531 where field0011 = 'VALUE_001';

-- statementId: getVactionByVactionType.select
-- lookupStatementId: getVactionByVactionType.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "vactionType": "VALUE_001",
--   "vactionDetailType": "VALUE_001"
-- }
select vactionType,vactiondetailType,isincludeFest,isincludeRest,minvactiondays,maxvactiondays from vm_vacationbaseinfo v where v.vactionType = 'VALUE_001' and v.vactiondetailtype = 'VALUE_001';

-- statementId: getVactionBaseInfoHK.select
-- lookupStatementId: getVactionBaseInfoHK.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "vactionType": "VALUE_001"
-- }
select vactionType,isincludeFest,isincludeRest,minvactiondays,maxvactiondays from vm_vacationbaseinfoHK v where util_common.getEnumValueById(v.vactionType) = 'VALUE_001';

-- statementId: personalInfoByUserIdHK.select
-- lookupStatementId: personalInfoByUserIdHK.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "userId": 1001,
--   "startYear": "VALUE_001",
--   "endYear": "VALUE_001"
-- }
select f1.memberId as "userId", f2.year as "year", f2.usedAnnualLeaveDays as "usedDays", /*to_char(field0011 - field0013) as leaveDay,可用于销假的天数*/ remainAnnualLeaveDays as "restDay", onOrderAnnualLeaveDays as "noTheWayDay" from vm_cap_hkMemberLeaveInfo f1 left join vm_cap_hkMemberLeaveInfo_son f2 on f1.id = f2.formmain_id where f1.memberId = 1001 and f2.year between 'VALUE_001' and 'VALUE_001' order by f2.year asc;

-- statementId: personalInfoByUserId.select
-- lookupStatementId: personalInfoByUserId.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "userId": 1001,
--   "startYear": "VALUE_001",
--   "endYear": "VALUE_001"
-- }
select f1.field0001 as "userId", f2.field0009 as "year", f2.field0011 as "usedDays", /*to_char(field0011 - field0013) as leaveDay,可用于销假的天数*/ field0012 as "restDay", field0013 as "noTheWayDay" from formmain_2153 f1 left join formson_2154 f2 on f1.id = f2.formmain_id where f1.field0001 = 1001 and f2.field0009 between 'VALUE_001' and 'VALUE_001' order by f2.field0009 asc;

-- statementId: queryCurrentDirector.select
-- lookupStatementId: queryCurrentDirector.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {}
select id, state, start_member_id, startdate, approve_member_id, approve_date, finished_flag, ratify_flag, ratify_member_id, ratify_date, modify_member_id, modify_date, sort, org_id, name, gender, post, education, positional_title, present_post_desc, id_type, id_number, status, date_of_appoint, date_of_depart, remark, presvious_post_desc, serial_number, filler, fill_date, filler_dept, record_module, edu_degree, nextSynTime from vm_company_directors_info where (util_common.getEnumShowById(org_id) = '高管');

-- statementId: queryPartTimeMemberIdNo.select
-- lookupStatementId: queryPartTimeMemberIdNo.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {}
select v1.id_type as "idType", v1.id_number as "idNumber", v1.nextSynTime as "nextSynTime", v1.name as "name" from vm_company_directors_info v1 group by v1.id_type,v1.id_number,v1.nextsyntime,v1.name having count(name)>1;

-- statementId: insertLeaveSubInfo.insert
-- lookupStatementId: insertLeaveSubInfo.insert
-- source: hr_sqlmap.xml
-- type: insert
-- params: {
--   "id": 1001,
--   "formmain_id": 1001,
--   "name": "NAME_001",
--   "leave_reason": "VALUE_001",
--   "leave_remark": "VALUE_001",
--   "gender": "VALUE_001",
--   "org_id": 1001,
--   "post": "VALUE_001",
--   "date_of_appoint": "2026-05-14",
--   "date_of_depart": "2026-05-14",
--   "adjustType": "VALUE_001",
--   "adjustDate": "2026-05-14",
--   "status": 1,
--   "id_type": 1001,
--   "id_type_updated": "2026-05-14",
--   "id_number": 1001,
--   "id_number_updated": "2026-05-14",
--   "positional_title": "TITLE_001",
--   "positional_title_updated": "2026-05-14",
--   "education": "VALUE_001",
--   "education_updated": "2026-05-14",
--   "edu_degree": "VALUE_001",
--   "edu_degree_updated": "2026-05-14",
--   "present_post_desc": "VALUE_001",
--   "present_post_desc_updated": "2026-05-14",
--   "presvious_post_desc": "VALUE_001",
--   "presvious_post_desc_updated": "2026-05-14",
--   "record_module": "VALUE_001",
--   "record_module_updated": "2026-05-14"
-- }
INSERT INTO vm_directors_leave_sub ( ID, FORMMAIN_ID, SORT, name, leave_reason, leave_remark, gender, org_id, post, date_of_appoint, date_of_depart, adjustType, adjustDate, status, id_type, id_type_updated, id_number, id_number_updated, positional_title, positional_title_updated, education, education_updated, edu_degree, edu_degree_updated, present_post_desc, present_post_desc_updated, presvious_post_desc, presvious_post_desc_updated, record_module, record_module_updated ) VALUES ( 1001, 1001, 0, 'NAME_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 1001, 'VALUE_001', to_date('2026-05-14','yyyy-mm-dd'), to_date('2026-05-14','yyyy-mm-dd'), 'VALUE_001', '2026-05-14', 1, 1001, '2026-05-14', 1001, '2026-05-14', 'TITLE_001', '2026-05-14', 'VALUE_001', '2026-05-14', 'VALUE_001', '2026-05-14', 'VALUE_001', '2026-05-14', 'VALUE_001', '2026-05-14', 'VALUE_001', '2026-05-14' );

-- statementId: updateDirectorRecord.update
-- lookupStatementId: updateDirectorRecord.update
-- source: hr_sqlmap.xml
-- type: update
-- params: {
--   "record": "VALUE_001",
--   "dateOfAppoint": "2026-05-14",
--   "idType": 1001,
--   "idNumber": 1001,
--   "org": "VALUE_001"
-- }
update VM_COMPANY_DIRECTORS_INFO set record = 'VALUE_001' where date_of_appoint = '2026-05-14' and id_type = 1001 and id_number = 1001 and org_id = 'VALUE_001';

-- statementId: getHolidayByDay.select
-- lookupStatementId: getHolidayByDay.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "year": "VALUE_001",
--   "date": "2026-05-14"
-- }
select to_char(datenum,'yyyy-mm-dd') datenum, isrest, datememo from table(util_common.getHolidays('VALUE_001',1)) where to_char(datenum,'yyyy-mm-dd') = '2026-05-14';

-- statementId: getParantalLeavePeriod.select
-- lookupStatementId: getParantalLeavePeriod.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "userId": 1001,
--   "startDate": "2026-05-14",
--   "endDate": "2026-05-14"
-- }
select parental.id as "id", parental.formmain_Id as "formmainId", base.memberId as "staffId", parental.childId as "childId", parental.holidayPeriodStart as "holidayPeriodStart", parental.holidayPeriodEnd as "holidayPeriodEnd", parental.holidayCount as "holidayCount", parental.holidayUsed as "holidayUsed", parental.holidayRest as "holidayRest", parental.holidayProcessing as "holidayProcessing", parental.idCopy as "idCopy" from vm_baseMemberInfo base left join vm_parentalLeaveInfo parental on base.id = parental.formmain_Id where base.memberId = 1001 and ( ('2026-05-14' < parental.holidayPeriodEnd and '2026-05-14' >= parental.holidayPeriodStart) or ('2026-05-14' < parental.holidayPeriodEnd and '2026-05-14' >= parental.holidayPeriodStart) ) order by parental.holidayPeriodStart, parental.childId asc;

-- statementId: getParantalLeavePeriodById.select
-- lookupStatementId: getParantalLeavePeriodById.select
-- source: hr_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select parental.id as "id", parental.formmain_Id as "formmainId", parental.childId as "childId", parental.holidayPeriodStart as "holidayPeriodStart", parental.holidayPeriodEnd as "holidayPeriodEnd", parental.holidayCount as "holidayCount", parental.holidayUsed as "holidayUsed", parental.holidayRest as "holidayRest", parental.holidayProcessing as "holidayProcessing", parental.idCopy as "idCopy" from vm_parentalLeaveInfo parental where id = 'VALUE_001';

-- statementId: getParentalLeaveRecord.select
-- lookupStatementId: getParentalLeaveRecord.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "identityNo": 1001,
--   "staffId": 1001,
--   "currentDate": "2026-05-14",
--   "isHalfDay": "VALUE_001"
-- }
select id as "id", identityNo as "identityNo", staffId as "staffId", currentDate as "currentDate", isHalfDay as "isHalfDay", isCancel as "isCancel", cancelDate as "cancelDate" from vm_parentalLeaveRecord where identityNo = 1001 and staffId = 1001 and currentDate = '2026-05-14' and isHalfDay = 'VALUE_001' and isCancel = 8705337157000773743;

-- statementId: addParentalLeaveRecord.insert
-- lookupStatementId: addParentalLeaveRecord.insert
-- source: hr_sqlmap.xml
-- type: insert
-- params: {
--   "id": 1001,
--   "identityNo": 1001,
--   "staffId": 1001,
--   "currentDate": "2026-05-14",
--   "isHalfDay": "VALUE_001",
--   "isCancel": "VALUE_001",
--   "cancelDate": "2026-05-14",
--   "periodId": 1001,
--   "leaveFlowId": 1001,
--   "cancelLeaveFlowId": 1001
-- }
INSERT INTO vm_parentalleaverecord ( id, identityNo, staffId, currentDate, isHalfDay, isCancel, cancelDate, periodId, leaveFlowId, cancelLeaveFlowId ) VALUES ( 1001, 1001, 1001, '2026-05-14', 'VALUE_001', 'VALUE_001', '2026-05-14', 1001, (select subject from ctp_affair where form_recordId = 1001 group by subject) , (select subject from ctp_affair where form_recordId = 1001 group by subject) );

-- statementId: getParentalLeaveFlowInfo.select
-- lookupStatementId: getParentalLeaveFlowInfo.select
-- source: hr_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id as id, writer as "writer", writerDept as "writerDept", writeDate as "writeDate", leaveType as "leaveType", startDate as "startDate", startHalfDay as "startHalfDay", endDate as "endDate", endHalfDay as "endHalfDay", calcPeriod0 as "calcPeriod0", discountDay0 as "discountDay0", calcPeriod1 as "calcPeriod1", discountDay1 as "discountDay1", calcPeriod2 as "calcPeriod2", discountDay2 as "discountDay2", calcPeriod3 as "calcPeriod3", discountDay3 as "discountDay3", calcPeriod4 as "calcPeriod4", discountDay4 as "discountDay4" from vm_wf_parentalleave where id = 'VALUE_001';

-- statementId: getParentalLeaveCancelFlowInfo.select
-- lookupStatementId: getParentalLeaveCancelFlowInfo.select
-- source: hr_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id as id, writer as "writer", writerDept as "writerDept", writeDate as "writeDate", leaveRecord as "leaveRecord", leaveType as "leaveType", startDate as "startDate", startHalfDay as "startHalfDay", endDate as "endDate", endHalfDay as "endHalfDay", cancelType as "cancelType", newstartDate as "newstartDate", newstartHalfDay as "newstartHalfDay", newendDate as "newendDate", newendHalfDay as "newendHalfDay" from vm_wf_parentalleavecancel where id = 'VALUE_001';

-- statementId: insertFormRelation.insert
-- lookupStatementId: insertFormRelation.insert
-- source: hr_sqlmap.xml
-- type: insert
-- params: {
--   "recordId": 1001,
--   "flowId": 1001,
--   "attachField": "VALUE_001"
-- }
insert into form_relation_record (id, from_masterdata_id, to_masterdata_id, state, field_name, form_type, type, member_id, from_subdata_id, to_subdata_id, from_form_id, to_form_id) values (util_common.getAbsID, 1001, (select id from col_summary where form_recordid=1001), 1, 'VALUE_001', '1', '1', '-6760911671874597139', '0', '0', '-8899514785812624908', '6734388298582673815' );

-- statementId: getCancelLeaveRecords.select
-- lookupStatementId: getCancelLeaveRecords.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "staffId": 1001,
--   "newStartDate": "2026-05-14",
--   "newEndDate": "2026-05-14"
-- }
select id as "id", identityNo as "identityNo", staffId as "staffId", currentDate as "currentDate", isHalfDay as "isHalfDay", isCancel as "isCancel", cancelDate as "cancelDate", periodId as "periodId" from vm_parentalLeaveRecord where staffId = 1001 and currentDate >= '2026-05-14' and currentDate <= '2026-05-14' and isCancel = 8705337157000773743 order by currentDate asc ,ishalfday desc;

-- statementId: updateParentalLeavePeriod.update
-- lookupStatementId: updateParentalLeavePeriod.update
-- source: hr_sqlmap.xml
-- type: update
-- params: {
--   "holidayUsed": 1001,
--   "holidayRest": 1001,
--   "id": 1001
-- }
update vm_parentalleaveInfo set holidayUsed = 1001, holidayRest = 1001 where id = 1001;

-- statementId: updateParentalLeaveRecord.update
-- lookupStatementId: updateParentalLeaveRecord.update
-- source: hr_sqlmap.xml
-- type: update
-- params: {
--   "isCancel": "VALUE_001",
--   "cancelDate": "2026-05-14",
--   "cancelLeaveFlowId": 1001,
--   "id": 1001
-- }
update vm_parentalleaverecord set isCancel = 'VALUE_001', cancelDate = '2026-05-14', cancelLeaveFlowId = (select subject from ctp_affair where form_recordId = 1001 group by subject) where id = 1001;

-- statementId: allBaseMemberInfo.update
-- lookupStatementId: allBaseMemberInfo.update
-- source: hr_sqlmap.xml
-- type: update
-- params: {}
update vm_baseMemberInfo set isinvestmanager = -812415069995905183, istopmanager = -1089048568118490234, isinvestdepartmanager = -1089048568118490234, isinvesthelp = -1089048568118490234;

-- statementId: baseMemberInfoByUserId.update
-- lookupStatementId: baseMemberInfoByUserId.update
-- source: hr_sqlmap.xml
-- type: update
-- params: {
--   "memIds": [
--     "EVENT_A",
--     "EVENT_B"
--   ]
-- }
update vm_baseMemberInfo set where util_user.getMemCodeByMemId(memberId) IN ('EVENT_A','EVENT_B');

-- statementId: isWorkDay.select
-- lookupStatementId: isWorkDay.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "date": "2026-05-14"
-- }
select to_char(util_common.isWorkDay('2026-05-14')) from dual;

-- statementId: getLastWorkDay.select
-- lookupStatementId: getLastWorkDay.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "date": "2026-05-14"
-- }
select util_common.getLastWorkDay('2026-05-14') from dual;

-- statementId: getNextWorkDay.select
-- lookupStatementId: getNextWorkDay.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "date": "2026-05-14"
-- }
select to_char(util_common.getNextWorkDay('2026-05-14')) from dual;

-- statementId: leaveDayDate.update
-- lookupStatementId: leaveDayDate.update
-- source: hr_sqlmap.xml
-- type: update
-- params: {
--   "startDate": "2026-05-14",
--   "endDate": "2026-05-14",
--   "id": 1001
-- }
update vm_wf_parentalleave set startDateextend = '2026-05-14', endDateextend = '2026-05-14' where id = 1001;

-- statementId: findLeaveStartDate.select
-- lookupStatementId: findLeaveStartDate.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "startDate": "2026-05-14",
--   "endDate": "2026-05-14",
--   "userId": 1001
-- }
select c.startdate, c.enddate, c. starthalf, c.endhalt from vm_leaveDayrecordtable c where ( ('2026-05-14' between c.startdate and c.enddate and c.enddate != '2026-05-14') or (enddate = '2026-05-14' -1 and c.endhalt = 3338464713283357441) ) and c.leaver = 1001;

-- statementId: mergeParentalChildInfo.insert
-- lookupStatementId: mergeParentalChildInfo.insert
-- source: hr_sqlmap.xml
-- type: insert
-- params: {
--   "childId": 1001,
--   "holidayPeriodStart": 1001,
--   "formmainId": 1001,
--   "id": 1001,
--   "holidayPeriodEnd": 1001,
--   "holidayCount": 1,
--   "holidayUsed": 1001,
--   "holidayRest": 1001,
--   "holidayProcessing": 1001,
--   "idCopy": 1001
-- }
merge into vm_parentalLeaveInfo a using (select 1001 as childId,1001 as holidayPeriodStart,1001 as formmain_id from dual) c on ( a.childId = c.childId and a.holidayPeriodStart=c.holidayPeriodStart and a.formmain_id = c.formmain_id) when not matched then insert( id, formmain_id, childId, holidayPeriodStart, holidayPeriodEnd, holidayCount, holidayUsed, holidayRest, holidayProcessing, idCopy ) values(1001, 1001, 1001, 1001, 1001, 1, 1001, 1001, 1001, 1001 ) when matched then update set holidayCount = 1;

-- statementId: getMemberBaseInfoIdByMemberId.select
-- lookupStatementId: getMemberBaseInfoIdByMemberId.select
-- source: hr_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id from VM_BASEMEMBERINFO where memberId = 'VALUE_001';

-- statementId: deleteEmptyParentalChildInfo.delete
-- lookupStatementId: deleteEmptyParentalChildInfo.delete
-- source: hr_sqlmap.xml
-- type: delete
-- params: {}
delete from vm_parentalLeaveInfo where childid is null or holidayperiodstart is null;

-- statementId: allCancelDayRecord.delete
-- lookupStatementId: allCancelDayRecord.delete
-- source: hr_sqlmap.xml
-- type: delete
-- params: {
--   "startDate": "2026-05-14",
--   "endDate": "2026-05-14"
-- }
delete from vm_DailyLeaveTravelRecord where leaveSerialNum in ( select distinct serialNum from vm_userapplyforleave f where f.recordStatus = 2149466679256501365 and to_char(f.modify_date, 'yyyy-mm-dd') BETWEEN '2026-05-14' AND '2026-05-14' connect by id = prior id and level <= enddate - begindate + 1 and prior sys_guid() is not null);

-- statementId: allCancelSurveyRecord.delete
-- lookupStatementId: allCancelSurveyRecord.delete
-- source: hr_sqlmap.xml
-- type: delete
-- params: {
--   "applyStatus": 1,
--   "startDate": "2026-05-14",
--   "endDate": "2026-05-14"
-- }
delete from vm_DailyLeaveTravelRecord where travelSerialNum in ( select distinct serialNum from vm_evectionRecord f where f.applyStatus = 1 and to_char(f.modify_date, 'yyyy-mm-dd') BETWEEN '2026-05-14' AND '2026-05-14' connect by id=prior id and level <= travelEndDate-travelBeginDate+1 and prior sys_guid() is not null);

-- statementId: allCancelDayRecordCtpContent.delete
-- lookupStatementId: allCancelDayRecordCtpContent.delete
-- source: hr_sqlmap.xml
-- type: delete
-- params: {}
delete from ctp_content_all f where f.module_template_id = -9154120848050929403 and f.content_template_id = 6050223712139953374 and not exists (select 1 from vm_DailyLeaveTravelRecord vdd where f.content_data_id = vdd.id);

-- statementId: empBusinessCard.select
-- lookupStatementId: empBusinessCard.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "kmCodes": [
--     "EVENT_A",
--     "EVENT_B"
--   ]
-- }
select f.id, to_char(f.memberId) memberId, f.loginName, nvl(f.chnname, f3.name) chnname, engname, departid, chnTitle, engTitle, f.qq, f.officeAddress, f.partTimeOfficeAddress, f.ecard, f.nameCardTemplate, util_common.getEnumShowById(f.showDeptChnName) showDeptChnName, util_common.getEnumShowById(f.showDeptEngName) showDeptEngName, util_common.getEnumShowById(f.showdeptEngAddress) showdeptEngAddress, f2_parent.name accountName, f2_parent.second_name accountEnName, f7.field0005 accountEnAddress, f2_parent.ext_attr_4 accountLandline, f2_parent.ext_attr_5 accountFax, nvl(f.departCn, util_org.getDeptNameByDeptId(f.departId)) departName, f2_parent.ext_attr_2 accountAddress, f2_parent.ext_attr_3 accountZIP, f2_parent.code, f3.ext_attr_2 email, f3.ext_attr_3 Landline, f.phone, f.otherPhone, f4.departEnName, f6.departEnName partTimeDepartEnName, f.businessQRCard, f.kmCode, util_org.getDeptNameByDeptId(f.partTimeDepartment) partTimeDepartName, f.traditionalName, f.partTimeTitle, f.partTimeChnTitle, f.partTimeEngTitle, f8.field0005 partTimeAccountEnAddress, f5_parent.ext_attr_4 partTimeAccountLandline, f5_parent.ext_attr_5 partTimeAccountFax, f5_parent.code partTimeAccountCode, f5_parent.ext_attr_7 url, f5_parent.name partTimeAccountName, f5_parent.second_name partTimeAccountEnName, f5_parent.ext_attr_2 partTimeAccountAddress, f5_parent.ext_attr_3 partTimeAccountZIP from vm_basememberinfo f left join org_unit f2 ON f.departId = f2.id left join org_unit f2_parent ON f2.org_account_id = f2_parent.id left join org_unit f5 ON f.partTimeDepartment = f5.id left join org_unit f5_parent ON f5.org_account_id = f5_parent.id left join org_member f3 on f.memberId = f3.id left join vm_deptaffairrole f4 on f.departId = f4.roleDept left join vm_deptaffairrole f6 on f.partTimeDepartment = f6.roleDept left join formmain_6276 f7 on f2_parent.code = f7.field0003 left join formmain_6276 f8 on f5_parent.code = f8.field0003 where f3.is_internal = 1 and f3.is_enable = 1 and f3.is_deleted = 0 AND kmCode IN ('EVENT_A','EVENT_B');

-- statementId: memberQrcode.select
-- lookupStatementId: memberQrcode.select
-- source: hr_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select to_char(f2.file_url) file_url from vm_basememberinfo f1 left join ctp_attachment f2 on f1.businessQRCard = f2.sub_reference where businessQRCard is not null and kmCode = 'VALUE_001';

-- statementId: memberPartTimeQrcode.select
-- lookupStatementId: memberPartTimeQrcode.select
-- source: hr_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select to_char(f2.file_url) file_url from vm_basememberinfo f1 left join ctp_attachment f2 on f1.partTimeQRCard = f2.sub_reference where partTimeQRCard is not null and kmCode = 'VALUE_001';

-- statementId: deleteAllECardReference
-- lookupStatementId: deleteAllECardReference
-- source: hr_sqlmap.xml
-- type: update
-- params: {}
update vm_basememberinfo set ecard = null;

-- statementId: eCardDownInfo.select
-- lookupStatementId: eCardDownInfo.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "kmCodes": [
--     "EVENT_A",
--     "EVENT_B"
--   ]
-- }
select ecard, to_char(f1.hrCode) hrCode,to_char(f2.file_url) as fieldId, nvl(f1.chnname, f3.name) chnname ,partTimeEcard,to_char(f2p.file_url) as partTimeFieldId from vm_basememberinfo f1 left join ctp_attachment f2 on f1.ecard = f2.sub_reference left join ctp_attachment f2p on f1.partTimeEcard = f2p.sub_reference left join org_member f3 on f1.memberId = f3.id where ecard is not null AND kmCode IN ('EVENT_A','EVENT_B');

-- statementId: companyEnName.select
-- lookupStatementId: companyEnName.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {}
select companyEnName from vm_companyExtend where companyCode = 'FGF';

-- statementId: cardExcelExport.select
-- lookupStatementId: cardExcelExport.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "kmCodes": [
--     "EVENT_A",
--     "EVENT_B"
--   ]
-- }
select chnname 中文姓名_1, engname 英文姓名_2, chnTitle 中文抬头_3, engTitle 英文抬头_4, f2.name 单位名称_5, nvl(f.departCn, util_org.getDeptNameByDeptId(f.departId)) 部门名称_6, f4.departEnName 部门英文名称_7, f2.ext_attr_2 单位地址_8, 'accountEnAddress' 单位英文地址_9, f.officeAddress 办公地址_10, f.phone 手机号_11, f.otherPhone 其他手机号_12, f3.ext_attr_3 座机_13, f3.ext_attr_2 邮箱_14, f2.ext_attr_3 单位邮编_15, f.qq qq_16, f.wechat 微信_17, util_common.getEnumShowById(f.showDeptEngName) 是否显示部门英文名称_18, util_common.getEnumShowById(f.showdeptEngAddress) 是否显示单位英文地址_19 from vm_basememberinfo f left join org_unit f2 on 1 = 1 left join org_member f3 on f.memberId = f3.id left join vm_deptaffairrole f4 on f.departId = f4.roleDept where f2.id = 97839079791739420 and f3.is_internal = 1 and f3.is_enable = 1 and f3.is_deleted = 0 and f.memberState = '在职' AND kmCode IN ('EVENT_A','EVENT_B');

-- statementId: cardDownInfo.select
-- lookupStatementId: cardDownInfo.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "kmCodes": [
--     "EVENT_A",
--     "EVENT_B"
--   ]
-- }
select nameCardTemplate, to_char(f1.hrCode) hrCode,to_char(f2.file_url) as fieldId, f1.chnname from vm_basememberinfo f1 left join ctp_attachment f2 on f1.nameCardTemplate = f2.sub_reference where nameCardTemplate is not null AND kmCode IN ('EVENT_A','EVENT_B');

-- statementId: updateEmpBaseInfo.update
-- lookupStatementId: updateEmpBaseInfo.update
-- source: hr_sqlmap.xml
-- type: update
-- params: {
--   "showDeptEngName": "NAME_001",
--   "showdeptEngAddress": "VALUE_001",
--   "phone": "VALUE_001",
--   "otherphone": "VALUE_001",
--   "qq": "VALUE_001",
--   "chnTitle": "TITLE_001",
--   "engTitle": "TITLE_001",
--   "officeAddress": "VALUE_001",
--   "engname": "NAME_001",
--   "departCn": "VALUE_001",
--   "wechat": "VALUE_001",
--   "kmCode": "CODE_001"
-- }
update vm_basememberinfo set , showDeptEngName = 'NAME_001' , showdeptEngAddress = 'VALUE_001' , phone = 'VALUE_001' , otherphone = 'VALUE_001' , qq = 'VALUE_001' , chnTitle = 'TITLE_001' , engTitle = 'TITLE_001' , officeAddress = 'VALUE_001' , engname = 'NAME_001' , departCn = 'VALUE_001' , wechat = 'VALUE_001' where kmcode = 'CODE_001';

-- statementId: paperCardModelFileUrl.select
-- lookupStatementId: paperCardModelFileUrl.select
-- source: hr_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select f.file_url fieldId from ctp_attachment f where f.sub_reference = 'VALUE_001';

-- statementId: getHKMembersAnnualLeaveInfo.select
-- lookupStatementId: getHKMembersAnnualLeaveInfo.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {}
select id as "id", memberId as "memberId", memberDept as "memberDept", memberState as "memberState", post as "post", joinDate as "joinDate", resignDate as "resignDate", remainExtraLeave as "remainExtraLeave", onOrderExtraLeave as "onOrderExtraLeave", noticeMembers as "noticeMembers", usedMarriageDay as "usedMarriageDay", appliedMarriageDay as "appliedMarriageDay", chargeMember as "chargeMember", firstMarriage as "firstMarriage" from vm_cap_hkMemberLeaveInfo;

-- statementId: getHKMembersLeaveDetailByMainId.select
-- lookupStatementId: getHKMembersLeaveDetailByMainId.select
-- source: hr_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id as "id", formmain_id as "formmainId", year as "year", annualLeaveStart as "annualLeaveStart", annualLeaveEnd as "annualLeaveEnd", annualLeaveDays as "annualLeaveDays", usedAnnualLeaveDays as "usedAnnualLeaveDays", remainAnnualLeaveDays as "remainAnnualLeaveDays", onOrderAnnualLeaveDays as "onOrderAnnualLeaveDays" from vm_cap_hkMemberLeaveInfo_son where formmain_id = 'VALUE_001' order by year desc;

-- statementId: getTodayHKLeaveApply.select
-- lookupStatementId: getTodayHKLeaveApply.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {}
select t.id, t."applyUser", t."leaveStartDate", t."leaveStartHalfDay", t."leaveEndDate", t."leaveEndHalfDay", t."type", t."recordSign" from ( SELECT q.id, q.applyUser as "applyUser", trunc(q.leaveStartDate) AS "leaveStartDate", util_common.getEnumShowById(q.leaveStartHalfDay) AS "leaveStartHalfDay", trunc(q.leaveEndDate) AS "leaveEndDate", util_common.getEnumShowById(q.leaveEndHalfDay) AS "leaveEndHalfDay", util_common.getEnumShowById(q.leaveType) AS "type", q.recordsign AS "recordSign" FROM vm_cap_hkLeaveRecord q left join vm_wf_hkleavebackapply qk on qk.leaveFlowSerialNo = q.recordSign WHERE q.recordState = util_common.getEnumIdByRefName('请假记录状态', '已请假') and (qk.state is null or qk.state = 0) UNION ALL SELECT id, applyUser as "applyUser", trunc(newLeaveStartDate) AS "leaveStartDate", util_common.getEnumShowById(newLeaveStartHalfDay) AS "leaveStartHalfDay", trunc(newLeaveEndDate) AS "leaveEndDate", util_common.getEnumShowById(newLeaveEndHalfDay) AS "leaveEndHalfDay", util_common.getEnumShowById(leaveType) AS "type", recordsign AS "recordSign" FROM vm_cap_hkLeaveRecord_son where leaveBackType = util_common.getEnumIdByRefName('销假类型', '部分销假') ) t where 1=1 and (t."leaveStartDate" <= sysdate and t."leaveEndDate" >= sysdate - 1 );

-- statementId: getTodayHKLeaveApplyUnfinished.select
-- lookupStatementId: getTodayHKLeaveApplyUnfinished.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "finishedFlowSign": "RAW_VALUE"
-- }
select t."applyUser", t."leaveStartDate", t."leaveStartHalfDay", t."leaveEndDate", t."leaveEndHalfDay", t."type" from ( select applyUser as "applyUser", leaveStartDate as "leaveStartDate", util_common.getEnumShowById(leaveStartHalfDay) as "leaveStartHalfDay", leaveEndDate as "leaveEndDate", util_common.getEnumShowById(leaveEndHalfDay) as "leaveEndHalfDay", finishedflag as "finishedflag", serialNo as "serialNo", util_common.getEnumShowById(leaveType) AS "type" from vm_wf_hkLeaveApply where state = 1 and finishedflag = 0 UNION ALL select applyUser as "userId", newLeaveStartDate as "leaveStartDate", util_common.getEnumShowById(newLeaveStartHalfDay) as "leaveStartHalfDay", newLeaveEndDate as "leaveEndDate", util_common.getEnumShowById(newLeaveEndHalfDay) as "leaveEndHalfDay", finishedflag as "finishedflag", leaveFlowSerialNo as "serialNo", util_common.getEnumShowById(leaveType) AS "type" from vm_wf_hkleavebackapply where state = 1 and finishedflag = 0 and leaveBackType = util_common.getEnumIdByRefName('销假类型', '部分销假') ) t where 1=1 and t."serialNo" not in (RAW_VALUE) and (t."leaveStartDate" <= sysdate and t."leaveEndDate" >= sysdate - 1 );

-- statementId: getTodayHKEvectionApply.select
-- lookupStatementId: getTodayHKEvectionApply.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {}
SELECT id, evectionNo as "evectionNo", evectionMember as "applyUser", evectionRetinues as "evectionRetinues", trunc(startDate) AS "leaveStartDate", trunc(endDate) AS "leaveEndDate", evectionExplain AS "evectionExplain", destination AS "destination", applyStatus AS "applyStatus" FROM vm_cap_evectionrecord q WHERE (startDate <= sysdate and endDate >= sysdate - 1 );

-- statementId: getTodayHKEvectionApplyUnfinished.select
-- lookupStatementId: getTodayHKEvectionApplyUnfinished.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "finishedFlowSign": "RAW_VALUE"
-- }
SELECT id, evectionMember as "applyUser", evectionRetinues as "evectionRetinues", trunc(startDate) AS "leaveStartDate", trunc(endDate) AS "leaveEndDate", evectionExplain AS "evectionExplain", destination AS "destination", applyStatus AS "applyStatus" from vm_cap_wf_evectionhk where 1=1 and serialNo not in (RAW_VALUE) and (startDate <= sysdate and endDate >= sysdate - 1 );

-- statementId: getHKhrReceivers.select
-- lookupStatementId: getHKhrReceivers.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {}
select EXT_ATTR_2 from org_member where id in ( select OBJECTIVE0_id from org_relationship where source_id = (select id from org_team where id = -3861360978288357917) and type = 'Team_Member' );

-- statementId: addHKMembersLeaveDetailInfo.insert
-- lookupStatementId: addHKMembersLeaveDetailInfo.insert
-- source: hr_sqlmap.xml
-- type: insert
-- params: {
--   "formmainId": 1001,
--   "year": "VALUE_001",
--   "annualLeaveStart": "VALUE_001",
--   "annualLeaveEnd": "VALUE_001",
--   "annualLeaveDays": "VALUE_001",
--   "usedAnnualLeaveDays": "VALUE_001",
--   "remainAnnualLeaveDays": "VALUE_001",
--   "onOrderAnnualLeaveDays": "VALUE_001",
--   "preYear": "VALUE_001"
-- }
insert into vm_cap_hkMemberLeaveInfo_son ( id, formmain_id, sort, year, annualLeaveStart, annualLeaveEnd, annualLeaveDays, usedAnnualLeaveDays, remainAnnualLeaveDays, onOrderAnnualLeaveDays, preYear ) values( util_common.getAbsID, 1001, -'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001' );

-- statementId: selectHKMembersFromOrgMember.select
-- lookupStatementId: selectHKMembersFromOrgMember.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {}
select id as "id", 1 as "state", -6760911671874597139 as "start_member_id", sysdate as "start_date", 0 as "approve_member_id", sysdate as "approve_date", 0 as "finishedflag", 0 as "ratifyflag", 0 as "ratify_member_id", null as "ratify_date", 0 as "sort", id as "memberId", util_user.getDeptIdByMemId(id) as "memberDept", -3531013148299411114 as "memberState", '' as "post", create_time as "joinDate", null as "resignDate", 0 as "remainExtraLeave", 0 as "onOrderExtraLeave", null as "noticeMembers", 0 as "chargeMember", null as "firstMarriage", 0 as "usedMarriageDay", 0 as "appliedMarriageDay" from org_member m where org_Account_id = -2948740806339441327 and is_internal = 1 AND is_virtual = 0 AND is_enable = 1 AND is_deleted = 0 and is_admin = 0 and type != 2 and not exists(select 1 from vm_cap_hkMemberLeaveInfo l where l.memberId = m.id);

-- statementId: addHKMembersFromOrgMember.insert
-- lookupStatementId: addHKMembersFromOrgMember.insert
-- source: hr_sqlmap.xml
-- type: insert
-- params: {
--   "id": 1001,
--   "memberId": 1001,
--   "memberDept": "VALUE_001",
--   "post": "VALUE_001",
--   "joinDate": "2026-05-14",
--   "resignDate": "2026-05-14",
--   "remainExtraLeave": "VALUE_001",
--   "onOrderExtraLeave": "VALUE_001",
--   "noticeMembers": "VALUE_001",
--   "chargeMember": "VALUE_001",
--   "firstMarriage": "VALUE_001",
--   "usedMarriageDay": "VALUE_001",
--   "appliedMarriageDay": "VALUE_001"
-- }
insert into vm_cap_hkMemberLeaveInfo ( id, state, start_member_id, start_date, approve_member_id, approve_date, finishedflag, ratifyflag, ratify_member_id, ratify_date, sort, writer, writeDate, memberId, memberDept, memberState, post, joinDate, resignDate, remainExtraLeave, onOrderExtraLeave, noticeMembers, chargeMember, firstMarriage, usedMarriageDay, appliedMarriageDay ) values ( 1001, 1, -6760911671874597139, SYSDATE, 0, SYSDATE, 0, 0, 0, null, 0, '-6760911671874597139', sysdate, 1001, 'VALUE_001', '7369887914205400284', 'VALUE_001', '2026-05-14', '2026-05-14', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001' );

-- statementId: getNoChargerMembers.select
-- lookupStatementId: getNoChargerMembers.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {}
select memberId as "memberId", memberDept as "memberDept" from vm_cap_hkMemberLeaveInfo where memberId not in (select memberId from vm_cap_chargeMemberRelation);

-- statementId: addChargeMemberRelation.insert
-- lookupStatementId: addChargeMemberRelation.insert
-- source: hr_sqlmap.xml
-- type: insert
-- params: {
--   "id": 1001,
--   "applyUser": "VALUE_001",
--   "applyDept": "VALUE_001",
--   "applyDate": "2026-05-14",
--   "memberId": 1001,
--   "memberDept": "VALUE_001",
--   "chargeMember": "VALUE_001"
-- }
insert into vm_cap_chargeMemberRelation ( id, state, start_member_id, start_date, approve_member_id, approve_date, finishedflag, ratifyflag, ratify_member_id, ratify_date, sort, applyUser, applyDept, applyDate, memberId, memberDept, chargeMember ) values ( 1001, 1, -6760911671874597139, SYSDATE, 0, SYSDATE, 0, 0, 0, null, 0, 'VALUE_001', 'VALUE_001', '2026-05-14', 1001, 'VALUE_001', 'VALUE_001' );

-- statementId: getSenderEmailByPostCode.select
-- lookupStatementId: getSenderEmailByPostCode.select
-- source: hr_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select ext_attr_2 from org_member where org_post_id = (select id from org_post where code = 'VALUE_001');

-- statementId: updateHKLeaveInfoChargeMember.update
-- lookupStatementId: updateHKLeaveInfoChargeMember.update
-- source: hr_sqlmap.xml
-- type: update
-- params: {
--   "chargeMember": "VALUE_001",
--   "memberId": 1001
-- }
update vm_cap_hkMemberLeaveInfo set chargeMember = 'VALUE_001' where memberId = 1001;

-- statementId: getDeptManagerByDeptIdHr.select
-- lookupStatementId: getDeptManagerByDeptIdHr.select
-- source: hr_sqlmap.xml
-- type: select
-- params: "VALUE_001"
SELECT SOURCE_ID FROM ORG_RELATIONSHIP RL WHERE RL.OBJECTIVE0_ID='VALUE_001' AND RL.TYPE = 'Member_Role' AND RL.OBJECTIVE1_ID IN (SELECT ID FROM ORG_ROLE R WHERE R.NAME = '部门经理');

-- statementId: getUnfinishedReturnLeaveFlowByUserId.select
-- lookupStatementId: getUnfinishedReturnLeaveFlowByUserId.select
-- source: hr_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select field0001 as "leaveFlowNo", field0008 as "leaveDays", field0009 as "leaveStartDate", field0010 as "leaveStartMorN", field0011 as "leaveEndDate", field0012 as "leaveEndMorN", field0013 as "leaveRtnType", field0015 as "newLeaveStartDate", field0016 as "newLeaveStartMorN", field0017 as "newLeaveEndDate", field0018 as "newLeaveEndMorN", field0022 as "newLeaveDays", field0030 as "returnDays", field0036 as "preLeaveYear", field0037 as "currentLeaveYear", field0038 as "nextLeaveYear", field0039 as "preYearRtnDays", field0040 as "currentYearRtnDays", field0041 as "nextYearRtnDays" from formmain_2163 where id in (select form_recordId from col_summary where templete_id = -7111560710701037197 and start_member_id = 'VALUE_001' and state = 0);

-- statementId: getUnfinishedReturnLeaveFlowByUserIdHK.select
-- lookupStatementId: getUnfinishedReturnLeaveFlowByUserIdHK.select
-- source: hr_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select serialNo as "leaveFlowNo", leaveDays as "leaveDays", leaveStartDate as "leaveStartDate", leaveStartHalfDay as "leaveStartMorN", leaveEndDate as "leaveEndDate", leaveEndHalfDay as "leaveEndMorN", leaveBackType as "leaveRtnType", newLeaveStartDate as "newLeaveStartDate", newLeaveStartHalfDay as "newLeaveStartMorN", newLeaveEndDate as "newLeaveEndDate", newLeaveEndHalfDay as "newLeaveEndMorN", newLeaveDay as "newLeaveDays", leaveBackDays as "returnDays", preYear as "preLeaveYear", year as "currentLeaveYear", nextYear as "nextLeaveYear", preYearDaysCount as "preYearRtnDays", currentYearDaysCount as "currentYearRtnDays", nextYearDaysCount as "nextYearRtnDays" from vm_wf_hkLeaveBackApply where id in (select form_recordId from col_summary where templete_id = -771164294647560130 and start_member_id = 'VALUE_001' and state = 0);

-- statementId: memberkeyinfo.select
-- lookupStatementId: memberkeyinfo.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "kmCode": "CODE_001",
--   "hrCode": "CODE_001",
--   "loginName": "NAME_001"
-- }
select to_char(f.memberId) memberId, f.kmCode, f.hrCode, f.loginName from vm_basememberinfo f where f.memberState = '在职' AND kmCode = 'CODE_001' AND hrCode = 'CODE_001' AND loginName = 'NAME_001';

-- statementId: updateInvestManagers.update
-- lookupStatementId: updateInvestManagers.update
-- source: hr_sqlmap.xml
-- type: update
-- params: "VALUE_001"
update formmain_2161 set field0080 = (select (listagg(c.mainmember || ',' || c.submember, ',') within group(order by c.submember)) as a from VM_DEPTPOST c where c.busimodel = '4053677126668929503' and c.questname in ('公司投资决策委员会', '固收投资决策委员会', '海外权益投资决策委员会', '量化投资决策委员会', '权益投资决策委员会', '社保养老金投资决策委员会', '衍生品投资决策委员会')) where id = 'VALUE_001';

-- statementId: updateHrNoAndWorkPlace.update
-- lookupStatementId: updateHrNoAndWorkPlace.update
-- source: hr_sqlmap.xml
-- type: update
-- params: {
--   "workPlace": "VALUE_001",
--   "hrNo": "VALUE_001",
--   "memberId": 1001
-- }
update addressbook set ext_attr_3 = 'VALUE_001', ext_attr_6 = 'VALUE_001' where member_id = 1001;

-- statementId: copyLeaveFlowDays.update
-- lookupStatementId: copyLeaveFlowDays.update
-- source: hr_sqlmap.xml
-- type: update
-- params: "VALUE_001"
update FORMMAIN_2161 set field0034 = field0013, field0063 = field0053, field0064 = field0054, field0065 = field0055, field0066 = field0056, field0067 = field0057, field0068 = field0058, field0069 = field0059, field0070 = field0060, field0071 = field0061, field0072 = field0062 where id = 'VALUE_001';

-- statementId: getInvestPlanSendInfoById.select
-- lookupStatementId: getInvestPlanSendInfoById.select
-- source: hr_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id as "id", serialNo as "serialNo", writer as "writer", writeDept as "writeDept", writeDate as "writeDate", sendPlanName as "sendPlanName", taskDeclaration as "taskDeclaration", planYear as "planYear", planNo as "planNo" from vm_cap_investPlanSend where id = 'VALUE_001';

-- statementId: getSendMemberByPlanNo.select
-- lookupStatementId: getSendMemberByPlanNo.select
-- source: hr_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select main.id as "id", main.planName as "planName", main.planNo as "planNo", main.planYear as "planYear", main.synDate as "synDate", main.serialNo as "serialNo", main.planType as "planType", (select EXT_ATTR_6 from addressbook where member_id = son.memberName) as "hrNo", son.memberName as "memberName", son.isSeniorExecutive as "isSeniorExecutive", son.isDirector as "isDirector", son.isFundManager as "isFundManager" from vm_cap_investPlanInfo main left join vm_cap_investPlanInfo_son son on main.id = son.formmain_id where planNo = 'VALUE_001';

-- statementId: getSendInvestPlanMemberIdByPlanNo.select
-- lookupStatementId: getSendInvestPlanMemberIdByPlanNo.select
-- source: hr_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select memberName from vm_cap_wf_investPlanCollect t where t.planNo = 'VALUE_001';

-- statementId: getDoneInvestCollectByPlanNo.select
-- lookupStatementId: getDoneInvestCollectByPlanNo.select
-- source: hr_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select memberName as "memberName" from vm_cap_wf_investPlanCollect wf where planNo = 'VALUE_001' and 3 = (select state from col_summary where form_recordId = wf.id);

-- statementId: deleteInvestPlanSendSon.delete
-- lookupStatementId: deleteInvestPlanSendSon.delete
-- source: hr_sqlmap.xml
-- type: delete
-- params: "VALUE_001"
delete from vm_cap_investPlanSend_son where formmain_id = (select id from vm_cap_investPlanSend where planNo = 'VALUE_001');

-- statementId: insertInvestPlanSendSon.insert
-- lookupStatementId: insertInvestPlanSendSon.insert
-- source: hr_sqlmap.xml
-- type: insert
-- params: {
--   "planNo": "VALUE_001",
--   "deptId": 1001,
--   "unReplyMembers": "VALUE_001",
--   "replyMembers": "VALUE_001"
-- }
insert into vm_cap_investPlanSend_son( id, formmain_id, memberDept, unReplyMembers, replyMembers) values( util_common.getAbsID, (select id from vm_cap_investPlanSend where planNo = 'VALUE_001'), 1001, 'VALUE_001', 'VALUE_001' );

-- statementId: insertInvestPlanResultMain.insert
-- lookupStatementId: insertInvestPlanResultMain.insert
-- source: hr_sqlmap.xml
-- type: insert
-- params: {
--   "id": 1001,
--   "serialNo": "VALUE_001",
--   "planName": "NAME_001",
--   "planNo": "VALUE_001",
--   "sendDate": "2026-05-14"
-- }
insert into vm_cap_investPlanResult( id, state , start_member_id , start_date , approve_member_id , approve_date , finishedflag , ratifyflag , ratify_member_id , ratify_date , sort , modify_member_id , modify_date , serialNo, planName, planNo, sendDate) values( 1001, 1,-6760911671874597139,SYSDATE,0,SYSDATE,0,0,0,null,0,-6760911671874597139,SYSDATE, 'VALUE_001', 'NAME_001', 'VALUE_001', '2026-05-14' );

-- statementId: getInvestPlanResultByPlanNo.select
-- lookupStatementId: getInvestPlanResultByPlanNo.select
-- source: hr_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select serialNo as "serialNo", planName as "planName", planNo as "planNo", sendDate as "sendDate" from vm_cap_investPlanResult wf where planNo = 'VALUE_001';

-- statementId: insertPlanInfoMain.insert
-- lookupStatementId: insertPlanInfoMain.insert
-- source: hr_sqlmap.xml
-- type: insert
-- params: {
--   "id": 1001,
--   "planName": "NAME_001",
--   "planNo": "VALUE_001",
--   "planYear": "VALUE_001",
--   "synDate": "2026-05-14",
--   "serialNo": "VALUE_001",
--   "planType": "VALUE_001"
-- }
insert into vm_cap_investPlanInfo( id, state , start_member_id , start_date , approve_member_id , approve_date , finishedflag , ratifyflag , ratify_member_id , ratify_date , sort , modify_member_id , modify_date , planName, planNo, planYear, synDate, serialNo, planType) values( 1001, 1,-6760911671874597139,SYSDATE,0,SYSDATE,0,0,0,null,0,-6760911671874597139,SYSDATE, 'NAME_001', 'VALUE_001', 'VALUE_001', '2026-05-14', 'VALUE_001', 'VALUE_001' );

-- statementId: insertPlanInfoSon.insert
-- lookupStatementId: insertPlanInfoSon.insert
-- source: hr_sqlmap.xml
-- type: insert
-- params: {
--   "formmain_id": 1001,
--   "memberName": "NAME_001",
--   "isSeniorExecutive": "VALUE_001",
--   "isDirector": "VALUE_001",
--   "isFundManager": "VALUE_001"
-- }
insert into vm_cap_investPlanInfo_son( id, formmain_id, memberName, isSeniorExecutive, isDirector, isFundManager) values( util_common.getAbsID, 1001, 'NAME_001', 'VALUE_001', 'VALUE_001', 'VALUE_001' );

-- statementId: getInvestCollectInfo.select
-- lookupStatementId: getInvestCollectInfo.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "planNo": "VALUE_001",
--   "year": "VALUE_001"
-- }
select main.id as "id", main.serialNo as "serialNo", main.planName as "planName", main.planNo as "planNo", main.sendDate as "sendDate", main.planYear as "planYear", son.formmain_id as "formmainId", son.productName as "productName", son.memberName as "memberName", son.memberHrNo as "memberHrNo", son.productId as "productId", son.fundCode as "fundCode", son.productShortName as "productShortName", son.investProportion as "investProportion" from vm_cap_investPlanResult main left join vm_cap_investPlanResult_son son on main.id = son.formmain_id where 1 = 1 AND planNo = 'VALUE_001';

-- statementId: getUnfinishedInvestFlowByPlanNo.select
-- lookupStatementId: getUnfinishedInvestFlowByPlanNo.select
-- source: hr_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select memberName as "memberName" from vm_cap_wf_investPlanCollect wf where planNo = 'VALUE_001' and 0 = (select state from col_summary where form_recordId = wf.id);

-- statementId: getManagerFundIdByManagerId.select
-- lookupStatementId: getManagerFundIdByManagerId.select
-- source: hr_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select pirid from vm_fundproductinfo where id in (select formmain_id from vm_fundproductinfoson where fundmanagername = 'VALUE_001');

-- statementId: memberAddressBookInfo.select
-- lookupStatementId: memberAddressBookInfo.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {}
select to_char(f.member_id) memberId, f.ext_attr_4 state,f.ext_attr_6 hrCode from addressbook f where f.ext_attr_4 is not null;

-- statementId: getGatedReadRecord.select
-- lookupStatementId: getGatedReadRecord.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "gatedPlace": "VALUE_001",
--   "fileName": "NAME_001",
--   "fileCreateDate": "2026-05-14"
-- }
select readStatus as "readStatus", gatedPlace as "gatedPlace", fileName as "fileName", fileCreateDate as "fileCreateDate", fileReadDate as "fileReadDate" from vm_cap_gatedReadRecord t where t.gatedPlace = 'VALUE_001' and t.fileName = 'NAME_001' and t.fileCreateDate = '2026-05-14' and readStatus = -3841538853571705149;

-- statementId: addGatedReadRecord.insert
-- lookupStatementId: addGatedReadRecord.insert
-- source: hr_sqlmap.xml
-- type: insert
-- params: {
--   "id": 1001,
--   "readStatus": 1,
--   "gatedPlace": "VALUE_001",
--   "fileName": "NAME_001",
--   "fileCreateDate": "2026-05-14",
--   "fileReadDate": "2026-05-14"
-- }
insert into vm_cap_gatedReadRecord( id, state , start_member_id , start_date , approve_member_id , approve_date , finishedflag , ratifyflag , ratify_member_id , ratify_date , sort , modify_member_id , modify_date , readStatus, gatedPlace, fileName, fileCreateDate, fileReadDate) values( 1001, 1,-6760911671874597139,SYSDATE,0,SYSDATE,0,0,0,null,0,-6760911671874597139,SYSDATE, 1, 'VALUE_001', 'NAME_001', '2026-05-14', '2026-05-14' );

-- statementId: getOADimissionMembersId.select
-- lookupStatementId: getOADimissionMembersId.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {}
select member_id as "memberId" from addressbook where ext_attr_4 = '离职';

-- statementId: getGatedMemberRelation.select
-- lookupStatementId: getGatedMemberRelation.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {}
select ID, STATE, START_MEMBER_ID, START_DATE, APPROVE_MEMBER_ID, APPROVE_DATE, FINISHEDFLAG, RATIFYFLAG, RATIFY_MEMBER_ID, RATIFY_DATE, SORT, MODIFY_MEMBER_ID, MODIFY_DATE, useable as "useable", gatedPlace as "gatedPlace", memberId as "memberId", memberKMCode as "memberKMCode", gatedRecordKey as "gatedRecordKey", gatedRecordValue as "gatedRecordValue" from vm_cap_gatedMemberRelation where useable = -3841538853571705149;

-- statementId: updateGatedMemberRelation.update
-- lookupStatementId: updateGatedMemberRelation.update
-- source: hr_sqlmap.xml
-- type: update
-- params: {
--   "useable": "VALUE_001",
--   "gatedPlace": "VALUE_001",
--   "memberId": 1001
-- }
update vm_cap_gatedMemberRelation set useable = 'VALUE_001' where gatedPlace = 'VALUE_001' and memberId = 1001;

-- statementId: getAttendSpecialRule.select
-- lookupStatementId: getAttendSpecialRule.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {}
select ID, STATE, START_MEMBER_ID, START_DATE, APPROVE_MEMBER_ID, APPROVE_DATE, FINISHEDFLAG, RATIFYFLAG, RATIFY_MEMBER_ID, RATIFY_DATE, SORT, MODIFY_MEMBER_ID, MODIFY_DATE, memberId as "memberId", memberKMCode as "memberKMCode", memberDept as "memberDept", checkable as "checkable", checkInTime as "checkInTime", checkOutTime as "checkOutTime" from vm_cap_attendSpecialRule;

-- statementId: getOrgMemberInfoByChnName.select
-- lookupStatementId: getOrgMemberInfoByChnName.select
-- source: hr_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id as "id", name as "name", code as "code" from org_member where is_internal = 1 and is_loginable = 1 and is_virtual = 0 and is_admin = 0 and is_assigned = 1 and state = 1 and is_enable =1 and is_deleted = 0 and status = 1 and name = 'VALUE_001';

-- statementId: insertGatedMemberRelation.insert
-- lookupStatementId: insertGatedMemberRelation.insert
-- source: hr_sqlmap.xml
-- type: insert
-- params: {
--   "gatedPlace": "VALUE_001",
--   "memberId": 1001,
--   "id": 1001,
--   "useable": "VALUE_001",
--   "memberKMCode": "CODE_001",
--   "gatedRecordKey": "VALUE_001",
--   "gatedRecordValue": "VALUE_001"
-- }
merge into vm_cap_gatedMemberRelation a using (select 'VALUE_001' as gatedPlace, 1001 as memberId from dual) c on ( a.gatedPlace = c.gatedPlace and a.memberId=c.memberId) when not matched then insert ( ID, STATE, START_MEMBER_ID, START_DATE, APPROVE_MEMBER_ID, APPROVE_DATE, FINISHEDFLAG, RATIFYFLAG, RATIFY_MEMBER_ID, RATIFY_DATE, SORT, MODIFY_MEMBER_ID, MODIFY_DATE, useable, gatedPlace, memberId, memberKMCode, gatedRecordKey, gatedRecordValue ) VALUES( 1001, 1, -6760911671874597139, sysdate, 0, null, 1, 0, 0, null, 0, null, null, 'VALUE_001', 'VALUE_001', 1001, 'CODE_001', 'VALUE_001', 'VALUE_001' ) when matched then update set gatedRecordValue = 'VALUE_001';

-- statementId: getAttendanceCommonRule.select
-- lookupStatementId: getAttendanceCommonRule.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "year": "VALUE_001",
--   "orgAccountId": 1,
--   "weekDayName": "NAME_001"
-- }
select id as "id", org_account_id as "orgAccountId", am_work_begintime as "amWorkBeginTime", am_work_endtime as "amWorkEndTime", pm_work_begintime as "pmWorkBeginTime", pm_work_endtime as "pmWorkEndTime", week_day_name as "weekDayName", is_work as "isWork", year as "year", update_time as "updateTime" from WORKTIME_CURRENCY where year = 'VALUE_001' and org_account_id = 1 and week_day_name = 'NAME_001';

-- statementId: insertGatedRecord.insert
-- lookupStatementId: insertGatedRecord.insert
-- source: hr_sqlmap.xml
-- type: insert
-- params: {
--   "id": 1001,
--   "memberId": 1001,
--   "gatedPlace": "VALUE_001",
--   "gatedDate": "2026-05-14",
--   "memberKMCode": "CODE_001",
--   "gatedInSignType": "VALUE_001",
--   "gatedOutSignType": "VALUE_001",
--   "gatedInDate": "2026-05-14",
--   "gatedOutDate": "2026-05-14",
--   "gatedInResult": "VALUE_001",
--   "gatedOutResult": "VALUE_001"
-- }
insert into vm_cap_gatedRecord( ID, STATE, START_MEMBER_ID, START_DATE, APPROVE_MEMBER_ID, APPROVE_DATE, FINISHEDFLAG, RATIFYFLAG, RATIFY_MEMBER_ID, RATIFY_DATE, SORT, MODIFY_MEMBER_ID, MODIFY_DATE, memberId, gatedPlace, gatedDate, memberKMCode, gatedInSignType, gatedOutSignType, gatedInDate, gatedOutDate, gatedInResult, gatedOutResult ) VALUES( 1001, 1, -6760911671874597139, sysdate, 0, null, 1, 0, 0, null, 0, null, null, 1001, 'VALUE_001', '2026-05-14', 'CODE_001', 'VALUE_001', 'VALUE_001', '2026-05-14', '2026-05-14', 'VALUE_001', 'VALUE_001' );

-- statementId: getGatedRecordByMemberAndDate.select
-- lookupStatementId: getGatedRecordByMemberAndDate.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "memberId": 1001,
--   "gatedDate": "2026-05-14"
-- }
select id as "id", memberId as "memberId", gatedPlace as "gatedPlace", cast(gatedDate as Date) as "gatedDate", memberKMCode as "memberKMCode", gatedInSignType as "gatedInSignType", gatedOutSignType as "gatedOutSignType", to_char(gatedInDate,'yyyy-mm-dd HH24:mi:ss') as "gatedInDate", to_char(gatedOutDate,'yyyy-mm-dd HH24:mi:ss') as "gatedOutDate", gatedInResult as "gatedInResult", gatedOutResult as "gatedOutResult" from vm_cap_gatedRecord where memberId = 1001 and to_char(gatedDate,'yyyy-mm-dd') = to_char('2026-05-14','yyyy-mm-dd');

-- statementId: getGatedRecordByDate.select
-- lookupStatementId: getGatedRecordByDate.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "gateDate": "2026-05-14"
-- }
select id as "id", memberId as "memberId", gatedPlace as "gatedPlace", cast(gatedDate as Date) as "gatedDate", memberKMCode as "memberKMCode", gatedInSignType as "gatedInSignType", gatedOutSignType as "gatedOutSignType", to_char(gatedInDate,'yyyy-mm-dd hh24:mi:ss') as "gatedInDate", to_char(gatedOutDate,'yyyy-mm-dd hh24:mi:ss') as "gatedOutDate", gatedInResult as "gatedInResult", gatedOutResult as "gatedOutResult" from vm_cap_gatedRecord where to_char(gatedDate,'yyyy-mm-dd') = to_char('2026-05-14','yyyy-mm-dd');

-- statementId: updateGatedRecord.update
-- lookupStatementId: updateGatedRecord.update
-- source: hr_sqlmap.xml
-- type: update
-- params: {
--   "gatedInSignType": "VALUE_001",
--   "gatedOutSignType": "VALUE_001",
--   "gatedInDate": "2026-05-14",
--   "gatedOutDate": "2026-05-14",
--   "gatedInResult": "VALUE_001",
--   "gatedOutResult": "VALUE_001",
--   "id": 1001
-- }
update vm_cap_gatedRecord set id = id ,gatedInSignType = 'VALUE_001' ,gatedOutSignType = 'VALUE_001' ,gatedInDate = '2026-05-14' ,gatedOutDate = '2026-05-14' ,gatedInResult = 'VALUE_001' ,gatedOutResult = 'VALUE_001' where id = 1001;

-- statementId: getAttendRecordByDate.select
-- lookupStatementId: getAttendRecordByDate.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "gateDate": "2026-05-14"
-- }
select id as "id", memberId as "memberId", memberKMCode as "memberKMCode", cast(gatedDate as Date) as "gatedDate", createTime as "createTime", attendInDate as "gatedInDate", attendOutDate as "gatedOutDate", attendInResult as "attendInResult", attendOutResult as "attendOutResult" from vm_cap_attendRecord where to_char(gatedDate,'yyyy-mm-dd') = to_char('2026-05-14','yyyy-mm-dd');

-- statementId: updateAttendRecordByDate.update
-- lookupStatementId: updateAttendRecordByDate.update
-- source: hr_sqlmap.xml
-- type: update
-- params: {
--   "attendInDate": "2026-05-14",
--   "attendOutDate": "2026-05-14",
--   "attendInResult": "VALUE_001",
--   "attendOutResult": "VALUE_001",
--   "id": 1001
-- }
update vm_cap_attendRecord set id = id ,attendInDate = '2026-05-14' ,attendOutDate = '2026-05-14' ,attendInResult = 'VALUE_001' ,attendOutResult = 'VALUE_001' where id = 1001;

-- statementId: generateTodayAttendRecord.insert
-- lookupStatementId: generateTodayAttendRecord.insert
-- source: hr_sqlmap.xml
-- type: insert
-- params: {
--   "date": "2026-05-14"
-- }
insert into vm_cap_attendRecord( ID, STATE, START_MEMBER_ID, START_DATE, APPROVE_MEMBER_ID, APPROVE_DATE, FINISHEDFLAG, RATIFYFLAG, RATIFY_MEMBER_ID, RATIFY_DATE, SORT, MODIFY_MEMBER_ID, MODIFY_DATE, memberId, memberKMCode, gatedDate, createTime, attendInDate, attendOutDate, attendInResult, attendOutResult ) select util_common.getAbsID(), 1, -6760911671874597139, sysdate, 0, null, 1, 0, 0, null, 0, null, null, member_Id, util_user.getMemCodeByMemId(member_id), to_date(to_char('2026-05-14','yyyy-mm-dd'),'yyyy-mm-dd'), sysdate, null, null, -2560390805576728489, -2560390805576728489 from addressbook where ext_attr_4 != '离职';

-- statementId: getTodayAttendIds.select
-- lookupStatementId: getTodayAttendIds.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "date": "2026-05-14"
-- }
select id as "id" from vm_cap_attendRecord where to_char(gatedDate,'yyyy-mm-dd') = to_char('2026-05-14','yyyy-mm-dd');

-- statementId: updateUserBasicInfoByOrgMember.update
-- lookupStatementId: updateUserBasicInfoByOrgMember.update
-- source: hr_sqlmap.xml
-- type: update
-- params: {}
MERGE INTO formmain_2153 f USING ( SELECT o.id AS org_member_id, a.ext_attr_3 AS work_location, TO_CHAR(o.org_department_id) AS dept, a.ext_attr_4 AS status, o.code AS km_emp_no, a.ext_attr_6 AS hr_emp_no, o.ext_attr_1 AS phone, TO_CHAR(o.org_account_id) AS unit FROM org_member o JOIN addressbook a ON o.id = a.member_id WHERE a.ext_attr_3 IS NOT NULL OR o.org_department_id IS NOT NULL OR a.ext_attr_4 IS NOT NULL OR o.code IS NOT NULL OR a.ext_attr_6 IS NOT NULL OR o.ext_attr_1 IS NOT NULL OR o.org_account_id IS NOT NULL) src ON (f.field0001 = src.org_member_id) WHEN MATCHED THEN UPDATE SET f.field0002 = CASE WHEN f.field0002 IS NULL OR f.field0002 = 'null' THEN src.work_location ELSE f.field0002 END, f.field0014 = CASE WHEN f.field0014 IS NULL OR f.field0014 = 'null' THEN src.dept ELSE f.field0014 END, f.field0007 = CASE WHEN f.field0007 IS NULL OR f.field0007 = 'null' THEN src.status ELSE f.field0007 END, f.field0015 = CASE WHEN f.field0015 IS NULL OR f.field0015 = 'null' THEN src.km_emp_no ELSE f.field0015 END, f.field0016 = CASE WHEN f.field0016 IS NULL OR f.field0016 = 'null' THEN src.hr_emp_no ELSE f.field0016 END, f.field0034 = CASE WHEN f.field0034 IS NULL OR f.field0034 = 'null' THEN src.phone ELSE f.field0034 END, f.field0051 = CASE WHEN f.field0051 IS NULL OR f.field0051 = 'null' THEN src.unit ELSE f.field0051 END WHERE (f.field0002 IS NULL OR f.field0002 = 'null' OR f.field0014 IS NULL OR f.field0014 = 'null' OR f.field0007 IS NULL OR f.field0007 = 'null' OR f.field0015 IS NULL OR f.field0015 = 'null' OR f.field0016 IS NULL OR f.field0016 = 'null' OR f.field0034 IS NULL OR f.field0034 = 'null' OR f.field0051 IS NULL OR f.field0051 = 'null');

-- statementId: getHKMemberLeavePeriodInfo.select
-- lookupStatementId: getHKMemberLeavePeriodInfo.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "memberId": 1001,
--   "year": "VALUE_001"
-- }
select annualLeaveStart as "annualLeaveStart",annualLeaveEnd as "annualLeaveEnd" from vm_cap_hkMemberLeaveInfo_son where formmain_id = (select id from vm_cap_hkMemberLeaveInfo where memberId = 1001) and year = 'VALUE_001';

-- statementId: queryColSummaryMap.select
-- lookupStatementId: queryColSummaryMap.select
-- source: hr_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select c.member_id as "memberId" from ctp_affair c where c.state = 3 and IS_DELETE = 0 and c.object_id = 'VALUE_001';

-- statementId: updateInvestPlanSealStatus.update
-- lookupStatementId: updateInvestPlanSealStatus.update
-- source: hr_sqlmap.xml
-- type: update
-- params: {
--   "sealStatus": 1,
--   "year": "VALUE_001",
--   "memberCode": "CODE_001"
-- }
update vm_cap_investPlanInfo_son t set t.sealStatus = 1 where formmain_id in (select id from vm_cap_investPlanInfo where planYear = 'VALUE_001') and memberName = (select id from org_member where code = 'CODE_001');

-- statementId: getInvestMemberSealStatus.select
-- lookupStatementId: getInvestMemberSealStatus.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "planNo": "VALUE_001",
--   "memberId": 1001
-- }
select sealStatus from vm_cap_investPlanInfo_son t where t.formmain_id = (select id from vm_cap_investPlanInfo where planNo = 'VALUE_001') and t.memberName = 1001;

-- statementId: directorPushMqSelect.select
-- lookupStatementId: directorPushMqSelect.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "tenure": "VALUE_001"
-- }
select idNumber as "idNumber", education as "education", degree as "degree", position as "position", presentPostDesc as "presentPostDesc", util_common.getEnumValueById(gender) as "gender", util_common.getEnumValueById(post) as "post", util_common.getEnumValueById(orgId) as "orgId", name as "name", util_common.getEnumValueById(idType) as "idType", presviousPostDesc as "presviousPostDesc", to_char(dateOfAppoint, 'yyyy-MM-dd') as "dateOfAppoint", to_char(dateOfDepart, 'yyyy-MM-dd') as "dateOfDepart", curriculumVitae as "curriculumVitae", util_common.getEnumValueById(status) as "status", sortIndex as "sortIndex", nationality as "nationality", dispatchUnit as "dispatchUnit", specialty as "specialty", contactPhone as "contactPhone", to_char(createTime, 'yyyy-MM-dd HH:mm:ss') as "createTime", to_char(updateTime, 'yyyy-MM-dd HH:mm:ss') as "updateTime" from VM_DIRECTORS_PUSH_MQ where status = '-2214726931032093630' or status = '1714373041428644393' and ADD_MONTHS(dateOfDepart, 'VALUE_001') >= SYSDATE order by util_common.getEnumValueById(status) asc,sortIndex asc,util_common.getEnumValueById(post) asc;

-- statementId: findExercisePlanInfo.select
-- lookupStatementId: findExercisePlanInfo.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "batchNo": "VALUE_001"
-- }
select id as "id", batchNo as "batchNo" from vm_cap_exercisePlan where 1 = 1 AND batchNo = 'VALUE_001';

-- statementId: selectExercisePlanInfo.select
-- lookupStatementId: selectExercisePlanInfo.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "batchNo": "VALUE_001",
--   "memberName": "NAME_001",
--   "exerciseName": "NAME_001",
--   "attrNum": "VALUE_001",
--   "attrProportion": "VALUE_001"
-- }
select id from vm_cap_exercisePlan_son where 1=1 AND formmain_id = (select id from vm_cap_exercisePlan where batchNo = 'VALUE_001') AND memberName = 'NAME_001' AND exerciseName = 'NAME_001' AND attrNum = 'VALUE_001' AND attrProportion = 'VALUE_001';

-- statementId: insertExercisePlanSon.insert
-- lookupStatementId: insertExercisePlanSon.insert
-- source: hr_sqlmap.xml
-- type: insert
-- params: {
--   "batchNo": "VALUE_001",
--   "memberName": "NAME_001",
--   "exerciseName": "NAME_001",
--   "attrNum": "VALUE_001",
--   "attrProportion": "VALUE_001"
-- }
insert into vm_cap_exercisePlan_son( id, formmain_id, memberName, exerciseName, attrNum, attrProportion) values( util_common.getAbsID, (select id from vm_cap_exercisePlan where batchNo = 'VALUE_001'), 'NAME_001', 'NAME_001', 'VALUE_001', 'VALUE_001' );

-- statementId: getExerciseCollectInfo.select
-- lookupStatementId: getExerciseCollectInfo.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "batchNo": "VALUE_001"
-- }
select main.id as "id", main.batchNo as "batchNo", main.batchName as "batchName", main.sendDate as "sendDate", son.formmain_id as "formmain_id", son.memberName as "memberName", son.memberHrNo as "memberHrNo", son.exerciseResult as "exerciseResult" from vm_cap_exercisePlanResult main left join vm_cap_exercisePlanResult_son son on main.id = son.formmain_id where 1 = 1 AND batchNo = 'VALUE_001';

-- statementId: getUnfinishedExerciseFlowByBatchNo.select
-- lookupStatementId: getUnfinishedExerciseFlowByBatchNo.select
-- source: hr_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select memberName as "memberName" from vm_cap_wf_exercisePlanCollect wf where batchNo = 'VALUE_001' and 0 = (select state from col_summary where form_recordId = wf.id);

-- statementId: getExercisePlanSendInfoById.select
-- lookupStatementId: getExercisePlanSendInfoById.select
-- source: hr_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id as "id", serialNo as "serialNo", writer as "writer", writeDept as "writeDept", writeDate as "writeDate", batchName as "batchName", taskDeclaration as "taskDeclaration", batchNo as "batchNo" from vm_cap_exercisePlanSend where id = 'VALUE_001';

-- statementId: getExerciseSendMemberByBatchNo.select
-- lookupStatementId: getExerciseSendMemberByBatchNo.select
-- source: hr_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select main.id as "id", main.batchName as "batchName", main.batchNo as "batchNo", main.synDate as "synDate", main.serialNo as "serialNo", (select EXT_ATTR_6 from addressbook where member_id = son.memberName) as "hrNo", son.memberName as "memberName", son.exerciseName as "exerciseName", son.attrNum as "attrNum", son.attrProportion as "attrProportion" from vm_cap_exercisePlan main left join vm_cap_exercisePlan_son son on main.id = son.formmain_id where batchNo = 'VALUE_001';

-- statementId: getExercisePlanSonList.select
-- lookupStatementId: getExercisePlanSonList.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "memberName": "NAME_001",
--   "batchNo": "VALUE_001"
-- }
select a.exerciseName as "exerciseName", a.attrNum as "attrNum", a.attrProportion as "attrProportion" from vm_cap_exercisePlan_son a left join vm_cap_exercisePlan b on b.id = a.formmain_id where 1 = 1 AND a.memberName = 'NAME_001' AND b.batchNo = 'VALUE_001';

-- statementId: getDoneExerciseCollectByBatchNo.select
-- lookupStatementId: getDoneExerciseCollectByBatchNo.select
-- source: hr_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select memberName as "memberName" from vm_cap_wf_exercisePlanCollect wf where batchNo = 'VALUE_001' and 3 = (select state from col_summary where form_recordId = wf.id);

-- statementId: deleteExercisePlanSendSon.delete
-- lookupStatementId: deleteExercisePlanSendSon.delete
-- source: hr_sqlmap.xml
-- type: delete
-- params: "VALUE_001"
delete from vm_cap_exercisePlanSend_son where formmain_id = (select id from vm_cap_exercisePlanSend where batchNo = 'VALUE_001');

-- statementId: insertExercisePlanSendSon.insert
-- lookupStatementId: insertExercisePlanSendSon.insert
-- source: hr_sqlmap.xml
-- type: insert
-- params: {
--   "batchNo": "VALUE_001",
--   "deptId": 1001,
--   "unReplyMembers": "VALUE_001",
--   "replyMembers": "VALUE_001"
-- }
insert into vm_cap_exercisePlanSend_son( id, formmain_id, memberDept, unReplyMembers, replyMembers) values( util_common.getAbsID, (select id from vm_cap_exercisePlanSend where batchNo = 'VALUE_001'), 1001, 'VALUE_001', 'VALUE_001' );

-- statementId: getSendExercisePlanMemberIdByBatchNo.select
-- lookupStatementId: getSendExercisePlanMemberIdByBatchNo.select
-- source: hr_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select memberName from vm_cap_wf_exercisePlanCollect t where t.batchNo = 'VALUE_001';

-- statementId: getExercisePlanResultByBatchNo.select
-- lookupStatementId: getExercisePlanResultByBatchNo.select
-- source: hr_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select serialNo as "serialNo", batchName as "batchName", batchNo as "batchNo", sendDate as "sendDate" from vm_cap_exercisePlanResult wf where batchNo = 'VALUE_001';

-- statementId: updateExerciseInfoPushStatus.update
-- lookupStatementId: updateExerciseInfoPushStatus.update
-- source: hr_sqlmap.xml
-- type: update
-- params: "VALUE_001"
update vm_cap_exercisePlan set pushStatus = '-3841538853571705149' where batchNo = 'VALUE_001';

-- statementId: delExercisePlanInfo.delete
-- lookupStatementId: delExercisePlanInfo.delete
-- source: hr_sqlmap.xml
-- type: delete
-- params: "VALUE_001"
delete from vm_cap_exercisePlan where batchNo = 'VALUE_001';

-- statementId: delExercisePlanSonInfo.delete
-- lookupStatementId: delExercisePlanSonInfo.delete
-- source: hr_sqlmap.xml
-- type: delete
-- params: "VALUE_001"
delete from vm_cap_exercisePlan_son where formmain_id = (select id from vm_cap_exercisePlan where batchNo = 'VALUE_001');

-- statementId: insertLeaveInfoToEveryDay
-- lookupStatementId: insertLeaveInfoToEveryDay
-- source: hr_sqlmap.xml
-- type: insert
-- params: {
--   "startDate": "2026-05-14",
--   "endDate": "2026-05-14"
-- }
MERGE INTO vm_DailyLeaveTravelRecord a USING ( SELECT t.applyUser, t.applyDept, t.leaveStartDate, t.leaveStartDateMA, t.leaveEndDate, t.leaveEndDateMA, t.leaveReason, t.leaveFlow, TO_DATE(TO_CHAR(t.toDate, 'YYYY-MM-DD'), 'YYYY-MM-DD') AS toDate, t.leaveSerialNum, -3841538853571705149 AS askForLeave FROM ( SELECT f.applyUser, f.applyDept, f.beginDate AS leaveStartDate, f.startTime AS leaveStartDateMA, f.endDate AS leaveEndDate, f.endTime AS leaveEndDateMA, f.reason AS leaveReason, f.flowName AS leaveFlow, f.beginDate + LEVEL - 1 AS toDate, f.serialNum AS leaveSerialNum FROM vm_userapplyforleave f WHERE f.recordStatus = 8705337157000773743 AND TO_CHAR(modify_date, 'YYYY-MM-DD') BETWEEN '2026-05-14' AND '2026-05-14' CONNECT BY id = PRIOR id AND LEVEL <= endDate - beginDate + 1 AND PRIOR sys_guid() IS NOT NULL ) t ) c ON (a.applyUser = c.applyUser AND a.toDate = c.toDate) WHEN NOT MATCHED THEN INSERT ( id, state, start_member_id, start_date, approve_member_id, approve_date, finishedflag, ratifyflag, ratify_member_id, applyUser, applyDept, toDate, askForLeave, leaveStartDate, leaveEndDate, leaveFlow, leaveReason, leaveStartDateMA, leaveEndDateMA, leaveSerialNum ) VALUES ( util_common.getAbsID, 1, -6760911671874597139, sysdate, -6760911671874597139, sysdate, 0, 0, -6760911671874597139, c.applyUser, c.applyDept, c.toDate, c.askForLeave, c.leaveStartDate, c.leaveEndDate, c.leaveFlow, c.leaveReason, c.leaveStartDateMA, c.leaveEndDateMA, c.leaveSerialNum ) WHEN MATCHED THEN update set a.askForLeave = c.askForLeave, a.leaveStartDate = c.leaveStartDate, a.leaveEndDate = c.leaveEndDate, a.leaveFlow = c.leaveFlow, a.leaveReason = c.leaveReason, a.leaveStartDateMA = c.leaveStartDateMA, a.leaveEndDateMA = c.leaveEndDateMA, a.leaveSerialNum = c.leaveSerialNum where a.askForLeave is null;

-- statementId: insertCancelToNewLeaveInfoToEveryDay
-- lookupStatementId: insertCancelToNewLeaveInfoToEveryDay
-- source: hr_sqlmap.xml
-- type: insert
-- params: {
--   "startDate": "2026-05-14",
--   "endDate": "2026-05-14"
-- }
MERGE INTO vm_DailyLeaveTravelRecord a USING ( select to_date(to_char(toDate, 'yyyy-mm-dd'), 'yyyy-mm-dd') toDate, applyUser, formmain_id, leaveStartDate, leaveStartDateMA, leaveEndDate, leaveEndDateMA , leaveReason, leaveFlow, leaveSerialNum, util_user.getDeptIdByMemId(applyUser) applyDept, '-3841538853571705149' askForLeave from (select distinct leaveStartDate+level-1 toDate, applyUser, formmain_id, leaveStartDate, leaveStartDateMA, leaveEndDate, leaveEndDateMA , leaveReason, leaveFlow, leaveSerialNum from (select distinct vm2.id, vm2.applyUser, vm1.formmain_id, vm1.leaveStartDate, vm1.leaveStartDateMA, vm1.leaveEndDate, vm1.leaveEndDateMA , vm1.leaveReason, vm1.leaveFlow, vm1.leaveSerialNum from vm_CancelLeaveDaySon vm1 left join VM_USERAPPLYFORLEAVE vm2 on vm1.formmain_id = vm2.id where vm1.leaveStartDate is not null and to_char(modify_date, 'yyyy-mm-dd') between '2026-05-14' and '2026-05-14' ) t connect by formmain_id=prior formmain_id and level <= leaveEndDate-leaveStartDate+1 and prior sys_guid() is not null) t ) c ON (a.applyUser = c.applyUser AND a.toDate = c.toDate) WHEN NOT MATCHED THEN INSERT ( id, state, start_member_id, start_date, approve_member_id, approve_date, finishedflag, ratifyflag, ratify_member_id, applyUser, applyDept, toDate, leaveStartDate, leaveStartDateMA, leaveEndDate, leaveEndDateMA , leaveReason, leaveFlow, leaveSerialNum, askForLeave ) VALUES ( util_common.getAbsID, 1, -6760911671874597139, sysdate, -6760911671874597139, sysdate, 0, 0, -6760911671874597139, c.applyUser, c.applyDept, c.toDate, c.leaveStartDate, c.leaveStartDateMA, c.leaveEndDate, c.leaveEndDateMA , c.leaveReason, c.leaveFlow, c.leaveSerialNum, c.askForLeave ) WHEN MATCHED THEN update set leaveStartDate = c.leaveStartDate, leaveStartDateMA = c.leaveStartDateMA, leaveEndDate = c.leaveEndDate, leaveEndDateMA = c.leaveEndDateMA , leaveReason = c.leaveReason, leaveFlow = c.leaveFlow, leaveSerialNum = c.leaveSerialNum, askForLeave = c.askForLeave where a.askForLeave is null;

-- statementId: insertCancelToNewLeaveInfoToEveryDayTableBindRelation
-- lookupStatementId: insertCancelToNewLeaveInfoToEveryDayTableBindRelation
-- source: hr_sqlmap.xml
-- type: insert
-- params: {
--   "startDate": "2026-05-14",
--   "endDate": "2026-05-14"
-- }
insert into form_relation_record (ID, FROM_MASTERDATA_ID, TO_MASTERDATA_ID, STATE, FIELD_NAME, FORM_TYPE, TYPE, MEMBER_ID, FROM_SUBDATA_ID, TO_SUBDATA_ID, FROM_FORM_ID, TO_FORM_ID ) select util_common.getAbsID, f.id, csy.id, '1', 'field0007', '1', '1', '-6760911671874597139', '0', '0', '6050223712139953374', '5474893650126653153' from vm_DailyLeaveTravelRecord f left join formmain_2163 f1 on f.leaveSerialNum = f1.field0001 left join col_summary csy on f1.id = csy.form_recordid where f1.id is not null and f.id is not null and csy.id is not null and to_char(f.start_date, 'yyyy-mm-dd') between '2026-05-14' and '2026-05-14' and not exists ( select 1 from form_relation_record fr where fr.field_name = 'field0007' and fr.to_masterdata_id = csy.id and fr.from_form_id = '6050223712139953374' and fr.from_masterdata_id = f.id and fr.to_form_id = '5474893650126653153' );

-- statementId: insertLeaveInfoToEveryDayTableBindRelation
-- lookupStatementId: insertLeaveInfoToEveryDayTableBindRelation
-- source: hr_sqlmap.xml
-- type: insert
-- params: {
--   "startDate": "2026-05-14",
--   "endDate": "2026-05-14"
-- }
insert into form_relation_record (ID, FROM_MASTERDATA_ID, TO_MASTERDATA_ID, STATE, FIELD_NAME, FORM_TYPE, TYPE, MEMBER_ID, FROM_SUBDATA_ID, TO_SUBDATA_ID, FROM_FORM_ID, TO_FORM_ID ) select util_common.getAbsID, f.id, csy.id, '1', 'field0007', '1', '1', '-6760911671874597139', '0', '0', '6050223712139953374', '6734388298582673815' from vm_DailyLeaveTravelRecord f left join formmain_2161 f1 on f.leaveSerialNum = f1.field0001 left join col_summary csy on f1.id = csy.form_recordid where f1.id is not null and f.id is not null and csy.id is not null and to_char(f.start_date, 'yyyy-mm-dd') between '2026-05-14' and '2026-05-14' and not exists ( select 1 from form_relation_record fr where fr.field_name = 'field0007' and fr.to_masterdata_id = csy.id and fr.from_form_id = '6050223712139953374' and fr.from_masterdata_id = f.id and fr.to_form_id = '6734388298582673815' );

-- statementId: insertTravelRecordToEveryDay
-- lookupStatementId: insertTravelRecordToEveryDay
-- source: hr_sqlmap.xml
-- type: insert
-- params: {
--   "applyStatus": 1,
--   "startDate": "2026-05-14",
--   "endDate": "2026-05-14"
-- }
MERGE INTO vm_DailyLeaveTravelRecord a USING ( SELECT DISTINCT to_date(to_char(f.travelBeginDate + level - 1, 'yyyy-mm-dd'), 'yyyy-mm-dd') AS toDate, travelMember AS applyUser, travelEndDate, travelBeginDate AS travelStartDate, flowName AS travelFlow, serialNum AS travelSerialNum, travelReason, util_user.getDeptIdByMemId(applyUser) AS applyDept, '-3841538853571705149' AS whetherToTravel FROM ( SELECT DISTINCT f.id, travelType, column_value travelMember, isHK, applyStatus, travelEndDate, travelBeginDate, applyUser, flowName, serialNum, travelReason FROM ( SELECT DISTINCT id, travelType, travelMember, isHK, applyStatus, travelEndDate, travelBeginDate, applyUser, flowName, serialNum, travelReason, ctravelMember FROM vm_evectionRecord WHERE (travelType = 1540751696090383749 OR travelType = 1786076025637390084) AND (applyStatus IS NULL OR applyStatus = 1) AND to_char(modify_date, 'yyyy-mm-dd') BETWEEN '2026-05-14' AND '2026-05-14' ) f, TABLE( SELECT util_common.split(f.travelMember || ',' || f.ctravelMember, ',') FROM dual ) ) f CONNECT BY PRIOR (id || travelMember) = (id || travelMember) AND PRIOR sys_guid() IS NOT NULL AND LEVEL <= travelEndDate - travelBeginDate + 1 ) c ON (a.applyUser = c.applyUser AND a.todate = c.todate ) WHEN NOT MATCHED THEN INSERT ( id, state, start_member_id, start_date, approve_member_id, approve_date, finishedflag, ratifyflag, ratify_member_id, applyUser, applyDept, toDate, whetherToTravel, travelStartDate, travelEndDate, travelFlow, travelReason, travelSerialNum ) VALUES ( util_common.getAbsID, 1, -6760911671874597139, sysdate, -6760911671874597139, sysdate, 0, 0, -6760911671874597139, c.applyUser, c.applyDept, c.todate, c.whetherToTravel, c.travelStartDate, c.travelEndDate, c.travelFlow, c.travelReason, c.travelSerialNum ) when matched then update set a.whetherToTravel = c.whetherToTravel, a.travelStartDate = c.travelStartDate, a.travelEndDate = c.travelEndDate, a.travelFlow = c.travelFlow, a.travelReason = c.travelReason, a.travelSerialNum = c.travelSerialNum where a.whetherToTravel is null;

-- statementId: insertTravelRecordToEveryDayTableBindRelation
-- lookupStatementId: insertTravelRecordToEveryDayTableBindRelation
-- source: hr_sqlmap.xml
-- type: insert
-- params: {
--   "startDate": "2026-05-14",
--   "endDate": "2026-05-14"
-- }
insert into form_relation_record (ID, FROM_MASTERDATA_ID, TO_MASTERDATA_ID, STATE, FIELD_NAME, FORM_TYPE, TYPE, MEMBER_ID, FROM_SUBDATA_ID, TO_SUBDATA_ID, FROM_FORM_ID, TO_FORM_ID ) select util_common.getAbsID, f.id, csy.id, '1', 'field0012', '1', '1', '-6760911671874597139', '0', '0', '6050223712139953374', '3803557390838549231' from vm_DailyLeaveTravelRecord f left join formmain_3376 f1 on f.travelSerialNum = f1.field0001 left join col_summary csy on f1.id = csy.form_recordid where f1.id is not null and f.id is not null and csy.id is not null and to_char(f.start_date, 'yyyy-mm-dd') between '2026-05-14' and '2026-05-14' and not exists ( select 1 from form_relation_record fr where fr.field_name = 'field0012' and fr.to_masterdata_id = csy.id and fr.from_form_id = '6050223712139953374' and fr.from_masterdata_id = f.id and fr.to_form_id = '3803557390838549231' );

-- statementId: insertSurveyRecordToEveryday
-- lookupStatementId: insertSurveyRecordToEveryday
-- source: hr_sqlmap.xml
-- type: insert
-- params: {
--   "startDate": "2026-05-14",
--   "endDate": "2026-05-14"
-- }
MERGE INTO vm_DailyLeaveTravelRecord a USING ( select to_date(to_char(toDate, 'yyyy-mm-dd'), 'yyyy-mm-dd') toDate, travelMember applyUser, travelEndDate surveyEndDate, travelBeginDate surveyStartDate, surveyReason, util_user.getDeptIdByMemId(applyUser) applyDept, '-3841538853571705149' whetherToSurvey, kmflg surveySerialNum from (select f.travelBeginDate+level-1 toDate, travelMember, travelEndDate, travelBeginDate, applyUser, travelReason surveyReason, kmflg from vm_evectionRecord f where f.travelType = -1018115749788758189 and to_char(modify_date, 'yyyy-mm-dd') between '2026-05-14' and '2026-05-14' connect by id=prior id and level <= travelEndDate-travelBeginDate+1 and prior sys_guid() is not null) t ) c ON (a.applyUser = c.applyUser AND a.toDate = c.toDate) WHEN NOT MATCHED THEN INSERT ( id, state, start_member_id, start_date, approve_member_id, approve_date, finishedflag, ratifyflag, ratify_member_id, applyUser, applyDept, toDate, surveyEndDate, surveyStartDate, surveyReason, whetherToSurvey, surveySerialNum ) VALUES ( util_common.getAbsID, 1, -6760911671874597139, sysdate, -6760911671874597139, sysdate, 0, 0, -6760911671874597139, c.applyUser, c.applyDept, c.toDate, c.surveyEndDate, c.surveyStartDate, c.surveyReason, c.whetherToSurvey, c.surveySerialNum ) WHEN MATCHED THEN update set surveyEndDate = c.surveyEndDate, surveyStartDate = c.surveyStartDate, surveyReason = c.surveyReason, whetherToSurvey = c.whetherToSurvey, surveySerialNum = c.surveySerialNum where a.whetherToSurvey is null;

-- statementId: eveyDayInfoCtpContent.insert
-- lookupStatementId: eveyDayInfoCtpContent.insert
-- source: hr_sqlmap.xml
-- type: insert
-- params: {
--   "startDate": "2026-05-14",
--   "endDate": "2026-05-14"
-- }
insert into ctp_content_all (ID, CREATE_ID, CREATE_DATE, MODIFY_ID, MODIFY_DATE, MODULE_TYPE, MODULE_ID, MODULE_TEMPLATE_ID, CONTENT_TYPE, CONTENT, CONTENT_DATA_ID, CONTENT_TEMPLATE_ID, TITLE, SORT) select util_common.getAbsID, '-6760911671874597139', sysdate, '-6760911671874597139', sysdate, 37, id, -9154120848050929403, '20', '', id, 6050223712139953374, '每日请假记录表', '0' from vm_DailyLeaveTravelRecord f where to_char(f.start_date, 'yyyy-mm-dd') between '2026-05-14' and '2026-05-14' and not exists (select 1 from ctp_content_all f1 where f1.CONTENT_TEMPLATE_ID = 6050223712139953374 and f1.module_template_id = -9154120848050929403 and f1.CONTENT_DATA_ID = f.id );

-- statementId: allDirectorInfo.select
-- lookupStatementId: allDirectorInfo.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {}
select to_char(org_id) "org_id", to_char(f.sortNumber) "sortNumber", f.record "record" from vm_company_directors_info f where f.status = -2214726931032093630;

-- statementId: stopHREntry.delete
-- lookupStatementId: stopHREntry.delete
-- source: hr_sqlmap.xml
-- type: delete
-- params: "VALUE_001"
delete from vm_basememberinfo f where f.memberId = (select field0053 from formmain_1660 where field0044 = 'VALUE_001');

-- statementId: codeLevelByMemberIdAndOrgId.select
-- lookupStatementId: codeLevelByMemberIdAndOrgId.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "memberId": 1001,
--   "orgId": 1001
-- }
select l.code from org_relationship os left join org_level l on l.id = os.objective2_id where os.type = 'Member_Post' and l.is_deleted = 0 and l.is_enable = 1 and os.source_id = 1001 and os.org_account_id = 1001 order by l.level_id;

-- statementId: memberIdByMemberCode
-- lookupStatementId: memberIdByMemberCode
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "departId": 1001,
--   "roleCode": "CODE_001"
-- }
select distinct rs.source_id from org_relationship rs where rs.objective0_id = 1001 and rs.objective1_id in (select id from org_role r where r.code = 'CODE_001');

-- statementId: findAllFGMemberLevels.select
-- lookupStatementId: findAllFGMemberLevels.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {}
select code, level_id from org_level f where f.is_deleted = 0 and status = 1 and is_enable = 1 and org_account_id = 97839079791739420;

-- statementId: findFGCEO.select
-- lookupStatementId: findFGCEO.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {}
select source_id from org_relationship os left join org_level l on l.id = os.objective2_id where os.type = 'Member_Post' and l.is_deleted = 0 and l.is_enable = 1 and os.org_account_id = 97839079791739420 and code = 'CEO';

-- statementId: findFGChairman.select
-- lookupStatementId: findFGChairman.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {}
select source_id from org_relationship os left join org_level l on l.id = os.objective2_id where os.type = 'Member_Post' and l.is_deleted = 0 and l.is_enable = 1 and os.org_account_id = 97839079791739420 and code = 'Chairman';

-- statementId: getColSummaryIdByFlowId.select
-- lookupStatementId: getColSummaryIdByFlowId.select
-- source: hr_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id from col_summary where form_recordid = 'VALUE_001' and case_id is not null;

-- statementId: getOperationIdByOperationName.select
-- lookupStatementId: getOperationIdByOperationName.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "viewName": "NAME_001",
--   "tableName": "NAME_001"
-- }
SELECT to_char(replace(wm_concat(t.name || '.' || t.value),',','_')) as id FROM (select '/QueryList/Query[@name="' || 'NAME_001' || '"]/ShowsThrough/Colum' XPATH, f.* from form_definition f where f.name = 'NAME_001') f, xmltable(f.XPATH passing xmltype(nvl(f.query_info, '<root/>')) columns "NAME" path '@name', "VALUE" path '@value') t;

-- statementId: queryApplyEvectionByDateRange.select
-- lookupStatementId: queryApplyEvectionByDateRange.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "userId": 1001,
--   "evectionStartDate": "2026-05-14",
--   "evectionEndDate": "2026-05-14"
-- }
select t."flowId", t."userId", t."travelerId", t."evectionStartDate", t."evectionEndDate", t."flowSerialNum", t."flowState", t."flowUrl" from ( select id as "flowId", field0008 as "userId", field0009 as "travelerId", field0010 as "evectionStartDate", field0011 as "evectionEndDate", field0001 as "flowSerialNum", finishedflag as "flowState", '' as "flowUrl" from FORMMAIN_3376 where state = 1 and finishedflag in (0,1) and field0041 = '1540751696090383749' union all select id as "flowId", userId as "userId", travelerId as "travelerId", evectionStartDate as "evectionStartDate", evectionEndDate as "evectionEndDate", flowSerialNum as "flowSerialNum", finishedflag as "flowState", flowUrl as "flowUrl" from VM_CAP4_EVATIONS where state = 1 and finishedflag in (0,1) union all select id as "flowId", evectionMember as "userId", evectionRetinues as "travelerId", startDate as "evectionStartDate", endDate as "evectionEndDate", serialNo as "flowSerialNum", finishedflag as "flowState", flowUrl as "flowUrl" from VM_CAP_WF_EVECTIONHK where state = 1 and finishedflag in (0,1) ) t where 1 =1 AND ( t."userId" = 1001 OR ',' || REPLACE( COALESCE( t."travelerId", '' ), ' ', '' ) || ',' LIKE '%,' || 1001 || ',%' ) AND t."evectionStartDate" <= to_date('2026-05-14','YYYY-MM-DD') AND t."evectionEndDate" >= to_date('2026-05-14','YYYY-MM-DD');

-- statementId: queryApplyChangeEvectionByDateRange.select
-- lookupStatementId: queryApplyChangeEvectionByDateRange.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "userId": 1001,
--   "evectionStartDate": "2026-05-14",
--   "evectionEndDate": "2026-05-14"
-- }
select t."flowId", t."userId", t."travelerId", t."evectionStartDate", t."evectionEndDate", t."flowSerialNum", t."flowState", t."flowUrl" from ( select id as "flowId", userId as "userId", travelerId as "travelerId", evectionStartDate as "evectionStartDate", evectionEndDate as "evectionEndDate", flowSerialNum as "flowSerialNum", finishedflag as "flowState", flowUrl as "flowUrl" from VM_CAP4_EVATIONS_CHANGE where state = 1 and finishedflag in (0,1) and evectionType = util_common.getEnumIdByRefName('出差变更类别', '变更') ) t where 1 =1 AND ( t."userId" = 1001 OR ',' || REPLACE( COALESCE( t."travelerId", '' ), ' ', '' ) || ',' LIKE '%,' || 1001 || ',%' ) AND t."evectionStartDate" <= to_date('2026-05-14','YYYY-MM-DD') AND t."evectionEndDate" >= to_date('2026-05-14','YYYY-MM-DD');

-- statementId: cancelEvectionBySerialNum.select
-- lookupStatementId: cancelEvectionBySerialNum.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "evectionSerialNum": "RAW_VALUE"
-- }
select t."flowId", t."evectionSerialNum" from ( select id as "flowId", state as "state", businessFlowId as "evectionSerialNum" from vm_hk_bussiness_cancel union all select id as "flowId", state as "state", businessFlowId as "evectionSerialNum" from VM_CAP4_EVATIONS_CHANGE ) t where 1 =1 and t."state" = 1 and t."evectionSerialNum" in (RAW_VALUE);

-- statementId: queryApplyLeaveByDateRange.select
-- lookupStatementId: queryApplyLeaveByDateRange.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "userId": 1001,
--   "startDateAMorPM": "2026-05-14",
--   "leaveStartDate": "2026-05-14",
--   "endDateAMorPM": "2026-05-14",
--   "leaveEndDate": "2026-05-14"
-- }
select t."flowId", t."userId", t."leaveStartDate", t."leaveStartDateAMorPM", t."leaveEndDate", t."leaveEndDateAMorPM", t."flowSerialNum", t."flowState", t."flowUrl" from ( select id as "flowId", writer as "userId", startDate as "leaveStartDate", startHalfDay as "leaveStartDateAMorPM", endDate as "leaveEndDate", endHalfDay as "leaveEndDateAMorPM", flowSerialNum as "flowSerialNum", finishedflag as "flowState", '' as "flowUrl" from VM_WF_PARENTALLEAVE where state = 1 and finishedflag in (0,1) UNION ALL SELECT id AS "flowId", writer AS "userId", startDate AS "leaveStartDate", startHalfDay AS "leaveStartDateAMorPM", endDate AS "leaveEndDate", endHalfDay AS "leaveEndDateAMorPM", flowSerialNum AS "flowSerialNum", finishedflag AS "flowState", flowUrl AS "flowUrl" FROM vm_wf_cap4_parentalleave union all select id as "flowId", applyUser as "userId", leaveStartDate as "leaveStartDate", to_char(leaveStartHalfDay) as "leaveStartDateAMorPM", leaveEndDate as "leaveEndDate", to_char(leaveEndHalfDay) as "leaveEndDateAMorPM", serialNo as "flowSerialNum", finishedflag as "flowState", flowUrl as "flowUrl" from VM_WF_HKLEAVEAPPLY where state = 1 and finishedflag in (0,1) ) t where 1 =1 AND t."userId" = 1001 AND ( CASE WHEN t."leaveStartDateAMorPM" = '770469099444389055' THEN TO_TIMESTAMP(to_char(t."leaveStartDate", 'yyyy-mm-dd') || ' 00:00:00', 'YYYY-MM-DD HH24:MI:SS') WHEN t."leaveStartDateAMorPM" = '3338464713283357441' THEN TO_TIMESTAMP(to_char(t."leaveStartDate", 'yyyy-mm-dd') || ' 12:00:00', 'YYYY-MM-DD HH24:MI:SS') ELSE NULL END ) <= ( CASE WHEN '2026-05-14' = '770469099444389055' THEN TO_TIMESTAMP('2026-05-14' || ' 00:00:00', 'YYYY-MM-DD HH24:MI:SS') WHEN '2026-05-14' = '3338464713283357441' THEN TO_TIMESTAMP('2026-05-14' || ' 12:00:00', 'YYYY-MM-DD HH24:MI:SS') ELSE NULL END ) AND ( CASE WHEN t."leaveEndDateAMorPM" = '770469099444389055' THEN TO_TIMESTAMP(to_char(t."leaveEndDate", 'yyyy-mm-dd') || ' 11:59:59', 'YYYY-MM-DD HH24:MI:SS') WHEN t."leaveEndDateAMorPM" = '3338464713283357441' THEN TO_TIMESTAMP(to_char(t."leaveEndDate", 'yyyy-mm-dd') || ' 23:59:59', 'YYYY-MM-DD HH24:MI:SS') ELSE NULL END ) >= ( CASE WHEN '2026-05-14' = '770469099444389055' THEN TO_TIMESTAMP('2026-05-14' || ' 11:59:59', 'YYYY-MM-DD HH24:MI:SS') WHEN '2026-05-14' = '3338464713283357441' THEN TO_TIMESTAMP('2026-05-14' || ' 23:59:59', 'YYYY-MM-DD HH24:MI:SS') ELSE NULL END );

-- statementId: queryApplyChangeLeaveByDateRange.select
-- lookupStatementId: queryApplyChangeLeaveByDateRange.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "userId": 1001,
--   "startDateAMorPM": "2026-05-14",
--   "leaveStartDate": "2026-05-14",
--   "endDateAMorPM": "2026-05-14",
--   "leaveEndDate": "2026-05-14"
-- }
select t."flowId", t."userId", t."leaveStartDate", t."leaveStartDateAMorPM", t."leaveEndDate", t."leaveEndDateAMorPM", t."flowSerialNum", t."flowState", t."flowUrl" from ( select id as "flowId", writer as "userId", newstartDate as "leaveStartDate", newstartHalfDay as "leaveStartDateAMorPM", newendDate as "leaveEndDate", newendHalfDay as "leaveEndDateAMorPM", flowSerialNum as "flowSerialNum", finishedflag as "flowState", '' as "flowUrl" from vm_wf_parentalleavecancel where state = 1 and finishedflag in (0,1) and cancelType = util_common.getEnumIdByRefName('销假类型', '部分销假') UNION ALL select id as "flowId", writer as "userId", newstartDate as "leaveStartDate", newstartHalfDay as "leaveStartDateAMorPM", newendDate as "leaveEndDate", newendHalfDay as "leaveEndDateAMorPM", flowSerialNum as "flowSerialNum", finishedflag as "flowState", flowUrl as "flowUrl" from vm_wf_cap4_parentalleavecancel where state = 1 and finishedflag in (0,1) and cancelType = util_common.getEnumIdByRefName('销假类型', '部分销假') union all select id as "flowId", applyUser as "userId", newLeaveStartDate as "leaveStartDate", to_char(newLeaveStartHalfDay) as "leaveStartDateAMorPM", newLeaveEndDate as "leaveEndDate", to_char(newLeaveEndHalfDay) as "leaveEndDateAMorPM", serialNo as "flowSerialNum", finishedflag as "flowState", flowUrl as "flowUrl" from vm_wf_hkleavebackapply where state = 1 and finishedflag in (0,1) and leaveBackType = util_common.getEnumIdByRefName('销假类型', '部分销假') ) t where 1 =1 AND t."userId" = 1001 AND ( CASE WHEN t."leaveStartDateAMorPM" = '770469099444389055' THEN TO_TIMESTAMP(to_char(t."leaveStartDate", 'yyyy-mm-dd') || ' 00:00:00', 'YYYY-MM-DD HH24:MI:SS') WHEN t."leaveStartDateAMorPM" = '3338464713283357441' THEN TO_TIMESTAMP(to_char(t."leaveStartDate", 'yyyy-mm-dd') || ' 12:00:00', 'YYYY-MM-DD HH24:MI:SS') ELSE NULL END ) <= ( CASE WHEN '2026-05-14' = '770469099444389055' THEN TO_TIMESTAMP('2026-05-14' || ' 00:00:00', 'YYYY-MM-DD HH24:MI:SS') WHEN '2026-05-14' = '3338464713283357441' THEN TO_TIMESTAMP('2026-05-14' || ' 12:00:00', 'YYYY-MM-DD HH24:MI:SS') ELSE NULL END ) AND ( CASE WHEN t."leaveEndDateAMorPM" = '770469099444389055' THEN TO_TIMESTAMP(to_char(t."leaveEndDate", 'yyyy-mm-dd') || ' 11:59:59', 'YYYY-MM-DD HH24:MI:SS') WHEN t."leaveEndDateAMorPM" = '3338464713283357441' THEN TO_TIMESTAMP(to_char(t."leaveEndDate", 'yyyy-mm-dd') || ' 23:59:59', 'YYYY-MM-DD HH24:MI:SS') ELSE NULL END ) >= ( CASE WHEN '2026-05-14' = '770469099444389055' THEN TO_TIMESTAMP('2026-05-14' || ' 11:59:59', 'YYYY-MM-DD HH24:MI:SS') WHEN '2026-05-14' = '3338464713283357441' THEN TO_TIMESTAMP('2026-05-14' || ' 23:59:59', 'YYYY-MM-DD HH24:MI:SS') ELSE NULL END );

-- statementId: cancelLeaveBySerialNum.select
-- lookupStatementId: cancelLeaveBySerialNum.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "leaveSerialNum": "RAW_VALUE"
-- }
select t."flowId", t."leaveSerialNum" from ( select id as "flowId", state as "state", businessFlowId as "leaveSerialNum" from vm_wf_parentalleavecancel union all select id as "flowId", state as "state", leaveFlowSerialNo as "leaveSerialNum" from vm_wf_hkleavebackapply ) t where 1 =1 and t."state" = 1 and t."leaveSerialNum" in (RAW_VALUE);

-- statementId: getMarriageBySingleMember.select
-- lookupStatementId: getMarriageBySingleMember.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {}
select id as "id", userId as "userId", firstMarriageDate as "firstMarriageDate", approvedMarriageDays as "approvedMarriageDays" from VM_MEMBER_MARRIAGE a where approvedMarriageDays > 0 and (pendingMarriageDays = 0 or pendingMarriageDays is null) and marriageStatus != util_common.getEnumIdByRefName('婚姻状况', '已婚');

-- statementId: deleteMarriageSonNullRecord.delete
-- lookupStatementId: deleteMarriageSonNullRecord.delete
-- source: hr_sqlmap.xml
-- type: delete
-- params: {
--   "formmain_id": 1001
-- }
delete from vm_memberMarriage_son where formmain_id = 1001 and (firstMarriageDate is null or approvedMarriageDays is null);

-- statementId: addMarriageSonRecord.insert
-- lookupStatementId: addMarriageSonRecord.insert
-- source: hr_sqlmap.xml
-- type: insert
-- params: {
--   "formmain_id": 1001,
--   "firstMarriageDate": "2026-05-14",
--   "approvedMarriageDays": "VALUE_001",
--   "updateTime": "2026-05-14"
-- }
insert into vm_memberMarriage_son( id, formmain_id, firstMarriageDate, approvedMarriageDays, updateTime) values( util_common.getAbsID, 1001, to_date('2026-05-14', 'YYYY-MM-DD'), 'VALUE_001', to_date('2026-05-14', 'YYYY-MM-DD hh24:mi:ss') );

-- statementId: updateMarriageData.update
-- lookupStatementId: updateMarriageData.update
-- source: hr_sqlmap.xml
-- type: update
-- params: {
--   "id": 1001
-- }
update VM_MEMBER_MARRIAGE set firstMarriageDate = null, approvedMarriageDays = 0 where id = 1001;

-- statementId: queryLeaveApplyByDate.select
-- lookupStatementId: queryLeaveApplyByDate.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "startDateAMorPM": "2026-05-14",
--   "leaveStartDate": "2026-05-14",
--   "endDateAMorPM": "2026-05-14",
--   "leaveEndDate": "2026-05-14",
--   "userId": 1001,
--   "deptCode": "CODE_001",
--   "lineCode": "CODE_001",
--   "companyCode": "CODE_001"
-- }
WITH converted_dates AS ( SELECT t."flowId", t."userId", t."leaveStartDate", t."leaveStartDateAMorPM", t."leaveEndDate", t."leaveEndDateAMorPM", t."flowSerialNum", t."flowState", t."leaveType", t."leaveSonType", t."flowUrl", CASE WHEN t."leaveStartDateAMorPM" = '770469099444389055' THEN TO_TIMESTAMP(TO_CHAR(t."leaveStartDate", 'yyyy-mm-dd') || ' 00:00:00', 'YYYY-MM-DD HH24:MI:SS') WHEN t."leaveStartDateAMorPM" = '3338464713283357441' THEN TO_TIMESTAMP(TO_CHAR(t."leaveStartDate", 'yyyy-mm-dd') || ' 12:00:00', 'YYYY-MM-DD HH24:MI:SS') ELSE NULL END AS leave_start_ts, CASE WHEN t."leaveEndDateAMorPM" = '770469099444389055' THEN TO_TIMESTAMP(TO_CHAR(t."leaveEndDate", 'yyyy-mm-dd') || ' 11:59:59', 'YYYY-MM-DD HH24:MI:SS') WHEN t."leaveEndDateAMorPM" = '3338464713283357441' THEN TO_TIMESTAMP(TO_CHAR(t."leaveEndDate", 'yyyy-mm-dd') || ' 23:59:59', 'YYYY-MM-DD HH24:MI:SS') ELSE NULL END AS leave_end_ts, CASE WHEN '2026-05-14' = '770469099444389055' THEN TO_TIMESTAMP('2026-05-14' || ' 00:00:00', 'YYYY-MM-DD HH24:MI:SS') WHEN '2026-05-14' = '3338464713283357441' THEN TO_TIMESTAMP('2026-05-14' || ' 12:00:00', 'YYYY-MM-DD HH24:MI:SS') ELSE NULL END AS request_start_ts, CASE WHEN '2026-05-14' = '770469099444389055' THEN TO_TIMESTAMP('2026-05-14' || ' 11:59:59', 'YYYY-MM-DD HH24:MI:SS') WHEN '2026-05-14' = '3338464713283357441' THEN TO_TIMESTAMP('2026-05-14' || ' 23:59:59', 'YYYY-MM-DD HH24:MI:SS') ELSE NULL END AS request_end_ts FROM ( SELECT id AS "flowId", writer AS "userId", startDate AS "leaveStartDate", startHalfDay AS "leaveStartDateAMorPM", endDate AS "leaveEndDate", endHalfDay AS "leaveEndDateAMorPM", flowSerialNum AS "flowSerialNum", finishedflag AS "flowState", util_common.getEnumValueById(to_char(leaveType)) AS "leaveType", util_common.getEnumValueById(to_char(leaveSonType)) AS "leaveSonType", '' AS "flowUrl" FROM VM_WF_PARENTALLEAVE WHERE state = 1 AND finishedflag IN (0, 1) UNION ALL SELECT id AS "flowId", writer AS "userId", startDate AS "leaveStartDate", startHalfDay AS "leaveStartDateAMorPM", endDate AS "leaveEndDate", endHalfDay AS "leaveEndDateAMorPM", flowSerialNum AS "flowSerialNum", finishedflag AS "flowState", util_common.getEnumValueById(to_char(leaveType)) AS "leaveType", util_common.getEnumValueById(to_char(leaveSonType)) AS "leaveSonType", flowUrl AS "flowUrl" FROM vm_wf_cap4_parentalleave UNION ALL SELECT id AS "flowId", applyUser AS "userId", leaveStartDate AS "leaveStartDate", TO_CHAR(leaveStartHalfDay) AS "leaveStartDateAMorPM", leaveEndDate AS "leaveEndDate", TO_CHAR(leaveEndHalfDay) AS "leaveEndDateAMorPM", serialNo AS "flowSerialNum", finishedflag AS "flowState", util_common.getEnumValueById(to_char(leaveType)) AS "leaveType", '' AS "leaveSonType", flowUrl AS "flowUrl" FROM VM_WF_HKLEAVEAPPLY WHERE state = 1 AND finishedflag IN (0, 1) ) t ) SELECT "flowId", "userId", "leaveStartDate", "leaveStartDateAMorPM", "leaveEndDate", "leaveEndDateAMorPM", "flowSerialNum", "flowState", "leaveType", "leaveSonType", "flowUrl" FROM converted_dates LEFT JOIN org_member m ON "userId" = m.id LEFT JOIN org_unit u ON u.id = m.org_department_id WHERE 1 = 1 AND "userId" = 1001 AND u.code = 'CODE_001' AND u.is_internal=1 AND u.is_enable=1 AND u.is_deleted=0 AND u.path LIKE (SELECT path FROM org_unit WHERE code = 'CODE_001' AND is_internal=1 AND is_enable=1 AND is_deleted=0 AND ROWNUM = 1) || '%' AND u.org_account_id = (SELECT id FROM org_unit WHERE code = 'CODE_001' AND is_internal=1 AND is_enable=1 AND is_deleted=0 AND ROWNUM = 1) AND ( (leave_start_ts >= request_start_ts AND leave_end_ts <= request_end_ts) OR (request_start_ts BETWEEN leave_start_ts AND leave_end_ts) OR (request_end_ts BETWEEN leave_start_ts AND leave_end_ts) ) order by "leaveStartDate";

-- statementId: queryLeaveApplyChangeByDate.select
-- lookupStatementId: queryLeaveApplyChangeByDate.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "startDateAMorPM": "2026-05-14",
--   "leaveStartDate": "2026-05-14",
--   "endDateAMorPM": "2026-05-14",
--   "leaveEndDate": "2026-05-14",
--   "userId": 1001,
--   "deptCode": "CODE_001",
--   "lineCode": "CODE_001",
--   "companyCode": "CODE_001"
-- }
WITH converted_dates AS ( SELECT t."flowId", t."userId", t."leaveStartDate", t."leaveStartDateAMorPM", t."leaveEndDate", t."leaveEndDateAMorPM", t."flowSerialNum", t."flowState", t."leaveType", t."leaveSonType", t."flowUrl", CASE WHEN t."leaveStartDateAMorPM" = '770469099444389055' THEN TO_TIMESTAMP(TO_CHAR(t."leaveStartDate", 'yyyy-mm-dd') || ' 00:00:00', 'YYYY-MM-DD HH24:MI:SS') WHEN t."leaveStartDateAMorPM" = '3338464713283357441' THEN TO_TIMESTAMP(TO_CHAR(t."leaveStartDate", 'yyyy-mm-dd') || ' 12:00:00', 'YYYY-MM-DD HH24:MI:SS') ELSE NULL END AS leave_start_ts, CASE WHEN t."leaveEndDateAMorPM" = '770469099444389055' THEN TO_TIMESTAMP(TO_CHAR(t."leaveEndDate", 'yyyy-mm-dd') || ' 11:59:59', 'YYYY-MM-DD HH24:MI:SS') WHEN t."leaveEndDateAMorPM" = '3338464713283357441' THEN TO_TIMESTAMP(TO_CHAR(t."leaveEndDate", 'yyyy-mm-dd') || ' 23:59:59', 'YYYY-MM-DD HH24:MI:SS') ELSE NULL END AS leave_end_ts, CASE WHEN '2026-05-14' = '770469099444389055' THEN TO_TIMESTAMP('2026-05-14' || ' 00:00:00', 'YYYY-MM-DD HH24:MI:SS') WHEN '2026-05-14' = '3338464713283357441' THEN TO_TIMESTAMP('2026-05-14' || ' 12:00:00', 'YYYY-MM-DD HH24:MI:SS') ELSE NULL END AS request_start_ts, CASE WHEN '2026-05-14' = '770469099444389055' THEN TO_TIMESTAMP('2026-05-14' || ' 11:59:59', 'YYYY-MM-DD HH24:MI:SS') WHEN '2026-05-14' = '3338464713283357441' THEN TO_TIMESTAMP('2026-05-14' || ' 23:59:59', 'YYYY-MM-DD HH24:MI:SS') ELSE NULL END AS request_end_ts FROM ( select id as "flowId", writer as "userId", newstartDate as "leaveStartDate", newstartHalfDay as "leaveStartDateAMorPM", newendDate as "leaveEndDate", newendHalfDay as "leaveEndDateAMorPM", flowSerialNum as "flowSerialNum", finishedflag as "flowState", util_common.getEnumValueById(to_char(leaveType)) AS "leaveType", '' AS "leaveSonType", '' as "flowUrl" from vm_wf_parentalleavecancel where state = 1 and finishedflag in (0,1) and cancelType = util_common.getEnumIdByRefName('销假类型', '部分销假') UNION ALL select id as "flowId", writer as "userId", newstartDate as "leaveStartDate", newstartHalfDay as "leaveStartDateAMorPM", newendDate as "leaveEndDate", newendHalfDay as "leaveEndDateAMorPM", flowSerialNum as "flowSerialNum", finishedflag as "flowState", util_common.getEnumValueById(to_char(leaveType)) AS "leaveType", util_common.getEnumValueById(to_char(leaveSonType)) AS "leaveSonType", flowUrl as "flowUrl" from vm_wf_cap4_parentalleavecancel where state = 1 and finishedflag in (0,1) and cancelType = util_common.getEnumIdByRefName('销假类型', '部分销假') UNION ALL select id as "flowId", applyUser as "userId", newLeaveStartDate as "leaveStartDate", to_char(newLeaveStartHalfDay) as "leaveStartDateAMorPM", newLeaveEndDate as "leaveEndDate", to_char(newLeaveEndHalfDay) as "leaveEndDateAMorPM", serialNo as "flowSerialNum", finishedflag as "flowState", util_common.getEnumValueById(to_char(leaveType)) AS "leaveType", '' AS "leaveSonType", flowUrl as "flowUrl" from vm_wf_hkleavebackapply where state = 1 and finishedflag in (0,1) and leaveBackType = util_common.getEnumIdByRefName('销假类型', '部分销假') ) t ) SELECT "flowId", "userId", "leaveStartDate", "leaveStartDateAMorPM", "leaveEndDate", "leaveEndDateAMorPM", "flowSerialNum", "flowState", "leaveType", "leaveSonType", "flowUrl" FROM converted_dates LEFT JOIN org_member m ON "userId" = m.id LEFT JOIN org_unit u ON u.id = m.org_department_id WHERE 1 = 1 AND "userId" = 1001 AND u.code = 'CODE_001' AND u.is_internal=1 AND u.is_enable=1 AND u.is_deleted=0 AND u.path LIKE (SELECT path FROM org_unit WHERE code = 'CODE_001' AND is_internal=1 AND is_enable=1 AND is_deleted=0 AND ROWNUM = 1) || '%' AND u.org_account_id = (SELECT id FROM org_unit WHERE code = 'CODE_001' AND is_internal=1 AND is_enable=1 AND is_deleted=0 AND ROWNUM = 1) AND ( (leave_start_ts >= request_start_ts AND leave_end_ts <= request_end_ts) OR (request_start_ts BETWEEN leave_start_ts AND leave_end_ts) OR (request_end_ts BETWEEN leave_start_ts AND leave_end_ts) ) order by "leaveStartDate";

-- statementId: cancelLeaveApplyBySerialNum.select
-- lookupStatementId: cancelLeaveApplyBySerialNum.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "leaveSerialNum": "RAW_VALUE"
-- }
select t."flowId", t."leaveSerialNum" from ( select id as "flowId", state as "state", businessFlowId as "leaveSerialNum" from vm_wf_parentalleavecancel union all select id as "flowId", state as "state", businessFlowId as "leaveSerialNum" from vm_wf_cap4_parentalleavecancel union all select id as "flowId", state as "state", leaveFlowSerialNo as "leaveSerialNum" from vm_wf_hkleavebackapply ) t where 1 =1 and t."state" = 1 and t."leaveSerialNum" in (RAW_VALUE);

-- statementId: queryAllStatusOfEvectionAndLeaveRec.select
-- lookupStatementId: queryAllStatusOfEvectionAndLeaveRec.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "writer": "VALUE_001",
--   "currentDate": "2026-05-14"
-- }
select id as "id", leaveStatus as "leaveStatus", isAmLeave as "isAmLeave", flowStatus as "flowStatus", isPmLeave as "isPmLeave", pmFlowStatus as "pmFlowStatus", evectionStatus as "evectionStatus", evectionFlowStatus as "evectionFlowStatus", surveyStatus as "surveyStatus", surveyFlowStatus as "surveyFlowStatus" from vm_wf_cap4_everyDayLeaveAndEvection where writer = 'VALUE_001' and currentDate = TO_DATE('2026-05-14', 'YYYY-MM-DD');

-- statementId: queryLeaveRecordIdByFlowSerialNum.select
-- lookupStatementId: queryLeaveRecordIdByFlowSerialNum.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "leaveFlowSerialNum": "VALUE_001",
--   "cancelLeaveFlowSerialNum": "VALUE_001"
-- }
select id as "id", leaveFlowSerialNum as "leaveFlowSerialNum", cancelLeaveFlowSerialNum as "cancelLeaveFlowSerialNum", pmLeaveFlowSerialNum as "pmLeaveFlowSerialNum", pmCancelLeaveFlowSerialNum as "pmCancelLeaveFlowSerialNum" from vm_wf_cap4_everyDayLeaveAndEvection where 1 = 1 AND ( leaveFlowSerialNum = 'VALUE_001' or pmLeaveFlowSerialNum = 'VALUE_001') AND ( cancelLeaveFlowSerialNum = 'VALUE_001' or pmCancelLeaveFlowSerialNum = 'VALUE_001');

-- statementId: updateEveryDayAMLeaveRecord.update
-- lookupStatementId: updateEveryDayAMLeaveRecord.update
-- source: hr_sqlmap.xml
-- type: update
-- params: {
--   "flowStatus": 1,
--   "isAmLeave": "VALUE_001",
--   "startDate": "2026-05-14",
--   "startHalfDay": "VALUE_001",
--   "endDate": "2026-05-14",
--   "endHalfDay": "VALUE_001",
--   "leaveRecord": "VALUE_001",
--   "flowUrl": "VALUE_001",
--   "leaveReason": "VALUE_001",
--   "leaveType": "VALUE_001",
--   "leaveSonType": "VALUE_001",
--   "leaveFlowSerialNum": "VALUE_001",
--   "cancelLeaveFlowSerialNum": "VALUE_001",
--   "writer": "VALUE_001",
--   "currentDate": "2026-05-14"
-- }
update vm_wf_cap4_everyDayLeaveAndEvection set flowStatus = 1 ,isAmLeave = 'VALUE_001' ,startDate = TO_DATE('2026-05-14', 'YYYY-MM-DD') ,startHalfDay = 'VALUE_001' ,endDate = TO_DATE('2026-05-14', 'YYYY-MM-DD') ,endHalfDay = 'VALUE_001' ,leaveRecord = 'VALUE_001' ,flowUrl = 'VALUE_001' ,leaveReason = 'VALUE_001' ,leaveType = 'VALUE_001' ,leaveSonType = 'VALUE_001' ,leaveFlowSerialNum = 'VALUE_001' ,cancelLeaveFlowSerialNum = 'VALUE_001' where writer = 'VALUE_001' and currentDate = TO_DATE('2026-05-14', 'YYYY-MM-DD');

-- statementId: updateEveryDayPMLeaveRecord.update
-- lookupStatementId: updateEveryDayPMLeaveRecord.update
-- source: hr_sqlmap.xml
-- type: update
-- params: {
--   "flowStatus": 1,
--   "isPmLeave": "VALUE_001",
--   "startDate": "2026-05-14",
--   "startHalfDay": "VALUE_001",
--   "endDate": "2026-05-14",
--   "endHalfDay": "VALUE_001",
--   "leaveRecord": "VALUE_001",
--   "flowUrl": "VALUE_001",
--   "leaveReason": "VALUE_001",
--   "leaveType": "VALUE_001",
--   "leaveSonType": "VALUE_001",
--   "leaveFlowSerialNum": "VALUE_001",
--   "cancelLeaveFlowSerialNum": "VALUE_001",
--   "writer": "VALUE_001",
--   "currentDate": "2026-05-14"
-- }
update vm_wf_cap4_everyDayLeaveAndEvection set pmFlowStatus = 1 ,isPmLeave = 'VALUE_001' ,pmStartDate = TO_DATE('2026-05-14', 'YYYY-MM-DD') ,pmStartHalfDay = 'VALUE_001' ,pmEndDate = TO_DATE('2026-05-14', 'YYYY-MM-DD') ,pmEndHalfDay = 'VALUE_001' ,pmLeaveRecord = 'VALUE_001' ,pmFlowUrl = 'VALUE_001' ,pmLeaveReason = 'VALUE_001' ,pmLeaveType = 'VALUE_001' ,pmLeaveSonType = 'VALUE_001' ,pmLeaveFlowSerialNum = 'VALUE_001' ,pmCancelLeaveFlowSerialNum = 'VALUE_001' where writer = 'VALUE_001' and currentDate = TO_DATE('2026-05-14', 'YYYY-MM-DD');

-- statementId: updateEveryDayLeaveStatus.update
-- lookupStatementId: updateEveryDayLeaveStatus.update
-- source: hr_sqlmap.xml
-- type: update
-- params: {
--   "id": 1001
-- }
UPDATE vm_wf_cap4_everyDayLeaveAndEvection SET leaveStatus = CASE WHEN (isAmLeave = '-3841538853571705149' AND isPmLeave = '-3841538853571705149') THEN util_common.getEnumIdByRefName('时段类型', '全天') WHEN (isAmLeave = '-3841538853571705149' AND (isPmLeave != '-3841538853571705149' OR isPmLeave IS NULL)) THEN util_common.getEnumIdByRefName('时段类型', '上午') WHEN (isPmLeave = '-3841538853571705149' AND (isAmLeave != '-3841538853571705149' OR isAmLeave IS NULL)) THEN util_common.getEnumIdByRefName('时段类型', '下午') ELSE util_common.getEnumIdByRefName('时段类型', '无') END WHERE id = 1001;

-- statementId: clearEveryDayLeaveRecordAM.update
-- lookupStatementId: clearEveryDayLeaveRecordAM.update
-- source: hr_sqlmap.xml
-- type: update
-- params: {
--   "id": 1001
-- }
update vm_wf_cap4_everyDayLeaveAndEvection set isAmLeave = null, startDate = null, startHalfDay = null, endDate = null, endHalfDay = null, leaveRecord = null, flowUrl = null, leaveType = null, leaveSonType = null, flowStatus = null, leaveReason = null, leaveFlowSerialNum = null where id = 1001;

-- statementId: clearEveryDayLeaveRecordPM.update
-- lookupStatementId: clearEveryDayLeaveRecordPM.update
-- source: hr_sqlmap.xml
-- type: update
-- params: {
--   "id": 1001
-- }
update vm_wf_cap4_everyDayLeaveAndEvection set isPmLeave = null, pmStartDate = null, pmStartHalfDay = null, pmEndDate = null, pmEndHalfDay = null, pmLeaveRecord = null, pmFlowUrl = null, pmLeaveType = null, pmLeaveSonType = null, pmFlowStatus = null, pmLeaveReason = null, pmLeaveFlowSerialNum = null where id = 1001;

-- statementId: clearEveryDayCancelLeaveRecordAM.update
-- lookupStatementId: clearEveryDayCancelLeaveRecordAM.update
-- source: hr_sqlmap.xml
-- type: update
-- params: {
--   "id": 1001
-- }
update vm_wf_cap4_everyDayLeaveAndEvection set isAmLeave = null, startDate = null, startHalfDay = null, endDate = null, endHalfDay = null, leaveRecord = null, flowUrl = null, leaveType = null, leaveSonType = null, flowStatus = null, leaveReason = null, cancelLeaveFlowSerialNum = null where id = 1001;

-- statementId: clearEveryDayCancelLeaveRecordPM.update
-- lookupStatementId: clearEveryDayCancelLeaveRecordPM.update
-- source: hr_sqlmap.xml
-- type: update
-- params: {
--   "id": 1001
-- }
update vm_wf_cap4_everyDayLeaveAndEvection set isPmLeave = null, pmStartDate = null, pmStartHalfDay = null, pmEndDate = null, pmEndHalfDay = null, pmLeaveRecord = null, pmFlowUrl = null, pmLeaveType = null, pmLeaveSonType = null, pmFlowStatus = null, pmLeaveReason = null, pmCancelLeaveFlowSerialNum = null where id = 1001;

-- statementId: insertEveryDayLeaveRecord.insert
-- lookupStatementId: insertEveryDayLeaveRecord.insert
-- source: hr_sqlmap.xml
-- type: insert
-- params: {
--   "id": 1001,
--   "writer": "VALUE_001",
--   "writerDept": "VALUE_001",
--   "currentDate": "2026-05-14",
--   "isFestDay": "VALUE_001",
--   "isRestDay": "VALUE_001"
-- }
insert into vm_wf_cap4_everyDayLeaveAndEvection( ID, STATE, START_MEMBER_ID, START_DATE, APPROVE_MEMBER_ID, APPROVE_DATE, FINISHEDFLAG, RATIFYFLAG, RATIFY_MEMBER_ID, RATIFY_DATE, SORT, MODIFY_MEMBER_ID, MODIFY_DATE, writer, writerDept, currentDate, isFestDay, isRestDay ) VALUES( 1001, 1, null, sysdate, null, sysdate, 0, 0, 0, sysdate, 0, null, sysdate, 'VALUE_001', 'VALUE_001', to_date('2026-05-14','yyyy-MM-dd'), 'VALUE_001', 'VALUE_001' );

-- statementId: insertEveryDaySurveyRecord.insert
-- lookupStatementId: insertEveryDaySurveyRecord.insert
-- source: hr_sqlmap.xml
-- type: insert
-- params: {
--   "id": 1001,
--   "writer": "VALUE_001",
--   "writerDept": "VALUE_001",
--   "currentDate": "2026-05-14",
--   "isFestDay": "VALUE_001",
--   "isRestDay": "VALUE_001",
--   "surveyStatus": 1,
--   "surveyFlowStatus": 1,
--   "surveyStartDate": "2026-05-14",
--   "surveyEndDate": "2026-05-14",
--   "surveyRecord": "VALUE_001",
--   "surveyReason": "VALUE_001",
--   "surveyFlowSerialNum": "VALUE_001"
-- }
insert into vm_wf_cap4_everyDayLeaveAndEvection( ID, STATE, START_MEMBER_ID, START_DATE, APPROVE_MEMBER_ID, APPROVE_DATE, FINISHEDFLAG, RATIFYFLAG, RATIFY_MEMBER_ID, RATIFY_DATE, SORT, MODIFY_MEMBER_ID, MODIFY_DATE, writer, writerDept, currentDate, isFestDay, isRestDay, surveyStatus, surveyFlowStatus, surveyStartDate, surveyEndDate, surveyRecord, surveyReason, surveyFlowSerialNum ) VALUES( 1001, 1, null, sysdate, null, sysdate, 0, 0, 0, sysdate, 0, null, sysdate, 'VALUE_001', 'VALUE_001', to_date('2026-05-14','yyyy-MM-dd'), 'VALUE_001', 'VALUE_001', 1, 1, to_date('2026-05-14','yyyy-MM-dd'), to_date('2026-05-14','yyyy-MM-dd'), 'VALUE_001', 'VALUE_001', 'VALUE_001' );

-- statementId: isSickRecord.select
-- lookupStatementId: isSickRecord.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "writer": "VALUE_001",
--   "currentDate": "2026-05-14",
--   "leaveType": "VALUE_001",
--   "isAmLeave": "VALUE_001",
--   "flowStatus": 1,
--   "isPmLeave": "VALUE_001",
--   "pmFlowStatus": 1
-- }
select id as "id", leaveStatus as "leaveStatus", flowStatus as "flowStatus" from vm_wf_cap4_everyDayLeaveAndEvection where writer = 'VALUE_001' and currentDate = TO_DATE('2026-05-14', 'YYYY-MM-DD') and leaveType = 'VALUE_001' AND isAmLeave = 'VALUE_001' AND flowStatus = 1 AND isPmLeave = 'VALUE_001' AND pmFlowStatus = 1;

-- statementId: queryNeedReimburseFlow.select
-- lookupStatementId: queryNeedReimburseFlow.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "endDateAMorPM": "2026-05-14",
--   "endDate": "2026-05-14",
--   "mainMember": "VALUE_001",
--   "leaveType": "VALUE_001",
--   "historyActiveDate": "2026-05-14",
--   "historyExpiryDate": "2026-05-14"
-- }
WITH calculation_cte AS ( select id as "id", mainMember as "mainMember", leaveType as "leaveType", cancelLeaveFlowSerialNum as "cancelLeaveFlowSerialNum", startDate as "startDate", maxOldDeductDays as "maxOldDeductDays", beforeOldDeductDays as "beforeOldDeductDays", afterOldDeductDays as "afterOldDeductDays", beforeNewDeductDays as "beforeNewDeductDays", afterNewDeductDays as "afterNewDeductDays", calculationProcess as "calculationProcess", CASE WHEN endDateAMorPM = '770469099444389055' THEN TO_TIMESTAMP(TO_CHAR(endDate, 'yyyy-mm-dd') || ' 11:59:59', 'YYYY-MM-DD HH24:MI:SS') WHEN endDateAMorPM = '3338464713283357441' THEN TO_TIMESTAMP(TO_CHAR(endDate, 'yyyy-mm-dd') || ' 23:59:59', 'YYYY-MM-DD HH24:MI:SS') ELSE NULL END AS leave_end_ts, CASE WHEN '2026-05-14' = '770469099444389055' THEN TO_TIMESTAMP('2026-05-14' || ' 11:59:59', 'YYYY-MM-DD HH24:MI:SS') WHEN '2026-05-14' = '3338464713283357441' THEN TO_TIMESTAMP('2026-05-14' || ' 23:59:59', 'YYYY-MM-DD HH24:MI:SS') ELSE NULL END AS request_end_ts from vm_wf_cap4_reimburseleave ) SELECT "id", "mainMember", "leaveType", "cancelLeaveFlowSerialNum", "startDate", "maxOldDeductDays", "beforeOldDeductDays", "afterOldDeductDays", "beforeNewDeductDays", "afterNewDeductDays", "calculationProcess", leave_end_ts, request_end_ts FROM calculation_cte where "mainMember" = 'VALUE_001' and leave_end_ts > request_end_ts and "leaveType" = 'VALUE_001' AND "startDate" BETWEEN TO_DATE('2026-05-14', 'YYYY-MM-DD') AND TO_DATE('2026-05-14', 'YYYY-MM-DD') order by leave_end_ts;

-- statementId: updateLeaveDeductDays.update
-- lookupStatementId: updateLeaveDeductDays.update
-- source: hr_sqlmap.xml
-- type: update
-- params: {
--   "cancelLeaveFlowSerialNum": "VALUE_001",
--   "calculationProcess": "VALUE_001",
--   "afterNewDeductDays": "VALUE_001",
--   "afterOldDeductDays": "VALUE_001",
--   "id": 1001
-- }
update vm_wf_cap4_reimburseleave set cancelLeaveFlowSerialNum = 'VALUE_001' ,calculationProcess = 'VALUE_001' ,afterNewDeductDays = 'VALUE_001' ,afterOldDeductDays = 'VALUE_001' where id = 1001;

-- statementId: updateEveryDayEvectionRecord.update
-- lookupStatementId: updateEveryDayEvectionRecord.update
-- source: hr_sqlmap.xml
-- type: update
-- params: {
--   "evectionFlowStatus": 1,
--   "evectionStatus": 1,
--   "evectionStartDate": "2026-05-14",
--   "evectionEndDate": "2026-05-14",
--   "evectionRecord": "VALUE_001",
--   "evectionFlowUrl": "VALUE_001",
--   "evectionReason": "VALUE_001",
--   "isOverseas": "VALUE_001",
--   "evectionFlowSerialNum": "VALUE_001",
--   "evectionChangeFlowSerialNum": "VALUE_001",
--   "writer": "VALUE_001",
--   "currentDate": "2026-05-14"
-- }
update vm_wf_cap4_everyDayLeaveAndEvection set evectionFlowStatus = 1 ,evectionStatus = 1 ,evectionStartDate = TO_DATE('2026-05-14', 'YYYY-MM-DD') ,evectionEndDate = TO_DATE('2026-05-14', 'YYYY-MM-DD') ,evectionRecord = 'VALUE_001' ,evectionFlowUrl = 'VALUE_001' ,evectionReason = 'VALUE_001' ,isOverseas = 'VALUE_001' ,evectionFlowSerialNum = 'VALUE_001' ,evectionChangeFlowSerialNum = 'VALUE_001' where writer = 'VALUE_001' and currentDate = TO_DATE('2026-05-14', 'YYYY-MM-DD');

-- statementId: clearEveryDayEvectionRecord.update
-- lookupStatementId: clearEveryDayEvectionRecord.update
-- source: hr_sqlmap.xml
-- type: update
-- params: {
--   "evectionFlowSerialNum": "VALUE_001"
-- }
update vm_wf_cap4_everyDayLeaveAndEvection set evectionStatus = null, evectionStartDate = null, evectionEndDate = null, evectionRecord = null, evectionFlowUrl = null, isOverseas = null, evectionFlowStatus = null, evectionReason = null where evectionFlowSerialNum = 'VALUE_001';

-- statementId: clearEveryDayCancelEvectionRecord.update
-- lookupStatementId: clearEveryDayCancelEvectionRecord.update
-- source: hr_sqlmap.xml
-- type: update
-- params: {
--   "evectionChangeFlowSerialNum": "VALUE_001"
-- }
update vm_wf_cap4_everyDayLeaveAndEvection set evectionStatus = null, evectionStartDate = null, evectionEndDate = null, evectionRecord = null, evectionFlowUrl = null, isOverseas = null, evectionFlowStatus = null, evectionReason = null where evectionChangeFlowSerialNum = 'VALUE_001';

-- statementId: insertEveryDayEvectionRecord.insert
-- lookupStatementId: insertEveryDayEvectionRecord.insert
-- source: hr_sqlmap.xml
-- type: insert
-- params: {
--   "id": 1001,
--   "writer": "VALUE_001",
--   "writerDept": "VALUE_001",
--   "currentDate": "2026-05-14",
--   "isFestDay": "VALUE_001",
--   "isRestDay": "VALUE_001",
--   "evectionStatus": 1,
--   "evectionStartDate": "2026-05-14",
--   "evectionEndDate": "2026-05-14",
--   "evectionRecord": "VALUE_001",
--   "evectionFlowUrl": "VALUE_001",
--   "evectionReason": "VALUE_001",
--   "isOverseas": "VALUE_001",
--   "evectionFlowSerialNum": "VALUE_001",
--   "evectionChangeFlowSerialNum": "VALUE_001",
--   "evectionFlowStatus": 1
-- }
insert into vm_wf_cap4_everyDayLeaveAndEvection( ID, STATE, START_MEMBER_ID, START_DATE, APPROVE_MEMBER_ID, APPROVE_DATE, FINISHEDFLAG, RATIFYFLAG, RATIFY_MEMBER_ID, RATIFY_DATE, SORT, MODIFY_MEMBER_ID, MODIFY_DATE, writer, writerDept, currentDate, isFestDay, isRestDay, evectionStatus, evectionStartDate, evectionEndDate, evectionRecord, evectionFlowUrl, evectionReason, isOverseas, evectionFlowSerialNum, evectionChangeFlowSerialNum, evectionFlowStatus ) VALUES( 1001, 1, null, sysdate, null, sysdate, 0, 0, 0, sysdate, 0, null, sysdate, 'VALUE_001', 'VALUE_001', to_date('2026-05-14','yyyy-MM-dd'), 'VALUE_001', 'VALUE_001', 1, to_date('2026-05-14','yyyy-MM-dd'), to_date('2026-05-14','yyyy-MM-dd'), 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 1 );

-- statementId: queryHistoryEvectionRecord.select
-- lookupStatementId: queryHistoryEvectionRecord.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "flowSerialNum": "VALUE_001"
-- }
select t."id", t."flowSerialNum", t."writer", t."singMember", t."writerDept", t."isOverseas", t."evectionRecord", t."startDateStr", t."endDateStr", t."evectionReason", t."evectionFlowUrl" from ( select id as "id", flowSerialNum as "flowSerialNum", userId as "writer", travelerId as "singMember", writerDept as "writerDept", isOverseas as "isOverseas", evectionRecord as "evectionRecord", to_char(evectionStartDate, 'yyyy-MM-dd') as "startDateStr", to_char(evectionEndDate, 'yyyy-MM-dd') as "endDateStr", evectionReason as "evectionReason", flowUrl as "evectionFlowUrl" from vm_cap4_evations union all select id as "id", flowSerialNum as "flowSerialNum", userId as "writer", travelerId as "singMember", writerDept as "writerDept", isOverseas as "isOverseas", evectionRecord as "evectionRecord", to_char(evectionStartDate, 'yyyy-MM-dd') as "startDateStr", to_char(evectionEndDate, 'yyyy-MM-dd') as "endDateStr", evectionReason as "evectionReason", flowUrl as "evectionFlowUrl" from vm_cap4_evations_change union all select id as "id", flowSerialNum as "flowSerialNum", userId as "writer", travelerId as "singMember", writerDept as "writerDept", isOverseas as "isOverseas", evectionRecord as "evectionRecord", to_char(evectionStartDate, 'yyyy-MM-dd') as "startDateStr", to_char(evectionEndDate, 'yyyy-MM-dd') as "endDateStr", evectionReason as "evectionReason", flowUrl as "evectionFlowUrl" from vm_cap4_hk_evations ) t where 1 =1 and t."flowSerialNum" = 'VALUE_001';

-- statementId: updateEmployeeVacationDays
-- lookupStatementId: updateEmployeeVacationDays
-- source: hr_sqlmap.xml
-- type: update
-- params: {
--   "totalDays": "VALUE_001",
--   "leaveType": "VALUE_001",
--   "belongYear": "VALUE_001",
--   "employeeName": "NAME_001"
-- }
update vm_employee_leave_info set totalDays = 'VALUE_001' where leaveType = 'VALUE_001' and belongYear = 'VALUE_001' and employeeName = util_user.getMemIdByMemCode('NAME_001');

-- statementId: insertEmployeeVacationDays
-- lookupStatementId: insertEmployeeVacationDays
-- source: hr_sqlmap.xml
-- type: insert
-- params: {
--   "id": 1001,
--   "employeeName": "NAME_001",
--   "idNumber": 1001,
--   "childIdNumber": 1001,
--   "employeeStatus": 1,
--   "belongYear": "VALUE_001",
--   "leaveType": "VALUE_001",
--   "leaveDetailType": "VALUE_001",
--   "totalDays": "VALUE_001",
--   "inTransitDays": "VALUE_001",
--   "usedDays": "VALUE_001",
--   "remainingDays": "VALUE_001",
--   "effectiveDate": "2026-05-14",
--   "expirationDate": "2026-05-14",
--   "maternityMarriageFlag": 1,
--   "remarks": "VALUE_001",
--   "cancellationInTransitDays": "VALUE_001",
--   "preDeductDays": "VALUE_001",
--   "uniqueFlag": 1
-- }
INSERT INTO vm_employee_leave_info ( id, state, start_member_id, start_date, approve_member_id, approve_date, finishedflag, ratifyflag, ratify_member_id, ratify_date, modify_member_id, modify_date, sort, employeeName, department, idNumber, childIdNumber, employeeStatus, belongYear, leaveType, leaveDetailType, totalDays, inTransitDays, usedDays, remainingDays, effectiveDate, expirationDate, maternityMarriageFlag, sysCurrentDate, remarks, cancellationInTransitDays, preDeductDays, uniqueFlag ) VALUES ( 1001, 1, '6105960157477424523', sysdate, '0', sysdate, 0, 0, '0', sysdate, '6105960157477424523', sysdate, 0, util_user.getMemIdByMemCode('NAME_001'), util_user.getDeptIdByMemCode('NAME_001'), 1001, 1001, 1, 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', 'VALUE_001', '2026-05-14', '2026-05-14', 1, sysdate, 'VALUE_001', 'VALUE_001', 'VALUE_001', 1 );

-- statementId: findChildrenInfoByLimitYear
-- lookupStatementId: findChildrenInfoByLimitYear
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "startDate": "2026-05-14"
-- }
select util_user.getMemCodeByMemId(employeeName) || f.childIdNumber from vm_employee_leave_info f where f.leaveType = 6922136425708142756 and f.expirationDate >= '2026-05-14';

-- statementId: findAllMemberMarryInfo
-- lookupStatementId: findAllMemberMarryInfo
-- source: hr_sqlmap.xml
-- type: select
-- params: {}
select util_user.getMemCodeByMemId(f.employeeName) from vm_employee_leave_info f where f.leaveType = -9128234600987606369;

-- statementId: staffDaysByYearAndLeaveType.select
-- lookupStatementId: staffDaysByYearAndLeaveType.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "leaveType": "VALUE_001",
--   "belongYear": [
--     "EVENT_A",
--     "EVENT_B"
--   ]
-- }
select id, uniqueFlag, util_user.getMemCodeByMemId(employeeName) employeeName, belongYear, leaveType, totalDays from vm_employee_leave_info f where f.leaveType = 'VALUE_001' and belongYear in ('EVENT_A','EVENT_B');

-- statementId: findMemberEffectUniqueFlagByMemberInfo
-- lookupStatementId: findMemberEffectUniqueFlagByMemberInfo
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "leaveType": "VALUE_001",
--   "employeeName": "NAME_001",
--   "endDate": "2026-05-14",
--   "startDate": "2026-05-14"
-- }
select f.uniqueFlag, f.remainingDays, effectiveDate from vm_employee_leave_info f where util_common.getEnumShowById(f.leaveType) = 'VALUE_001' and f.employeeName = util_user.getMemIdByLoginName('NAME_001') and '2026-05-14' >= f.effectiveDate and '2026-05-14' <= f.expirationDate order by f.effectiveDate desc;

-- statementId: findReimburseLeaveRecord.select
-- lookupStatementId: findReimburseLeaveRecord.select
-- source: hr_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select id as "id" from vm_wf_cap4_reimburseleave where cancelLeaveFlowSerialNum = 'VALUE_001';

-- statementId: deleteLeaveArchiveReimburseInfo.delete
-- lookupStatementId: deleteLeaveArchiveReimburseInfo.delete
-- source: hr_sqlmap.xml
-- type: delete
-- params: "VALUE_001"
delete from vm_wf_cap4_reimburseleave_son where formmainId = 'VALUE_001';

-- statementId: insertLeaveArchiveReimburseInfo.insert
-- lookupStatementId: insertLeaveArchiveReimburseInfo.insert
-- source: hr_sqlmap.xml
-- type: insert
-- params: {
--   "formmainId": 1001,
--   "uniqueFlag": 1,
--   "reimburseInterval": "VALUE_001",
--   "effectiveDate": "2026-05-14",
--   "expirationDate": "2026-05-14",
--   "totalDays": "VALUE_001",
--   "usedDays": "VALUE_001",
--   "reimbursedUsedDays": "VALUE_001",
--   "reimburseTime": "2026-05-14 10:00:00",
--   "reimburseDays": "VALUE_001"
-- }
insert into vm_wf_cap4_reimburseleave_son( id, formmainId, uniqueFlag, reimburseInterval, effectiveDate, expirationDate, totalDays, usedDays, reimbursedUsedDays, reimburseTime, reimburseDays) values( util_common.getAbsID, 1001, 1, 'VALUE_001', to_date('2026-05-14', 'YYYY-MM-DD'), to_date('2026-05-14', 'YYYY-MM-DD'), 'VALUE_001', 'VALUE_001', 'VALUE_001', to_date('2026-05-14 10:00:00', 'YYYY-MM-DD hh24:mi:ss'), 'VALUE_001' );

-- statementId: findUserLeaveArchiveByReimburseInfo.select
-- lookupStatementId: findUserLeaveArchiveByReimburseInfo.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "employeeName": "NAME_001",
--   "leaveType": "VALUE_001",
--   "endDate": "2026-05-14",
--   "startDate": "2026-05-14"
-- }
SELECT id as "id", employeeName as "employeeName", department as "department", leaveType as "leaveType", effectiveDate as "effectiveDate", expirationDate as "expirationDate", totalDays as "totalDays", usedDays as "usedDays", remainingDays as "remainingDays", uniqueFlag as "uniqueFlag" FROM VM_EMPLOYEE_LEAVE_INFO WHERE 1 = 1 and uniqueFlag is not null and effectiveDate is not null and expirationDate is not null and employeeName = 'NAME_001' and leaveType = 'VALUE_001' and effectiveDate <= TO_DATE('2026-05-14', 'YYYY-MM-DD') and expirationDate >= TO_DATE('2026-05-14', 'YYYY-MM-DD') ORDER BY expirationDate DESC, remainingDays DESC;

-- statementId: updateLeaveArchiveById.update
-- lookupStatementId: updateLeaveArchiveById.update
-- source: hr_sqlmap.xml
-- type: update
-- params: {
--   "usedDays": "VALUE_001",
--   "remainingDays": "VALUE_001",
--   "id": 1001
-- }
update vm_employee_leave_info set usedDays = 'VALUE_001', remainingDays = 'VALUE_001' where id = 1001;

-- statementId: allEnableMemberId.select
-- lookupStatementId: allEnableMemberId.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {}
select code from org_member f where is_enable = 1 and is_deleted = 0 and f.is_internal = 1 and f.is_virtual = 0 and code is not null;

-- statementId: subordinateLeaveRecordByLoginId
-- lookupStatementId: subordinateLeaveRecordByLoginId
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "userId": 1001,
--   "userIds": [
--     "EVENT_A",
--     "EVENT_B"
--   ],
--   "endDate": "2026-05-14",
--   "startDate": "2026-05-14"
-- }
SELECT CASE WHEN vwp.finishedflag = 1 THEN l.id ELSE vwp.id END AS ID, om.name, 'leave' AS leaveCancelType, vwp.finishedflag AS ISFINISHED, vwp.startDate, vwp.endDate, util_common.getEnumShowById(vwp.startHalfDay) AS STARTDATEMORN, util_common.getEnumShowById(vwp.endHalfDay) AS ENDDATEMORN, util_common.getEnumShowById(vwp.leaveType) AS TYPE FROM vm_wf_cap4_parentalleave vwp LEFT JOIN org_member om ON vwp.writer = om.id LEFT JOIN vm_leaveInfo_doc_cap4 l ON l.leaveSerialNum = vwp.flowSerialNum AND l.leaveCancelType = 8705337157000773743 WHERE vwp.state = 1 and (l.leaveCancelType = 8705337157000773743 or l.leaveCancelType is null) and ( util_user.getDeptIdByMemId(1001) = '4685348575850154659' OR om.id IN ( SELECT COLUMN_VALUE FROM TABLE(util_org.getUnderlingMemId(1001)) UNION SELECT TO_NUMBER(1001) FROM DUAL ) ) and om.id in ('EVENT_A','EVENT_B') AND vwp.startDate <= to_date('2026-05-14', 'yyyy-mm-dd') AND vwp.endDate >= to_date('2026-05-14', 'yyyy-mm-dd') AND NOT EXISTS ( SELECT 1 FROM vm_wf_cap4_parentalleavecancel WHERE businessFlowId = l.leaveSerialNum ) and vwp.flowSerialNum is not null;

-- statementId: subordinateNewLeaveRecordByLoginId
-- lookupStatementId: subordinateNewLeaveRecordByLoginId
-- source: hr_sqlmap.xml
-- type: select
-- params: {
--   "userId": 1001,
--   "userIds": [
--     "EVENT_A",
--     "EVENT_B"
--   ],
--   "endDate": "2026-05-14",
--   "startDate": "2026-05-14"
-- }
SELECT CASE WHEN vwp.finishedflag = 1 THEN vdc.id ELSE vwp.id END AS ID, om.name, 'cancel' as leaveCancelType, vwp.finishedflag AS ISFINISHED, vwp.newstartDate startDate, vwp.newendDate endDate, util_common.getEnumShowById(vwp.newstartHalfDay) AS STARTDATEMORN, util_common.getEnumShowById(vwp.newendHalfDay) AS ENDDATEMORN, util_common.getEnumShowById(vwp.leaveType) AS TYPE FROM vm_wf_cap4_parentalleavecancel vwp LEFT JOIN org_member om ON vwp.writer = om.id left join vm_leaveInfo_doc_cap4 vdc on vwp.businessFlowId=vdc.leaveSerialNum WHERE vwp.state = 1 and vwp.cancelType = 7806055738419137699 and ( util_user.getDeptIdByMemId(1001) = '4685348575850154659' OR om.id IN ( SELECT COLUMN_VALUE FROM TABLE(util_org.getUnderlingMemId(1001)) UNION SELECT TO_NUMBER(1001) FROM DUAL ) ) and om.id in ('EVENT_A','EVENT_B') AND vwp.newstartDate <= to_date('2026-05-14', 'yyyy-mm-dd') AND vwp.newendDate >= to_date('2026-05-14', 'yyyy-mm-dd');

-- statementId: findNeedPushLeaveAttachmentMonthly
-- lookupStatementId: findNeedPushLeaveAttachmentMonthly
-- source: hr_sqlmap.xml
-- type: select
-- params: {}
select f.id, f.leave_request_number from vm_employee_leave_recordCAP4 f left join vm_basememberinfo v on f.applicant = v.memberId where trigger_upload_process = -3841538853571705149 and proof_process_status = '审批中' and v.memberState = '在职';

-- statementId: stopLeaveAttachmentMonthly.select
-- lookupStatementId: stopLeaveAttachmentMonthly.select
-- source: hr_sqlmap.xml
-- type: select
-- params: {}
select f.id from VM_LEAVE_PROOF_ATTACHMENT_UPLOAD f left join vm_basememberinfo vbf on f.applicant = vbf.memberId where f.finishedflag = 0 and vbf.memberState = '离职';

-- statementId: manageNoteById.select
-- lookupStatementId: manageNoteById.select
-- source: managenote_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select to_char(id) id, serialNo, util_user.getMemCodeByMemId(sendUser) sendUserNo, util_user.getMemberNameByMemId(sendUser) memberName, to_char(sendDate, 'yyyy-mm-dd') sendDate, sendUser, sendDept, noticeType, sendState, noticeMembers, noticeDepts, noticeTitle, noticeContent, confirmContent, remark, noticeFile, noticeAccounts, removeMembers from vm_managenotice where id = 'VALUE_001';

-- statementId: findNeedSendManageNode.select
-- lookupStatementId: findNeedSendManageNode.select
-- source: managenote_sqlmap.xml
-- type: select
-- params: {
--   "noticeAccounts": 7,
--   "noticeDepts": "RAW_VALUE",
--   "noticeMembers": "RAW_VALUE",
--   "removeMembers": "RAW_VALUE",
--   "sendSerialNo": "VALUE_001"
-- }
select distinct to_char(id) id, to_char(org_department_id) org_department_id from org_member where ( 1=0 or org_account_id in (7) or org_department_id in (RAW_VALUE) or id in (RAW_VALUE) ) AND id not in (RAW_VALUE) and is_admin=0 and is_internal=1 and type <> 2 and is_virtual=0 and is_deleted=0 and state = 1 and id not in (select noticeMember from vm_wf_managenotice where sendSerialNo = 'VALUE_001' and noticeMember is not null);

-- statementId: findHaveSendManageFlowBySerialNo.select
-- lookupStatementId: findHaveSendManageFlowBySerialNo.select
-- source: managenote_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select noticeMember from vm_wf_managenotice where sendSerialNo = 'VALUE_001';

-- statementId: findManageNoteFlowBySendSerialNo.select
-- lookupStatementId: findManageNoteFlowBySendSerialNo.select
-- source: managenote_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select to_char(id) as "id", serialNo as "serialNo", sendUser as "sendUser", sendDept as "sendDept", sendDate as "sendDate", noticeFile as "noticeFile", noticeTitle as "noticeTitle", noticeContent as "noticeContent", noticeType as "noticeType", confirmContent as "confirmContent", noticeMember as "noticeMember", noticeDept as "noticeDept", sendSerialNo as "sendSerialNo", uniqueCheckNo as "uniqueCheckNo", confirmSelected as "confirmSelected" from vm_wf_managenotice where sendSerialNo = 'VALUE_001';

-- statementId: updateManageNoteFlowByDeptId.update
-- lookupStatementId: updateManageNoteFlowByDeptId.update
-- source: managenote_sqlmap.xml
-- type: update
-- params: {
--   "notConfirmMembers": "VALUE_001",
--   "confirmedMembers": "VALUE_001",
--   "deptId": 1001,
--   "formmainId": 1001
-- }
update vm_managenotice_send set notConfirmMembers = 'VALUE_001', confirmedMembers = 'VALUE_001' where noticeDept = 1001 and formmain_id = 1001;

-- statementId: findManageNoteDepartInfo.select
-- lookupStatementId: findManageNoteDepartInfo.select
-- source: managenote_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select noticeDept,notConfirmMembers from vm_managenotice_send where formmain_id = 'VALUE_001';

-- statementId: updateManageNoteById.select
-- lookupStatementId: updateManageNoteById.select
-- source: managenote_sqlmap.xml
-- type: update
-- params: {
--   "notConfirmMembers": "VALUE_001",
--   "noticeDept": "VALUE_001",
--   "formmain_id": 1001
-- }
update vm_managenotice_send set notConfirmMembers = 'VALUE_001' where noticeDept = 'VALUE_001' and formmain_id = 1001;

-- statementId: insertManageSon.insert
-- lookupStatementId: insertManageSon.insert
-- source: managenote_sqlmap.xml
-- type: insert
-- params: {
--   "id": 1001,
--   "formmain_id": 1001,
--   "noticeDept": "VALUE_001",
--   "notConfirmMembers": "VALUE_001"
-- }
insert into vm_managenotice_send ( id, formmain_id, noticeDept, notConfirmMembers ) values ( 1001, 1001, 'VALUE_001', 'VALUE_001' );

-- statementId: manageNode.delete
-- lookupStatementId: manageNode.delete
-- source: managenote_sqlmap.xml
-- type: delete
-- params: {}
delete from vm_managenotice_send where noticeDept is null;

-- statementId: manageNoteCAP4ById.select
-- lookupStatementId: manageNoteCAP4ById.select
-- source: managenote_sqlmap.xml
-- type: select
-- params: "VALUE_001"
SELECT id, title, push_status, prompt_personnel, prompt_department, prompt_company, remove_personnel, prompt_text, serial_number FROM vm_managerNoteCap4Push where id = 'VALUE_001';

-- statementId: findNeedSendManageNoteCAP4.select
-- lookupStatementId: findNeedSendManageNoteCAP4.select
-- source: managenote_sqlmap.xml
-- type: select
-- params: {
--   "prompt_company": "RAW_VALUE",
--   "prompt_department": "RAW_VALUE",
--   "prompt_personnel": "RAW_VALUE",
--   "remove_personnel": "RAW_VALUE",
--   "serial_number": "VALUE_001"
-- }
select distinct to_char(id) id, to_char(org_department_id) org_department_id from org_member where ( 1=0 or org_account_id in (RAW_VALUE) or org_department_id in (RAW_VALUE) or id in (RAW_VALUE) ) AND id not in (RAW_VALUE) and is_admin=0 and is_internal=1 and type <> 2 and is_virtual=0 and is_deleted=0 and state = 1 and id not in (select noticeMember from vm_wf_managenoteCap4 where sendSerialNo = 'VALUE_001' and noticeMember is not null);

-- statementId: findNeedSendManageNoteDW.select
-- lookupStatementId: findNeedSendManageNoteDW.select
-- source: managenote_sqlmap.xml
-- type: select
-- params: {
--   "prompt_department": "RAW_VALUE",
--   "remove_personnel": "RAW_VALUE",
--   "serial_number": "VALUE_001"
-- }
select distinct to_char(orp.objective0_id) id, to_char(ou.id) org_department_id from org_unit ou left join org_relationship orp on ou.id = orp.source_id where ou.id in (RAW_VALUE) AND orp.objective0_id not in (RAW_VALUE) and orp.type = 'BusinessDepartment_Member' and orp.objective0_id is not null and orp.objective0_id not in (select noticeMember from vm_wf_managenoteCap4 where sendSerialNo = 'VALUE_001' and noticeMember is not null);

-- statementId: manageNoteSonTableBlank.delete
-- lookupStatementId: manageNoteSonTableBlank.delete
-- source: managenote_sqlmap.xml
-- type: delete
-- params: {}
delete from vm_managerNoteCap4PushMemberInfos where departId is null;

-- statementId: managerNoteSonTable.insert
-- lookupStatementId: managerNoteSonTable.insert
-- source: managenote_sqlmap.xml
-- type: insert
-- params: {
--   "id": 1001,
--   "departId": 1001,
--   "unconfirmed_personnel": "VALUE_001"
-- }
insert into vm_managerNoteCap4PushMemberInfos ( id, formmain_id, departId, unconfirmed_personnel ) values ( util_common.getID, 1001, 1001, 'VALUE_001' );

-- statementId: haveSendDepartInfoCAP4.select
-- lookupStatementId: haveSendDepartInfoCAP4.select
-- source: managenote_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select unconfirmed_personnel, to_char(departId) as departId from vm_managerNoteCap4PushMemberInfos where formmain_id = 'VALUE_001';

-- statementId: managerNoteSonTable.update
-- lookupStatementId: managerNoteSonTable.update
-- source: managenote_sqlmap.xml
-- type: update
-- params: {
--   "unconfirmed_personnel": "VALUE_001",
--   "id": 1001,
--   "departId": 1001
-- }
update vm_managerNoteCap4PushMemberInfos set unconfirmed_personnel = 'VALUE_001' where formmain_id = 1001 and departId = 1001;

-- statementId: havePushNoticeMember.select
-- lookupStatementId: havePushNoticeMember.select
-- source: managenote_sqlmap.xml
-- type: select
-- params: "VALUE_001"
select to_char(noticeMember) AS noticeMember, to_char(noticeDepart) as noticedepart, to_char(imConfig) as imConfig from vm_wf_managenoteCap4 where sendSerialNo = 'VALUE_001';

-- statementId: updateManageNoteCAP4FlowByDeptId.update
-- lookupStatementId: updateManageNoteCAP4FlowByDeptId.update
-- source: managenote_sqlmap.xml
-- type: update
-- params: {
--   "unconfirmed_personnel": "VALUE_001",
--   "confirmed_personnel": "VALUE_001",
--   "departId": 1001,
--   "formmainId": 1001
-- }
update vm_managerNoteCap4PushMemberInfos set unconfirmed_personnel = 'VALUE_001', confirmed_personnel = 'VALUE_001' where departId = 1001 and formmain_id = 1001;

