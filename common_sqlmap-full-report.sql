-- common_sqlmap.xml statement SQL 脚本
-- 资源路径: /online_sqlmaps/common_sqlmap.xml
-- 用例数: 188
-- 通过: 188
-- 失败: 0

-- statementId: setAffairTrack.update
-- case: 基础参数命中
-- type: update
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "isTrack": "VALUE_001",
--   "id": 1001
-- }
update ctp_affair set track = 'VALUE_001' where id = 1001;

-- statementId: ctpAffairStatus.update
-- case: 基础参数命中
-- type: update
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "status": 1,
--   "subStatus": 1,
--   "affairId": 1001,
--   "activityId": 1001
-- }
update ctp_affair set state=1, sub_state=1 where object_id = (select distinct object_id from ctp_affair where ID=1001) and activity_Id=1001;

-- statementId: colInfo.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "affairId": 1001
-- }
select a.sub_object_id as workitemId,s.process_id as processId,s.case_Id as caseId, a.activity_Id as activityId,s.id as summaryId from ctp_affair a,col_summary s where a.object_id=s.id and a.id=1001;

-- statementId: getFormNameByTempleteNo.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "templeteNumber": "VALUE_001"
-- }
SELECT T2.NAME AS FORMNAME FROM WF_PROCESS_TEMPLETE T1, FORM_DEFINITION T2, (SELECT S1.WORKFLOW_ID FROM CTP_TEMPLATE S1 WHERE S1.TEMPLETE_NUMBER = 'VALUE_001') T3 WHERE T3.WORKFLOW_ID = T1.ID AND T1.APPID = T2.ID and t2.id is not null;

-- statementId: getCap4FormNameByTempleteNo.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "templeteNumber": "VALUE_001"
-- }
SELECT T2.NAME AS FORMNAME FROM WF_PROCESS_TEMPLETE T1, CAP_FORM_DEFINITION T2, (SELECT S1.WORKFLOW_ID FROM CTP_TEMPLATE S1 WHERE S1.TEMPLETE_NUMBER = 'VALUE_001') T3 WHERE T3.WORKFLOW_ID = T1.ID AND T1.APPID = T2.ID and t2.id is not null;

-- statementId: getSonTableColType.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "sonTableName": "NAME_001",
--   "tableName": "NAME_001",
--   "field": "VALUE_001"
-- }
select VC_FIELDINPUTTYPE as fieldInputType,VC_FIELDREFID as fieldrefid from vm_formfield where VC_TABLENAME = 'NAME_001' and VC_OWNERTABLEID = 'NAME_001' and VC_FIELDNAME = 'VALUE_001';

-- statementId: getTableNameByFormName.select
-- case: 动态条件命中
-- type: select
-- assertion: 传入动态变量，验证最终 SQL 正常展开
-- params: {
--   "mainTableName": "NAME_001",
--   "sonTableName": "NAME_001"
-- }
SELECT VC_TABLENAME AS tableName, VC_OWNERTABLEID AS ownerTableID FROM VM_FORMFIELD WHERE VC_FORMNAME = 'NAME_001' AND VC_TABLEDISPLAY = 'NAME_001' AND ROWNUM = 1;

-- statementId: getTableNameByFormName.select
-- case: 可选条件关闭
-- type: select
-- assertion: 移除可选动态属性，观察条件收缩后的 SQL
-- params: {
--   "mainTableName": "NAME_001"
-- }
SELECT VC_TABLENAME AS tableName, VC_OWNERTABLEID AS ownerTableID FROM VM_FORMFIELD WHERE VC_FORMNAME = 'NAME_001' AND VC_OWNERTABLEID is null AND ROWNUM = 1;

-- statementId: getCap4TableNameByFormName.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "mainTableName": "NAME_001"
-- }
SELECT id,field_info FROM cap_form_definition WHERE name = 'NAME_001';

-- statementId: getTableNameByFieldName.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "tableName": "NAME_001",
--   "fieldName": "NAME_001"
-- }
SELECT DISTINCT vc_tablename AS tableName FROM vm_formfield t where vc_formName = 'NAME_001' and vc_fielddisplay = 'NAME_001';

-- statementId: getFieldDefByModuleId.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "moduleId": 1001
-- }
SELECT DISTINCT VMF.VC_FIELDNAME as fieldid, VMF.VC_FIELDDISPLAY as fieldshowname FROM VM_FORMFIELD VMF WHERE N_FORMID = (SELECT CCA.CONTENT_TEMPLATE_ID FROM CTP_CONTENT_ALL CCA WHERE MODULE_ID = 1001 AND ROWNUM = 1) AND VMF.VC_FIELDNAME LIKE 'field%' order by nvl(length(trim(vmf.VC_FIELDDISPLAY)),0) desc;

-- statementId: getChnVariableDeclareByModuleId.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "moduleId": 1001
-- }
SELECT businessName as "businessName", tableName as "tableName", viewName as "viewName", varName as "varName", varNewName as "varNewName", moduleId as "moduleId" FROM vm_chnVariableDeclare WHERE moduleId = 1001 and varNewName is not null;

-- statementId: getFieldDefByTempNo.select
-- case: 动态条件命中
-- type: select
-- assertion: 传入动态变量，验证最终 SQL 正常展开
-- params: {
--   "templeteNumber": "VALUE_001"
-- }
SELECT t.VC_FORMNAME AS formName, t.VC_TEMPLATENUMBER AS templeteNumber, t.VC_TABLENAME AS tableName, t.VC_TABLETYPE AS tableType, t.VC_OWNERTABLEID AS ownerTableID, t.VC_FIELDNAME AS fieldName, t.VC_FIELDDISPLAY AS fieldDisplay, t.VC_FIELDINPUTTYPE AS fieldType, t.VC_FIELDREFID AS refEnumID FROM vm_formfield t WHERE 1=1 AND t.VC_TEMPLATENUMBER = 'VALUE_001';

-- statementId: getFieldDefByTempNo.select
-- case: 可选条件关闭
-- type: select
-- assertion: 移除可选动态属性，观察条件收缩后的 SQL
-- params: {}
SELECT t.VC_FORMNAME AS formName, t.VC_TEMPLATENUMBER AS templeteNumber, t.VC_TABLENAME AS tableName, t.VC_TABLETYPE AS tableType, t.VC_OWNERTABLEID AS ownerTableID, t.VC_FIELDNAME AS fieldName, t.VC_FIELDDISPLAY AS fieldDisplay, t.VC_FIELDINPUTTYPE AS fieldType, t.VC_FIELDREFID AS refEnumID FROM vm_formfield t WHERE 1=1;

-- statementId: getCap4FieldDefByTempNo.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "templeteNumber": "VALUE_001"
-- }
SELECT T2.field_info as "fieldInfo", t2.name as "tableChName" FROM WF_PROCESS_TEMPLETE T1, cap_FORM_DEFINITION T2, (SELECT S1.WORKFLOW_ID FROM CTP_TEMPLATE S1 WHERE S1.TEMPLETE_NUMBER = 'VALUE_001') T3 WHERE T3.WORKFLOW_ID = T1.ID AND T1.APPID = T2.ID and t2.id is not null;

-- statementId: selectField.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "templateNumber": "VALUE_001",
--   "filedName": "NAME_001"
-- }
SELECT vc_fieldname AS fieldName FROM vm_formfield t where vc_templateNumber = 'VALUE_001' and vc_fielddisplay = 'NAME_001';

-- statementId: selectFieldByTableName.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "tableName": "NAME_001",
--   "filedName": "NAME_001"
-- }
SELECT DISTINCT vc_fieldname AS fieldName FROM vm_formfield t where vc_formName = 'NAME_001' and vc_fielddisplay = 'NAME_001' and vc_fieldname like '%field%';

-- statementId: selectFieldByTableNameSub.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "tableName": "NAME_001",
--   "filedName": "NAME_001",
--   "ownerTableName": "NAME_001"
-- }
SELECT DISTINCT vc_fieldname AS fieldName FROM vm_formfield t where VC_TABLEDISPLAY = 'NAME_001' and vc_fielddisplay = 'NAME_001' and VC_OWNERTABLEID = 'NAME_001' and vc_fieldname like '%field%';

-- statementId: getBbsBoardId.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "name": "NAME_001"
-- }
select id from bbs_board where name='NAME_001' and account_id = -1730833917365171641;

-- statementId: getInquiryBoardId.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "name": "NAME_001"
-- }
select id from inquiry_surveytype where type_name='NAME_001' and account_id = -1730833917365171641;

-- statementId: getInterfaceConfigByTemplateId.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "mainTable": "demo_table",
--   "formTemplateID": 1001
-- }
SELECT T2.SHOWVALUE AS INTERSWITCH, T1.FIELD0012 AS INTERDEFAULT FROM demo_table T1 LEFT JOIN CTP_ENUM_ITEM T2 ON T2.ID = T1.FIELD0013 WHERE T1.FIELD0001 = 1001;

-- statementId: affairInstruct.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: 1001
select field0006 from formson_2230 where field0004 = 1001;

-- statementId: getFlowConfig.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "sonTable": "demo_table",
--   "mainTable": "demo_table",
--   "formTemplateID": 1001
-- }
SELECT A1.FIELDNAME, A1.FIELDID, A2.SHOWVALUE AS SWITCHWAY, A1.SWITCHRULE, A3.SHOWVALUE AS ISMUST FROM (SELECT S1.FIELD0014 AS FIELDNAME, S1.FIELD0015 AS FIELDID, S1.FIELD0016 AS SWITCHWAY, S1.FIELD0017 AS SWITCHRULE, S1.FIELD0018 AS ISMUST FROM demo_table S1, (SELECT T1.ID FROM demo_table T1 WHERE T1.FIELD0001 = 1001) S2 WHERE S1.FORMMAIN_ID = S2.ID) A1 LEFT JOIN CTP_ENUM_ITEM A2 ON A1.SWITCHWAY = A2.ID LEFT JOIN CTP_ENUM_ITEM A3 ON A1.ISMUST = A3.ID;

-- statementId: messageRecord.insert
-- case: 基础参数命中
-- type: insert
-- assertion: 传入基础变量，验证最终 SQL 正常生成
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
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "id": 1001
-- }
select id as ID, dbms_lob.substr(FIELD0007) as DATA, FIELD0003 as FUNCTION, FIELD0001 as SYSTEM, FIELD0002 as RECORDMOUDLE from formmain_1541 where id = 1001;

-- statementId: logInfo.insert
-- case: 基础参数命中
-- type: insert
-- assertion: 传入基础变量，验证最终 SQL 正常生成
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
-- case: 基础参数命中
-- type: update
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "state": 1,
--   "remark": "VALUE_001",
--   "logId": 1001
-- }
update formmain_1541 set FIELD0005=1, FIELD0006=FIELD0006+1, FIELD0008='VALUE_001' where　id=1001;

-- statementId: loggerInfoFailNew.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "state": 1,
--   "ifHandle": "VALUE_001",
--   "startDay": "VALUE_001"
-- }
select count(1) from vm_log_record where operateState=1 and ifHandle='VALUE_001' and to_char(START_DATE, 'yyyy-mm-dd') between 'VALUE_001' and to_char(sysDate, 'yyyy-mm-dd');

-- statementId: logInfoNew.insert
-- case: 基础参数命中
-- type: insert
-- assertion: 传入基础变量，验证最终 SQL 正常生成
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
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "moduleId": 1001
-- }
SELECT content_template_id as formid,module_type as moduletype FROM ctp_content_all WHERE module_id = 1001;

-- statementId: refreshData.select.count
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "formId": 1001
-- }
SELECT count(*) FROM ctp_content_all WHERE content_template_id = 1001 AND module_template_id!=-1;

-- statementId: refreshData.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "formId": 1001
-- }
SELECT content_data_id as dataid FROM ctp_content_all WHERE content_template_id = 1001 AND module_template_id!=-1;

-- statementId: logContent.insert
-- case: 基础参数命中
-- type: insert
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "id": 1001,
--   "formId": 1001
-- }
INSERT INTO CTP_CONTENT_ALL( ID , CREATE_ID , CREATE_DATE , MODIFY_ID , MODIFY_DATE , MODULE_TYPE , MODULE_ID , MODULE_TEMPLATE_ID , CONTENT_TYPE , CONTENT , CONTENT_DATA_ID , CONTENT_TEMPLATE_ID , TITLE , SORT ) VALUES(1001,-6760911671874597139,SYSDATE, -6760911671874597139,SYSDATE,37,1001,-2502453340916791461, 20,null,1001,-1012645829320425254,'日志信息',0);

-- statementId: nodeConfigInfo.select
-- case: 动态条件命中
-- type: select
-- assertion: 传入动态变量，验证最终 SQL 正常展开
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

-- statementId: nodeConfigInfo.select
-- case: 可选条件关闭
-- type: select
-- assertion: 移除可选动态属性，观察条件收缩后的 SQL
-- params: {}
select n_recid as id, vc_activityid as activityid, vc_dataname as dataname ,vc_datavalue as datavalue from fg_node_config where vc_status = 1;

-- statementId: nodeConfigInfo.insert
-- case: 基础参数命中
-- type: insert
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "id": 1001,
--   "activityId": 1001,
--   "dataname": "NAME_001",
--   "datavalue": "VALUE_001",
--   "templeteId": 1001
-- }
insert into fg_node_config(n_recid,vc_status,vc_activityid,vc_dataname,vc_datavalue,vc_templeteid) values(1001,1,1001,'NAME_001','VALUE_001',1001);

-- statementId: nodeConfigInfo.update
-- case: 基础参数命中
-- type: update
-- assertion: 传入基础变量，验证最终 SQL 正常生成
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
-- case: 基础参数命中
-- type: update
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "status": 1,
--   "activityId": 1001,
--   "templeteId": 1001
-- }
update fg_node_config set vc_status = 1 where vc_activityid = 1001 and vc_templeteid = 1001;

-- statementId: nodeParam.insert
-- case: 基础参数命中
-- type: insert
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "id": 1001,
--   "token": "VALUE_001",
--   "activityId": 1001,
--   "key": "VALUE_001",
--   "value": "VALUE_001"
-- }
INSERT INTO fg_node_param ( ID ,vc_token,vc_activityId,vc_key,vc_value ) VALUES(1001,'VALUE_001',1001,'VALUE_001','VALUE_001');

-- statementId: nodeParam.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "token": "VALUE_001",
--   "activityId": 1001,
--   "key": "VALUE_001"
-- }
select vc_value from fg_node_param where vc_token = 'VALUE_001' and vc_activityId = 1001 and vc_key = 'VALUE_001';

-- statementId: groovyFunction.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "formName": "NAME_001"
-- }
SELECT t1.function_name AS functionname,t1.function_param AS param,t1.code_text as code FROM form_custom_function t1,form_definition t2 WHERE t2.name='NAME_001' and t2.id=t1.form_id;

-- statementId: sonTable.delete
-- case: 基础参数命中
-- type: delete
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "tableName": "demo_table",
--   "formId": 1001
-- }
delete demo_table where formmain_id = 1001;

-- statementId: checkSuperNodeInfo.select
-- case: 动态条件命中
-- type: select
-- assertion: 传入动态变量，验证最终 SQL 正常展开
-- params: {
--   "timeLimit": 7
-- }
SELECT id as taskid, subject as taskname,ca.sub_object_id as workitemid FROM ctp_affair ca WHERE ca.sub_object_id in (SELECT wsc.workitem_id FROM wf_supernode_control wsc WHERE wsc.invoke_time IS NOT NULL AND wsc.return_time IS NOT NULL AND wsc.member_id <>util_user.getMemIdByLoginName('flowbot') AND ca.member_id in (SELECT ID FROM org_member) AND wsc.invoke_time > SYSDATE - 7 ) and state = 3;

-- statementId: checkSuperNodeInfo.select
-- case: 可选条件关闭
-- type: select
-- assertion: 移除可选动态属性，观察条件收缩后的 SQL
-- params: {}
SELECT id as taskid, subject as taskname,ca.sub_object_id as workitemid FROM ctp_affair ca WHERE ca.sub_object_id in (SELECT wsc.workitem_id FROM wf_supernode_control wsc WHERE wsc.invoke_time IS NOT NULL AND wsc.return_time IS NOT NULL AND wsc.member_id <>util_user.getMemIdByLoginName('flowbot') AND ca.member_id in (SELECT ID FROM org_member) ) and state = 3;

-- statementId: checkTaskCoun.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: 1001
select count(taskid) from vm_checkSuperNode where taskid = 1001;

-- statementId: errorSuperNode.insert
-- case: 基础参数命中
-- type: insert
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "taskId": 1001,
--   "firstErrorDate": "2026-05-14",
--   "taskName": "NAME_001"
-- }
insert into vm_checkSuperNode (id, taskid, firsterrordate, taskname, dealstatus) values(util_common.getID, 1001, '2026-05-14', 'NAME_001', util_common.getEnumIdByShow('-675442050070198336','未处理'));

-- statementId: checkColIds.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: 1001
select id from col_summary where form_recordid = 1001 order by create_date desc;

-- statementId: colSumasyID.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: 1001
select * from col_summary where form_recordid = 1001 and case_id is not null;

-- statementId: DC_InternalRep_T001.select
-- case: 动态条件命中
-- type: select
-- assertion: 传入动态变量，验证最终 SQL 正常展开
-- params: {
--   "startDate": "2026-05-14",
--   "endDate": "2026-05-14"
-- }
select templateId, id, reportcode, reportsubject, launchdate, reportdate, propose,proposecode, agentmember, agentmembercode, department, departmentcode,finish_date from ( select 'DC_InternalRep_T001' as templateId,v1.id as id, reportcode, reportsubject, launchdate, reportdate, propose,proposecode, agentmember, agentmembercode, department, departmentcode,v2.finish_date from vm_generalreport v1 left join col_summary v2 on v1.id = v2.form_recordid and v2.finish_date is not null union all select 'DC_InternalRep_4_001' as templateId,v1.id as id, reportcode, reportsubject, launchdate, reportdate, propose,proposecode, agentmember, agentmembercode, department, departmentcode,v2.finish_date from vm_generalreport_cap4 v1 left join col_summary v2 on v1.id = v2.form_recordid and v2.finish_date is not null ) v where 1=1 AND v.finish_date >=to_date('2026-05-14','YYYY-MM-DD') AND v.finish_date <=to_date('2026-05-14','YYYY-MM-DD') order by v.finish_date desc;

-- statementId: DC_InternalRep_T001.select
-- case: 可选条件关闭
-- type: select
-- assertion: 移除可选动态属性，观察条件收缩后的 SQL
-- params: {}
select templateId, id, reportcode, reportsubject, launchdate, reportdate, propose,proposecode, agentmember, agentmembercode, department, departmentcode,finish_date from ( select 'DC_InternalRep_T001' as templateId,v1.id as id, reportcode, reportsubject, launchdate, reportdate, propose,proposecode, agentmember, agentmembercode, department, departmentcode,v2.finish_date from vm_generalreport v1 left join col_summary v2 on v1.id = v2.form_recordid and v2.finish_date is not null union all select 'DC_InternalRep_4_001' as templateId,v1.id as id, reportcode, reportsubject, launchdate, reportdate, propose,proposecode, agentmember, agentmembercode, department, departmentcode,v2.finish_date from vm_generalreport_cap4 v1 left join col_summary v2 on v1.id = v2.form_recordid and v2.finish_date is not null ) v where 1=1 order by v.finish_date desc;

-- statementId: DC_InternalRep_T001.select.count
-- case: 动态条件命中
-- type: select
-- assertion: 传入动态变量，验证最终 SQL 正常展开
-- params: {
--   "startDate": "2026-05-14",
--   "endDate": "2026-05-14"
-- }
select count('x') from( select templateId, id, reportcode, reportsubject, launchdate, reportdate, propose,proposecode, agentmember, agentmembercode, department, departmentcode,finish_date from ( select 'DC_InternalRep_T001' as templateId,v1.id as id, reportcode, reportsubject, launchdate, reportdate, propose,proposecode, agentmember, agentmembercode, department, departmentcode,v2.finish_date from vm_generalreport v1 left join col_summary v2 on v1.id = v2.form_recordid union all select 'DC_InternalRep_4_001' as templateId,v1.id as id, reportcode, reportsubject, launchdate, reportdate, propose,proposecode, agentmember, agentmembercode, department, departmentcode,v2.finish_date from vm_generalreport_cap4 v1 left join col_summary v2 on v1.id = v2.form_recordid ) v where 1=1 AND v.finish_date >=to_date('2026-05-14','YYYY-MM-DD') AND v.finish_date <=to_date('2026-05-14','YYYY-MM-DD') order by v.finish_date desc );

-- statementId: DC_InternalRep_T001.select.count
-- case: 可选条件关闭
-- type: select
-- assertion: 移除可选动态属性，观察条件收缩后的 SQL
-- params: {}
select count('x') from( select templateId, id, reportcode, reportsubject, launchdate, reportdate, propose,proposecode, agentmember, agentmembercode, department, departmentcode,finish_date from ( select 'DC_InternalRep_T001' as templateId,v1.id as id, reportcode, reportsubject, launchdate, reportdate, propose,proposecode, agentmember, agentmembercode, department, departmentcode,v2.finish_date from vm_generalreport v1 left join col_summary v2 on v1.id = v2.form_recordid union all select 'DC_InternalRep_4_001' as templateId,v1.id as id, reportcode, reportsubject, launchdate, reportdate, propose,proposecode, agentmember, agentmembercode, department, departmentcode,v2.finish_date from vm_generalreport_cap4 v1 left join col_summary v2 on v1.id = v2.form_recordid ) v where 1=1 order by v.finish_date desc );

-- statementId: CG_ProductChange_T001.select
-- case: 动态条件命中
-- type: select
-- assertion: 传入动态变量，验证最终 SQL 正常展开
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

-- statementId: CG_ProductChange_T001.select
-- case: 可选条件关闭
-- type: select
-- assertion: 移除可选动态属性，观察条件收缩后的 SQL
-- params: {}
select * from ( select 'CT_PFProChange_T001' as templateId, vp.id , vpc.productCode_detail as productcode, vpc.fundCode_detail as fundCode, vpc.productName_detail as productname, vp.changeTitle as subjectmatter, util_user.getMemberNameByMemId(vp.applyUser) as sendusername, util_org.getDeptNameByDeptId(vp.applyDepartMent) as senddepart, vp.applyDepartMent as departId, to_char(vp.applyDate, 'YYYY-MM-DD') senddate, vp.state as flowStatus, vp.applyUser as senduser from vm_product_changeson vpc left join vm_product_change vp on vpc.formmain_id = vp.id ) where 1 =1;

-- statementId: PDM_ProdReview_T001V1.select
-- case: 动态条件命中
-- type: select
-- assertion: 传入动态变量，验证最终 SQL 正常展开
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

-- statementId: PDM_ProdReview_T001V1.select
-- case: 可选条件关闭
-- type: select
-- assertion: 移除可选动态属性，观察条件收缩后的 SQL
-- params: {}
select * from (select distinct 'PDM_ProdReview_T001' as templateId,formmain_id as id, productcode, prdcode as fundcode, productname, subjectmatter, util_user.getMemberNameByMemId(senduser) as sendusername, util_org.getDeptNameByDeptId(senddepart) as senddepart, senddepart as departId, to_char(senddate,'YYYY-MM-DD')senddate,flowstatus,senduser from vm_fundproductinfo t left join vm_prodreviewson t1 on pirid = productcode left join vm_prodreview t2 on t1.formmain_id = t2.id where pirid = productcode and t1.formmain_id = t2.id union all select distinct 'CT_Project_T001' as templateId,s.id id, s.productcode productcode, s.fundcode fundcode, s.productname productname, c.subject || s.productname subjectmatter, util_user.getMemberNameByMemId(s.senduser) as sendusername, util_org.getDeptNameByDeptId(s.senddepart) as senddepart, senddepart as departId, to_char(s.senddate,'YYYY-MM-DD') senddate, s.flowstatus,s.senduser from vm_singleproject s ,col_summary c where s.id = c.form_recordid and c.case_id is not null union all select distinct 'CT_MProject_T001' as templateId, s.id id, s.productcode productcode, s.fundcode fundcode, s.productname productname, c.subject || s.productname subjectmatter, util_user.getMemberNameByMemId(s.senduser) as sendusername, util_org.getDeptNameByDeptId(s.senddepart) as senddepart, senddepart as departId, to_char(s.senddate,'YYYY-MM-DD') senddate, s.flowstatus,s.senduser from vm_doubleproject s ,col_summary c where s.id = c.form_recordid and c.case_id is not null union all select case when oldproadditional = 1 or oldprofeereduce = 1 then 'CT_PFProject_T006' else 'CT_PFProject_T001' end templateId, id, productcode productcode, fundcode fundcode, productname productname, subjectmatter, sendusername, senddepart, departId, to_char(senddate, 'YYYY-MM-DD') senddate, flowstatus, senduser from vm_establishmentofpublicfunds union all select 'CT_MProjectNew_T001' as templateId, id, productcode, fundcode, productname, subjectmatter, util_user.getMemberNameByMemId(senduser) as sendusername, util_org.getDeptNameByDeptId(senddepart) as senddepart, senddepart as departId, to_char(senddate, 'YYYY-MM-DD') senddate, flowstatus,senduser from vm_MProjectNew union all select 'CT_ProjectNew_T001' as templateId, id, productcode, fundcode, productname, subjectmatter, util_user.getMemberNameByMemId(senduser) as sendusername, util_org.getDeptNameByDeptId(senddepart) as senddepart, senddepart as departId, to_char(senddate, 'YYYY-MM-DD') senddate, flowstatus,senduser from vm_sProjectNew union all select distinct 'PD_publicCheck_T001' as templateId, t.id, productcode, fundcode, productname, subjectmatter, util_user.getMemberNameByMemId(senduser) as sendusername, util_org.getDeptNameByDeptId(senddepart) as senddepart, senddepart as departId, to_char(senddate,'YYYY-MM-DD')senddate,flowstatus,senduser from vm_productcheckcap4 t left join vm_productcheckCap4_son t1 on t1.formmain_id = t.id union all select distinct 'PDM_ProdReview_cap4' as templateId, formmain_id as id, wcp.productcode, wcp.fundcode, wcp.productname, wc.subjectMatter, util_user.getMemberNameByMemId(senduser) as sendusername, util_org.getDeptNameByDeptId(senddepart) as senddepart, senddepart as departId, to_char(senddate,'YYYY-MM-DD')senddate, FINISHEDFLAG flowstatus, senduser from VM_CAP_WF_PRODREVIEW wc left join VM_CAP_PRODUCTAPPROVESON wcp on wc.id = wcp.formmain_id where state = 1 union all select distinct 'PD_Anual_NJ_cap4' as templateId, formmain_id as id, pas.productcode, pas.fundcode, pas.productname, pa.subjectMatter, util_user.getMemberNameByMemId(senduser) as sendusername, util_org.getDeptNameByDeptId(senddepart) as senddepart, senddepart as departId, to_char(senddate,'YYYY-MM-DD')senddate, FINISHEDFLAG flowstatus, senduser from vm_cap_pension_approve pa left join vm_cap_pension_approveson pas on pa.id = pas.formmain_id where state = 1 ) where 1 =1;

-- statementId: CT_Approve_0001V1.select.count
-- case: 动态条件命中
-- type: select
-- assertion: 传入动态变量，验证最终 SQL 正常展开
-- params: {
--   "contractNo": "VALUE_001",
--   "snCode": "CODE_001",
--   "order": "order by id desc"
-- }
select count('x') from ( select va.id, vt.sn snCode, va.contractNo contractNo, util_common.getEnumShowById(va.contractType) contractType, util_user.getMemberNameByMemId(va.approveUserName) approveUserName, util_user.getMemCodeByMemId(va.approveUserName) as approveUserCode, util_org.getDeptNameByDeptId(va.approveUserDept) approveUserDept, util_org.getDeptCodeByDeptId(va.approveUserDept) as approveUserDeptCode, va.counterpartyName counterpartyName, va.title title, to_char(va.contractBeginDate, 'yyyy-mm-dd') contractBeginDate, to_char(va.contractEndDate, 'yyyy-mm-dd') contractEndDate, va.amount amount from VM_APPROVE_OLD va left join vm_assetdocument vt on vt.contractCode = va.contractNo union all select va.id, vt.sn snCode, va.contractNo contractNo, util_common.getEnumShowById(va.contractType) contractType, util_user.getMemberNameByMemId(va.approveUserName) approveUserName, util_user.getMemCodeByMemId(va.approveUserName) as approveUserCode, util_org.getDeptNameByDeptId(va.approveUserDept) approveUserDept, util_org.getDeptCodeByDeptId(va.approveUserDept) as approveUserDeptCode, va.counterpartyName counterpartyName, va.title title, to_char(va.contractBeginDate, 'yyyy-mm-dd') contractBeginDate, to_char(va.contractEndDate, 'yyyy-mm-dd') contractEndDate, va.amount amount from VM_APPROVE_NEW va left join vm_assetdocument vt on vt.contractCode = va.contractNo ) where 1 =1 AND contractNo = 'VALUE_001' AND snCode = 'CODE_001' order by id desc;

-- statementId: CT_Approve_0001V1.select.count
-- case: 可选条件关闭
-- type: select
-- assertion: 移除可选动态属性，观察条件收缩后的 SQL
-- params: {}
select count('x') from ( select va.id, vt.sn snCode, va.contractNo contractNo, util_common.getEnumShowById(va.contractType) contractType, util_user.getMemberNameByMemId(va.approveUserName) approveUserName, util_user.getMemCodeByMemId(va.approveUserName) as approveUserCode, util_org.getDeptNameByDeptId(va.approveUserDept) approveUserDept, util_org.getDeptCodeByDeptId(va.approveUserDept) as approveUserDeptCode, va.counterpartyName counterpartyName, va.title title, to_char(va.contractBeginDate, 'yyyy-mm-dd') contractBeginDate, to_char(va.contractEndDate, 'yyyy-mm-dd') contractEndDate, va.amount amount from VM_APPROVE_OLD va left join vm_assetdocument vt on vt.contractCode = va.contractNo union all select va.id, vt.sn snCode, va.contractNo contractNo, util_common.getEnumShowById(va.contractType) contractType, util_user.getMemberNameByMemId(va.approveUserName) approveUserName, util_user.getMemCodeByMemId(va.approveUserName) as approveUserCode, util_org.getDeptNameByDeptId(va.approveUserDept) approveUserDept, util_org.getDeptCodeByDeptId(va.approveUserDept) as approveUserDeptCode, va.counterpartyName counterpartyName, va.title title, to_char(va.contractBeginDate, 'yyyy-mm-dd') contractBeginDate, to_char(va.contractEndDate, 'yyyy-mm-dd') contractEndDate, va.amount amount from VM_APPROVE_NEW va left join vm_assetdocument vt on vt.contractCode = va.contractNo ) where 1 =1;

-- statementId: CT_Approve_0001V1.select
-- case: 动态条件命中
-- type: select
-- assertion: 传入动态变量，验证最终 SQL 正常展开
-- params: {
--   "contractNo": "VALUE_001",
--   "snCode": "CODE_001",
--   "order": "order by id desc"
-- }
select id, snCode, contractNo, contractType, approveUserName, approveUserCode, approveUserDept, approveUserDeptCode, counterpartyName, title, contractBeginDate, contractEndDate, amount from ( select va.id, vt.sn snCode, va.contractNo contractNo, util_common.getEnumShowById(va.contractType) contractType, util_user.getMemberNameByMemId(va.approveUserName) approveUserName, util_user.getMemCodeByMemId(va.approveUserName) as approveUserCode, util_org.getDeptNameByDeptId(va.approveUserDept) approveUserDept, util_org.getDeptCodeByDeptId(va.approveUserDept) as approveUserDeptCode, va.counterpartyName counterpartyName, va.title title, to_char(va.contractBeginDate, 'yyyy-mm-dd') contractBeginDate, to_char(va.contractEndDate, 'yyyy-mm-dd') contractEndDate, va.amount amount from VM_APPROVE_OLD va left join vm_assetdocument vt on vt.contractCode = va.contractNo union all select va.id, vt.sn snCode, va.contractNo contractNo, util_common.getEnumShowById(va.contractType) contractType, util_user.getMemberNameByMemId(va.approveUserName) approveUserName, util_user.getMemCodeByMemId(va.approveUserName) as approveUserCode, util_org.getDeptNameByDeptId(va.approveUserDept) approveUserDept, util_org.getDeptCodeByDeptId(va.approveUserDept) as approveUserDeptCode, va.counterpartyName counterpartyName, va.title title, to_char(va.contractBeginDate, 'yyyy-mm-dd') contractBeginDate, to_char(va.contractEndDate, 'yyyy-mm-dd') contractEndDate, va.amount amount from VM_APPROVE_NEW va left join vm_assetdocument vt on vt.contractCode = va.contractNo ) where 1 =1 AND contractNo = 'VALUE_001' AND snCode = 'CODE_001' order by id desc;

-- statementId: CT_Approve_0001V1.select
-- case: 可选条件关闭
-- type: select
-- assertion: 移除可选动态属性，观察条件收缩后的 SQL
-- params: {}
select id, snCode, contractNo, contractType, approveUserName, approveUserCode, approveUserDept, approveUserDeptCode, counterpartyName, title, contractBeginDate, contractEndDate, amount from ( select va.id, vt.sn snCode, va.contractNo contractNo, util_common.getEnumShowById(va.contractType) contractType, util_user.getMemberNameByMemId(va.approveUserName) approveUserName, util_user.getMemCodeByMemId(va.approveUserName) as approveUserCode, util_org.getDeptNameByDeptId(va.approveUserDept) approveUserDept, util_org.getDeptCodeByDeptId(va.approveUserDept) as approveUserDeptCode, va.counterpartyName counterpartyName, va.title title, to_char(va.contractBeginDate, 'yyyy-mm-dd') contractBeginDate, to_char(va.contractEndDate, 'yyyy-mm-dd') contractEndDate, va.amount amount from VM_APPROVE_OLD va left join vm_assetdocument vt on vt.contractCode = va.contractNo union all select va.id, vt.sn snCode, va.contractNo contractNo, util_common.getEnumShowById(va.contractType) contractType, util_user.getMemberNameByMemId(va.approveUserName) approveUserName, util_user.getMemCodeByMemId(va.approveUserName) as approveUserCode, util_org.getDeptNameByDeptId(va.approveUserDept) approveUserDept, util_org.getDeptCodeByDeptId(va.approveUserDept) as approveUserDeptCode, va.counterpartyName counterpartyName, va.title title, to_char(va.contractBeginDate, 'yyyy-mm-dd') contractBeginDate, to_char(va.contractEndDate, 'yyyy-mm-dd') contractEndDate, va.amount amount from VM_APPROVE_NEW va left join vm_assetdocument vt on vt.contractCode = va.contractNo ) where 1 =1;

-- statementId: AS_Asset_0001V1.select.count
-- case: 动态条件命中
-- type: select
-- assertion: 传入动态变量，验证最终 SQL 正常展开
-- params: {
--   "snCode": "CODE_001",
--   "startDate": "2026-05-14",
--   "endDate": "2026-05-14",
--   "order": "order by id desc"
-- }
select count('x') from ( select id,to_char(MODIFY_DATE, 'yyyy-mm-dd') as modifyDate, sn as snCode, assetsCode as assetsCode, util_common.getEnumShowById(assetCategory) as assetCategory, util_common.getEnumShowById(assetsName) as assetsName, to_char(buyTime, 'yyyy-mm-dd') as buyTime, util_org.getDeptNameByDeptId(useDepart) as useDepart, util_org.getDeptCodeByDeptId(useDepart) as useDepartCode, util_user.getMemCodeByMemId(useMember) as useMemberCode, util_user.getMemberNameByMemId(useMember) as useMember from vm_assetdocument ) where 1 =1 AND snCode = 'CODE_001' AND to_date(modifyDate,'YYYY-MM-DD') >=to_date('2026-05-14','YYYY-MM-DD') AND to_date(modifyDate,'YYYY-MM-DD') <=to_date('2026-05-14','YYYY-MM-DD') order by id desc;

-- statementId: AS_Asset_0001V1.select.count
-- case: 可选条件关闭
-- type: select
-- assertion: 移除可选动态属性，观察条件收缩后的 SQL
-- params: {}
select count('x') from ( select id,to_char(MODIFY_DATE, 'yyyy-mm-dd') as modifyDate, sn as snCode, assetsCode as assetsCode, util_common.getEnumShowById(assetCategory) as assetCategory, util_common.getEnumShowById(assetsName) as assetsName, to_char(buyTime, 'yyyy-mm-dd') as buyTime, util_org.getDeptNameByDeptId(useDepart) as useDepart, util_org.getDeptCodeByDeptId(useDepart) as useDepartCode, util_user.getMemCodeByMemId(useMember) as useMemberCode, util_user.getMemberNameByMemId(useMember) as useMember from vm_assetdocument ) where 1 =1;

-- statementId: AS_Asset_0001V1.select
-- case: 动态条件命中
-- type: select
-- assertion: 传入动态变量，验证最终 SQL 正常展开
-- params: {
--   "snCode": "CODE_001",
--   "startDate": "2026-05-14",
--   "endDate": "2026-05-14",
--   "order": "order by id desc"
-- }
select id, modifyDate, snCode, assetsCode, assetCategory, assetsName, buyTime, useDepart, useDepartCode, useMemberCode, useMember from ( select id,to_char(MODIFY_DATE, 'yyyy-mm-dd') as modifyDate, sn as snCode, assetsCode as assetsCode, util_common.getEnumShowById(assetCategory) as assetCategory, util_common.getEnumShowById(assetsName) as assetsName, to_char(buyTime, 'yyyy-mm-dd') as buyTime, util_org.getDeptNameByDeptId(useDepart) as useDepart, util_org.getDeptCodeByDeptId(useDepart) as useDepartCode, util_user.getMemCodeByMemId(useMember) as useMemberCode, util_user.getMemberNameByMemId(useMember) as useMember from vm_assetdocument ) where 1 =1 AND snCode = 'CODE_001' AND to_date(modifyDate,'YYYY-MM-DD') >=to_date('2026-05-14','YYYY-MM-DD') AND to_date(modifyDate,'YYYY-MM-DD') <=to_date('2026-05-14','YYYY-MM-DD') order by id desc;

-- statementId: AS_Asset_0001V1.select
-- case: 可选条件关闭
-- type: select
-- assertion: 移除可选动态属性，观察条件收缩后的 SQL
-- params: {}
select id, modifyDate, snCode, assetsCode, assetCategory, assetsName, buyTime, useDepart, useDepartCode, useMemberCode, useMember from ( select id,to_char(MODIFY_DATE, 'yyyy-mm-dd') as modifyDate, sn as snCode, assetsCode as assetsCode, util_common.getEnumShowById(assetCategory) as assetCategory, util_common.getEnumShowById(assetsName) as assetsName, to_char(buyTime, 'yyyy-mm-dd') as buyTime, util_org.getDeptNameByDeptId(useDepart) as useDepart, util_org.getDeptCodeByDeptId(useDepart) as useDepartCode, util_user.getMemCodeByMemId(useMember) as useMemberCode, util_user.getMemberNameByMemId(useMember) as useMember from vm_assetdocument ) where 1 =1;

-- statementId: CG_ProductChange_T001.select.count
-- case: 动态条件命中
-- type: select
-- assertion: 传入动态变量，验证最终 SQL 正常展开
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

-- statementId: CG_ProductChange_T001.select.count
-- case: 可选条件关闭
-- type: select
-- assertion: 移除可选动态属性，观察条件收缩后的 SQL
-- params: {}
select count('x') from ( select 'CT_PFProChange_T001' as templateId, vp.id , vpc.productCode_detail as productcode, vpc.fundCode_detail as fundCode, vpc.productName_detail as productname, vp.changeTitle as subjectmatter, util_user.getMemberNameByMemId(vp.applyUser) as sendusername, util_org.getDeptNameByDeptId(vp.applyDepartMent) as senddepart, vp.applyDepartMent as departId, to_char(vp.applyDate, 'YYYY-MM-DD') senddate, vp.state as flowStatus, vp.applyUser as senduser from vm_product_changeson vpc left join vm_product_change vp on vpc.formmain_id = vp.id ) where 1 =1;

-- statementId: PDM_ProdReview_T001V1.select.count
-- case: 动态条件命中
-- type: select
-- assertion: 传入动态变量，验证最终 SQL 正常展开
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

-- statementId: PDM_ProdReview_T001V1.select.count
-- case: 可选条件关闭
-- type: select
-- assertion: 移除可选动态属性，观察条件收缩后的 SQL
-- params: {}
select count('x') from ( select distinct formmain_id as id, productcode, prdcode as fundcode, productname, subjectmatter, util_user.getMemberNameByMemId(senduser) as sendusername, util_org.getDeptNameByDeptId(senddepart) as senddepart, senddepart as departId, to_char(senddate,'YYYY-MM-DD')senddate,flowstatus,senduser from vm_fundproductinfo t left join vm_prodreviewson t1 on pirid = productcode left join vm_prodreview t2 on t1.formmain_id = t2.id where pirid = productcode and t1.formmain_id = t2.id union all select distinct s.id id, s.productcode productcode, s.fundcode fundcode, s.productname productname, c.subject || s.productname subjectmatter, util_user.getMemberNameByMemId(s.senduser) as sendusername, util_org.getDeptNameByDeptId(s.senddepart) as senddepart, senddepart as departId, to_char(s.senddate,'YYYY-MM-DD') senddate, s.flowstatus,s.senduser from vm_singleproject s ,col_summary c where s.id = c.form_recordid and c.case_id is not null union all select distinct s.id id , s.productcode productcode, s.fundcode fundcode, s.productname productname, c.subject || s.productname subjectmatter, util_user.getMemberNameByMemId(s.senduser) as sendusername, util_org.getDeptNameByDeptId(s.senddepart) as senddepart, senddepart as departId, to_char(s.senddate,'YYYY-MM-DD') senddate, s.flowstatus,s.senduser from vm_doubleproject s ,col_summary c where s.id = c.form_recordid and c.case_id is not null union all select id, productcode productcode, fundcode fundcode, productname productname, subjectmatter, sendusername, senddepart, departId, to_char(senddate,'YYYY-MM-DD') senddate, flowstatus,senduser from vm_establishmentofpublicfunds union all select id, productcode, fundcode, productname, subjectmatter, util_user.getMemberNameByMemId(senduser) as sendusername, util_org.getDeptNameByDeptId(senddepart) as senddepart, senddepart as departId, to_char(senddate, 'YYYY-MM-DD') senddate, flowstatus,senduser from vm_MProjectNew union all select id, productcode, fundcode, productname, subjectmatter, util_user.getMemberNameByMemId(senduser) as sendusername, util_org.getDeptNameByDeptId(senddepart) as senddepart, senddepart as departId, to_char(senddate, 'YYYY-MM-DD') senddate, flowstatus,senduser from vm_sProjectNew union all select distinct t.id, productcode, fundcode, productname, subjectmatter, util_user.getMemberNameByMemId(senduser) as sendusername, util_org.getDeptNameByDeptId(senddepart) as senddepart, senddepart as departId, to_char(senddate,'YYYY-MM-DD')senddate,flowstatus,senduser from vm_productcheckcap4 t left join vm_productcheckCap4_son t1 on t1.formmain_id = t.id union all select distinct formmain_id as id, wcp.productcode, wcp.fundcode, wcp.productname, wc.subjectMatter, util_user.getMemberNameByMemId(senduser) as sendusername, util_org.getDeptNameByDeptId(senddepart) as senddepart, senddepart as departId, to_char(senddate,'YYYY-MM-DD')senddate, FINISHEDFLAG flowstatus, senduser from VM_CAP_WF_PRODREVIEW wc left join VM_CAP_PRODUCTAPPROVESON wcp on wc.id = wcp.formmain_id where state = 1 union all select distinct formmain_id as id, pas.productcode, pas.fundcode, pas.productname, pa.subjectMatter, util_user.getMemberNameByMemId(senduser) as sendusername, util_org.getDeptNameByDeptId(senddepart) as senddepart, senddepart as departId, to_char(senddate,'YYYY-MM-DD')senddate, FINISHEDFLAG flowstatus, senduser from vm_cap_pension_approve pa left join vm_cap_pension_approveson pas on pa.id = pas.formmain_id where state = 1 ) where 1 =1;

-- statementId: PDM_ProdReview_T001.select
-- case: 动态条件命中
-- type: select
-- assertion: 传入动态变量，验证最终 SQL 正常展开
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

-- statementId: PDM_ProdReview_T001.select
-- case: 可选条件关闭
-- type: select
-- assertion: 移除可选动态属性，观察条件收缩后的 SQL
-- params: {}
select distinct 'PDM_ProdReview_T001' as templateId, formmain_id as id,productcode,prdcode as fundcode,productname,subjectmatter, util_user.getMemberNameByMemId(senduser) as sendusername, util_org.getDeptNameByDeptId(senddepart) as senddepart, to_char(senddate,'YYYY-MM-DD')senddate,flowstatus, senddepart ad departId from vm_fundproductinfo t left join vm_prodreviewson t1 on pirid = productcode left join vm_prodreview t2 on t1.formmain_id = t2.id where pirid = productcode and t1.formmain_id = t2.id;

-- statementId: PDM_ProdReview_T001.select.count
-- case: 动态条件命中
-- type: select
-- assertion: 传入动态变量，验证最终 SQL 正常展开
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

-- statementId: PDM_ProdReview_T001.select.count
-- case: 可选条件关闭
-- type: select
-- assertion: 移除可选动态属性，观察条件收缩后的 SQL
-- params: {}
select count('x') from (select distinct formmain_id as id,productcode,prdcode as fundcode,productname,subjectmatter, util_user.getMemberNameByMemId(senduser) as sendusername, util_org.getDeptNameByDeptId(senddepart) as senddepart, to_char(senddate,'YYYY-MM-DD')senddate,flowstatus senddepart ad departId from vm_fundproductinfo t left join vm_prodreviewson t1 on pirid = productcode left join vm_prodreview t2 on t1.formmain_id = t2.id where pirid = productcode and t1.formmain_id = t2.id );

-- statementId: CT_Approve_T006.select
-- case: 动态条件命中
-- type: select
-- assertion: 传入动态变量，验证最终 SQL 正常展开
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

-- statementId: CT_Approve_T006.select
-- case: 可选条件关闭
-- type: select
-- assertion: 移除可选动态属性，观察条件收缩后的 SQL
-- params: {}
select id, templateId, productcode, fundcode, productname, contracttitle, sendusername, contractcode, anagoguename, contracttype, senddate, flowstatus, senddepart, senddepart as departId from (select distinct formmain_id as id,'CT_Approve_T006' as templateId, productcode,prdcode as fundcode, productname, subjectMatter, subjectMatter as contracttitle, util_user.getMemberNameByMemId(senduser) as sendusername, sendUser, contractcode, anagoguename, util_common.getEnumShowById(contracttype) as contracttype, to_char(senddate,'YYYY-MM-DD')senddate, flowstatus, util_org.getDeptNameByDeptId(departId) as senddepart, departId from vm_fundproductinfo t left join vm_ApproveSon t1 on pirid = productcode left join vm_Approve t2 on t1.formmain_id = t2.id where pirid = productcode and t1.formmain_id = t2.id and 1=1 union all select distinct t.id, 'PD_publicContract_01' as templateId, productcode, fundcode, productname, contracttitle subjectMatter, contracttitle, util_user.getMemberNameByMemId(senduser) as sendusername, sendUser, contractcode, anagoguename, util_common.getEnumShowById(contracttype) as contracttype, to_char(senddate,'YYYY-MM-DD') senddate, flowstatus, util_org.getDeptNameByDeptId(senddepart) as senddepart, senddepart as departId from vm_productcontractcap4 t left join vm_productContractCap4_son t1 on t.id = formmain_id union all select distinct formmain_id as id, 'CT_Approve_cap4' as templateId, productcode, fundcode, productname, contracttitle subjectMatter, contracttitle, util_user.getMemberNameByMemId(senduser) as sendusername, sendUser, contractcode, anagoguename, util_common.getEnumShowById(contracttype) as contracttype, to_char(senddate, 'YYYY-MM-DD') senddate, FINISHEDFLAG flowstatus, util_org.getDeptNameByDeptId(senddepart) as senddepart, senddepart departId from VM_CAP_WF_PRODCONTRACT wc left join VM_CAP_APPROVESON wcp on wc.id = wcp.formmain_id where state = 1 union all select distinct formmain_id as id, 'CT_Anual_NJ_cap4' as templateId, productcode, fundcode, productname, contracttitle subjectMatter, contracttitle, util_user.getMemberNameByMemId(senduser) as sendusername, sendUser, contractcode, anagoguename, util_common.getEnumShowById(contracttype) as contracttype, to_char(senddate, 'YYYY-MM-DD') senddate, FINISHEDFLAG flowstatus, util_org.getDeptNameByDeptId(senddepart) as senddepart, senddepart departId from vm_cap_pension_contract pc left join vm_cap_pension_contractson pcs on pc.id = pcs.formmain_id where state = 1 ) where 1 = 1;

-- statementId: CT_Approve_T006.select.count
-- case: 动态条件命中
-- type: select
-- assertion: 传入动态变量，验证最终 SQL 正常展开
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

-- statementId: CT_Approve_T006.select.count
-- case: 可选条件关闭
-- type: select
-- assertion: 移除可选动态属性，观察条件收缩后的 SQL
-- params: {}
select count('x') from (select distinct formmain_id as id, productcode,prdcode as fundcode, productname, subjectMatter, subjectMatter as contracttitle, util_user.getMemberNameByMemId(senduser) as sendusername, sendUser, contractcode, anagoguename, util_common.getEnumShowById(contracttype) as contracttype, to_char(senddate,'YYYY-MM-DD')senddate, flowstatus, util_org.getDeptNameByDeptId(departId) as senddepart, departId from vm_fundproductinfo t left join vm_ApproveSon t1 on pirid = productcode left join vm_Approve t2 on t1.formmain_id = t2.id where pirid = productcode and t1.formmain_id = t2.id union all select distinct t.id, productcode, fundcode, productname, contracttitle subjectMatter, contracttitle, util_user.getMemberNameByMemId(senduser) as sendusername, sendUser, contractcode, anagoguename, util_common.getEnumShowById(contracttype) as contracttype, to_char(senddate,'YYYY-MM-DD') senddate, flowstatus, util_org.getDeptNameByDeptId(senddepart) as senddepart, senddepart as departId from vm_productcontractcap4 t left join vm_productContractCap4_son t1 on t.id = formmain_id union all select distinct formmain_id as id, productcode, fundcode, productname, contracttitle subjectMatter, contracttitle, util_user.getMemberNameByMemId(senduser) as sendusername, sendUser, contractcode, anagoguename, util_common.getEnumShowById(contracttype) as contracttype, to_char(senddate, 'YYYY-MM-DD') senddate, FINISHEDFLAG flowstatus, util_org.getDeptNameByDeptId(senddepart) as senddepart, senddepart departId from VM_CAP_WF_PRODCONTRACT wc left join VM_CAP_APPROVESON wcp on wc.id = wcp.formmain_id where state = 1 union all select distinct formmain_id as id, productcode, fundcode, productname, contracttitle subjectMatter, contracttitle, util_user.getMemberNameByMemId(senduser) as sendusername, sendUser, contractcode, anagoguename, util_common.getEnumShowById(contracttype) as contracttype, to_char(senddate, 'YYYY-MM-DD') senddate, FINISHEDFLAG flowstatus, util_org.getDeptNameByDeptId(senddepart) as senddepart, senddepart departId from vm_cap_pension_contract pc left join vm_cap_pension_contractson pcs on pc.id = pcs.formmain_id where state = 1 ) where 1 = 1;

-- statementId: DC_External_T002.select
-- case: 动态条件命中
-- type: select
-- assertion: 传入动态变量，验证最终 SQL 正常展开
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

-- statementId: DC_External_T002.select
-- case: 可选条件关闭
-- type: select
-- assertion: 移除可选动态属性，观察条件收缩后的 SQL
-- params: {}
select id, templateId, productcode, fundcode, productname, doccode, doctitle, sendusername, senddepart, senddate, flowstatus from ( select distinct formmain_id as id,'DC_External_T002' as templateId, productcode, prdcode as fundcode, productname, doccode, subjectMatter as doctitle, util_user.getMemberNameByMemId(senduser) as sendusername, sendUser, util_org.getDeptNameByDeptId(senddepart) as senddepart, to_char(senddate,'YYYY-MM-DD')senddate, flowstatus from vm_fundproductinfo t left join vm_DCExternalSon t1 on pirid = productcode left join vm_DCExternal t2 on t1.formmain_id = t2.id where pirid = productcode and docflowtype = '产品管理' and t1.formmain_id = t2.id UNION ALL select distinct formmain_id as id,'DC_External4_T002' as templateId, productcode, prdcode as fundcode, productname, doccode, subjectMatter as doctitle, util_user.getMemberNameByMemId(senduser) as sendusername, sendUser, util_org.getDeptNameByDeptId(senddepart) as senddepart, to_char(senddate,'YYYY-MM-DD')senddate, flowstatus from vm_fundproductinfoCap4 t left join vm_DCExternalSon_cap4 t1 on pirid = productcode left join vm_DCExternal_cap4 t2 on t1.formmain_id = t2.id where pirid = productcode and docflowtype = '产品管理' and t1.formmain_id = t2.id ) where 1 =1;

-- statementId: DC_External_T002.select.count
-- case: 动态条件命中
-- type: select
-- assertion: 传入动态变量，验证最终 SQL 正常展开
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

-- statementId: DC_External_T002.select.count
-- case: 可选条件关闭
-- type: select
-- assertion: 移除可选动态属性，观察条件收缩后的 SQL
-- params: {}
select count('x') from ( select id, templateId, productcode, fundcode, productname, doccode, doctitle, sendusername, senddepart, senddate, flowstatus from ( select distinct formmain_id as id,'DC_External_T002' as templateId, productcode, prdcode as fundcode, productname, doccode, subjectMatter as doctitle, util_user.getMemberNameByMemId(senduser) as sendusername, sendUser, util_org.getDeptNameByDeptId(senddepart) as senddepart, to_char(senddate,'YYYY-MM-DD')senddate, flowstatus from vm_fundproductinfo t left join vm_DCExternalSon t1 on pirid = productcode left join vm_DCExternal t2 on t1.formmain_id = t2.id where pirid = productcode and docflowtype = '产品管理' and t1.formmain_id = t2.id UNION ALL select distinct formmain_id as id,'DC_External4_T002' as templateId, productcode, prdcode as fundcode, productname, doccode, subjectMatter as doctitle, util_user.getMemberNameByMemId(senduser) as sendusername, sendUser, util_org.getDeptNameByDeptId(senddepart) as senddepart, to_char(senddate,'YYYY-MM-DD')senddate, flowstatus from vm_fundproductinfoCap4 t left join vm_DCExternalSon_cap4 t1 on pirid = productcode left join vm_DCExternal_cap4 t2 on t1.formmain_id = t2.id where pirid = productcode and docflowtype = '产品管理' and t1.formmain_id = t2.id ) where 1 =1 );

-- statementId: SL_Apply_T001V1.select
-- case: 动态条件命中
-- type: select
-- assertion: 传入动态变量，验证最终 SQL 正常展开
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

-- statementId: SL_Apply_T001V1.select
-- case: 可选条件关闭
-- type: select
-- assertion: 移除可选动态属性，观察条件收缩后的 SQL
-- params: {}
select * from ( select distinct formmain_id as id,'SL_Apply_T001' as templateId, productcode, prdcode as fundcode, productname, subjectMatter, util_user.getMemberNameByMemId(senduser) as sendusername, to_char(senddate,'YYYY-MM-DD') senddate, flowstatus, senduser, util_org.getDeptNameByDeptId(senddepart) as senddepart, senddepart as departId from vm_fundproductinfo t left join vm_PDMProdReviewson t1 on pirid = productcode left join vm_PDMProdReview t2 on t1.formmain_id = t2.id where pirid = productcode and sealtype = util_common.getEnumIdByRefName('用章业务','产品管理业务') and subdivision != -9172006034010128312 and t1.formmain_id = t2.id UNION ALL select distinct s.id id, decode (s.type, '-4623859796867068930', 'CT_OProject_T001', 'CT_OProject_T002') as templateId, s.productcode productcode, s.fundcode fundcode, s.productname productname, c.subject || s.productname subjectmatter, util_user.getMemberNameByMemId(s.senduser) as sendusername, to_char(s.senddate,'YYYY-MM-DD') senddate, s.flowstatus,senduser, util_org.getDeptNameByDeptId(senddepart) as senddepart, senddepart as departId from vm_checkproject s ,col_summary c where s.id = c.form_recordid and c.case_id is not null UNION ALL select distinct t1.id, templateId, productcode, prdcode as fundcode, productname , subjectmatter, sendusername, senddate, flowstatus, senduser, senddepart, departId from vm_wfLOFPFPronect t1 left join vm_fundproductinfo t2 on t1.productcode = t2.pirid union all select distinct id, templateId, productcode, fundcode, productname , subjectmatter, sendusername, senddate, flowstatus, senduser, senddepart, departId from vw_PublicOffering_Reported union all select distinct id, templateId, productcode, fundcode, productname , subjectmatter, sendusername, senddate, flowstatus, senduser, senddepart, departId from vw_PublicOffering_Supplement ) where 1 =1;

-- statementId: SL_Apply_T001V1.select.count
-- case: 动态条件命中
-- type: select
-- assertion: 传入动态变量，验证最终 SQL 正常展开
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

-- statementId: SL_Apply_T001V1.select.count
-- case: 可选条件关闭
-- type: select
-- assertion: 移除可选动态属性，观察条件收缩后的 SQL
-- params: {}
select count('x') from( select distinct formmain_id as id, 'SL_Apply_T001' as templateId, productcode, prdcode as fundcode, subjectMatter, productname, util_user.getMemberNameByMemId(senduser) as sendusername, to_char(senddate,'YYYY-MM-DD') senddate, flowstatus, senduser, util_org.getDeptNameByDeptId(senddepart) as senddepart, senddepart as departId from vm_fundproductinfo t left join vm_PDMProdReviewson t1 on pirid = productcode left join vm_PDMProdReview t2 on t1.formmain_id = t2.id where pirid = productcode and sealtype = util_common.getEnumIdByRefName('用章业务','产品管理业务') and subdivision != -9172006034010128312 and t1.formmain_id = t2.id UNION ALL select distinct s.id id,'CT_OProject_T001' as templateId, s.productcode productcode, s.fundcode fundcode, s.productname productname, c.subject || s.productname subjectmatter, util_user.getMemberNameByMemId(s.senduser) as sendusername, to_char(s.senddate,'YYYY-MM-DD') senddate, s.flowstatus,senduser, util_org.getDeptNameByDeptId(senddepart) as senddepart, senddepart as departId from vm_checkproject s ,col_summary c where s.id = c.form_recordid and c.case_id is not null UNION ALL select distinct t1.id, templateId, productcode, prdcode as fundcode, productname , subjectmatter, sendusername, senddate, flowstatus, senduser, senddepart, departId from vm_wfLOFPFPronect t1 left join vm_fundproductinfo t2 on t1.productcode = t2.pirid union all select distinct id, templateId, productcode, fundcode, productname , subjectmatter, sendusername, senddate, flowstatus, senduser, senddepart, departId from vw_PublicOffering_Reported union all select distinct id, templateId, productcode, fundcode, productname , subjectmatter, sendusername, senddate, flowstatus, senduser, senddepart, departId from vw_PublicOffering_Supplement) where 1 =1;

-- statementId: SL_Apply_T001.select
-- case: 动态条件命中
-- type: select
-- assertion: 传入动态变量，验证最终 SQL 正常展开
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

-- statementId: SL_Apply_T001.select
-- case: 可选条件关闭
-- type: select
-- assertion: 移除可选动态属性，观察条件收缩后的 SQL
-- params: {}
select distinct formmain_id as id, productcode, prdcode as fundcode, productname, subjectMatter, util_user.getMemberNameByMemId(senduser) as sendusername, to_char(senddate,'YYYY-MM-DD')senddate, flowstatus, util_org.getDeptNameByDeptId(senddepart) as senddepart, senddepart as departId from vm_fundproductinfo t left join vm_PDMProdReviewson t1 on pirid = productcode left join vm_PDMProdReview t2 on t1.formmain_id = t2.id where pirid = productcode and sealtype = util_common.getEnumIdByRefName('用章业务','产品管理业务') and t1.formmain_id = t2.id;

-- statementId: SL_Apply_T001.select.count
-- case: 动态条件命中
-- type: select
-- assertion: 传入动态变量，验证最终 SQL 正常展开
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

-- statementId: SL_Apply_T001.select.count
-- case: 可选条件关闭
-- type: select
-- assertion: 移除可选动态属性，观察条件收缩后的 SQL
-- params: {}
select count('x') from(select distinct formmain_id as id, productcode, prdcode as fundcode, productname, subjectMatter, util_user.getMemberNameByMemId(senduser) as sendusername, to_char(senddate,'YYYY-MM-DD')senddate, flowstatus, util_org.getDeptNameByDeptId(senddepart) as senddepart, senddepart as departId from vm_fundproductinfo t left join vm_PDMProdReviewson t1 on pirid = productcode left join vm_PDMProdReview t2 on t1.formmain_id = t2.id where pirid = productcode and sealtype = util_common.getEnumIdByRefName('用章业务','产品管理业务') and t1.formmain_id = t2.id );

-- statementId: CT_PFProject_T001.select
-- case: 动态条件命中
-- type: select
-- assertion: 传入动态变量，验证最终 SQL 正常展开
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

-- statementId: CT_PFProject_T001.select
-- case: 可选条件关闭
-- type: select
-- assertion: 移除可选动态属性，观察条件收缩后的 SQL
-- params: {}
select id, 'CT_PFProject_T001' as templateId, sendusername, fundcode, to_char(senddate,'YYYY-MM-DD') senddate, subjectmatter, productcode, productname, flowstatus, senddepart, departId from vm_establishmentofpublicfunds where 1=1;

-- statementId: CT_PFProject_T001.select.count
-- case: 动态条件命中
-- type: select
-- assertion: 传入动态变量，验证最终 SQL 正常展开
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

-- statementId: CT_PFProject_T001.select.count
-- case: 可选条件关闭
-- type: select
-- assertion: 移除可选动态属性，观察条件收缩后的 SQL
-- params: {}
select count('x') from vm_establishmentofpublicfunds where 1=1;

-- statementId: getFlowSearchConfig.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: "VALUE_001"
select flowtype,fieldname,fieldid,switchway,switchrule,ismust from vm_flowSearchConfig where flowtype = 'VALUE_001';

-- statementId: getFlowTaskSearchConfig.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: "VALUE_001"
select flowtype,fieldname,fieldid,switchway,switchrule,ismust from vm_flowTaskSearchConfig where flowtype = 'VALUE_001';

-- statementId: SL_Apply_T001FlowTask.select
-- case: 动态条件命中
-- type: select
-- assertion: 传入动态变量，验证最终 SQL 正常展开
-- params: {
--   "userID": 1001,
--   "order": "order by id desc"
-- }
SELECT ca.id as id,om.name as senderLoginName, ca.SUBJECT as subject, nvl(op.login_name, 'flowbot') sendername, ca.MEMBER_ID as memberId, ca.OBJECT_ID as objectId, ca.ACTIVITY_ID as activityId, to_char(ca.RECEIVE_TIME, 'yyyymmdd') as receiveTime, ca.STATE as state, ca.is_delete as isDelete, ca.TEMPLETE_ID as templeteId, cs.PROCESS_ID as processId from CTP_AFFAIR ca left join org_principal op on ca.sender_id = op.member_id left join org_member om on ca.sender_id = om.id left join col_summary cs on ca.object_id = cs.id left join vm_pdmprodreview t1 on t1.id = cs.form_recordid where ca.app in (1) and t1.sealtype = util_common.getEnumIdByRefName('用章业务', '产品管理业务') and ca.state in (3,7,8) and ca.member_id = 1001 order by id desc;

-- statementId: SL_Apply_T001FlowTask.select
-- case: 可选条件关闭
-- type: select
-- assertion: 移除可选动态属性，观察条件收缩后的 SQL
-- params: {
--   "userID": 1001
-- }
SELECT ca.id as id,om.name as senderLoginName, ca.SUBJECT as subject, nvl(op.login_name, 'flowbot') sendername, ca.MEMBER_ID as memberId, ca.OBJECT_ID as objectId, ca.ACTIVITY_ID as activityId, to_char(ca.RECEIVE_TIME, 'yyyymmdd') as receiveTime, ca.STATE as state, ca.is_delete as isDelete, ca.TEMPLETE_ID as templeteId, cs.PROCESS_ID as processId from CTP_AFFAIR ca left join org_principal op on ca.sender_id = op.member_id left join org_member om on ca.sender_id = om.id left join col_summary cs on ca.object_id = cs.id left join vm_pdmprodreview t1 on t1.id = cs.form_recordid where ca.app in (1) and t1.sealtype = util_common.getEnumIdByRefName('用章业务', '产品管理业务') and ca.state in (3,7,8) and ca.member_id = 1001;

-- statementId: PDM_ProdReview_T001FlowTask.select
-- case: 动态条件命中
-- type: select
-- assertion: 传入动态变量，验证最终 SQL 正常展开
-- params: {
--   "templateId": 1001,
--   "userID": 1001,
--   "order": "order by id desc"
-- }
SELECT ca.id as id,om.name as senderLoginName, ca.SUBJECT as subject, nvl(op.login_name, 'flowbot') sendername, ca.MEMBER_ID as memberId, ca.OBJECT_ID as objectId, ca.ACTIVITY_ID as activityId, to_char(ca.RECEIVE_TIME, 'yyyymmdd') as receiveTime, ca.STATE as state, ca.is_delete as isDelete, ca.TEMPLETE_ID as templeteId, cs.PROCESS_ID as processId from CTP_AFFAIR ca left join org_principal op on ca.sender_id = op.member_id left join org_member om on ca.sender_id = om.id left join col_summary cs on ca.object_id = cs.id where ca.app in (1) and ca.state in (3,7,8) and ca.templete_id = 1001 and ca.member_id = 1001 order by id desc;

-- statementId: PDM_ProdReview_T001FlowTask.select
-- case: 可选条件关闭
-- type: select
-- assertion: 移除可选动态属性，观察条件收缩后的 SQL
-- params: {
--   "templateId": 1001,
--   "userID": 1001
-- }
SELECT ca.id as id,om.name as senderLoginName, ca.SUBJECT as subject, nvl(op.login_name, 'flowbot') sendername, ca.MEMBER_ID as memberId, ca.OBJECT_ID as objectId, ca.ACTIVITY_ID as activityId, to_char(ca.RECEIVE_TIME, 'yyyymmdd') as receiveTime, ca.STATE as state, ca.is_delete as isDelete, ca.TEMPLETE_ID as templeteId, cs.PROCESS_ID as processId from CTP_AFFAIR ca left join org_principal op on ca.sender_id = op.member_id left join org_member om on ca.sender_id = om.id left join col_summary cs on ca.object_id = cs.id where ca.app in (1) and ca.state in (3,7,8) and ca.templete_id = 1001 and ca.member_id = 1001;

-- statementId: CT_Approve_T006FlowTask.select
-- case: 动态条件命中
-- type: select
-- assertion: 传入动态变量，验证最终 SQL 正常展开
-- params: {
--   "templateId": 1001,
--   "userID": 1001,
--   "order": "order by id desc"
-- }
SELECT ca.id as id,om.name as senderLoginName, ca.SUBJECT as subject, nvl(op.login_name, 'flowbot') sendername, ca.MEMBER_ID as memberId, ca.OBJECT_ID as objectId, ca.ACTIVITY_ID as activityId, to_char(ca.RECEIVE_TIME, 'yyyymmdd') as receiveTime, ca.STATE as state, ca.is_delete as isDelete, ca.TEMPLETE_ID as templeteId, cs.PROCESS_ID as processId from CTP_AFFAIR ca left join org_principal op on ca.sender_id = op.member_id left join org_member om on ca.sender_id = om.id left join col_summary cs on ca.object_id = cs.id where ca.app in (1) and ca.state in (3,7,8) and ca.templete_id = 1001 and ca.member_id = 1001 order by id desc;

-- statementId: CT_Approve_T006FlowTask.select
-- case: 可选条件关闭
-- type: select
-- assertion: 移除可选动态属性，观察条件收缩后的 SQL
-- params: {
--   "templateId": 1001,
--   "userID": 1001
-- }
SELECT ca.id as id,om.name as senderLoginName, ca.SUBJECT as subject, nvl(op.login_name, 'flowbot') sendername, ca.MEMBER_ID as memberId, ca.OBJECT_ID as objectId, ca.ACTIVITY_ID as activityId, to_char(ca.RECEIVE_TIME, 'yyyymmdd') as receiveTime, ca.STATE as state, ca.is_delete as isDelete, ca.TEMPLETE_ID as templeteId, cs.PROCESS_ID as processId from CTP_AFFAIR ca left join org_principal op on ca.sender_id = op.member_id left join org_member om on ca.sender_id = om.id left join col_summary cs on ca.object_id = cs.id where ca.app in (1) and ca.state in (3,7,8) and ca.templete_id = 1001 and ca.member_id = 1001;

-- statementId: DC_External_T002FlowTask.select
-- case: 动态条件命中
-- type: select
-- assertion: 传入动态变量，验证最终 SQL 正常展开
-- params: {
--   "templateId": 1001,
--   "userID": 1001,
--   "order": "order by id desc"
-- }
SELECT ca.id as id,om.name as senderLoginName, ca.SUBJECT as subject, nvl(op.login_name, 'flowbot') sendername, ca.MEMBER_ID as memberId, ca.OBJECT_ID as objectId, ca.ACTIVITY_ID as activityId, to_char(ca.RECEIVE_TIME, 'yyyymmdd') as receiveTime, ca.STATE as state, ca.is_delete as isDelete, ca.TEMPLETE_ID as templeteId, cs.PROCESS_ID as processId from CTP_AFFAIR ca left join org_principal op on ca.sender_id = op.member_id left join org_member om on ca.sender_id = om.id left join col_summary cs on ca.object_id = cs.id where ca.app in (1) and ca.state in (3,7,8) and ca.templete_id = 1001 and ca.member_id = 1001 order by id desc;

-- statementId: DC_External_T002FlowTask.select
-- case: 可选条件关闭
-- type: select
-- assertion: 移除可选动态属性，观察条件收缩后的 SQL
-- params: {
--   "templateId": 1001,
--   "userID": 1001
-- }
SELECT ca.id as id,om.name as senderLoginName, ca.SUBJECT as subject, nvl(op.login_name, 'flowbot') sendername, ca.MEMBER_ID as memberId, ca.OBJECT_ID as objectId, ca.ACTIVITY_ID as activityId, to_char(ca.RECEIVE_TIME, 'yyyymmdd') as receiveTime, ca.STATE as state, ca.is_delete as isDelete, ca.TEMPLETE_ID as templeteId, cs.PROCESS_ID as processId from CTP_AFFAIR ca left join org_principal op on ca.sender_id = op.member_id left join org_member om on ca.sender_id = om.id left join col_summary cs on ca.object_id = cs.id where ca.app in (1) and ca.state in (3,7,8) and ca.templete_id = 1001 and ca.member_id = 1001;

-- statementId: getFormBindInfo.select
-- case: 无参基础场景
-- type: select
-- assertion: 不传参数，验证固定 SQL 可直接生成
-- params: {}
select field0007 as key,field0008 as value from formmain_3537;

-- statementId: findFormOperationId.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "viewName": "NAME_001",
--   "tableName": "NAME_001"
-- }
SELECT to_char(replace(wm_concat(t.name || '.' || t.value),',','_')) as id FROM (select '/QueryList/Query[@name="' || 'NAME_001' || '"]/ShowsThrough/Colum' XPATH, f.* from form_definition f where f.name = 'NAME_001') f, xmltable(f.XPATH passing xmltype(nvl(f.query_info, '<root/>')) columns "NAME" path '@name', "VALUE" path '@value') t;

-- statementId: findTemplatedByBingName.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: "NAME_001"
select c.templete_number from ctp_template c where subject = 'NAME_001' and c.templete_number is not null;

-- statementId: findRptDesignIdByRptDesignName.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: "NAME_001"
select vr.id from VREPORT_RECORD vr where vr.record_subject = 'NAME_001';

-- statementId: findMeetingRoomManagerById.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "currentUserId": 1001
-- }
select OFF_ADMIN from MEETING_ROOM where OFF_ADMIN=1001;

-- statementId: findConfereesByMeetingId.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "meetingId": 1001
-- }
select CONFEREES from meeting where id=1001;

-- statementId: findMemeberNameByDepartmentId.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "departmentId": 1001
-- }
select name from ORG_MEMBER where ORG_DEPARTMENT_ID=1001 and IS_ENABLE='1' and STATE='1' and IS_DELETED='0';

-- statementId: findMemeberNameByMemberId.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "memberId": 1001
-- }
select name from ORG_MEMBER where id=1001 and IS_ENABLE='1' and STATE='1' and IS_DELETED='0';

-- statementId: findMemeberNameByAccountId.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "accountId": 1
-- }
select name from ORG_MEMBER where ORG_ACCOUNT_ID=1 and IS_ENABLE='1' and STATE='1' and IS_DELETED='0';

-- statementId: getWhiteRightId.select
-- case: 无参基础场景
-- type: select
-- assertion: 不传参数，验证固定 SQL 可直接生成
-- params: {}
select RIGHTID from VM_WHITERIGHTID_FORM;

-- statementId: fieldMap.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: "NAME_001"
SELECT T.* FROM (SELECT T2.Field_Info FROM FORM_DEFINITION T2 WHERE T2.name='NAME_001') S1, XMLTABLE('TableList/Table/FieldList/Field' PASSING XMLTYPE(S1.Field_Info) COLUMNS "name" VARCHAR2(50) PATH '@name', "display" VARCHAR2(50) PATH '@display') T;

-- statementId: getNodeConfigurarion.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "activityId": 1001,
--   "workFlowId": 1001
-- }
select extractvalue(xmltype(w.workflow), '/ps/p/n[@d][@i="' || 1001 || '"]/@d') as d from wf_process_templete w where id = 1001;

-- statementId: templateInfoByTemplateId.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: 1001
select cp.workflow_id, cp.form_appid from ctp_template cp where id = 1001;

-- statementId: formNameByFormAppId.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: 1001
select name from form_definition where id = 1001;

-- statementId: getCapFormDefNameById.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: 1001
select name from cap_form_definition where id = 1001;

-- statementId: findFieldMap.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: 1001
select distinct vc_fieldname,vc_fielddisplay from vm_formfield where n_formid= 1001;

-- statementId: DT_DirectorManager_T001.select
-- case: 动态条件命中
-- type: select
-- assertion: 传入动态变量，验证最终 SQL 正常展开
-- params: {
--   "isResume": "RAW_VALUE",
--   "name": "NAME_001",
--   "orgId": 1001,
--   "idType": 1001,
--   "idNumber": 1001,
--   "status": 1
-- }
select id, util_common.getEnumValueById(org_id) as org_id, name, util_common.getEnumValueById(gender) as gender, util_common.getEnumValueById(post) as post, education, positional_title, decode(RAW_VALUE,'1',nvl('',present_post_desc)) as present_post_desc , util_common.getEnumValueById(id_type) as id_type, id_number, util_common.getEnumValueById(status) as status, to_char(date_of_appoint,'YYYY-MM-DD') as date_of_appoint, to_char(date_of_depart,'YYYY-MM-DD') as date_of_depart, remark, decode(RAW_VALUE,'1',nvl('',presvious_post_desc)) as presvious_post_desc , serial_number from vm_company_directors_info where 1=1 and name like '%' || 'NAME_001'||'%' and util_common.getEnumValueById(org_id) = 1001 and util_common.getEnumValueById(id_type) = 1001 and id_number like '%' || 1001||'%' and util_common.getEnumValueById(status) = 1;

-- statementId: DT_DirectorManager_T001.select
-- case: 可选条件关闭
-- type: select
-- assertion: 移除可选动态属性，观察条件收缩后的 SQL
-- params: {
--   "isResume": "RAW_VALUE"
-- }
select id, util_common.getEnumValueById(org_id) as org_id, name, util_common.getEnumValueById(gender) as gender, util_common.getEnumValueById(post) as post, education, positional_title, decode(RAW_VALUE,'1',nvl('',present_post_desc)) as present_post_desc , util_common.getEnumValueById(id_type) as id_type, id_number, util_common.getEnumValueById(status) as status, to_char(date_of_appoint,'YYYY-MM-DD') as date_of_appoint, to_char(date_of_depart,'YYYY-MM-DD') as date_of_depart, remark, decode(RAW_VALUE,'1',nvl('',presvious_post_desc)) as presvious_post_desc , serial_number from vm_company_directors_info where 1=1;

-- statementId: DT_DirectorManager_T001.select.count
-- case: 动态条件命中
-- type: select
-- assertion: 传入动态变量，验证最终 SQL 正常展开
-- params: {
--   "name": "NAME_001",
--   "orgId": 1001,
--   "idType": 1001,
--   "idNumber": 1001,
--   "status": 1
-- }
select count(*) from vm_company_directors_info where 1=1 and name like '%' || 'NAME_001'||'%' and util_common.getEnumValueById(org_id) = 1001 and util_common.getEnumValueById(id_type) = 1001 and id_number like '%' || 1001||'%' and util_common.getEnumValueById(status) = 1;

-- statementId: DT_DirectorManager_T001.select.count
-- case: 可选条件关闭
-- type: select
-- assertion: 移除可选动态属性，观察条件收缩后的 SQL
-- params: {}
select count(*) from vm_company_directors_info where 1=1;

-- statementId: memberIdByPostCode.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "code": "CODE_001",
--   "accounId": 1001
-- }
select o.source_id from org_relationship o where o.objective1_id = (select id from org_post o where o.code = 'CODE_001' and o.org_account_id = 1001);

-- statementId: ExtendedAttributesByTemplateNumber.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: "VALUE_001"
select field0007 as attrNum,field0008 as nodeNum,field0009 attrName,field0010 attrValue,field0011 as attrRemark from formson_2231 a left join formmain_2229 b on a.formmain_id=b.id where b.field0001 ='VALUE_001';

-- statementId: CL_EXPORTCOM_T001.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: 1001
select grade,mainpoints,referenceevaluationmethod,specificAssessment,util_common.getEnumShowById( assessmentResult) as assessmentResult ,correctivePlanAndAction,util_user.getMemberNameByMemId(designatedcontactperson) as designatedcontactperson,ctp_attachment.fileName as noteTheFile,remark from vm_selfEvaluationChildInfo left join ctp_attachment on vm_selfEvaluationChildInfo.noteTheFile =ctp_attachment.sub_reference where formmainId=1001 order by grade;

-- statementId: CL_EXPORTCOM_T002.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: 1001
select grade as grade_exp,mainpoints as mainpoints_exp,referenceevaluationmethod as referenceevaluationmethod_exp,util_user.getMemberNameByMemId(designatedcontactperson) as designatedcontactperson_exp,specificAssessment as specificAssessment_exp,util_common.getEnumShowById( assessmentResult) as assessmentResult_exp ,correctivePlanAndAction as correctivePlanAndAction_exp ,ctp_attachment.fileName as noteTheFile_exp, remark as remark_exp,util_common.getEnumShowById(reviewOpinion) as reviewOpinion_exp ,theFactDescription as theFactDescription_exp,reviewRsultConfirmOpinions as reviewRsultConfirmOpinions_exp from vm_selfEvaluationChildInfo left join ctp_attachment on vm_selfEvaluationChildInfo.noteTheFile =ctp_attachment.sub_reference where formmainId=1001 order by grade;

-- statementId: CL_POPM_T001.select
-- case: 动态条件命中
-- type: select
-- assertion: 传入动态变量，验证最终 SQL 正常展开
-- params: {
--   "topic": "TITLE_001",
--   "applyUser": "VALUE_001",
--   "createDateBegin": "2026-05-14",
--   "createDateEnd": "2026-05-14",
--   "order": "order by id desc"
-- }
select * from ( select id,(CASE msg WHEN '0' THEN '1' WHEN '1' THEN '2' ELSE '其他' END) as type,msg, util_user.getMemberNameByMemId(applyUser) as apply_user ,applyUser, to_char(applyDate,'YYYY-MM-DD') as create_date , applyDate,state, topic,mail,title, (CASE WHEN mail = '1' THEN lmpcontent WHEN msg = '1' THEN lmpcontent||msgContent ELSE lmpcontent||'其他' END) as lmpcontent from vm_launchMaterialProcess vm where finishedflag =1 union all select id,(CASE msg WHEN '0' THEN '1' WHEN '1' THEN '2' ELSE '其他' END) as type,msg, util_user.getMemberNameByMemId(applyUser) as apply_user ,applyUser, to_char(applyDate,'YYYY-MM-DD') as create_date ,applyDate, state, topic,mail,title, (CASE WHEN mail = '1' THEN lmpcontent WHEN msg = '1' THEN lmpcontent||msgContent ELSE lmpcontent||'其他' END) as lmpcontent from vm_customerserviceprocess where finishedflag =1 union all select id,(CASE msg WHEN '0' THEN '1' WHEN '1' THEN '2' ELSE '其他' END) as type,msg, util_user.getMemberNameByMemId(applyUser) as apply_user ,applyUser, to_char(applyDate,'YYYY-MM-DD') as create_date ,applyDate, state, topic,mail,title, (CASE WHEN mail = '1' THEN lmpcontent WHEN msg = '1' THEN lmpcontent||msgContent ELSE lmpcontent||'其他' END) as lmpcontent from vm_customerserviceprocess_cap4 where finishedflag =1 union all select id,(CASE msg WHEN '0' THEN '1' WHEN '1' THEN '2' ELSE '其他' END) as type,msg, util_user.getMemberNameByMemId(applyUser) as apply_user ,applyUser, to_char(applyDate,'YYYY-MM-DD') as create_date , applyDate,state, topic,mail,title, (CASE WHEN mail = '1' THEN lmpcontent WHEN msg = '1' THEN lmpcontent||msgContent ELSE lmpcontent||'其他' END) as lmpcontent from vm_launchMaterialProcess_cap4 where finishedflag =1 ) where 1 = 1 and mail = 1 and topic like '%' || 'TITLE_001'|| '%' and msg = 1 and lmpcontent like '%' || 'TITLE_001'|| '%' and util_user.getMemberNameByMemId(applyUser) like '%' || 'VALUE_001' || '%' and to_date('2026-05-14','yyyy-mm-dd') <= trunc(applyDate) and to_date('2026-05-14','yyyy-mm-dd') >= trunc(applyDate) order by id desc;

-- statementId: CL_POPM_T001.select
-- case: 可选条件关闭
-- type: select
-- assertion: 移除可选动态属性，观察条件收缩后的 SQL
-- params: {}
select * from ( select id,(CASE msg WHEN '0' THEN '1' WHEN '1' THEN '2' ELSE '其他' END) as type,msg, util_user.getMemberNameByMemId(applyUser) as apply_user ,applyUser, to_char(applyDate,'YYYY-MM-DD') as create_date , applyDate,state, topic,mail,title, (CASE WHEN mail = '1' THEN lmpcontent WHEN msg = '1' THEN lmpcontent||msgContent ELSE lmpcontent||'其他' END) as lmpcontent from vm_launchMaterialProcess vm where finishedflag =1 union all select id,(CASE msg WHEN '0' THEN '1' WHEN '1' THEN '2' ELSE '其他' END) as type,msg, util_user.getMemberNameByMemId(applyUser) as apply_user ,applyUser, to_char(applyDate,'YYYY-MM-DD') as create_date ,applyDate, state, topic,mail,title, (CASE WHEN mail = '1' THEN lmpcontent WHEN msg = '1' THEN lmpcontent||msgContent ELSE lmpcontent||'其他' END) as lmpcontent from vm_customerserviceprocess where finishedflag =1 union all select id,(CASE msg WHEN '0' THEN '1' WHEN '1' THEN '2' ELSE '其他' END) as type,msg, util_user.getMemberNameByMemId(applyUser) as apply_user ,applyUser, to_char(applyDate,'YYYY-MM-DD') as create_date ,applyDate, state, topic,mail,title, (CASE WHEN mail = '1' THEN lmpcontent WHEN msg = '1' THEN lmpcontent||msgContent ELSE lmpcontent||'其他' END) as lmpcontent from vm_customerserviceprocess_cap4 where finishedflag =1 union all select id,(CASE msg WHEN '0' THEN '1' WHEN '1' THEN '2' ELSE '其他' END) as type,msg, util_user.getMemberNameByMemId(applyUser) as apply_user ,applyUser, to_char(applyDate,'YYYY-MM-DD') as create_date , applyDate,state, topic,mail,title, (CASE WHEN mail = '1' THEN lmpcontent WHEN msg = '1' THEN lmpcontent||msgContent ELSE lmpcontent||'其他' END) as lmpcontent from vm_launchMaterialProcess_cap4 where finishedflag =1 ) where 1 = 1 and mail = 1 and msg = 1;

-- statementId: CL_POPM_T001.select.count
-- case: 动态条件命中
-- type: select
-- assertion: 传入动态变量，验证最终 SQL 正常展开
-- params: {
--   "topic": "TITLE_001",
--   "applyUser": "VALUE_001",
--   "createDateBegin": "2026-05-14",
--   "createDateEnd": "2026-05-14",
--   "order": "order by id desc"
-- }
select count(*) from ( select id,(CASE msg WHEN '0' THEN '1' WHEN '1' THEN '2' ELSE '其他' END) as type,msg, util_user.getMemberNameByMemId(applyUser) as apply_user ,applyUser, to_char(applyDate,'YYYY-MM-DD') as create_date , applyDate,state, topic,mail,title, (CASE WHEN mail = '1' THEN lmpcontent WHEN msg = '1' THEN lmpcontent||msgContent ELSE lmpcontent||'其他' END) as lmpcontent from vm_launchMaterialProcess vm where finishedflag =1 union all select id,(CASE msg WHEN '0' THEN '1' WHEN '1' THEN '2' ELSE '其他' END) as type,msg, util_user.getMemberNameByMemId(applyUser) as apply_user ,applyUser, to_char(applyDate,'YYYY-MM-DD') as create_date ,applyDate, state, topic,mail,title, (CASE WHEN mail = '1' THEN lmpcontent WHEN msg = '1' THEN lmpcontent||msgContent ELSE lmpcontent||'其他' END) as lmpcontent from vm_customerserviceprocess where finishedflag =1 union all select id,(CASE msg WHEN '0' THEN '1' WHEN '1' THEN '2' ELSE '其他' END) as type,msg, util_user.getMemberNameByMemId(applyUser) as apply_user ,applyUser, to_char(applyDate,'YYYY-MM-DD') as create_date ,applyDate, state, topic,mail,title, (CASE WHEN mail = '1' THEN lmpcontent WHEN msg = '1' THEN lmpcontent||msgContent ELSE lmpcontent||'其他' END) as lmpcontent from vm_customerserviceprocess_cap4 where finishedflag =1 union all select id,(CASE msg WHEN '0' THEN '1' WHEN '1' THEN '2' ELSE '其他' END) as type,msg, util_user.getMemberNameByMemId(applyUser) as apply_user ,applyUser, to_char(applyDate,'YYYY-MM-DD') as create_date , applyDate,state, topic,mail,title, (CASE WHEN mail = '1' THEN lmpcontent WHEN msg = '1' THEN lmpcontent||msgContent ELSE lmpcontent||'其他' END) as lmpcontent from vm_launchMaterialProcess_cap4 where finishedflag =1 ) where 1=1 and mail = 1 and topic like '%' || 'TITLE_001'|| '%' and msg = 1 and lmpcontent like '%' || 'TITLE_001'|| '%' and util_user.getMemberNameByMemId(applyUser) like '%' || 'VALUE_001' || '%' and to_date('2026-05-14','yyyy-mm-dd') <= trunc(applyDate) and to_date('2026-05-14','yyyy-mm-dd') >= trunc(applyDate) order by id desc;

-- statementId: CL_POPM_T001.select.count
-- case: 可选条件关闭
-- type: select
-- assertion: 移除可选动态属性，观察条件收缩后的 SQL
-- params: {}
select count(*) from ( select id,(CASE msg WHEN '0' THEN '1' WHEN '1' THEN '2' ELSE '其他' END) as type,msg, util_user.getMemberNameByMemId(applyUser) as apply_user ,applyUser, to_char(applyDate,'YYYY-MM-DD') as create_date , applyDate,state, topic,mail,title, (CASE WHEN mail = '1' THEN lmpcontent WHEN msg = '1' THEN lmpcontent||msgContent ELSE lmpcontent||'其他' END) as lmpcontent from vm_launchMaterialProcess vm where finishedflag =1 union all select id,(CASE msg WHEN '0' THEN '1' WHEN '1' THEN '2' ELSE '其他' END) as type,msg, util_user.getMemberNameByMemId(applyUser) as apply_user ,applyUser, to_char(applyDate,'YYYY-MM-DD') as create_date ,applyDate, state, topic,mail,title, (CASE WHEN mail = '1' THEN lmpcontent WHEN msg = '1' THEN lmpcontent||msgContent ELSE lmpcontent||'其他' END) as lmpcontent from vm_customerserviceprocess where finishedflag =1 union all select id,(CASE msg WHEN '0' THEN '1' WHEN '1' THEN '2' ELSE '其他' END) as type,msg, util_user.getMemberNameByMemId(applyUser) as apply_user ,applyUser, to_char(applyDate,'YYYY-MM-DD') as create_date ,applyDate, state, topic,mail,title, (CASE WHEN mail = '1' THEN lmpcontent WHEN msg = '1' THEN lmpcontent||msgContent ELSE lmpcontent||'其他' END) as lmpcontent from vm_customerserviceprocess_cap4 where finishedflag =1 union all select id,(CASE msg WHEN '0' THEN '1' WHEN '1' THEN '2' ELSE '其他' END) as type,msg, util_user.getMemberNameByMemId(applyUser) as apply_user ,applyUser, to_char(applyDate,'YYYY-MM-DD') as create_date , applyDate,state, topic,mail,title, (CASE WHEN mail = '1' THEN lmpcontent WHEN msg = '1' THEN lmpcontent||msgContent ELSE lmpcontent||'其他' END) as lmpcontent from vm_launchMaterialProcess_cap4 where finishedflag =1 ) where 1=1 and mail = 1 and msg = 1;

-- statementId: formContent.insert
-- case: 基础参数命中
-- type: insert
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "type": "VALUE_001",
--   "formId": 1001,
--   "module_template_id": 1001,
--   "content_template_id": 1001,
--   "title": "TITLE_001"
-- }
insert into ctp_content_all (ID, CREATE_ID, CREATE_DATE, MODIFY_ID, MODIFY_DATE, MODULE_TYPE, MODULE_ID, MODULE_TEMPLATE_ID, CONTENT_TYPE, CONTENT, CONTENT_DATA_ID, CONTENT_TEMPLATE_ID, TITLE, SORT) values (util_common.getAbsID, '-6760911671874597139', sysdate, '-6760911671874597139', sysdate, 'VALUE_001', 1001, 1001, '20', '', 1001, 1001, 'TITLE_001', '0');

-- statementId: h5Source.select
-- case: 无参基础场景
-- type: select
-- assertion: 不传参数，验证固定 SQL 可直接生成
-- params: {}
select TEMPLATE_CODE, TEMPLATE_ID, APP_ID,TABLE_NAME from vm_h5paramconfig;

-- statementId: allPrivRoleMenu.select
-- case: 无参基础场景
-- type: select
-- assertion: 不传参数，验证固定 SQL 可直接生成
-- params: {}
select menuid from PRIV_ROLE_MENU;

-- statementId: cap4BtnConfigByFormId.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "formId": 1001,
--   "buttonName": "NAME_001"
-- }
select customBtnName tableName, bindId, implClassPath, implClassBeanName, extendField, functionDesc from vm_customBtnConfig where bindId = 1001 and customBtnName = 'NAME_001';

-- statementId: CL_RoadShow0001_R001V1.select
-- case: 动态条件命中
-- type: select
-- assertion: 传入动态变量，验证最终 SQL 正常展开
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

-- statementId: CL_RoadShow0001_R001V1.select
-- case: 可选条件关闭
-- type: select
-- assertion: 移除可选动态属性，观察条件收缩后的 SQL
-- params: {}
select 'CL_RoadShow0001_R001' as templateId, id, applierCode, applierName, applyDeptCode, applyOrgName, applyDate, title, way, startTime, endTime, wfStatus, prodCodeJoin, prodNameJoin, funderNameJoin, FundCodeJoin, customerName, stage, custid from vm_wf_CL_RoadShow0001_R001 v1 where util_org.inDepartmentGroup(util_org.getDeptIdByDeptCode(applyDeptCode), 'structLine') = 1 order by applyDate desc;

-- statementId: CL_RoadShow0001_R001V1.select.count
-- case: 动态条件命中
-- type: select
-- assertion: 传入动态变量，验证最终 SQL 正常展开
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

-- statementId: CL_RoadShow0001_R001V1.select.count
-- case: 可选条件关闭
-- type: select
-- assertion: 移除可选动态属性，观察条件收缩后的 SQL
-- params: {}
select count(*) from vm_wf_CL_RoadShow0001_R001 v1 where util_org.inDepartmentGroup(util_org.getDeptIdByDeptCode(applyDeptCode), 'structLine') = 1;

-- statementId: getHolidayCalendar.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "year": "VALUE_001",
--   "includeWeekend": "VALUE_001"
-- }
select to_char(datenum,'yyyy-mm-dd') datenum, isrest, datememo from table(util_common.getHolidays('VALUE_001','VALUE_001'));

-- statementId: deleteTableContent.delete
-- case: 动态条件命中
-- type: delete
-- assertion: 传入动态变量，验证最终 SQL 正常展开
-- params: {
--   "module_template_id": 1001,
--   "content_template_id": 1001,
--   "formId": 1001
-- }
delete from ctp_content_all c where module_template_id = 1001 and content_template_id = 1001 AND CONTENT_DATA_ID = 1001;

-- statementId: deleteTableContent.delete
-- case: 可选条件关闭
-- type: delete
-- assertion: 移除可选动态属性，观察条件收缩后的 SQL
-- params: {
--   "module_template_id": 1001,
--   "content_template_id": 1001
-- }
delete from ctp_content_all c where module_template_id = 1001 and content_template_id = 1001;

-- statementId: getUserInfoByCode.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: "CODE_001"
select org.name as name, org.ext_attr_1 as cellPhone, org.ext_attr_2 as email, org.ext_attr_3 as tel, (select ext_attr_2 from org_unit where id = org.org_account_id) as address, vm.usertitle as userTitle, (select ext_attr_7 from org_unit where id = org.org_account_id) as url, (select name from org_unit where id = org.org_account_id) as company, org.org_account_id as accountId, vm.id as mainId, vm.traditionalName as traditionalName from org_member org left join vm_member vm on (org.code = vm.kmCode) where org.code = 'CODE_001' and org.is_deleted = 0 and org.is_enable = 1;

-- statementId: getUserInfoByVmId.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: 1001
select org.name as name, org.ext_attr_1 as cellPhone, org.ext_attr_2 as email, org.ext_attr_3 as tel, (select ext_attr_2 from org_unit where id = org.org_account_id) as address, vm.usertitle as userTitle, (select ext_attr_7 from org_unit where id = org.org_account_id) as url, (select name from org_unit where id = org.org_account_id) as company, vm.id as mainId from org_member org left join vm_member vm on (org.code = vm.kmCode) where vm.id = 1001 and org.is_deleted = 0 and org.is_enable = 1;

-- statementId: getUserInfoById.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: 1001
select org.name as name, org.ext_attr_1 as cellPhone, org.ext_attr_2 as email, org.ext_attr_3 as tel, (select ext_attr_2 from org_unit where id = org.org_account_id) as address, vm.usertitle as userTitle, (select ext_attr_7 from org_unit where id = org.org_account_id) as url, (select name from org_unit where id = org.org_account_id) as company, org.org_account_id as companyId, vm.id as mainId from org_member org left join vm_member vm on (org.code = vm.kmCode) where org.id = 1001 and org.is_deleted = 0 and org.is_enable = 1;

-- statementId: getAllUserCode.select
-- case: 无参基础场景
-- type: select
-- assertion: 不传参数，验证固定 SQL 可直接生成
-- params: {}
select kmCode from vm_member where kmCode is not null and status = '在职';

-- statementId: getDownloadUserInfoById.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: 1001
select (select file_url from CTP_ATTACHMENT where SUB_REFERENCE = qrcode) as imgId from vm_member where kmCode is not null and id = 1001;

-- statementId: getAllQrCodeId.select
-- case: 无参基础场景
-- type: select
-- assertion: 不传参数，验证固定 SQL 可直接生成
-- params: {}
select (select file_url from CTP_ATTACHMENT where SUB_REFERENCE = qrcode) as imgId, util_user.getMemberNameByMemCode(kmcode) name, hrid from vm_member where qrCode is not null and status = '在职';

-- statementId: getMemberNameById.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: 1001
select (select name from org_member where id = userId) name from vm_member where id = 1001;

-- statementId: Product_Element_T001.select
-- case: 动态条件命中
-- type: select
-- assertion: 传入动态变量，验证最终 SQL 正常展开
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

-- statementId: Product_Element_T001.select
-- case: 可选条件关闭
-- type: select
-- assertion: 移除可选动态属性，观察条件收缩后的 SQL
-- params: {}
select * from( select productName,/*产品名称*/ productCode,/*产品编号*/ id, send_date senddate, state flowStatus, util_user.getMemCodeByMemId(send_user) sendUser, util_org.getDeptCodeByDeptId(send_depart) departCode, util_user.getMemberNameByMemId(send_user) send_user, /*申请人 */ to_char(send_date, 'yyyy-mm-dd') send_date, /* 申请日期 */ util_org.getDeptNameByDeptId(send_depart) send_depart, /*申请部门 */ util_common.getEnumValueById(product_category) product_category, /*集合计划类型*/ product_fullname, /*产品全称 */ util_user.getMemberNameByMemIds(sales_member) sales_member, /*项目负责销售人员*/ util_user.getMemberNameByMemIds(investment_manager) investment_manager, /*投资经理 */ trustee_member, /*托管人名称 */ util_common.getEnumValueById(main_investment_strategy) main_investment_strategy, /*主要投资策略 */ administrative_fee, /*年管理费率 */ util_common.getEnumValueById(is_performance_reward) is_performance_reward, /*是否有业绩报酬 */ per_reward_percentage, /*业绩报酬计提比例 */ trustee_fee, /*年托管费率 */ duration, /*计划存续期限 */ util_common.getEnumValueById(is_fof) is_fof, /*是否为FOF产品 */ util_common.getEnumValueById(is_qdii) is_qdii, /*是否为QDII产品 */ util_common.getEnumValueById(settlement_mode) settlement_mode, /*结算模式 */ investment_scope, /* 投资范围 */ special_investment_target, /* 拟实际运用的特殊投资标的*/ investment_restriction, /* 投资限制 */ position_deadline, /*建仓期 */ performance_benchmark, /*业绩比较基准*/ util_common.getEnumValueById(is_warn_stop_loss_line) is_warn_stop_loss_line, /*有无预警止损条款*/ warn_line, /*预警线 */ stop_loss_line, /*止损线 */ util_common.getEnumValueById(is_income_distribute) is_income_distribute, /*是否进行收益分配 */ util_common.getEnumValueById(bond_valuation_method) bond_valuation_method, /*估值方法 */ util_common.getEnumValueById(valuation_check) valuation_check, /*估值日 */ util_common.getEnumValueById(product_investment_type) product_investment_type, /*产品投资类型*/ investment_objective, /*投资目标 */ client_fullname, /*委托人名称及数量*/ util_common.getEnumValueById(launch_confirmation_day) launch_confirmation_day, /*参与退出确认日 */ util_common.getEnumValueById(is_use_elect_sig) is_use_elect_sig, /*是否采用电子合同 */ per_reward_benchmark, /*业绩报酬绝对计提基准年化收益率*/ util_common.getEnumValueById(duration_unit) duration_unit, /*计划存续期限单位 */ debt_limit_lower, /*存款债券等债权类资产的比例占资产管理计划总资产下限 */ debt_limit_upper, /*存款债券等债权类资产的比例占资产管理计划总资产上限 */ stock_limit_lower, /*投资于股票等股权类资产占资产管理计划总资产的比例下限*/ stock_limit_upper, /*投资于股票等股权类资产占资产管理计划总资产的比例上限*/ shop_derivative_limit_lower, /*投资于商品及金融衍生品的持仓合约价值占资产管理计划总资产的比例下限*/ shop_derivative_limit_upper, /*投资于商品及金融衍生品的持仓合约价值占资产管理计划总资产的比例上限*/ derivative_limit_lower, /*衍生品账户权益占资产管理计划总资产的比例下限 */ derivative_limit_upper, /*衍生品账户权益占资产管理计划总资产的比例上限 */ p_opening_frequency, /*产品开放频率值*/ decode(p_opening_frequency, 1, p_open_frequency1_param1, 2, p_open_frequency2_param1, 3, p_open_frequency3_param1, 4, p_open_frequency4_param2, 5, p_open_frequency5_param1,6,'',7,'',0,'') p_opening_frequency_param1, decode(p_opening_frequency, 1, '', 2, util_common.getEnumShowById(p_open_frequency2_param2), 3, p_open_frequency3_param3, 4, '', 5, p_open_frequency5_param4,6,'',7,'',0,'') p_opening_frequency_param2, decode(p_opening_frequency, 1, '', 2, p_open_frequency2_param4, 3, '', 4, '', 5, p_open_frequency5_param3,6,'',7,'',0,'') p_opening_frequency_param3 from vm_wf_product_element_Double union all select productName,/*产品名称*/ productCode,/*产品编号*/ id, send_date senddate, state flowStatus, util_user.getMemCodeByMemId(send_user) sendUser, util_org.getDeptCodeByDeptId(send_depart) departCode, util_user.getMemberNameByMemId(send_user) send_user, /*申请人 */ to_char(send_date, 'yyyy-mm-dd') send_date, /* 申请日期 */ util_org.getDeptNameByDeptId(send_depart) send_depart, /*申请部门 */ util_common.getEnumValueById(product_category) product_category, /*集合计划类型*/ product_fullname, /*产品全称 */ util_user.getMemberNameByMemIds(sales_member) sales_member, /*项目负责销售人员*/ util_user.getMemberNameByMemIds(investment_manager) investment_manager, /*投资经理 */ trustee_member, /*托管人名称 */ util_common.getEnumValueById(main_investment_strategy) main_investment_strategy, /*主要投资策略 */ administrative_fee, /*年管理费率 */ util_common.getEnumValueById(is_performance_reward) is_performance_reward, /*是否有业绩报酬 */ per_reward_percentage, /*业绩报酬计提比例 */ trustee_fee, /*年托管费率 */ to_char(duration) duration, /*计划存续期限 */ util_common.getEnumValueById(is_fof) is_fof, /*是否为FOF产品 */ util_common.getEnumValueById(is_qdii) is_qdii, /*是否为QDII产品 */ util_common.getEnumValueById(settlement_mode) settlement_mode, /*结算模式 */ investment_scope, /* 投资范围 */ special_investment_target, /* 拟实际运用的特殊投资标的*/ investment_restriction, /* 投资限制 */ position_deadline, /*建仓期 */ performance_benchmark, /*业绩比较基准*/ util_common.getEnumValueById(is_warn_stop_loss_line) is_warn_stop_loss_line, /*有无预警止损条款*/ warn_line, /*预警线 */ stop_loss_line, /*止损线 */ util_common.getEnumValueById(is_income_distribute) is_income_distribute, /*是否进行收益分配 */ util_common.getEnumValueById(bond_valuation_method) bond_valuation_method, /*估值方法 */ util_common.getEnumValueById(valuation_check) valuation_check, /*估值日 */ util_common.getEnumValueById(product_investment_type) product_investment_type, /*产品投资类型*/ investment_objective, /*投资目标 */ client_fullname, /*委托人名称及数量*/ util_common.getEnumValueById(launch_confirmation_day) launch_confirmation_day, /*参与退出确认日 */ util_common.getEnumValueById(is_use_elect_sig) is_use_elect_sig, /*是否采用电子合同 */ per_reward_benchmark, /*业绩报酬绝对计提基准年化收益率*/ util_common.getEnumValueById(duration_unit) duration_unit, /*计划存续期限单位 */ debt_limit_lower, /*存款债券等债权类资产的比例占资产管理计划总资产下限 */ debt_limit_upper, /*存款债券等债权类资产的比例占资产管理计划总资产上限 */ stock_limit_lower, /*投资于股票等股权类资产占资产管理计划总资产的比例下限*/ stock_limit_upper, /*投资于股票等股权类资产占资产管理计划总资产的比例上限*/ shop_derivative_limit_lower, /*投资于商品及金融衍生品的持仓合约价值占资产管理计划总资产的比例下限*/ shop_derivative_limit_upper, /*投资于商品及金融衍生品的持仓合约价值占资产管理计划总资产的比例上限*/ derivative_limit_lower, /*衍生品账户权益占资产管理计划总资产的比例下限 */ derivative_limit_upper, /*衍生品账户权益占资产管理计划总资产的比例上限 */ p_opening_frequency, /*产品开放频率值*/ decode(p_opening_frequency, 1, '', 2, p_opening_frequency2_param2, 3, '') p_opening_frequency_param1, decode(p_opening_frequency, 1, '', 2, p_opening_frequency2_param4, 3, ''), decode(p_opening_frequency, 1, '', 2, p_opening_frequency2_param5, 3, '') p_opening_frequency_param3 from vm_wf_product_element_Single) t where 1=1;

-- statementId: Product_Element_T001.select.count
-- case: 动态条件命中
-- type: select
-- assertion: 传入动态变量，验证最终 SQL 正常展开
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

-- statementId: Product_Element_T001.select.count
-- case: 可选条件关闭
-- type: select
-- assertion: 移除可选动态属性，观察条件收缩后的 SQL
-- params: {}
select count('x') from( select productName,/*产品名称*/ productCode,/*产品编号*/ id, send_date senddate, state flowStatus, util_user.getMemCodeByMemId(send_user) sendUser, util_org.getDeptCodeByDeptId(send_depart) departCode, util_user.getMemberNameByMemId(send_user) send_user, /*申请人 */ to_char(send_date, 'yyyy-mm-dd') send_date, /* 申请日期 */ util_org.getDeptNameByDeptId(send_depart) send_depart, /*申请部门 */ util_common.getEnumValueById(product_category) product_category, /*集合计划类型*/ product_fullname, /*产品全称 */ util_user.getMemberNameByMemIds(sales_member) sales_member, /*项目负责销售人员*/ util_user.getMemberNameByMemIds(investment_manager) investment_manager, /*投资经理 */ trustee_member, /*托管人名称 */ util_common.getEnumValueById(main_investment_strategy) main_investment_strategy, /*主要投资策略 */ administrative_fee, /*年管理费率 */ util_common.getEnumValueById(is_performance_reward) is_performance_reward, /*是否有业绩报酬 */ per_reward_percentage, /*业绩报酬计提比例 */ trustee_fee, /*年托管费率 */ duration, /*计划存续期限 */ util_common.getEnumValueById(is_fof) is_fof, /*是否为FOF产品 */ util_common.getEnumValueById(is_qdii) is_qdii, /*是否为QDII产品 */ util_common.getEnumValueById(settlement_mode) settlement_mode, /*结算模式 */ investment_scope, /* 投资范围 */ special_investment_target, /* 拟实际运用的特殊投资标的*/ investment_restriction, /* 投资限制 */ position_deadline, /*建仓期 */ performance_benchmark, /*业绩比较基准*/ util_common.getEnumValueById(is_warn_stop_loss_line) is_warn_stop_loss_line, /*有无预警止损条款*/ warn_line, /*预警线 */ stop_loss_line, /*止损线 */ util_common.getEnumValueById(is_income_distribute) is_income_distribute, /*是否进行收益分配 */ util_common.getEnumValueById(bond_valuation_method) bond_valuation_method, /*估值方法 */ util_common.getEnumValueById(valuation_check) valuation_check, /*估值日 */ util_common.getEnumValueById(product_investment_type) product_investment_type, /*产品投资类型*/ investment_objective, /*投资目标 */ client_fullname, /*委托人名称及数量*/ util_common.getEnumValueById(launch_confirmation_day) launch_confirmation_day, /*参与退出确认日 */ util_common.getEnumValueById(is_use_elect_sig) is_use_elect_sig, /*是否采用电子合同 */ per_reward_benchmark, /*业绩报酬绝对计提基准年化收益率*/ util_common.getEnumValueById(duration_unit) duration_unit, /*计划存续期限单位 */ debt_limit_lower, /*存款债券等债权类资产的比例占资产管理计划总资产下限 */ debt_limit_upper, /*存款债券等债权类资产的比例占资产管理计划总资产上限 */ stock_limit_lower, /*投资于股票等股权类资产占资产管理计划总资产的比例下限*/ stock_limit_upper, /*投资于股票等股权类资产占资产管理计划总资产的比例上限*/ shop_derivative_limit_lower, /*投资于商品及金融衍生品的持仓合约价值占资产管理计划总资产的比例下限*/ shop_derivative_limit_upper, /*投资于商品及金融衍生品的持仓合约价值占资产管理计划总资产的比例上限*/ derivative_limit_lower, /*衍生品账户权益占资产管理计划总资产的比例下限 */ derivative_limit_upper, /*衍生品账户权益占资产管理计划总资产的比例上限 */ p_opening_frequency, /*产品开放频率值*/ decode(p_opening_frequency, 1, p_open_frequency1_param1, 2, p_open_frequency2_param1, 3, p_open_frequency3_param1, 4, p_open_frequency4_param2, 5, p_open_frequency5_param1,6,'',7,'',0,'') p_opening_frequency_param1, decode(p_opening_frequency, 1, '', 2, util_common.getEnumShowById(p_open_frequency2_param2), 3, p_open_frequency3_param3, 4, '', 5, p_open_frequency5_param4,6,'',7,'',0,'') p_opening_frequency_param2, decode(p_opening_frequency, 1, '', 2, p_open_frequency2_param4, 3, '', 4, '', 5, p_open_frequency5_param3,6,'',7,'',0,'') p_opening_frequency_param3 from vm_wf_product_element_Double union all select productName,/*产品名称*/ productCode,/*产品编号*/ id, send_date senddate, state flowStatus, util_user.getMemCodeByMemId(send_user) sendUser, util_org.getDeptCodeByDeptId(send_depart) departCode, util_user.getMemberNameByMemId(send_user) send_user, /*申请人 */ to_char(send_date, 'yyyy-mm-dd') send_date, /* 申请日期 */ util_org.getDeptNameByDeptId(send_depart) send_depart, /*申请部门 */ util_common.getEnumValueById(product_category) product_category, /*集合计划类型*/ product_fullname, /*产品全称 */ util_user.getMemberNameByMemIds(sales_member) sales_member, /*项目负责销售人员*/ util_user.getMemberNameByMemIds(investment_manager) investment_manager, /*投资经理 */ trustee_member, /*托管人名称 */ util_common.getEnumValueById(main_investment_strategy) main_investment_strategy, /*主要投资策略 */ administrative_fee, /*年管理费率 */ util_common.getEnumValueById(is_performance_reward) is_performance_reward, /*是否有业绩报酬 */ per_reward_percentage, /*业绩报酬计提比例 */ trustee_fee, /*年托管费率 */ to_char(duration) duration, /*计划存续期限 */ util_common.getEnumValueById(is_fof) is_fof, /*是否为FOF产品 */ util_common.getEnumValueById(is_qdii) is_qdii, /*是否为QDII产品 */ util_common.getEnumValueById(settlement_mode) settlement_mode, /*结算模式 */ investment_scope, /* 投资范围 */ special_investment_target, /* 拟实际运用的特殊投资标的*/ investment_restriction, /* 投资限制 */ position_deadline, /*建仓期 */ performance_benchmark, /*业绩比较基准*/ util_common.getEnumValueById(is_warn_stop_loss_line) is_warn_stop_loss_line, /*有无预警止损条款*/ warn_line, /*预警线 */ stop_loss_line, /*止损线 */ util_common.getEnumValueById(is_income_distribute) is_income_distribute, /*是否进行收益分配 */ util_common.getEnumValueById(bond_valuation_method) bond_valuation_method, /*估值方法 */ util_common.getEnumValueById(valuation_check) valuation_check, /*估值日 */ util_common.getEnumValueById(product_investment_type) product_investment_type, /*产品投资类型*/ investment_objective, /*投资目标 */ client_fullname, /*委托人名称及数量*/ util_common.getEnumValueById(launch_confirmation_day) launch_confirmation_day, /*参与退出确认日 */ util_common.getEnumValueById(is_use_elect_sig) is_use_elect_sig, /*是否采用电子合同 */ per_reward_benchmark, /*业绩报酬绝对计提基准年化收益率*/ util_common.getEnumValueById(duration_unit) duration_unit, /*计划存续期限单位 */ debt_limit_lower, /*存款债券等债权类资产的比例占资产管理计划总资产下限 */ debt_limit_upper, /*存款债券等债权类资产的比例占资产管理计划总资产上限 */ stock_limit_lower, /*投资于股票等股权类资产占资产管理计划总资产的比例下限*/ stock_limit_upper, /*投资于股票等股权类资产占资产管理计划总资产的比例上限*/ shop_derivative_limit_lower, /*投资于商品及金融衍生品的持仓合约价值占资产管理计划总资产的比例下限*/ shop_derivative_limit_upper, /*投资于商品及金融衍生品的持仓合约价值占资产管理计划总资产的比例上限*/ derivative_limit_lower, /*衍生品账户权益占资产管理计划总资产的比例下限 */ derivative_limit_upper, /*衍生品账户权益占资产管理计划总资产的比例上限 */ p_opening_frequency, /*产品开放频率值*/ decode(p_opening_frequency, 1, '', 2, p_opening_frequency2_param2, 3, '') p_opening_frequency_param1, decode(p_opening_frequency, 1, '', 2, p_opening_frequency2_param4, 3, ''), decode(p_opening_frequency, 1, '', 2, p_opening_frequency2_param5, 3, '') p_opening_frequency_param3 from vm_wf_product_element_Single) t where 1=1;

-- statementId: OAUserHelpConfig.select
-- case: 无参基础场景
-- type: select
-- assertion: 不传参数，验证固定 SQL 可直接生成
-- params: {}
select id, flowNumber, xpath, helpDesc, helpUrl, urlSHowType, showType, fullText, helpEnableUrl from vm_oauserhelpconfig where isenable = -3841538853571705149;

-- statementId: findNeedSendAlertAffair.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: "RAW_VALUE"
RAW_VALUE;

-- statementId: browserInfo.insert
-- case: 基础参数命中
-- type: update
-- assertion: 传入基础变量，验证最终 SQL 正常生成
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
-- case: 无参基础场景
-- type: select
-- assertion: 不传参数，验证固定 SQL 可直接生成
-- params: {}
select id from portal_customize_menu;

-- statementId: portalIds.select
-- case: 无参基础场景
-- type: select
-- assertion: 不传参数，验证固定 SQL 可直接生成
-- params: {}
select distinct portal_id from portal_nav where nav_type = 'menu';

-- statementId: getWorkFlowInfoByActivityId.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: 1001
select form_id as "formId", form_name as "formName", wf_template_id as "wfTemplateId", wf_process_name as "wfProcessName", wf_activity_id as "wfActivityId", wf_activity_name as "wfActivityName", wf_activity_desc as "wfActivityDesc", wf_activity_extend_param as "wfActivityExtendParam", wf_activity_performer_type as "wfActivityPerformerType", wf_activity_performer_value as "wfActivityPerformerValue", wf_activity_performer_desc as "wfActivityPerformerDesc", wf_activity_performer_account as "wfActivityPerformerAccount", wf_activity_right_code as "wfActivityRightCode", wf_activity_right_name as "wfActivityRightName" from VM_WFACTIVITYINFO where wf_activity_id = 1001;

-- statementId: getBulDateById.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: 1001
select id as "id", title as "title", type_id as "typeId", publish_scope as "publishScope", publish_department_id as "publishDepartmentId", brief as "brief", keywords as "keywords", data_format as "dataFormat", create_date as "createDate", create_user as "createUser", audit_date as "auditDate", audit_user_id as "auditUserId", audit_advice as "auditAdvice", publish_date as "publishDate", publish_user_id as "publishUserId", pigeonhole_date as "pigeonholeDate", pigeonhole_user_id as "pigeonholeUserId", pigeonhole_path as "pigeonholePath", update_date as "updateDate", update_user as "updateUser", read_count as "readCount", top_order as "topOrder", state as "state", deleted_flag as "deletedFlag", accountid as "accountid", ext1 as "ext1", ext2 as "ext2", ext3 as "ext3", ext4 as "ext4", ext5 as "ext5", att_flag as "attFlag", show_publish_user_flag as "showPublishUserFlag", spacetype as "spacetype", publish_choose as "publishChoose", write_publish as "writePublish", open_record_read as "openRecordRead", short_content as "shortContent", hide_publish_scope_flag as "hidePublishScopeFlag", expire_date as "expireDate", top_number_group as "topNumberGroup", top_number_unit as "topNumberUnit", audit_type as "auditType", ceb_type as "cebType", out_permit as "outPermit" from bul_data where id = 1001;

-- statementId: overdueNodeConfig.select
-- case: 无参基础场景
-- type: select
-- assertion: 不传参数，验证固定 SQL 可直接生成
-- params: {}
select id, templateNo, tableName, configNo, title, content, pushConditions, pushMember, configDisplay, isuse from vm_overduenoteconfig where isuse = -3841538853571705149;

-- statementId: postMemberByTaskName.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "businessModel": "VALUE_001",
--   "taskName": "NAME_001"
-- }
select f.mainmember || ',' || f.submember from VM_DEPTPOST f where util_common.getEnumShowById(f.busimodel)='VALUE_001' and f.questname='NAME_001';

-- statementId: rabbitMqFlowConf.select
-- case: 无参基础场景
-- type: select
-- assertion: 不传参数，验证固定 SQL 可直接生成
-- params: {}
select flowName, flowCode, flowBean, onStartFunctionName, onCancelFunctionName, onStopFunctionName, onStepBackFunctionName, onFinishedFunctionName, onWorkitemFunctionName, workitemNode, enable from vm_rabbitMqFlowConf where enable = -3841538853571705149;

-- statementId: rabbitMqConf.select
-- case: 无参基础场景
-- type: select
-- assertion: 不传参数，验证固定 SQL 可直接生成
-- params: {}
select functionName, functionCode, exchangeName, enable from vm_rabbitMqConf where enable = -3841538853571705149;

-- statementId: rabbitMqQueueConf.select
-- case: 无参基础场景
-- type: select
-- assertion: 不传参数，验证固定 SQL 可直接生成
-- params: {}
select mqe.exchangeName as "exchangeName", mqe.exchangeType as "exchangeType", mqes.queueName as "queueName", mqes.routingkey as "routingkey", mqes.threshold as "threshold", mqes.percentage as "percentage", mqes.receiverFWork as "receiverFWork", mqes.finalThreshold as "finalThreshold" from vm_mq_exchange mqe left join vm_mq_exchange_son mqes on mqes.formmainId = mqe.id where mqes.isSendMessage = '-3841538853571705149';

-- statementId: queryQueueNameByFormmainId.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: 1001
select mqes.queueName as "queueName" from vm_mq_exchange_son mqes left join vm_mq_exchange mqe on mqes.formmainId = mqe.id where mqes.formmainId = 1001;

-- statementId: queryExchangeNameByDataId.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: 1001
select mqe.id as "id", mqe.exchangeName as "exchangeName", mqe.exchangeType as "exchangeType" from vm_mq_exchange mqe where mqe.id = 1001;

-- statementId: insertQueueByExchangeName.insert
-- case: 基础参数命中
-- type: insert
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "formmainId": 1001,
--   "queueName": "NAME_001",
--   "routingkey": "VALUE_001"
-- }
insert into vm_mq_exchange_son( id, formmainId, queueName, routingkey) values( util_common.getAbsID, 1001, 'NAME_001', 'VALUE_001' );

-- statementId: fgOnlineEditNoCallBack.select
-- case: 无参基础场景
-- type: select
-- assertion: 不传参数，验证固定 SQL 可直接生成
-- params: {}
select to_char(id) "id", templateNo "templateNo", isCallBack "isCallBack", to_char(nvl(failRetryCount, '0')) "failRetryCount", contractFile "contractFile", totalContractAmount "totalContractAmount", counterparty "counterparty", contractAmountUpperForShort "contractAmountUpperForShort" from vm_onlineDocEdit f where f.isCallBack = -1089048568118490234 and (f.failRetryCount < 5 or f.failRetryCount is null);

-- statementId: getPushFailedTask.select
-- case: 无参基础场景
-- type: select
-- assertion: 不传参数，验证固定 SQL 可直接生成
-- params: {}
select vfp.id as "id", vfp.url as "url", vfp.callType as "callType", vfp.lambdaFunction as "lambdaFunction", vfp.json as "json", vfm.beanName as "beanName", vfm.methedName as "methedName" from vm_fg_feature_push vfp left join vm_fg_feature_manage vfm on vfm.feature = vfp.feature where util_common.getEnumValueById(vfm.isOpen) = '1' and (vfp.status is null or util_common.getEnumValueById(vfp.status) = '1') and util_common.getEnumValueById(vfp.isNeedPush) = '1' order by util_common.getEnumValueById(vfm.priority) desc;

-- statementId: getPushFailedTaskById.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: 1001
select vfp.id as "id", vfp.url as "url", vfp.callType as "callType", vfp.lambdaFunction as "lambdaFunction", vfp.json as "json", vfm.beanName as "beanName", vfm.methedName as "methedName" from vm_fg_feature_push vfp left join vm_fg_feature_manage vfm on vfm.feature = vfp.feature where util_common.getEnumValueById(vfm.isOpen) = '1' and (vfp.status is null or util_common.getEnumValueById(vfp.status) = '1') and util_common.getEnumValueById(vfp.isNeedPush) = '1' and vfp.id = 1001;

-- statementId: insertCtpContentAll.insert
-- case: 基础参数命中
-- type: insert
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "moduleTemplateId": 1001,
--   "contentTemplateId": 1001,
--   "title": "TITLE_001",
--   "tableName": "demo_table"
-- }
insert into ctp_content_all (ID, CREATE_ID, CREATE_DATE, MODIFY_ID, MODIFY_DATE, MODULE_TYPE, MODULE_ID, MODULE_TEMPLATE_ID, CONTENT_TYPE, CONTENT, CONTENT_DATA_ID, CONTENT_TEMPLATE_ID, TITLE, SORT) select util_common.getAbsID, '-6760911671874597139', sysdate, '-6760911671874597139', sysdate, 42, id, 1001, '20', '', id, 1001, 'TITLE_001', '0' from demo_table vm where id not in(select content_data_id from ctp_content_all c where c.content_template_id = 1001 and content_data_id is not null);

-- statementId: insertCtp4ContentAll.insert
-- case: 基础参数命中
-- type: insert
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "formId": 1001
-- }
insert into ctp_content_all (ID, CREATE_ID, CREATE_DATE, MODIFY_ID, MODIFY_DATE, MODULE_TYPE, MODULE_ID, MODULE_TEMPLATE_ID, CONTENT_TYPE, CONTENT, CONTENT_DATA_ID, CONTENT_TEMPLATE_ID, TITLE, SORT) ( select util_common.getAbsID, '-6760911671874597139', sysdate, '-6760911671874597139', sysdate, 42, id, moduleTemplateId, '20', '', id, contentTemplateId, 'CAP4-日志记录', '0' from vm_log_record vm where id =1001 );

-- statementId: findFGSQLFlowExecuteInfoByFlowInfo
-- case: 动态条件命中
-- type: select
-- assertion: 传入动态变量，验证最终 SQL 正常展开
-- params: {
--   "templateCode": "CODE_001",
--   "eventType": "VALUE_001",
--   "eventName": [
--     "EVENT_A",
--     "EVENT_B"
--   ]
-- }
select to_char(fces.eventType) eventType, fces.SQLContent, eventname, to_char(fces.executeSort) executeSort from vm_cap4_eventDataDoc fed join vm_cap4_eventDataDocSon fces on fed.id = fces.formmain_id where fed.flowTemplateCode = 'CODE_001' and fces.eventType = 'VALUE_001' and fces.eventName IN ('EVENT_A','EVENT_B');

-- statementId: findFGSQLFlowExecuteInfoByFlowInfo
-- case: 可选条件关闭
-- type: select
-- assertion: 移除可选动态属性，观察条件收缩后的 SQL
-- params: {
--   "templateCode": "CODE_001",
--   "eventType": "VALUE_001"
-- }
select to_char(fces.eventType) eventType, fces.SQLContent, eventname, to_char(fces.executeSort) executeSort from vm_cap4_eventDataDoc fed join vm_cap4_eventDataDocSon fces on fed.id = fces.formmain_id where fed.flowTemplateCode = 'CODE_001' and fces.eventType = 'VALUE_001' and fces.eventName IN (null);

-- statementId: executeEventSQLByFlowInfo.update
-- case: 基础参数命中
-- type: update
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: "update demo_table set status = 1"
update demo_table set status = 1;

-- statementId: fgOnlineSonByMainId.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: 1001
select id "id", formmain_id "formmain_id", paymentBatch "paymentBatch", paymentAmount "paymentAmount", expectedPaymentDate "expectedPaymentDate", percentage "percentage", paymentTerms "paymentTerms", remarks "remarks", paymentAmountUpperForShort "paymentAmountUpperForShort" from vm_fgonlinedocSon where formmain_id = 1001;

-- statementId: dataUnloadByCode.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: "CODE_001"
select writeDate, dataFileName, to_char(fileNameWithTime) fileNameWithTime, to_char(isNeedAttachment) isNeedAttachment, to_char(isZip) isZip, fileOutPath, dataUnloadCode from vm_dataUnloadConfig where dataUnloadCode = 'CODE_001';

-- statementId: queryDepartPostRecord.select
-- case: 动态条件命中
-- type: select
-- assertion: 传入动态变量，验证最终 SQL 正常展开
-- params: {
--   "name": "NAME_001",
--   "modelId": 1001
-- }
select id "id", modifydate "modifydate", dept "dept", busimodel "busimodel", questname "questname", postscope "postscope", mainmember "mainmember", submember "submember" from vm_deptpost where 1 = 1 and questName = 'NAME_001' and busimodel = 1001;

-- statementId: queryDepartPostRecord.select
-- case: 可选条件关闭
-- type: select
-- assertion: 移除可选动态属性，观察条件收缩后的 SQL
-- params: {}
select id "id", modifydate "modifydate", dept "dept", busimodel "busimodel", questname "questname", postscope "postscope", mainmember "mainmember", submember "submember" from vm_deptpost where 1 = 1;

-- statementId: findMenuNameById.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: 1001
select distinct name,tableName from (select id,nvl(ext7, name) name,'priv_menu' tableName from priv_menu union all select id, show_name as name, 'portal_customize_menu' tableName from portal_customize_menu) where id = 1001;

-- statementId: allEnableFilterMenu.select
-- case: 无参基础场景
-- type: select
-- assertion: 不传参数，验证固定 SQL 可直接生成
-- params: {}
select to_char(filterType) filterType, menuName, to_char(menuId) menuId, to_char(enable) enable from vm_enumFilterConfigCap4 where enable = -3841538853571705149;

-- statementId: config.selectAllEnabled
-- case: 无参基础场景
-- type: select
-- assertion: 不传参数，验证固定 SQL 可直接生成
-- params: {}
SELECT d.sysCode "sysCode", d.sourceHost "sourceHost", d.targetHost "targetHost", to_char(i.enable) "enable", i.interfaceCode "interfaceCode", to_char(i.startQingzhou) "startQingzhou", i.interfacePath "interfacePath", to_char(d.startQingzhouHost) "startQingzhouHost" FROM vm_qingzhou_domain d LEFT JOIN vm_qingzhou_interface_config i ON d.sysCode = i.sysCode WHERE i.enable = -3841538853571705149;

-- statementId: config.selectBySysCode
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: "CODE_001"
SELECT d.sysCode "sysCode", d.sourceHost "sourceHost", d.targetHost "targetHost", to_char(i.enable) "enable", i.interfaceCode "interfaceCode", to_char(i.startQingzhou) "startQingzhou", i.interfacePath "interfacePath", to_char(d.startQingzhouHost) "startQingzhouHost" FROM vm_qingzhou_domain d LEFT JOIN vm_qingzhou_interface_config i ON d.sysCode = i.sysCode WHERE d.sysCode = 'CODE_001' AND i.enable = -3841538853571705149;

-- statementId: config.selectByInterfaceCode
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: "CODE_001"
SELECT d.sysCode "sysCode", d.sourceHost "sourceHost", d.targetHost "targetHost", to_char(i.enable) "enable", i.interfaceCode "interfaceCode", to_char(i.startQingzhou) "startQingzhou", i.interfacePath "interfacePath", to_char(d.startQingzhouHost) "startQingzhouHost" FROM vm_qingzhou_domain d LEFT JOIN vm_qingzhou_interface_config i ON d.sysCode = i.sysCode WHERE i.interfaceCode = 'CODE_001' AND i.enable = -3841538853571705149;

-- statementId: interfaceConfig.selectInterfaceCodesBySysCode
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: "CODE_001"
SELECT interfaceCode FROM vm_qingzhou_interface_config WHERE sysCode = 'CODE_001' AND enable = -3841538853571705149;

-- statementId: mwork.selectAllPushConfigs
-- case: 无参基础场景
-- type: select
-- assertion: 不传参数，验证固定 SQL 可直接生成
-- params: {}
SELECT p.id as id, p.matching_rule as matchingRule, p.channel_code as channelCode, p.is_enabled as isEnabled, p.regex_match as regexMatch, p.template_id as templateId, c.app_id as appId, c.app_secret as appSecret, c.title_prefix_config as titlePrefixConfig FROM vm_rich_work_push_config p LEFT JOIN vm_mwork_channel_config c ON p.channel_code = c.channel_code WHERE p.is_enabled = -3841538853571705149 /* 只查询启用的配置 */;

-- statementId: mwork.selectPushConfigById
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: 1001
SELECT p.id as id, p.matching_rule as matchingRule, p.channel_code as channelCode, p.is_enabled as isEnabled, p.regex_match as regexMatch, p.template_id as templateId, c.app_id as appId, c.app_secret as appSecret, c.title_prefix_config as titlePrefixConfig FROM vm_rich_work_push_config p LEFT JOIN vm_mwork_channel_config c ON p.channel_code = c.channel_code WHERE p.id = 1001;

-- statementId: mwork.selectPushConfigsByChannelCode
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: "CODE_001"
SELECT p.id as id, p.matching_rule as matchingRule, p.channel_code as channelCode, p.is_enabled as isEnabled, p.regex_match as regexMatch, p.template_id as templateId, c.app_id as appId, c.app_secret as appSecret, c.title_prefix_config as titlePrefixConfig FROM vm_rich_work_push_config p LEFT JOIN vm_mwork_channel_config c ON p.channel_code = c.channel_code WHERE p.channel_code = 'CODE_001' AND p.is_enabled = -3841538853571705149 /* 根据通道编码查询且启用的配置 */;

