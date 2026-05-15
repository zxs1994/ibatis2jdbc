-- hr_sqlmap.xml statement SQL 脚本
-- 资源路径: /online_sqlmaps/hr_sqlmap.xml
-- 用例数: 267
-- 通过: 266
-- 失败: 1

-- statementId: stepBackFlowInfo.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "flowId": 1001
-- }
SELECT field0044 AS flowId, field0004 AS memberId, field0005 AS staffName, field0007 AS kmAccount, field0010 AS deptId, field0009 AS place, field0012 AS post, field0050 AS papersType, field0049 AS papersNo, field0013 AS workPhone, field0014 AS telephone FROM formmain_1660 WHERE field0044 =1001;

-- statementId: leaveInDate.select
-- case: 动态条件命中
-- type: select
-- assertion: 传入动态变量，验证最终 SQL 正常展开
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

-- statementId: leaveInDate.select
-- case: 可选条件关闭
-- type: select
-- assertion: 移除可选动态属性，观察条件收缩后的 SQL
-- params: {
--   "absenceTableName": "demo_table",
--   "startDate": "2026-05-14",
--   "endDate": "2026-05-14",
--   "startDateMorN": "2026-05-14",
--   "endDateMorN": "2026-05-14"
-- }
SELECT T.FIELD0001 AS LEAVEID, T.FIELD0002 AS APPLYUSER FROM demo_table T INNER JOIN ( SELECT T2.ID, T3.SHOWVALUE AS FIELD0015, T4.SHOWVALUE AS FIELD0017 FROM demo_table T2 LEFT JOIN CTP_ENUM_ITEM T3 ON T2.FIELD0015 = T3.ID LEFT JOIN CTP_ENUM_ITEM T4 ON T2.FIELD0017 = T4.ID ) S1 ON S1.ID = T.ID WHERE T.STATE = 1 AND ((TO_DATE('2026-05-14', 'YYYY-MM-DD') > T.FIELD0014 AND TO_DATE('2026-05-14', 'YYYY-MM-DD') < T.FIELD0016) OR (TO_DATE('2026-05-14', 'YYYY-MM-DD') > T.FIELD0014 AND TO_DATE('2026-05-14', 'YYYY-MM-DD') < T.FIELD0016) OR (TO_DATE('2026-05-14', 'YYYY-MM-DD') < T.FIELD0014 AND TO_DATE('2026-05-14', 'YYYY-MM-DD') > T.FIELD0016) OR (T.FIELD0014 = TO_DATE('2026-05-14', 'YYYY-MM-DD') AND S1.FIELD0015 = '2026-05-14') OR (T.FIELD0014 = TO_DATE('2026-05-14', 'YYYY-MM-DD') AND S1.FIELD0015 = DECODE('2026-05-14', '下午', '下午')) OR (T.FIELD0016 = TO_DATE('2026-05-14', 'YYYY-MM-DD') AND S1.FIELD0017 = '2026-05-14') OR (T.FIELD0016 = TO_DATE('2026-05-14', 'YYYY-MM-DD') AND S1.FIELD0017 = DECODE('2026-05-14', '上午', '上午')) OR (T.FIELD0014 = TO_DATE('2026-05-14', 'YYYY-MM-DD') AND S1.FIELD0015 = '2026-05-14') OR (T.FIELD0016 = TO_DATE('2026-05-14', 'YYYY-MM-DD') AND S1.FIELD0017 = '2026-05-14')) and 1=0;

-- statementId: HKLeaveInDate.select
-- case: 动态条件命中
-- type: select
-- assertion: 传入动态变量，验证最终 SQL 正常展开
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

-- statementId: HKLeaveInDate.select
-- case: 可选条件关闭
-- type: select
-- assertion: 移除可选动态属性，观察条件收缩后的 SQL
-- params: {
--   "startDate": "2026-05-14",
--   "endDate": "2026-05-14",
--   "startDateMorN": "2026-05-14",
--   "endDateMorN": "2026-05-14"
-- }
SELECT T.serialNo AS LEAVEID, T.applyUser AS APPLYUSER FROM vm_wf_hkLeaveApply T INNER JOIN ( SELECT T2.ID, T3.SHOWVALUE AS leaveStartHalfDay, T4.SHOWVALUE AS leaveEndHalfDay FROM vm_wf_hkLeaveApply T2 LEFT JOIN CTP_ENUM_ITEM T3 ON T2.leaveStartHalfDay = T3.ID LEFT JOIN CTP_ENUM_ITEM T4 ON T2.leaveEndHalfDay = T4.ID ) S1 ON S1.ID = T.ID WHERE T.STATE = 1 AND ((TO_DATE('2026-05-14', 'YYYY-MM-DD') > T.leaveStartDate AND TO_DATE('2026-05-14', 'YYYY-MM-DD') < T.leaveEndDate) OR (TO_DATE('2026-05-14', 'YYYY-MM-DD') > T.leaveStartDate AND TO_DATE('2026-05-14', 'YYYY-MM-DD') < T.leaveEndDate) OR (TO_DATE('2026-05-14', 'YYYY-MM-DD') < T.leaveStartDate AND TO_DATE('2026-05-14', 'YYYY-MM-DD') > T.leaveEndDate) OR (T.leaveStartDate = TO_DATE('2026-05-14', 'YYYY-MM-DD') AND S1.leaveStartHalfDay = '2026-05-14') OR (T.leaveStartDate = TO_DATE('2026-05-14', 'YYYY-MM-DD') AND S1.leaveStartHalfDay = DECODE('2026-05-14', '下午', '下午')) OR (T.leaveEndDate = TO_DATE('2026-05-14', 'YYYY-MM-DD') AND S1.leaveEndHalfDay = '2026-05-14') OR (T.leaveEndDate = TO_DATE('2026-05-14', 'YYYY-MM-DD') AND S1.leaveStartHalfDay = DECODE('2026-05-14', '上午', '上午')) OR (T.leaveStartDate = TO_DATE('2026-05-14', 'YYYY-MM-DD') AND S1.leaveStartHalfDay = '2026-05-14') OR (T.leaveEndDate = TO_DATE('2026-05-14', 'YYYY-MM-DD') AND S1.leaveEndHalfDay = '2026-05-14'));

-- statementId: cancelInDate.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "absenceCancelTableName": "demo_table",
--   "leaveId": 1001,
--   "endDate": "2026-05-14",
--   "startDate": "2026-05-14",
--   "endDateHalf": "2026-05-14"
-- }
SELECT t1.id FROM demo_table t1 WHERE t1.field0006 = 1001 AND STATE = 1 AND ( to_date('2026-05-14', 'YYYY-MM-DD') < t1.field0015 OR to_date('2026-05-14', 'YYYY-MM-DD') > t1.field0017 OR (to_date('2026-05-14', 'YYYY-MM-DD') = t1.field0015 and util_common.getEnumShowById(field0016) = '下午' and '2026-05-14' = '上午') OR (to_date('2026-05-14', 'YYYY-MM-DD') = t1.field0017 and util_common.getEnumShowById(field0018) = '上午' and '2026-05-14' = '下午') OR t1.field0013 = '-2733701732180602896' ) and id in (select form_recordId from col_summary where state = 3 and templete_id = -7111560710701037197) ORDER BY t1.start_date DESC;

-- statementId: HKCancelInDate.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "leaveId": 1001,
--   "endDate": "2026-05-14",
--   "startDate": "2026-05-14"
-- }
SELECT t1.id FROM vm_wf_hkLeaveBackApply t1 WHERE t1.leaveFlowSerialNo = 1001 AND STATE = 1 AND ( to_date('2026-05-14', 'YYYY-MM-DD') < t1.newLeaveStartDate OR to_date('2026-05-14', 'YYYY-MM-DD') > t1.newLeaveEndDate OR t1.leaveBackType = '-2733701732180602896' ) ORDER BY t1.start_date DESC;

-- statementId: getLivingResum.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "absenceCancelTableName": "demo_table",
--   "flowId": 1001
-- }
SELECT t1.id FROM demo_table t1 WHERE t1.field0006 = 1001 AND STATE = 1;

-- statementId: getHKLivingResum.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "flowId": 1001
-- }
SELECT t1.id FROM vm_wf_hkLeaveBackApply t1 WHERE t1.leaveFlowSerialNo = 1001 AND STATE = 1;

-- statementId: defaultInfo.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "defaultInfoTableName": "demo_table",
--   "deptName": "NAME_001"
-- }
SELECT t1.FIELD0005 AS beforeMember FROM demo_table t1 WHERE t1.field0003 = 'NAME_001';

-- statementId: updateDefaultInfo.update
-- case: 基础参数命中
-- type: update
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "defaultInfoTableName": "demo_table",
--   "curdate": "2026-05-14",
--   "totalMem": "VALUE_001",
--   "deptName": "NAME_001"
-- }
update demo_table t1 set t1.modify_date = CAST(to_date('2026-05-14', 'YYYY-MM-DD hh24:mi:ss') AS TIMESTAMP ), t1.field0005 = 'VALUE_001' where t1.field0003 = 'NAME_001';

-- statementId: insertStaffBasic.insert
-- case: 基础参数命中
-- type: insert
-- assertion: 传入基础变量，验证最终 SQL 正常生成
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
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "staffInfoTableName": "demo_table",
--   "code": "CODE_001"
-- }
SELECT t1.id FROM demo_table t1, org_member t2 WHERE t2.code = 'CODE_001' AND t1.field0001 = t2.id;

-- statementId: checkStaffYearInfo.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "staffInfoSonName": "RAW_VALUE",
--   "formMainId": 1001,
--   "year": "VALUE_001"
-- }
SELECT t1.id FROM RAW_VALUE t1 WHERE t1.formmain_id = 1001 AND t1.field0009 = 'VALUE_001';

-- statementId: insertStaffInfoMain.insert
-- case: 基础参数命中
-- type: insert
-- assertion: 传入基础变量，验证最终 SQL 正常生成
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
-- case: 基础参数命中
-- type: insert
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "staffInfoSonName": "RAW_VALUE",
--   "id": 1001,
--   "formMainId": 1001,
--   "year": "VALUE_001",
--   "days": "VALUE_001"
-- }
INSERT INTO RAW_VALUE ( ID, formmain_id, SORT, field0009, field0010, field0011, field0012, field0013) VALUES ( 1001, 1001, 0, 'VALUE_001', 'VALUE_001', 0, 'VALUE_001', 0 );

-- statementId: updateStaffInfoMain.update
-- case: 基础参数命中
-- type: update
-- assertion: 传入基础变量，验证最终 SQL 正常生成
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
-- case: 基础参数命中
-- type: update
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "staffInfoSonName": "RAW_VALUE",
--   "days": "VALUE_001",
--   "formMainId": 1001,
--   "year": "VALUE_001"
-- }
update RAW_VALUE t2 set t2.field0010 = 'VALUE_001' ,t2.field0012=('VALUE_001' - t2.field0011) where 1001 = t2.formmain_id and t2.field0009 = 'VALUE_001';

-- statementId: getLeaveVerifyDate.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "staffInfoTableName": "demo_table",
--   "staffInfoSonName": "RAW_VALUE",
--   "year": "VALUE_001",
--   "userId": 1001
-- }
SELECT t4.showvalue AS ifManager, t1.field0005 AS firstMarriage, t1.field0006 AS usedMarriageDay, t1.field0008 AS appliedMarriageDay, nvl(t2.field0012, '0') AS restYearDay, t2.field0013 AS appliedYearDay, CASE t3.ext_attr_11 WHEN 1 THEN '男' WHEN 2 THEN '女' ELSE '' END AS sex FROM demo_table t1 LEFT JOIN RAW_VALUE t2 ON t1.id = t2.formmain_id AND t2.field0009 = 'VALUE_001' LEFT JOIN org_member t3 ON t3.id = t1.field0001 LEFT JOIN ctp_enum_item t4 ON t4.id = t1.field0004 WHERE t1.field0001 = 1001;

-- statementId: getHKLeaveVerifyDate.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "year": "VALUE_001",
--   "userId": 1001
-- }
SELECT t1.firstMarriage, t1.usedMarriageDay, t1.appliedMarriageDay, nvl(t2.remainAnnualLeaveDays, '0') AS restYearDay, t2.onOrderAnnualLeaveDays AS appliedYearDay, CASE t3.ext_attr_11 WHEN 1 THEN '男' WHEN 2 THEN '女' ELSE '' END AS sex FROM vm_cap_hkMemberLeaveInfo t1 LEFT JOIN vm_cap_hkMemberLeaveInfo_son t2 ON t1.id = t2.formmain_id AND t2.year = 'VALUE_001' LEFT JOIN org_member t3 ON t3.id = t1.memberId WHERE t1.memberId = 1001;

-- statementId: getLeaveMaxAndMinDay.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "vacationTableName": "demo_table",
--   "leaveType": "VALUE_001",
--   "leaveDetailType": "VALUE_001"
-- }
select nvl(t1.field0006, '0') as leaveMaxDay ,nvl(t1.field0005 , '0') as leaveMinDay from demo_table t1 left join ctp_enum_item s1 on s1.id = t1.field0001 left join ctp_enum_item s2 on s2.id = t1.field0002 where t1.field0001 = 'VALUE_001' and t1.field0002 = 'VALUE_001';

-- statementId: getHKLeaveMaxAndMinDay.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "leaveType": "VALUE_001"
-- }
select nvl(t1.maxvactiondays, '0') as leaveMaxDay ,nvl(t1.minvactiondays , '0') as leaveMinDay from vm_vacationbaseinfoHK t1 left join ctp_enum_item s1 on s1.id = t1.vactiontype where t1.vactiontype = 'VALUE_001';

-- statementId: leaveInfo.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "formmain": "RAW_VALUE",
--   "formson": "RAW_VALUE",
--   "startDate": "2026-05-14",
--   "endDate": "2026-05-14"
-- }
SELECT TO_CHAR(T1.START_DATE, 'YYYY-MM-DD') AS LEAVE_FILEDATE, T1.ID AS LEAVEID, T3.NAME AS APPLY_NAME, NVL(T3.CODE, ' ') AS APPLY_NO, T4.NAME AS AGENT_NAME, NVL(T4.CODE, ' ') AS AGENT_NO, NVL(T5.CODE, ' ') AS APPLYDEPTNO, TO_CHAR(T1.FIELD0004, 'YYYY-MM-DD') AS LEAVE_APPLY_DATE, T6.ENUMVALUE AS LEAVE_TYPE, NVL(T7.ENUMVALUE, ' ') AS LEAVE_DETAIL_TYPE, TO_CHAR(T1.FIELD0010, 'YYYY-MM-DD') AS LEAVE_START_DATE, CASE T8.SHOWVALUE WHEN '上午' THEN 'AM' WHEN '下午' THEN 'PM' ELSE ' ' END AS LEAVE_STARTDATEAMORPM, TO_CHAR(T1.FIELD0012, 'YYYY-MM-DD') AS LEAVE_END_DATE, CASE T9.SHOWVALUE WHEN '上午' THEN 'AM' WHEN '下午' THEN 'PM' ELSE ' ' END AS LEAVE_ENDDATEAMORPM, T1.FIELD0014 AS LEAVE_DAY, T1.FIELD0016 AS LEAVE_REASON, CASE T10.SHOWVALUE WHEN '是' THEN 'T' WHEN '否' THEN 'F' ELSE ' ' END AS LEAVECOUNTRYFLAG, NVL(T1.FIELD0017, ' ') AS COUNTRY, NVL(TO_CHAR(T1.FIELD0019, 'YYYY-MM-DD'), ' ') AS EXIT_DATE, NVL(TO_CHAR(T1.FIELD0020, 'YYYY-MM-DD'), ' ') AS RETURN_DATE, T1.FIELD0018 AS STAY_DAY, NVL(TO_CHAR(T2.FIELD0032, 'YYYY-MM-DD'), ' ') AS CANCEL_FILEDATE, T2.ID AS CANCEL_ID, NVL(TO_CHAR(T2.FIELD0024, 'YYYY-MM-DD'), ' ') AS CANCEL_APPLY_DATE, NVL(T11.ENUMVALUE, ' ') AS CANCEL_APPLY_TYPE, NVL(TO_CHAR(T2.FIELD0025, 'YYYY-MM-DD'), ' ') AS CANCEL_START_DATE, CASE T12.SHOWVALUE WHEN '上午' THEN 'AM' WHEN '下午' THEN 'PM' ELSE ' ' END AS CANCEL_STARTDATEAMORPM, NVL(TO_CHAR(T2.FIELD0027, 'YYYY-MM-DD'), ' ') AS CANCEL_END_DATE, CASE T13.SHOWVALUE WHEN '上午' THEN 'AM' WHEN '下午' THEN 'PM' ELSE ' ' END AS CANCEL_ENDDATEAMORPM, NVL(T2.FIELD0030, ' ') AS CANCEL_REASON, T2.FIELD0029 AS CANCEL_DAY FROM RAW_VALUE T1 LEFT JOIN RAW_VALUE T2 ON T1.ID = T2.FORMMAIN_ID LEFT JOIN ORG_MEMBER T3 ON T1.FIELD0001 = T3.ID LEFT JOIN ORG_MEMBER T4 ON T1.FIELD0002 = T4.ID LEFT JOIN ORG_UNIT T5 ON T1.FIELD0003 = T5.ID LEFT JOIN CTP_ENUM_ITEM T6 ON T1.FIELD0008 = T6.ID LEFT JOIN CTP_ENUM_ITEM T7 ON T1.FIELD0009 = T7.ID LEFT JOIN CTP_ENUM_ITEM T8 ON T1.FIELD0011 = T8.ID LEFT JOIN CTP_ENUM_ITEM T9 ON T1.FIELD0013 = T9.ID LEFT JOIN CTP_ENUM_ITEM T10 ON T1.FIELD0015 = T10.ID LEFT JOIN CTP_ENUM_ITEM T11 ON T2.FIELD0023 = T11.ID LEFT JOIN CTP_ENUM_ITEM T12 ON T2.FIELD0026 = T12.ID LEFT JOIN CTP_ENUM_ITEM T13 ON T2.FIELD0028 = T13.ID WHERE T1.START_DATE BETWEEN TO_DATE('2026-05-14', 'YYYY-MM-DD') AND TO_DATE('2026-05-14', 'YYYY-MM-DD') OR T2.FIELD0032 BETWEEN TO_DATE('2026-05-14', 'YYYY-MM-DD') AND TO_DATE('2026-05-14', 'YYYY-MM-DD');

-- statementId: getFestival.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "userId": 1001,
--   "startDate": "2026-05-14",
--   "endDate": "2026-05-14"
-- }
SELECT s1.DATE_NUM FROM worktime_specialday s1 WHERE s1.is_rest = '2' AND s1.org_account_id IN (SELECT a1.org_account_id FROM org_member a1 WHERE a1.id = 1001) AND (to_date(s1.date_num, 'YYYY-MM-DD') BETWEEN to_date('2026-05-14', 'YYYY-MM-DD') AND to_date('2026-05-14', 'YYYY-MM-DD'));

-- statementId: isOnlyFestDay.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "userId": 1001,
--   "checkDate": "2026-05-14"
-- }
SELECT s1.ID FROM worktime_specialday s1 WHERE s1.is_rest = '2' AND s1.org_account_id IN ( SELECT a1.org_account_id FROM org_member a1 WHERE a1.id = 1001) AND to_date(s1.date_num, 'YYYY-MM-DD') = to_date('2026-05-14', 'YYYY-MM-DD');

-- statementId: isOnlyRestDay.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "userId": 1001,
--   "checkDate": "2026-05-14"
-- }
SELECT s1.ID FROM worktime_specialday s1 WHERE s1.is_rest = '1' AND s1.org_account_id IN ( SELECT a1.org_account_id FROM org_member a1 WHERE a1.id = 1001) AND to_date(s1.date_num, 'YYYY-MM-DD') = to_date('2026-05-14', 'YYYY-MM-DD');

-- statementId: isRestDay.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "userId": 1001,
--   "checkDate": "2026-05-14"
-- }
SELECT s1.ID,s1.DATE_NUM FROM worktime_specialday s1 WHERE ( s1.is_rest = '2' OR s1.is_rest = '1') AND s1.org_account_id IN ( SELECT a1.org_account_id FROM org_member a1 WHERE a1.id = 1001) AND to_date(s1.date_num, 'YYYY-MM-DD') = to_date('2026-05-14', 'YYYY-MM-DD');

-- statementId: isCancelDay.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "userId": 1001,
--   "date": "2026-05-14",
--   "dateMorN": "2026-05-14"
-- }
select vc.id,vc.leaveStartDate,vc.leaveStartDateMA,vc.leaveEndDate,vc.leaveEndDateMA,vu.applyUser from VM_CANCELLEAVEDAYSON_SICK vc left join VM_USERAPPLYFORLEAVE_SICK vu on vc.formmain_id = vu.id where vu.applyUser = 1001 and ( (to_date(to_char(vc.leaveStartDate, 'yyyy-MM-dd'), 'yyyy-MM-dd') < to_date('2026-05-14', 'yyyy-MM-dd') and to_date(to_char(vc.leaveEndDate, 'yyyy-MM-dd'), 'yyyy-MM-dd') > to_date('2026-05-14', 'yyyy-MM-dd')) or (to_date(to_char(vc.leaveStartDate, 'yyyy-MM-dd'), 'yyyy-MM-dd') = to_date('2026-05-14', 'yyyy-MM-dd') and to_date(to_char(vc.leaveEndDate, 'yyyy-MM-dd'), 'yyyy-MM-dd') = to_date('2026-05-14', 'yyyy-MM-dd') and (vc.leaveStartDateMA = '2026-05-14' or (vc.leaveStartDateMA = '770469099444389055' and vc.leaveEndDateMA = '3338464713283357441'))) or (to_date(to_char(vc.leaveStartDate, 'yyyy-MM-dd'), 'yyyy-MM-dd') = to_date('2026-05-14', 'yyyy-MM-dd') and to_date(to_char(vc.leaveEndDate, 'yyyy-MM-dd'), 'yyyy-MM-dd') != to_date('2026-05-14', 'yyyy-MM-dd') and (vc.leaveStartDateMA = '2026-05-14' or vc.leaveStartDateMA = '770469099444389055')) or (to_date(to_char(vc.leaveStartDate, 'yyyy-MM-dd'), 'yyyy-MM-dd') != to_date('2026-05-14', 'yyyy-MM-dd') and to_date(to_char(vc.leaveEndDate, 'yyyy-MM-dd'), 'yyyy-MM-dd') = to_date('2026-05-14', 'yyyy-MM-dd') and (vc.leaveEndDateMA = '2026-05-14' or vc.leaveEndDateMA = '3338464713283357441') ) );

-- statementId: isSickDay.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "userId": 1001,
--   "date": "2026-05-14",
--   "dateMorN": "2026-05-14"
-- }
select vu.id as "id", to_char(vc.leaveStartDate, 'yyyy-MM-dd') as "leaveStartDate", util_common.getEnumValueById(vc.leaveStartDateMA) as "leaveStartDateMA", to_char(vc.leaveEndDate, 'yyyy-MM-dd') as "leaveEndDate", util_common.getEnumValueById(vc.leaveEndDateMA) as "leaveEndDateMA", vc.leaveDay as "leaveDay", vc.leaveSerialNum as "leaveSerialNum" from VM_USERAPPLYFORLEAVE_SICK vu left join VM_CANCELLEAVEDAYSON_SICK vc on vc.formmain_id = vu.id where vu.applyUser = 1001 and vu.dayType = '-4565462988988594193' and ( (to_date(to_char(vu.beginDate, 'yyyy-MM-dd'), 'yyyy-MM-dd') < to_date('2026-05-14', 'yyyy-MM-dd') and to_date(to_char(vu.endDate, 'yyyy-MM-dd'), 'yyyy-MM-dd') > to_date('2026-05-14', 'yyyy-MM-dd')) or (to_date(to_char(vu.beginDate, 'yyyy-MM-dd'), 'yyyy-MM-dd') = to_date('2026-05-14', 'yyyy-MM-dd') and to_date(to_char(vu.endDate, 'yyyy-MM-dd'), 'yyyy-MM-dd') = to_date('2026-05-14', 'yyyy-MM-dd') and (vu.startTime = '2026-05-14' or (vu.startTime = '770469099444389055' and vu.endTime = '3338464713283357441'))) or (to_date(to_char(vu.beginDate, 'yyyy-MM-dd'), 'yyyy-MM-dd') = to_date('2026-05-14', 'yyyy-MM-dd') and to_date(to_char(vu.endDate, 'yyyy-MM-dd'), 'yyyy-MM-dd') != to_date('2026-05-14', 'yyyy-MM-dd') and (vu.startTime = '2026-05-14' or vu.startTime = '770469099444389055')) or (to_date(to_char(vu.beginDate, 'yyyy-MM-dd'), 'yyyy-MM-dd') != to_date('2026-05-14', 'yyyy-MM-dd') and to_date(to_char(vu.endDate, 'yyyy-MM-dd'), 'yyyy-MM-dd') = to_date('2026-05-14', 'yyyy-MM-dd') and (vu.endTime = '2026-05-14' or vu.endTime = '3338464713283357441') ) );

-- statementId: lowerDepartmentLevel.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "userId": 1001,
--   "roleName": "NAME_001"
-- }
SELECT min(length(u.path)) FROM org_relationship rs LEFT JOIN org_unit u ON u.id = rs.objective0_id WHERE rs.source_id = 1001 AND rs.objective1_id IN ( SELECT r.id FROM org_role r WHERE r.name = 'NAME_001');

-- statementId: lowerDepartmentManager.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "checkRole": "VALUE_001",
--   "userId": 1001,
--   "roleName": "NAME_001",
--   "level": "VALUE_001"
-- }
SELECT rs1.source_id id FROM org_relationship rs1 LEFT JOIN org_relationship rs2 ON rs1.objective0_id = rs2.objective0_id LEFT JOIN org_unit u ON u.id = rs1.objective0_id WHERE rs1.objective1_id IN (SELECT r.id FROM org_role r WHERE r.name = 'VALUE_001') AND rs2.source_id = 1001 AND rs2.objective1_id IN ( SELECT r.id FROM org_role r WHERE r.name = 'NAME_001') AND length(u.path) = 'VALUE_001';

-- statementId: findLeaveDayByUserId.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "userId": 1001,
--   "ehrLeaveInfoTable": "demo_table",
--   "startDate": "2026-05-14",
--   "endDate": "2026-05-14"
-- }
SELECT id, 1001 AS STAFFID,(SELECT name FROM org_member t WHERE t.id = field0001) AS NAME, trunc(field0010) AS STARTDATE, util_common.getEnumShowById(q.field0011) AS STARTDATEMORN, trunc(field0012) AS ENDDATE, util_common.getEnumShowById(q.field0013) AS ENDDATEMORN, util_common.getEnumShowById(q.field0008) AS TYPE, 1 AS ISFINISHED FROM demo_table q WHERE (field0010 BETWEEN '2026-05-14' AND '2026-05-14' OR field0012 BETWEEN '2026-05-14' AND '2026-05-14' OR (field0010 < '2026-05-14' AND field0012 > '2026-05-14')) AND field0006 = util_common.getEnumIdByRefName('请假记录状态', '已请假') AND field0001 IN ( SELECT COLUMN_VALUE FROM TABLE(util_org.getUnderlingMemId(1001)) UNION SELECT m.id FROM org_member m WHERE m.is_internal = 1 AND m.is_virtual = 0 AND m.is_enable = 1 AND m.is_deleted = 0 AND EXISTS (SELECT 1 FROM org_member m WHERE m.id = 1001 AND m.org_department_id = util_org.getDeptIdByDeptCode('77715')));

-- statementId: findHkLeaveDayByUserId.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "startDate": "2026-05-14",
--   "endDate": "2026-05-14",
--   "userId": 1001
-- }
SELECT id, applyUser as STAFFID, (SELECT name FROM org_member t WHERE t.id = applyUser) AS NAME, trunc(leaveStartDate) AS STARTDATE, util_common.getEnumShowById(q.leaveStartHalfDay) AS STARTDATEMORN, trunc(leaveEndDate) AS ENDDATE, util_common.getEnumShowById(q.leaveEndHalfDay) AS ENDDATEMORN, util_common.getEnumShowById(q.leaveType) AS TYPE, 1 AS ISFINISHED FROM vm_cap_hkLeaveRecord q WHERE (leaveStartDate BETWEEN '2026-05-14' AND '2026-05-14' OR leaveEndDate BETWEEN '2026-05-14' AND '2026-05-14' OR (leaveStartDate < '2026-05-14' AND leaveEndDate > '2026-05-14')) AND recordState = util_common.getEnumIdByRefName('请假记录状态', '已请假') AND applyUser IN ( SELECT COLUMN_VALUE FROM TABLE(util_org.getUnderlingMemId(1001)) UNION SELECT m.id FROM org_member m WHERE m.is_internal = 1 AND m.is_virtual = 0 AND m.is_enable = 1 AND m.is_deleted = 0 AND EXISTS (SELECT 1 FROM org_member m WHERE m.id = 1001 AND (m.org_post_id = (select id from org_post where code = 'HKZGHROfficer' ) or m.org_post_id = (select id from org_post where code = 'HKZGCEO' ) or m.org_post_id = (select id from org_post where code = 'HKZGFinanceOfficer' ) )) UNION select to_number(memberId) from vm_cap_chargeMemberRelation where chargeMember = 1001 UNION select distinct(to_number(applyUser)) from vm_wf_hkLeaveApply where 1001 in (select * from util_common.split(noticeMembers,',')) );

-- statementId: findLeaveDayByUserId4Cancel.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "userId": 1001,
--   "ehrLeaveCancelInfoTable": "demo_table",
--   "ehrLeaveInfoTable": "demo_table",
--   "startDate": "2026-05-14",
--   "endDate": "2026-05-14"
-- }
SELECT k1.id, 1001 AS STAFFID,(SELECT name FROM org_member t WHERE t.id = k1.field0001) NAME, STARTDATE, STARTDATEMORN, ENDDATE, ENDDATEMORN, 1 AS ISFINISHED, util_common.getEnumShowById(k1.field0008) AS TYPE FROM formmain_2157 k1 JOIN ( SELECT formmain_id, trunc(field0025) AS STARTDATE, util_common.getEnumShowById(q.field0026) AS STARTDATEMORN, trunc(field0027) AS ENDDATE, util_common.getEnumShowById(q.field0028) AS ENDDATEMORN FROM demo_table q WHERE field0023 =util_common.getEnumIdByRefName('销假类型', '部分销假') AND formmain_id IN ( SELECT ID FROM demo_table WHERE (field0010 BETWEEN '2026-05-14' AND '2026-05-14' OR field0012 BETWEEN '2026-05-14' AND '2026-05-14' OR (field0010<'2026-05-14' AND field0012>'2026-05-14')) AND field0006=util_common.getEnumIdByRefName('请假记录状态', '已销假') AND field0001 IN ( SELECT COLUMN_VALUE FROM TABLE (util_org.getUnderlingMemId(1001)) UNION SELECT m.id FROM org_member m WHERE m.is_internal=1 AND m.is_virtual=0 AND m.is_enable=1 AND m.is_deleted=0 AND EXISTS ( SELECT 1 FROM org_member m WHERE m.id = 1001 AND m.org_department_id=util_org.getDeptIdByDeptCode('77715') ) ) ) ) k2 ON k1.id = k2.formmain_id;

-- statementId: findHkLeaveDayByUserId4Cancel.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "userId": 1001,
--   "startDate": "2026-05-14",
--   "endDate": "2026-05-14"
-- }
SELECT k1.id, 1001 AS STAFFID,(SELECT name FROM org_member t WHERE t.id = k1.applyUser) NAME, STARTDATE AS STARTDATE, STARTDATEMORN as STARTDATEMORN, ENDDATE as ENDDATE, ENDDATEMORN as ENDDATEMORN, 1 AS ISFINISHED, util_common.getEnumShowById(k1.leaveType) AS TYPE FROM vm_cap_hkLeaveRecord k1 JOIN ( SELECT formmainId, trunc(newLeaveStartDate) AS STARTDATE, util_common.getEnumShowById(q.newLeaveStartHalfDay) AS STARTDATEMORN, trunc(newLeaveEndDate) AS ENDDATE, util_common.getEnumShowById(q.newLeaveEndHalfDay) AS ENDDATEMORN FROM vm_cap_hkLeaveRecord_son q WHERE leaveBackType =util_common.getEnumIdByRefName('销假类型', '部分销假') AND formmainId IN ( SELECT ID FROM vm_cap_hkLeaveRecord WHERE (leaveStartDate BETWEEN '2026-05-14' AND '2026-05-14' OR leaveEndDate BETWEEN '2026-05-14' AND '2026-05-14' OR (leaveStartDate<'2026-05-14' AND leaveEndDate>'2026-05-14')) AND recordState=util_common.getEnumIdByRefName('请假记录状态', '已销假') AND applyUser IN ( SELECT COLUMN_VALUE FROM TABLE (util_org.getUnderlingMemId(1001)) UNION SELECT m.id FROM org_member m WHERE m.is_internal = 1 AND m.is_virtual = 0 AND m.is_enable = 1 AND m.is_deleted = 0 AND EXISTS (SELECT 1 FROM org_member m WHERE m.id = 1001 AND (m.org_post_id = (select id from org_post where code = 'HKZGHROfficer' ) or m.org_post_id = (select id from org_post where code = 'HKZGCEO' ) or m.org_post_id = (select id from org_post where code = 'HKZGFinanceOfficer' ) )) UNION select to_number(memberId) from vm_cap_chargeMemberRelation where chargeMember = 1001 ) ) ) k2 ON k1.id = k2.formmainId;

-- statementId: findUnfinishedLeaveDayByUserId.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "userId": 1001,
--   "leaveFlowTable": "demo_table",
--   "startDate": "2026-05-14",
--   "endDate": "2026-05-14"
-- }
SELECT csy.id as id, 1001 AS STAFFID,(SELECT name FROM org_member t WHERE t.id = field0002) AS NAME, trunc(field0014) AS STARTDATE, util_common.getEnumShowById(field0015) AS STARTDATEMORN, trunc(field0016) AS ENDDATE, util_common.getEnumShowById(field0017) AS ENDDATEMORN, 0 AS ISFINISHED, util_common.getEnumShowById(fm.field0010) AS TYPE from demo_table fm left join col_summary csy on csy.form_recordid=fm.id WHERE ( field0014 BETWEEN '2026-05-14' AND '2026-05-14' OR field0016 BETWEEN '2026-05-14' AND '2026-05-14' OR (field0014 < '2026-05-14' AND field0016 > '2026-05-14') ) AND fm.finishedflag = 0 AND fm.state = 1 AND field0002 IN ( SELECT COLUMN_VALUE FROM TABLE (util_org.getUnderlingMemId(1001)) UNION SELECT m.id FROM org_member m WHERE m.is_internal=1 AND m.is_virtual=0 AND m.is_enable=1 AND m.is_deleted=0 AND EXISTS ( SELECT 1 FROM org_member m WHERE m.id = 1001 AND m.org_department_id=util_org.getDeptIdByDeptCode('77715')));

-- statementId: findHkUnfinishedLeaveDayByUserId.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "userId": 1001,
--   "startDate": "2026-05-14",
--   "endDate": "2026-05-14"
-- }
SELECT fm.id as id, 1001 AS STAFFID,(SELECT name FROM org_member t WHERE t.id = applyUser) AS NAME, trunc(leaveStartDate) AS STARTDATE, util_common.getEnumShowById(leaveStartHalfDay) AS STARTDATEMORN, trunc(leaveEndDate) AS ENDDATE, util_common.getEnumShowById(leaveEndHalfDay) AS ENDDATEMORN, 0 AS ISFINISHED, util_common.getEnumShowById(fm.leaveType) AS TYPE from vm_wf_hkLeaveApply fm left join col_summary csy on csy.form_recordid=fm.id WHERE ( leaveStartDate BETWEEN '2026-05-14' AND '2026-05-14' OR leaveEndDate BETWEEN '2026-05-14' AND '2026-05-14' OR (leaveStartDate < '2026-05-14' AND leaveEndDate > '2026-05-14') ) AND fm.finishedflag = 0 AND fm.state = 1 AND applyUser IN ( SELECT COLUMN_VALUE FROM TABLE (util_org.getUnderlingMemId(1001)) UNION SELECT m.id FROM org_member m WHERE m.is_internal = 1 AND m.is_virtual = 0 AND m.is_enable = 1 AND m.is_deleted = 0 AND EXISTS (SELECT 1 FROM org_member m WHERE m.id = 1001 AND (m.org_post_id = (select id from org_post where code = 'HKZGHROfficer' ) or m.org_post_id = (select id from org_post where code = 'HKZGCEO' ) or m.org_post_id = (select id from org_post where code = 'HKZGFinanceOfficer' ) )) UNION select to_number(memberId) from vm_cap_chargeMemberRelation where chargeMember = 1001 UNION select distinct(to_number(applyUser)) from vm_wf_hkLeaveApply where 1001 in (select * from util_common.split(noticeMembers,',')) );

-- statementId: getOtherLeavingFlow.select
-- case: 动态条件命中
-- type: select
-- assertion: 传入动态变量，验证最终 SQL 正常展开
-- params: {
--   "leaveFlowTable": "demo_table",
--   "currentFlow": "VALUE_001"
-- }
Select id as id,field0002 as applyuser,field0004 as applydept,trunc(field0014) as startdate,field0015 as startdatehalf, trunc(field0016) as enddate, field0017 as enddatehalf from demo_table where finishedflag = 0 and id <> 'VALUE_001' and state = 1;

-- statementId: getOtherLeavingFlow.select
-- case: 可选条件关闭
-- type: select
-- assertion: 移除可选动态属性，观察条件收缩后的 SQL
-- params: {
--   "leaveFlowTable": "demo_table"
-- }
Select id as id,field0002 as applyuser,field0004 as applydept,trunc(field0014) as startdate,field0015 as startdatehalf, trunc(field0016) as enddate, field0017 as enddatehalf from demo_table where finishedflag = 0 and state = 1;

-- statementId: getActualYearDay.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
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
-- case: 基础参数命中
-- type: update
-- assertion: 传入基础变量，验证最终 SQL 正常生成
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
-- case: 动态条件命中
-- type: select
-- assertion: 传入动态变量，验证最终 SQL 正常展开
-- params: {
--   "year": "VALUE_001",
--   "memberList": [
--     "EVENT_A",
--     "EVENT_B"
--   ]
-- }
select t.member as member,t.yearday as yearday, t.planmonth_1 as m1p,t.actualmonth_1 as m1a,t.planmonth_2 as m2p,t.actualmonth_2 as m2a, t.planmonth_3 as m3p,t.actualmonth_3 as m3a,t.planmonth_4 as m4p,t.actualmonth_4 as m4a, t.planmonth_5 as m5p,t.actualmonth_5 as m5a,t.planmonth_6 as m6p,t.actualmonth_6 as m6a, t.planmonth_7 as m7p,t.actualmonth_7 as m7a,t.planmonth_8 as m8p,t.actualmonth_8 as m8a, t.planmonth_9 as m9p,t.actualmonth_9 as m9a,t.planmonth_10 as m10p,t.actualmonth_10 as m10a, t.planmonth_11 as m11p,t.actualmonth_11 as m11a,t.planmonth_12 as m12p,t.actualmonth_12 as m12a from vm_yearleaveday t where t.year='VALUE_001' and t.member in ('EVENT_A','EVENT_B');

-- statementId: getYearLeavePlan.select
-- case: 可选条件关闭
-- type: select
-- assertion: 移除可选动态属性，观察条件收缩后的 SQL
-- params: {
--   "year": "VALUE_001"
-- }
select t.member as member,t.yearday as yearday, t.planmonth_1 as m1p,t.actualmonth_1 as m1a,t.planmonth_2 as m2p,t.actualmonth_2 as m2a, t.planmonth_3 as m3p,t.actualmonth_3 as m3a,t.planmonth_4 as m4p,t.actualmonth_4 as m4a, t.planmonth_5 as m5p,t.actualmonth_5 as m5a,t.planmonth_6 as m6p,t.actualmonth_6 as m6a, t.planmonth_7 as m7p,t.actualmonth_7 as m7a,t.planmonth_8 as m8p,t.actualmonth_8 as m8a, t.planmonth_9 as m9p,t.actualmonth_9 as m9a,t.planmonth_10 as m10p,t.actualmonth_10 as m10a, t.planmonth_11 as m11p,t.actualmonth_11 as m11a,t.planmonth_12 as m12p,t.actualmonth_12 as m12a from vm_yearleaveday t where t.year='VALUE_001';

-- statementId: initYearLeavePlan.insert
-- case: 基础参数命中
-- type: insert
-- assertion: 传入基础变量，验证最终 SQL 正常生成
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
-- case: 动态条件命中
-- type: select
-- assertion: 传入动态变量，验证最终 SQL 正常展开
-- params: {
--   "orgAccount": [
--     "EVENT_A",
--     "EVENT_B"
--   ]
-- }
SELECT DISTINCT ou.code FROM org_unit ou, (SELECT '^'||PATH aPATH FROM org_unit WHERE NAME IN ('EVENT_A','EVENT_B') ) t WHERE regexp_like(ou.path,t.aPATH) AND regexp_like(ou.code,'^[0-9]+[0-9]$$') AND ou.NAME NOT LIKE '%高管部%' AND ou.TYPE = 'Department' AND is_internal=1 AND is_enable=1 AND is_deleted=0 AND CODE IS NOT NULL;

-- statementId: getDeptListByAccountList.select
-- case: 可选条件关闭
-- type: select
-- assertion: 移除可选动态属性，观察条件收缩后的 SQL
-- params: {}
SELECT DISTINCT ou.code FROM org_unit ou, (SELECT '^'||PATH aPATH FROM org_unit ) t WHERE regexp_like(ou.path,t.aPATH) AND regexp_like(ou.code,'^[0-9]+[0-9]$$') AND ou.NAME NOT LIKE '%高管部%' AND ou.TYPE = 'Department' AND is_internal=1 AND is_enable=1 AND is_deleted=0 AND CODE IS NOT NULL;

-- statementId: getLineLeaderList.select
-- case: 动态条件命中
-- type: select
-- assertion: 传入动态变量，验证最终 SQL 正常展开
-- params: {
--   "orgAccount": [
--     "EVENT_A",
--     "EVENT_B"
--   ]
-- }
select om.code from org_member om where id in( SELECT DISTINCT RL.SOURCE_ID FROM ORG_RELATIONSHIP RL WHERE RL.TYPE = 'Member_Role' AND RL.OBJECTIVE1_ID IN (SELECT ID FROM ORG_ROLE R WHERE R.NAME = '分管领导') and RL.objective0_id IN(SELECT DISTINCT ou.id FROM org_unit ou, (SELECT '^'||PATH aPATH FROM org_unit WHERE NAME IN ('EVENT_A','EVENT_B') ) t WHERE regexp_like(ou.path,t.aPATH) AND regexp_like(ou.code,'^[0-9]+[0-9]$$') AND ou.NAME NOT LIKE '%高管部%' AND ou.TYPE = 'Department' AND is_internal=1 AND is_enable=1 AND is_deleted=0 AND CODE IS NOT NULL));

-- statementId: getLineLeaderList.select
-- case: 可选条件关闭
-- type: select
-- assertion: 移除可选动态属性，观察条件收缩后的 SQL
-- params: {}
select om.code from org_member om where id in( SELECT DISTINCT RL.SOURCE_ID FROM ORG_RELATIONSHIP RL WHERE RL.TYPE = 'Member_Role' AND RL.OBJECTIVE1_ID IN (SELECT ID FROM ORG_ROLE R WHERE R.NAME = '分管领导');
-- error: org.opentest4j.AssertionFailedError: getLineLeaderList.select generated SQL with unbalanced parentheses: select om.code from org_member om where id in( SELECT DISTINCT RL.SOURCE_ID FROM ORG_RELATIONSHIP RL WHERE RL.TYPE = 'Member_Role' AND RL.OBJECTIVE1_ID IN (SELECT ID FROM ORG_ROLE R WHERE R.NAME = '分管领导') ==> expected: <true> but was: <false>

-- statementId: clearActualYearLeaveDay.update
-- case: 无参基础场景
-- type: update
-- assertion: 不传参数，验证固定 SQL 可直接生成
-- params: {}
UPDATE vm_yearleaveday SET actualmonth_1 = 0,actualmonth_2 = 0,actualmonth_3 = 0,actualmonth_4 = 0, actualmonth_5 = 0,actualmonth_6 = 0,actualmonth_7 = 0,actualmonth_8 = 0, actualmonth_9 = 0,actualmonth_10 = 0,actualmonth_11 = 0,actualmonth_12 = 0;

-- statementId: getlineleaderdept.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "leaderId": 1001
-- }
SELECT ou.id FROM org_unit ou WHERE ou.ID in(SELECT OBJECTIVE0_ID FROM ORG_RELATIONSHIP RL WHERE RL.SOURCE_ID=1001) and ou.TYPE = 'Department' AND is_internal=1 AND is_enable=1 AND regexp_like(ou.code,'^[0-9]+[0-9]$') AND ou.NAME NOT LIKE '%高管部%';

-- statementId: getDeptByDeptManager.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "deptManager": "VALUE_001"
-- }
SELECT ID as dept FROM org_unit WHERE ID in(SELECT OBJECTIVE0_ID FROM ORG_RELATIONSHIP RL WHERE RL.SOURCE_ID='VALUE_001' AND RL.TYPE = 'Member_Role' AND RL.OBJECTIVE1_ID IN (SELECT ID FROM ORG_ROLE R WHERE R.NAME = '部门经理'));

-- statementId: getDeptYearLeavePlan.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "dept": "VALUE_001",
--   "year": "VALUE_001"
-- }
SELECT DISTINCT dept, nvl(planmonth_1,0)+nvl(planmonth_2,0)+nvl(planmonth_3,0) as planquarter_1, nvl(actualmonth_1,0)+nvl(actualmonth_2,0)+nvl(actualmonth_3,0) as actualquarter_1, nvl(planmonth_4,0)+nvl(planmonth_5,0)+nvl(planmonth_6,0) as planquarter_2, nvl(actualmonth_4,0)+nvl(actualmonth_5,0)+nvl(actualmonth_6,0) as actualquarter_2, nvl(planmonth_7,0)+nvl(planmonth_8,0)+nvl(planmonth_9,0) as planquarter_3, nvl(actualmonth_7,0)+nvl(actualmonth_8,0)+nvl(actualmonth_9,0) as actualquarter_3, nvl(planmonth_10,0)+nvl(planmonth_11,0)+nvl(planmonth_12,0) as planquarter_4, nvl(actualmonth_10,0)+nvl(actualmonth_11,0)+nvl(actualmonth_12,0) as actualquarter_4 FROM vm_yearleaveday where dept='VALUE_001' and year='VALUE_001';

-- statementId: initDeptYearLeavePlan.insert
-- case: 基础参数命中
-- type: insert
-- assertion: 传入基础变量，验证最终 SQL 正常生成
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
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "mainTable": "demo_table",
--   "sonTable": "demo_table",
--   "currentYear": "VALUE_001"
-- }
select t1.field0001 as member,t1.field0003 as dept,t1.field0008 as leavetype, to_char(t1.field0010,'yyyy-mm-dd') as startdate,(select s2.enumvalue from ctp_enum_item s2 where s2.id=t1.field0011) as startdatehalf, to_char(t1.field0012,'yyyy-mm-dd') as enddate,(select s3.enumvalue from ctp_enum_item s3 where s3.id=t1.field0013) as enddatehalf, (select s4.showvalue from ctp_enum_item s4 where s4.id=t2.field0023) as cancelleavetype, to_char(t2.field0025,'yyyy-mm-dd') as newstartdate,(select s5.enumvalue from ctp_enum_item s5 where s5.id=t2.field0026) as newstartdatehalf, to_char(t2.field0027,'yyyy-mm-dd') as newenddate,(select s6.enumvalue from ctp_enum_item s6 where s6.id=t2.field0028) as newenddatehalf, from demo_table t1,demo_table t2 where t1.id=t2.formmain_id and to_char(t1.field0010,'yyyy')='VALUE_001' and (select s1.showvalue from ctp_enum_item s1 where s1.id=t1.field0008) = '年假';

-- statementId: getLeaveInfo.select
-- case: 无参基础场景
-- type: select
-- assertion: 不传参数，验证固定 SQL 可直接生成
-- params: "VALUE_001"
select distinct v.id, title, to_char(leavedate,'yyyy-mm-dd') as leavedate, leavemember, leavedepart, agentmember, memberaddress, note, authorinfo from vm_wfleaveinfo v, ctp_affair c where v.id = c.object_id(+) and (sysdate-15) > v.leavedate and v.id not in ( select v.id from vm_wfleaveinfo v, ctp_affair c where v.id = c.object_id(+) and (sysdate-15) > v.leavedate and c.activity_id = 'VALUE_001' );

-- statementId: getCap4LeaveInfo.select
-- case: 无参基础场景
-- type: select
-- assertion: 不传参数，验证固定 SQL 可直接生成
-- params: "VALUE_001"
select distinct v.id, c.activity_id, to_char(leavedate, 'yyyy-mm-dd') as leavedate, leaveUserId, deptCode, agentNo, workplace, remark, flowUrl, isCloseAccount from vm_wf_cap4leaveinfo v left join ctp_affair c on v.id = c.form_recordid where (sysdate - 15) > v.leavedate and c.activity_id = 'VALUE_001' and c.state = 3 and (v.isCloseAccount is null or v.isCloseAccount != -1089048568118490234) and (v.remark is null or v.remark not in ('派遣人员转正式员工', '母子公司调动')) and v.leaveUserId not in (select staffNo from vm_wf_vm_RevokeSysAccCAP4);

-- statementId: getNoteById.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: 1001
select id from formmain_3531 where field0011 = 1001;

-- statementId: getVactionByVactionType.select
-- case: 动态条件命中
-- type: select
-- assertion: 传入动态变量，验证最终 SQL 正常展开
-- params: {
--   "vactionType": "VALUE_001",
--   "vactionDetailType": "VALUE_001"
-- }
select vactionType,vactiondetailType,isincludeFest,isincludeRest,minvactiondays,maxvactiondays from vm_vacationbaseinfo v where v.vactionType = 'VALUE_001' and v.vactiondetailtype = 'VALUE_001';

-- statementId: getVactionByVactionType.select
-- case: 可选条件关闭
-- type: select
-- assertion: 移除可选动态属性，观察条件收缩后的 SQL
-- params: {
--   "vactionType": "VALUE_001"
-- }
select vactionType,vactiondetailType,isincludeFest,isincludeRest,minvactiondays,maxvactiondays from vm_vacationbaseinfo v where v.vactionType = 'VALUE_001';

-- statementId: getVactionBaseInfoHK.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "vactionType": "VALUE_001"
-- }
select vactionType,isincludeFest,isincludeRest,minvactiondays,maxvactiondays from vm_vacationbaseinfoHK v where util_common.getEnumValueById(v.vactionType) = 'VALUE_001';

-- statementId: personalInfoByUserIdHK.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "userId": 1001,
--   "startYear": "VALUE_001",
--   "endYear": "VALUE_001"
-- }
select f1.memberId as "userId", f2.year as "year", f2.usedAnnualLeaveDays as "usedDays", /*to_char(field0011 - field0013) as leaveDay,可用于销假的天数*/ remainAnnualLeaveDays as "restDay", onOrderAnnualLeaveDays as "noTheWayDay" from vm_cap_hkMemberLeaveInfo f1 left join vm_cap_hkMemberLeaveInfo_son f2 on f1.id = f2.formmain_id where f1.memberId = 1001 and f2.year between 'VALUE_001' and 'VALUE_001' order by f2.year asc;

-- statementId: personalInfoByUserId.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "userId": 1001,
--   "startYear": "VALUE_001",
--   "endYear": "VALUE_001"
-- }
select f1.field0001 as "userId", f2.field0009 as "year", f2.field0011 as "usedDays", /*to_char(field0011 - field0013) as leaveDay,可用于销假的天数*/ field0012 as "restDay", field0013 as "noTheWayDay" from formmain_2153 f1 left join formson_2154 f2 on f1.id = f2.formmain_id where f1.field0001 = 1001 and f2.field0009 between 'VALUE_001' and 'VALUE_001' order by f2.field0009 asc;

-- statementId: queryCurrentDirector.select
-- case: 无参基础场景
-- type: select
-- assertion: 不传参数，验证固定 SQL 可直接生成
-- params: {}
select id, state, start_member_id, startdate, approve_member_id, approve_date, finished_flag, ratify_flag, ratify_member_id, ratify_date, modify_member_id, modify_date, sort, org_id, name, gender, post, education, positional_title, present_post_desc, id_type, id_number, status, date_of_appoint, date_of_depart, remark, presvious_post_desc, serial_number, filler, fill_date, filler_dept, record_module, edu_degree, nextSynTime from vm_company_directors_info where (util_common.getEnumShowById(org_id) = '高管');

-- statementId: queryPartTimeMemberIdNo.select
-- case: 无参基础场景
-- type: select
-- assertion: 不传参数，验证固定 SQL 可直接生成
-- params: {}
select v1.id_type as "idType", v1.id_number as "idNumber", v1.nextSynTime as "nextSynTime", v1.name as "name" from vm_company_directors_info v1 group by v1.id_type,v1.id_number,v1.nextsyntime,v1.name having count(name)>1;

-- statementId: insertLeaveSubInfo.insert
-- case: 基础参数命中
-- type: insert
-- assertion: 传入基础变量，验证最终 SQL 正常生成
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
-- case: 基础参数命中
-- type: update
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "record": "VALUE_001",
--   "dateOfAppoint": "2026-05-14",
--   "idType": 1001,
--   "idNumber": 1001,
--   "org": "VALUE_001"
-- }
update VM_COMPANY_DIRECTORS_INFO set record = 'VALUE_001' where date_of_appoint = '2026-05-14' and id_type = 1001 and id_number = 1001 and org_id = 'VALUE_001';

-- statementId: getHolidayByDay.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "year": "VALUE_001",
--   "date": "2026-05-14"
-- }
select to_char(datenum,'yyyy-mm-dd') datenum, isrest, datememo from table(util_common.getHolidays('VALUE_001',1)) where to_char(datenum,'yyyy-mm-dd') = '2026-05-14';

-- statementId: getParantalLeavePeriod.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "userId": 1001,
--   "startDate": "2026-05-14",
--   "endDate": "2026-05-14"
-- }
select parental.id as "id", parental.formmain_Id as "formmainId", base.memberId as "staffId", parental.childId as "childId", parental.holidayPeriodStart as "holidayPeriodStart", parental.holidayPeriodEnd as "holidayPeriodEnd", parental.holidayCount as "holidayCount", parental.holidayUsed as "holidayUsed", parental.holidayRest as "holidayRest", parental.holidayProcessing as "holidayProcessing", parental.idCopy as "idCopy" from vm_baseMemberInfo base left join vm_parentalLeaveInfo parental on base.id = parental.formmain_Id where base.memberId = 1001 and ( ('2026-05-14' < parental.holidayPeriodEnd and '2026-05-14' >= parental.holidayPeriodStart) or ('2026-05-14' < parental.holidayPeriodEnd and '2026-05-14' >= parental.holidayPeriodStart) ) order by parental.holidayPeriodStart, parental.childId asc;

-- statementId: getParantalLeavePeriodById.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: 1001
select parental.id as "id", parental.formmain_Id as "formmainId", parental.childId as "childId", parental.holidayPeriodStart as "holidayPeriodStart", parental.holidayPeriodEnd as "holidayPeriodEnd", parental.holidayCount as "holidayCount", parental.holidayUsed as "holidayUsed", parental.holidayRest as "holidayRest", parental.holidayProcessing as "holidayProcessing", parental.idCopy as "idCopy" from vm_parentalLeaveInfo parental where id = 1001;

-- statementId: getParentalLeaveRecord.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "identityNo": 1001,
--   "staffId": 1001,
--   "currentDate": "2026-05-14",
--   "isHalfDay": "VALUE_001"
-- }
select id as "id", identityNo as "identityNo", staffId as "staffId", currentDate as "currentDate", isHalfDay as "isHalfDay", isCancel as "isCancel", cancelDate as "cancelDate" from vm_parentalLeaveRecord where identityNo = 1001 and staffId = 1001 and currentDate = '2026-05-14' and isHalfDay = 'VALUE_001' and isCancel = 8705337157000773743;

-- statementId: addParentalLeaveRecord.insert
-- case: 基础参数命中
-- type: insert
-- assertion: 传入基础变量，验证最终 SQL 正常生成
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
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: 1001
select id as id, writer as "writer", writerDept as "writerDept", writeDate as "writeDate", leaveType as "leaveType", startDate as "startDate", startHalfDay as "startHalfDay", endDate as "endDate", endHalfDay as "endHalfDay", calcPeriod0 as "calcPeriod0", discountDay0 as "discountDay0", calcPeriod1 as "calcPeriod1", discountDay1 as "discountDay1", calcPeriod2 as "calcPeriod2", discountDay2 as "discountDay2", calcPeriod3 as "calcPeriod3", discountDay3 as "discountDay3", calcPeriod4 as "calcPeriod4", discountDay4 as "discountDay4" from vm_wf_parentalleave where id = 1001;

-- statementId: getParentalLeaveCancelFlowInfo.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: 1001
select id as id, writer as "writer", writerDept as "writerDept", writeDate as "writeDate", leaveRecord as "leaveRecord", leaveType as "leaveType", startDate as "startDate", startHalfDay as "startHalfDay", endDate as "endDate", endHalfDay as "endHalfDay", cancelType as "cancelType", newstartDate as "newstartDate", newstartHalfDay as "newstartHalfDay", newendDate as "newendDate", newendHalfDay as "newendHalfDay" from vm_wf_parentalleavecancel where id = 1001;

-- statementId: insertFormRelation.insert
-- case: 基础参数命中
-- type: insert
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "recordId": 1001,
--   "flowId": 1001,
--   "attachField": "VALUE_001"
-- }
insert into form_relation_record (id, from_masterdata_id, to_masterdata_id, state, field_name, form_type, type, member_id, from_subdata_id, to_subdata_id, from_form_id, to_form_id) values (util_common.getAbsID, 1001, (select id from col_summary where form_recordid=1001), 1, 'VALUE_001', '1', '1', '-6760911671874597139', '0', '0', '-8899514785812624908', '6734388298582673815' );

-- statementId: getCancelLeaveRecords.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "staffId": 1001,
--   "newStartDate": "2026-05-14",
--   "newEndDate": "2026-05-14"
-- }
select id as "id", identityNo as "identityNo", staffId as "staffId", currentDate as "currentDate", isHalfDay as "isHalfDay", isCancel as "isCancel", cancelDate as "cancelDate", periodId as "periodId" from vm_parentalLeaveRecord where staffId = 1001 and currentDate >= '2026-05-14' and currentDate <= '2026-05-14' and isCancel = 8705337157000773743 order by currentDate asc ,ishalfday desc;

-- statementId: updateParentalLeavePeriod.update
-- case: 基础参数命中
-- type: update
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "holidayUsed": 1001,
--   "holidayRest": 1001,
--   "id": 1001
-- }
update vm_parentalleaveInfo set holidayUsed = 1001, holidayRest = 1001 where id = 1001;

-- statementId: updateParentalLeaveRecord.update
-- case: 基础参数命中
-- type: update
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "isCancel": "VALUE_001",
--   "cancelDate": "2026-05-14",
--   "cancelLeaveFlowId": 1001,
--   "id": 1001
-- }
update vm_parentalleaverecord set isCancel = 'VALUE_001', cancelDate = '2026-05-14', cancelLeaveFlowId = (select subject from ctp_affair where form_recordId = 1001 group by subject) where id = 1001;

-- statementId: allBaseMemberInfo.update
-- case: 无参基础场景
-- type: update
-- assertion: 不传参数，验证固定 SQL 可直接生成
-- params: {}
update vm_baseMemberInfo set isinvestmanager = -812415069995905183, istopmanager = -1089048568118490234, isinvestdepartmanager = -1089048568118490234, isinvesthelp = -1089048568118490234;

-- statementId: baseMemberInfoByUserId.update
-- case: 动态条件命中
-- type: update
-- assertion: 传入动态变量，验证最终 SQL 正常展开
-- params: {
--   "memIds": [
--     "EVENT_A",
--     "EVENT_B"
--   ],
--   "isTopManager": "VALUE_001",
--   "isInvestDepartManager": "VALUE_001",
--   "isInvestHelp": "VALUE_001",
--   "isInvestManager": "VALUE_001"
-- }
update vm_baseMemberInfo set , istopmanager = -3841538853571705149 , isinvestdepartmanager =-3841538853571705149 , isinvesthelp = -3841538853571705149 , isinvestmanager =8754640325005626184 where util_user.getMemCodeByMemId(memberId) IN ('EVENT_A','EVENT_B');

-- statementId: baseMemberInfoByUserId.update
-- case: 可选条件关闭
-- type: update
-- assertion: 移除可选动态属性，观察条件收缩后的 SQL
-- params: {}
update vm_baseMemberInfo set where util_user.getMemCodeByMemId(memberId) IN (null);

-- statementId: isWorkDay.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "date": "2026-05-14"
-- }
select to_char(util_common.isWorkDay('2026-05-14')) from dual;

-- statementId: getLastWorkDay.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "date": "2026-05-14"
-- }
select util_common.getLastWorkDay('2026-05-14') from dual;

-- statementId: getNextWorkDay.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "date": "2026-05-14"
-- }
select to_char(util_common.getNextWorkDay('2026-05-14')) from dual;

-- statementId: leaveDayDate.update
-- case: 基础参数命中
-- type: update
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "startDate": "2026-05-14",
--   "endDate": "2026-05-14",
--   "id": 1001
-- }
update vm_wf_parentalleave set startDateextend = '2026-05-14', endDateextend = '2026-05-14' where id = 1001;

-- statementId: findLeaveStartDate.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "startDate": "2026-05-14",
--   "endDate": "2026-05-14",
--   "userId": 1001
-- }
select c.startdate, c.enddate, c. starthalf, c.endhalt from vm_leaveDayrecordtable c where ( ('2026-05-14' between c.startdate and c.enddate and c.enddate != '2026-05-14') or (enddate = '2026-05-14' -1 and c.endhalt = 3338464713283357441) ) and c.leaver = 1001;

-- statementId: mergeParentalChildInfo.insert
-- case: 基础参数命中
-- type: insert
-- assertion: 传入基础变量，验证最终 SQL 正常生成
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
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: 1001
select id from VM_BASEMEMBERINFO where memberId = 1001;

-- statementId: deleteEmptyParentalChildInfo.delete
-- case: 无参基础场景
-- type: delete
-- assertion: 不传参数，验证固定 SQL 可直接生成
-- params: {}
delete from vm_parentalLeaveInfo where childid is null or holidayperiodstart is null;

-- statementId: allCancelDayRecord.delete
-- case: 基础参数命中
-- type: delete
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "startDate": "2026-05-14",
--   "endDate": "2026-05-14"
-- }
delete from vm_DailyLeaveTravelRecord where leaveSerialNum in ( select distinct serialNum from vm_userapplyforleave f where f.recordStatus = 2149466679256501365 and to_char(f.modify_date, 'yyyy-mm-dd') BETWEEN '2026-05-14' AND '2026-05-14' connect by id = prior id and level <= enddate - begindate + 1 and prior sys_guid() is not null);

-- statementId: allCancelSurveyRecord.delete
-- case: 基础参数命中
-- type: delete
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "applyStatus": 1,
--   "startDate": "2026-05-14",
--   "endDate": "2026-05-14"
-- }
delete from vm_DailyLeaveTravelRecord where travelSerialNum in ( select distinct serialNum from vm_evectionRecord f where f.applyStatus = 1 and to_char(f.modify_date, 'yyyy-mm-dd') BETWEEN '2026-05-14' AND '2026-05-14' connect by id=prior id and level <= travelEndDate-travelBeginDate+1 and prior sys_guid() is not null);

-- statementId: allCancelDayRecordCtpContent.delete
-- case: 无参基础场景
-- type: delete
-- assertion: 不传参数，验证固定 SQL 可直接生成
-- params: {}
delete from ctp_content_all f where f.module_template_id = -9154120848050929403 and f.content_template_id = 6050223712139953374 and not exists (select 1 from vm_DailyLeaveTravelRecord vdd where f.content_data_id = vdd.id);

-- statementId: empBusinessCard.select
-- case: 动态条件命中
-- type: select
-- assertion: 传入动态变量，验证最终 SQL 正常展开
-- params: {
--   "kmCodes": [
--     "EVENT_A",
--     "EVENT_B"
--   ]
-- }
select f.id, to_char(f.memberId) memberId, f.loginName, nvl(f.chnname, f3.name) chnname, engname, departid, chnTitle, engTitle, f.qq, f.officeAddress, f.partTimeOfficeAddress, f.ecard, f.nameCardTemplate, util_common.getEnumShowById(f.showDeptChnName) showDeptChnName, util_common.getEnumShowById(f.showDeptEngName) showDeptEngName, util_common.getEnumShowById(f.showdeptEngAddress) showdeptEngAddress, f2_parent.name accountName, f2_parent.second_name accountEnName, f7.field0005 accountEnAddress, f2_parent.ext_attr_4 accountLandline, f2_parent.ext_attr_5 accountFax, nvl(f.departCn, util_org.getDeptNameByDeptId(f.departId)) departName, f2_parent.ext_attr_2 accountAddress, f2_parent.ext_attr_3 accountZIP, f2_parent.code, f3.ext_attr_2 email, f3.ext_attr_3 Landline, f.phone, f.otherPhone, f4.departEnName, f6.departEnName partTimeDepartEnName, f.businessQRCard, f.kmCode, util_org.getDeptNameByDeptId(f.partTimeDepartment) partTimeDepartName, f.traditionalName, f.partTimeTitle, f.partTimeChnTitle, f.partTimeEngTitle, f8.field0005 partTimeAccountEnAddress, f5_parent.ext_attr_4 partTimeAccountLandline, f5_parent.ext_attr_5 partTimeAccountFax, f5_parent.code partTimeAccountCode, f5_parent.ext_attr_7 url, f5_parent.name partTimeAccountName, f5_parent.second_name partTimeAccountEnName, f5_parent.ext_attr_2 partTimeAccountAddress, f5_parent.ext_attr_3 partTimeAccountZIP from vm_basememberinfo f left join org_unit f2 ON f.departId = f2.id left join org_unit f2_parent ON f2.org_account_id = f2_parent.id left join org_unit f5 ON f.partTimeDepartment = f5.id left join org_unit f5_parent ON f5.org_account_id = f5_parent.id left join org_member f3 on f.memberId = f3.id left join vm_deptaffairrole f4 on f.departId = f4.roleDept left join vm_deptaffairrole f6 on f.partTimeDepartment = f6.roleDept left join formmain_6276 f7 on f2_parent.code = f7.field0003 left join formmain_6276 f8 on f5_parent.code = f8.field0003 where f3.is_internal = 1 and f3.is_enable = 1 and f3.is_deleted = 0 AND kmCode IN ('EVENT_A','EVENT_B');

-- statementId: empBusinessCard.select
-- case: 可选条件关闭
-- type: select
-- assertion: 移除可选动态属性，观察条件收缩后的 SQL
-- params: {}
select f.id, to_char(f.memberId) memberId, f.loginName, nvl(f.chnname, f3.name) chnname, engname, departid, chnTitle, engTitle, f.qq, f.officeAddress, f.partTimeOfficeAddress, f.ecard, f.nameCardTemplate, util_common.getEnumShowById(f.showDeptChnName) showDeptChnName, util_common.getEnumShowById(f.showDeptEngName) showDeptEngName, util_common.getEnumShowById(f.showdeptEngAddress) showdeptEngAddress, f2_parent.name accountName, f2_parent.second_name accountEnName, f7.field0005 accountEnAddress, f2_parent.ext_attr_4 accountLandline, f2_parent.ext_attr_5 accountFax, nvl(f.departCn, util_org.getDeptNameByDeptId(f.departId)) departName, f2_parent.ext_attr_2 accountAddress, f2_parent.ext_attr_3 accountZIP, f2_parent.code, f3.ext_attr_2 email, f3.ext_attr_3 Landline, f.phone, f.otherPhone, f4.departEnName, f6.departEnName partTimeDepartEnName, f.businessQRCard, f.kmCode, util_org.getDeptNameByDeptId(f.partTimeDepartment) partTimeDepartName, f.traditionalName, f.partTimeTitle, f.partTimeChnTitle, f.partTimeEngTitle, f8.field0005 partTimeAccountEnAddress, f5_parent.ext_attr_4 partTimeAccountLandline, f5_parent.ext_attr_5 partTimeAccountFax, f5_parent.code partTimeAccountCode, f5_parent.ext_attr_7 url, f5_parent.name partTimeAccountName, f5_parent.second_name partTimeAccountEnName, f5_parent.ext_attr_2 partTimeAccountAddress, f5_parent.ext_attr_3 partTimeAccountZIP from vm_basememberinfo f left join org_unit f2 ON f.departId = f2.id left join org_unit f2_parent ON f2.org_account_id = f2_parent.id left join org_unit f5 ON f.partTimeDepartment = f5.id left join org_unit f5_parent ON f5.org_account_id = f5_parent.id left join org_member f3 on f.memberId = f3.id left join vm_deptaffairrole f4 on f.departId = f4.roleDept left join vm_deptaffairrole f6 on f.partTimeDepartment = f6.roleDept left join formmain_6276 f7 on f2_parent.code = f7.field0003 left join formmain_6276 f8 on f5_parent.code = f8.field0003 where f3.is_internal = 1 and f3.is_enable = 1 and f3.is_deleted = 0;

-- statementId: memberQrcode.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: "CODE_001"
select to_char(f2.file_url) file_url from vm_basememberinfo f1 left join ctp_attachment f2 on f1.businessQRCard = f2.sub_reference where businessQRCard is not null and kmCode = 'CODE_001';

-- statementId: memberPartTimeQrcode.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: "CODE_001"
select to_char(f2.file_url) file_url from vm_basememberinfo f1 left join ctp_attachment f2 on f1.partTimeQRCard = f2.sub_reference where partTimeQRCard is not null and kmCode = 'CODE_001';

-- statementId: deleteAllECardReference
-- case: 无参基础场景
-- type: update
-- assertion: 不传参数，验证固定 SQL 可直接生成
-- params: {}
update vm_basememberinfo set ecard = null;

-- statementId: eCardDownInfo.select
-- case: 动态条件命中
-- type: select
-- assertion: 传入动态变量，验证最终 SQL 正常展开
-- params: {
--   "kmCodes": [
--     "EVENT_A",
--     "EVENT_B"
--   ]
-- }
select ecard, to_char(f1.hrCode) hrCode,to_char(f2.file_url) as fieldId, nvl(f1.chnname, f3.name) chnname ,partTimeEcard,to_char(f2p.file_url) as partTimeFieldId from vm_basememberinfo f1 left join ctp_attachment f2 on f1.ecard = f2.sub_reference left join ctp_attachment f2p on f1.partTimeEcard = f2p.sub_reference left join org_member f3 on f1.memberId = f3.id where ecard is not null AND kmCode IN ('EVENT_A','EVENT_B');

-- statementId: eCardDownInfo.select
-- case: 可选条件关闭
-- type: select
-- assertion: 移除可选动态属性，观察条件收缩后的 SQL
-- params: {}
select ecard, to_char(f1.hrCode) hrCode,to_char(f2.file_url) as fieldId, nvl(f1.chnname, f3.name) chnname ,partTimeEcard,to_char(f2p.file_url) as partTimeFieldId from vm_basememberinfo f1 left join ctp_attachment f2 on f1.ecard = f2.sub_reference left join ctp_attachment f2p on f1.partTimeEcard = f2p.sub_reference left join org_member f3 on f1.memberId = f3.id where ecard is not null;

-- statementId: companyEnName.select
-- case: 无参基础场景
-- type: select
-- assertion: 不传参数，验证固定 SQL 可直接生成
-- params: {}
select companyEnName from vm_companyExtend where companyCode = 'FGF';

-- statementId: cardExcelExport.select
-- case: 动态条件命中
-- type: select
-- assertion: 传入动态变量，验证最终 SQL 正常展开
-- params: {
--   "kmCodes": [
--     "EVENT_A",
--     "EVENT_B"
--   ]
-- }
select chnname 中文姓名_1, engname 英文姓名_2, chnTitle 中文抬头_3, engTitle 英文抬头_4, f2.name 单位名称_5, nvl(f.departCn, util_org.getDeptNameByDeptId(f.departId)) 部门名称_6, f4.departEnName 部门英文名称_7, f2.ext_attr_2 单位地址_8, 'accountEnAddress' 单位英文地址_9, f.officeAddress 办公地址_10, f.phone 手机号_11, f.otherPhone 其他手机号_12, f3.ext_attr_3 座机_13, f3.ext_attr_2 邮箱_14, f2.ext_attr_3 单位邮编_15, f.qq qq_16, f.wechat 微信_17, util_common.getEnumShowById(f.showDeptEngName) 是否显示部门英文名称_18, util_common.getEnumShowById(f.showdeptEngAddress) 是否显示单位英文地址_19 from vm_basememberinfo f left join org_unit f2 on 1 = 1 left join org_member f3 on f.memberId = f3.id left join vm_deptaffairrole f4 on f.departId = f4.roleDept where f2.id = 97839079791739420 and f3.is_internal = 1 and f3.is_enable = 1 and f3.is_deleted = 0 and f.memberState = '在职' AND kmCode IN ('EVENT_A','EVENT_B');

-- statementId: cardExcelExport.select
-- case: 可选条件关闭
-- type: select
-- assertion: 移除可选动态属性，观察条件收缩后的 SQL
-- params: {}
select chnname 中文姓名_1, engname 英文姓名_2, chnTitle 中文抬头_3, engTitle 英文抬头_4, f2.name 单位名称_5, nvl(f.departCn, util_org.getDeptNameByDeptId(f.departId)) 部门名称_6, f4.departEnName 部门英文名称_7, f2.ext_attr_2 单位地址_8, 'accountEnAddress' 单位英文地址_9, f.officeAddress 办公地址_10, f.phone 手机号_11, f.otherPhone 其他手机号_12, f3.ext_attr_3 座机_13, f3.ext_attr_2 邮箱_14, f2.ext_attr_3 单位邮编_15, f.qq qq_16, f.wechat 微信_17, util_common.getEnumShowById(f.showDeptEngName) 是否显示部门英文名称_18, util_common.getEnumShowById(f.showdeptEngAddress) 是否显示单位英文地址_19 from vm_basememberinfo f left join org_unit f2 on 1 = 1 left join org_member f3 on f.memberId = f3.id left join vm_deptaffairrole f4 on f.departId = f4.roleDept where f2.id = 97839079791739420 and f3.is_internal = 1 and f3.is_enable = 1 and f3.is_deleted = 0 and f.memberState = '在职';

-- statementId: cardDownInfo.select
-- case: 动态条件命中
-- type: select
-- assertion: 传入动态变量，验证最终 SQL 正常展开
-- params: {
--   "kmCodes": [
--     "EVENT_A",
--     "EVENT_B"
--   ]
-- }
select nameCardTemplate, to_char(f1.hrCode) hrCode,to_char(f2.file_url) as fieldId, f1.chnname from vm_basememberinfo f1 left join ctp_attachment f2 on f1.nameCardTemplate = f2.sub_reference where nameCardTemplate is not null AND kmCode IN ('EVENT_A','EVENT_B');

-- statementId: cardDownInfo.select
-- case: 可选条件关闭
-- type: select
-- assertion: 移除可选动态属性，观察条件收缩后的 SQL
-- params: {}
select nameCardTemplate, to_char(f1.hrCode) hrCode,to_char(f2.file_url) as fieldId, f1.chnname from vm_basememberinfo f1 left join ctp_attachment f2 on f1.nameCardTemplate = f2.sub_reference where nameCardTemplate is not null;

-- statementId: updateEmpBaseInfo.update
-- case: 动态条件命中
-- type: update
-- assertion: 传入动态变量，验证最终 SQL 正常展开
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

-- statementId: updateEmpBaseInfo.update
-- case: 可选条件关闭
-- type: update
-- assertion: 移除可选动态属性，观察条件收缩后的 SQL
-- params: {
--   "kmCode": "CODE_001"
-- }
update vm_basememberinfo set where kmcode = 'CODE_001';

-- statementId: paperCardModelFileUrl.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: "VALUE_001"
select f.file_url fieldId from ctp_attachment f where f.sub_reference = 'VALUE_001';

-- statementId: getHKMembersAnnualLeaveInfo.select
-- case: 无参基础场景
-- type: select
-- assertion: 不传参数，验证固定 SQL 可直接生成
-- params: {}
select id as "id", memberId as "memberId", memberDept as "memberDept", memberState as "memberState", post as "post", joinDate as "joinDate", resignDate as "resignDate", remainExtraLeave as "remainExtraLeave", onOrderExtraLeave as "onOrderExtraLeave", noticeMembers as "noticeMembers", usedMarriageDay as "usedMarriageDay", appliedMarriageDay as "appliedMarriageDay", chargeMember as "chargeMember", firstMarriage as "firstMarriage" from vm_cap_hkMemberLeaveInfo;

-- statementId: getHKMembersLeaveDetailByMainId.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: 1001
select id as "id", formmain_id as "formmainId", year as "year", annualLeaveStart as "annualLeaveStart", annualLeaveEnd as "annualLeaveEnd", annualLeaveDays as "annualLeaveDays", usedAnnualLeaveDays as "usedAnnualLeaveDays", remainAnnualLeaveDays as "remainAnnualLeaveDays", onOrderAnnualLeaveDays as "onOrderAnnualLeaveDays" from vm_cap_hkMemberLeaveInfo_son where formmain_id = 1001 order by year desc;

-- statementId: getTodayHKLeaveApply.select
-- case: 无参基础场景
-- type: select
-- assertion: 不传参数，验证固定 SQL 可直接生成
-- params: {}
select t.id, t."applyUser", t."leaveStartDate", t."leaveStartHalfDay", t."leaveEndDate", t."leaveEndHalfDay", t."type", t."recordSign" from ( SELECT q.id, q.applyUser as "applyUser", trunc(q.leaveStartDate) AS "leaveStartDate", util_common.getEnumShowById(q.leaveStartHalfDay) AS "leaveStartHalfDay", trunc(q.leaveEndDate) AS "leaveEndDate", util_common.getEnumShowById(q.leaveEndHalfDay) AS "leaveEndHalfDay", util_common.getEnumShowById(q.leaveType) AS "type", q.recordsign AS "recordSign" FROM vm_cap_hkLeaveRecord q left join vm_wf_hkleavebackapply qk on qk.leaveFlowSerialNo = q.recordSign WHERE q.recordState = util_common.getEnumIdByRefName('请假记录状态', '已请假') and (qk.state is null or qk.state = 0) UNION ALL SELECT id, applyUser as "applyUser", trunc(newLeaveStartDate) AS "leaveStartDate", util_common.getEnumShowById(newLeaveStartHalfDay) AS "leaveStartHalfDay", trunc(newLeaveEndDate) AS "leaveEndDate", util_common.getEnumShowById(newLeaveEndHalfDay) AS "leaveEndHalfDay", util_common.getEnumShowById(leaveType) AS "type", recordsign AS "recordSign" FROM vm_cap_hkLeaveRecord_son where leaveBackType = util_common.getEnumIdByRefName('销假类型', '部分销假') ) t where 1=1 and (t."leaveStartDate" <= sysdate and t."leaveEndDate" >= sysdate - 1 );

-- statementId: getTodayHKLeaveApplyUnfinished.select
-- case: 动态条件命中
-- type: select
-- assertion: 传入动态变量，验证最终 SQL 正常展开
-- params: {
--   "finishedFlowSign": "RAW_VALUE"
-- }
select t."applyUser", t."leaveStartDate", t."leaveStartHalfDay", t."leaveEndDate", t."leaveEndHalfDay", t."type" from ( select applyUser as "applyUser", leaveStartDate as "leaveStartDate", util_common.getEnumShowById(leaveStartHalfDay) as "leaveStartHalfDay", leaveEndDate as "leaveEndDate", util_common.getEnumShowById(leaveEndHalfDay) as "leaveEndHalfDay", finishedflag as "finishedflag", serialNo as "serialNo", util_common.getEnumShowById(leaveType) AS "type" from vm_wf_hkLeaveApply where state = 1 and finishedflag = 0 UNION ALL select applyUser as "userId", newLeaveStartDate as "leaveStartDate", util_common.getEnumShowById(newLeaveStartHalfDay) as "leaveStartHalfDay", newLeaveEndDate as "leaveEndDate", util_common.getEnumShowById(newLeaveEndHalfDay) as "leaveEndHalfDay", finishedflag as "finishedflag", leaveFlowSerialNo as "serialNo", util_common.getEnumShowById(leaveType) AS "type" from vm_wf_hkleavebackapply where state = 1 and finishedflag = 0 and leaveBackType = util_common.getEnumIdByRefName('销假类型', '部分销假') ) t where 1=1 and t."serialNo" not in (RAW_VALUE) and (t."leaveStartDate" <= sysdate and t."leaveEndDate" >= sysdate - 1 );

-- statementId: getTodayHKLeaveApplyUnfinished.select
-- case: 可选条件关闭
-- type: select
-- assertion: 移除可选动态属性，观察条件收缩后的 SQL
-- params: {}
select t."applyUser", t."leaveStartDate", t."leaveStartHalfDay", t."leaveEndDate", t."leaveEndHalfDay", t."type" from ( select applyUser as "applyUser", leaveStartDate as "leaveStartDate", util_common.getEnumShowById(leaveStartHalfDay) as "leaveStartHalfDay", leaveEndDate as "leaveEndDate", util_common.getEnumShowById(leaveEndHalfDay) as "leaveEndHalfDay", finishedflag as "finishedflag", serialNo as "serialNo", util_common.getEnumShowById(leaveType) AS "type" from vm_wf_hkLeaveApply where state = 1 and finishedflag = 0 UNION ALL select applyUser as "userId", newLeaveStartDate as "leaveStartDate", util_common.getEnumShowById(newLeaveStartHalfDay) as "leaveStartHalfDay", newLeaveEndDate as "leaveEndDate", util_common.getEnumShowById(newLeaveEndHalfDay) as "leaveEndHalfDay", finishedflag as "finishedflag", leaveFlowSerialNo as "serialNo", util_common.getEnumShowById(leaveType) AS "type" from vm_wf_hkleavebackapply where state = 1 and finishedflag = 0 and leaveBackType = util_common.getEnumIdByRefName('销假类型', '部分销假') ) t where 1=1 and (t."leaveStartDate" <= sysdate and t."leaveEndDate" >= sysdate - 1 );

-- statementId: getTodayHKEvectionApply.select
-- case: 无参基础场景
-- type: select
-- assertion: 不传参数，验证固定 SQL 可直接生成
-- params: {}
SELECT id, evectionNo as "evectionNo", evectionMember as "applyUser", evectionRetinues as "evectionRetinues", trunc(startDate) AS "leaveStartDate", trunc(endDate) AS "leaveEndDate", evectionExplain AS "evectionExplain", destination AS "destination", applyStatus AS "applyStatus" FROM vm_cap_evectionrecord q WHERE (startDate <= sysdate and endDate >= sysdate - 1 );

-- statementId: getTodayHKEvectionApplyUnfinished.select
-- case: 动态条件命中
-- type: select
-- assertion: 传入动态变量，验证最终 SQL 正常展开
-- params: {
--   "finishedFlowSign": "RAW_VALUE"
-- }
SELECT id, evectionMember as "applyUser", evectionRetinues as "evectionRetinues", trunc(startDate) AS "leaveStartDate", trunc(endDate) AS "leaveEndDate", evectionExplain AS "evectionExplain", destination AS "destination", applyStatus AS "applyStatus" from vm_cap_wf_evectionhk where 1=1 and serialNo not in (RAW_VALUE) and (startDate <= sysdate and endDate >= sysdate - 1 );

-- statementId: getTodayHKEvectionApplyUnfinished.select
-- case: 可选条件关闭
-- type: select
-- assertion: 移除可选动态属性，观察条件收缩后的 SQL
-- params: {}
SELECT id, evectionMember as "applyUser", evectionRetinues as "evectionRetinues", trunc(startDate) AS "leaveStartDate", trunc(endDate) AS "leaveEndDate", evectionExplain AS "evectionExplain", destination AS "destination", applyStatus AS "applyStatus" from vm_cap_wf_evectionhk where 1=1 and (startDate <= sysdate and endDate >= sysdate - 1 );

-- statementId: getHKhrReceivers.select
-- case: 无参基础场景
-- type: select
-- assertion: 不传参数，验证固定 SQL 可直接生成
-- params: {}
select EXT_ATTR_2 from org_member where id in ( select OBJECTIVE0_id from org_relationship where source_id = (select id from org_team where id = -3861360978288357917) and type = 'Team_Member' );

-- statementId: addHKMembersLeaveDetailInfo.insert
-- case: 基础参数命中
-- type: insert
-- assertion: 传入基础变量，验证最终 SQL 正常生成
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
-- case: 无参基础场景
-- type: select
-- assertion: 不传参数，验证固定 SQL 可直接生成
-- params: {}
select id as "id", 1 as "state", -6760911671874597139 as "start_member_id", sysdate as "start_date", 0 as "approve_member_id", sysdate as "approve_date", 0 as "finishedflag", 0 as "ratifyflag", 0 as "ratify_member_id", null as "ratify_date", 0 as "sort", id as "memberId", util_user.getDeptIdByMemId(id) as "memberDept", -3531013148299411114 as "memberState", '' as "post", create_time as "joinDate", null as "resignDate", 0 as "remainExtraLeave", 0 as "onOrderExtraLeave", null as "noticeMembers", 0 as "chargeMember", null as "firstMarriage", 0 as "usedMarriageDay", 0 as "appliedMarriageDay" from org_member m where org_Account_id = -2948740806339441327 and is_internal = 1 AND is_virtual = 0 AND is_enable = 1 AND is_deleted = 0 and is_admin = 0 and type != 2 and not exists(select 1 from vm_cap_hkMemberLeaveInfo l where l.memberId = m.id);

-- statementId: addHKMembersFromOrgMember.insert
-- case: 基础参数命中
-- type: insert
-- assertion: 传入基础变量，验证最终 SQL 正常生成
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
-- case: 无参基础场景
-- type: select
-- assertion: 不传参数，验证固定 SQL 可直接生成
-- params: {}
select memberId as "memberId", memberDept as "memberDept" from vm_cap_hkMemberLeaveInfo where memberId not in (select memberId from vm_cap_chargeMemberRelation);

-- statementId: addChargeMemberRelation.insert
-- case: 基础参数命中
-- type: insert
-- assertion: 传入基础变量，验证最终 SQL 正常生成
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
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: "CODE_001"
select ext_attr_2 from org_member where org_post_id = (select id from org_post where code = 'CODE_001');

-- statementId: updateHKLeaveInfoChargeMember.update
-- case: 基础参数命中
-- type: update
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "chargeMember": "VALUE_001",
--   "memberId": 1001
-- }
update vm_cap_hkMemberLeaveInfo set chargeMember = 'VALUE_001' where memberId = 1001;

-- statementId: getDeptManagerByDeptIdHr.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: 1001
SELECT SOURCE_ID FROM ORG_RELATIONSHIP RL WHERE RL.OBJECTIVE0_ID=1001 AND RL.TYPE = 'Member_Role' AND RL.OBJECTIVE1_ID IN (SELECT ID FROM ORG_ROLE R WHERE R.NAME = '部门经理');

-- statementId: getUnfinishedReturnLeaveFlowByUserId.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: 1001
select field0001 as "leaveFlowNo", field0008 as "leaveDays", field0009 as "leaveStartDate", field0010 as "leaveStartMorN", field0011 as "leaveEndDate", field0012 as "leaveEndMorN", field0013 as "leaveRtnType", field0015 as "newLeaveStartDate", field0016 as "newLeaveStartMorN", field0017 as "newLeaveEndDate", field0018 as "newLeaveEndMorN", field0022 as "newLeaveDays", field0030 as "returnDays", field0036 as "preLeaveYear", field0037 as "currentLeaveYear", field0038 as "nextLeaveYear", field0039 as "preYearRtnDays", field0040 as "currentYearRtnDays", field0041 as "nextYearRtnDays" from formmain_2163 where id in (select form_recordId from col_summary where templete_id = -7111560710701037197 and start_member_id = 1001 and state = 0);

-- statementId: getUnfinishedReturnLeaveFlowByUserIdHK.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: 1001
select serialNo as "leaveFlowNo", leaveDays as "leaveDays", leaveStartDate as "leaveStartDate", leaveStartHalfDay as "leaveStartMorN", leaveEndDate as "leaveEndDate", leaveEndHalfDay as "leaveEndMorN", leaveBackType as "leaveRtnType", newLeaveStartDate as "newLeaveStartDate", newLeaveStartHalfDay as "newLeaveStartMorN", newLeaveEndDate as "newLeaveEndDate", newLeaveEndHalfDay as "newLeaveEndMorN", newLeaveDay as "newLeaveDays", leaveBackDays as "returnDays", preYear as "preLeaveYear", year as "currentLeaveYear", nextYear as "nextLeaveYear", preYearDaysCount as "preYearRtnDays", currentYearDaysCount as "currentYearRtnDays", nextYearDaysCount as "nextYearRtnDays" from vm_wf_hkLeaveBackApply where id in (select form_recordId from col_summary where templete_id = -771164294647560130 and start_member_id = 1001 and state = 0);

-- statementId: memberkeyinfo.select
-- case: 动态条件命中
-- type: select
-- assertion: 传入动态变量，验证最终 SQL 正常展开
-- params: {
--   "kmCode": "CODE_001",
--   "hrCode": "CODE_001",
--   "loginName": "NAME_001"
-- }
select to_char(f.memberId) memberId, f.kmCode, f.hrCode, f.loginName from vm_basememberinfo f where f.memberState = '在职' AND kmCode = 'CODE_001' AND hrCode = 'CODE_001' AND loginName = 'NAME_001';

-- statementId: memberkeyinfo.select
-- case: 可选条件关闭
-- type: select
-- assertion: 移除可选动态属性，观察条件收缩后的 SQL
-- params: {}
select to_char(f.memberId) memberId, f.kmCode, f.hrCode, f.loginName from vm_basememberinfo f where f.memberState = '在职';

-- statementId: updateInvestManagers.update
-- case: 基础参数命中
-- type: update
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: 1001
update formmain_2161 set field0080 = (select (listagg(c.mainmember || ',' || c.submember, ',') within group(order by c.submember)) as a from VM_DEPTPOST c where c.busimodel = '4053677126668929503' and c.questname in ('公司投资决策委员会', '固收投资决策委员会', '海外权益投资决策委员会', '量化投资决策委员会', '权益投资决策委员会', '社保养老金投资决策委员会', '衍生品投资决策委员会')) where id = 1001;

-- statementId: updateHrNoAndWorkPlace.update
-- case: 基础参数命中
-- type: update
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "workPlace": "VALUE_001",
--   "hrNo": "VALUE_001",
--   "memberId": 1001
-- }
update addressbook set ext_attr_3 = 'VALUE_001', ext_attr_6 = 'VALUE_001' where member_id = 1001;

-- statementId: copyLeaveFlowDays.update
-- case: 基础参数命中
-- type: update
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: 1001
update FORMMAIN_2161 set field0034 = field0013, field0063 = field0053, field0064 = field0054, field0065 = field0055, field0066 = field0056, field0067 = field0057, field0068 = field0058, field0069 = field0059, field0070 = field0060, field0071 = field0061, field0072 = field0062 where id = 1001;

-- statementId: getInvestPlanSendInfoById.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: 1001
select id as "id", serialNo as "serialNo", writer as "writer", writeDept as "writeDept", writeDate as "writeDate", sendPlanName as "sendPlanName", taskDeclaration as "taskDeclaration", planYear as "planYear", planNo as "planNo" from vm_cap_investPlanSend where id = 1001;

-- statementId: getSendMemberByPlanNo.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: "VALUE_001"
select main.id as "id", main.planName as "planName", main.planNo as "planNo", main.planYear as "planYear", main.synDate as "synDate", main.serialNo as "serialNo", main.planType as "planType", (select EXT_ATTR_6 from addressbook where member_id = son.memberName) as "hrNo", son.memberName as "memberName", son.isSeniorExecutive as "isSeniorExecutive", son.isDirector as "isDirector", son.isFundManager as "isFundManager" from vm_cap_investPlanInfo main left join vm_cap_investPlanInfo_son son on main.id = son.formmain_id where planNo = 'VALUE_001';

-- statementId: getSendInvestPlanMemberIdByPlanNo.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: "VALUE_001"
select memberName from vm_cap_wf_investPlanCollect t where t.planNo = 'VALUE_001';

-- statementId: getDoneInvestCollectByPlanNo.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: "VALUE_001"
select memberName as "memberName" from vm_cap_wf_investPlanCollect wf where planNo = 'VALUE_001' and 3 = (select state from col_summary where form_recordId = wf.id);

-- statementId: deleteInvestPlanSendSon.delete
-- case: 基础参数命中
-- type: delete
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: "VALUE_001"
delete from vm_cap_investPlanSend_son where formmain_id = (select id from vm_cap_investPlanSend where planNo = 'VALUE_001');

-- statementId: insertInvestPlanSendSon.insert
-- case: 基础参数命中
-- type: insert
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "planNo": "VALUE_001",
--   "deptId": 1001,
--   "unReplyMembers": "VALUE_001",
--   "replyMembers": "VALUE_001"
-- }
insert into vm_cap_investPlanSend_son( id, formmain_id, memberDept, unReplyMembers, replyMembers) values( util_common.getAbsID, (select id from vm_cap_investPlanSend where planNo = 'VALUE_001'), 1001, 'VALUE_001', 'VALUE_001' );

-- statementId: insertInvestPlanResultMain.insert
-- case: 基础参数命中
-- type: insert
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "id": 1001,
--   "serialNo": "VALUE_001",
--   "planName": "NAME_001",
--   "planNo": "VALUE_001",
--   "sendDate": "2026-05-14"
-- }
insert into vm_cap_investPlanResult( id, state , start_member_id , start_date , approve_member_id , approve_date , finishedflag , ratifyflag , ratify_member_id , ratify_date , sort , modify_member_id , modify_date , serialNo, planName, planNo, sendDate) values( 1001, 1,-6760911671874597139,SYSDATE,0,SYSDATE,0,0,0,null,0,-6760911671874597139,SYSDATE, 'VALUE_001', 'NAME_001', 'VALUE_001', '2026-05-14' );

-- statementId: getInvestPlanResultByPlanNo.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: "VALUE_001"
select serialNo as "serialNo", planName as "planName", planNo as "planNo", sendDate as "sendDate" from vm_cap_investPlanResult wf where planNo = 'VALUE_001';

-- statementId: insertPlanInfoMain.insert
-- case: 基础参数命中
-- type: insert
-- assertion: 传入基础变量，验证最终 SQL 正常生成
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
-- case: 基础参数命中
-- type: insert
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "formmain_id": 1001,
--   "memberName": "NAME_001",
--   "isSeniorExecutive": "VALUE_001",
--   "isDirector": "VALUE_001",
--   "isFundManager": "VALUE_001"
-- }
insert into vm_cap_investPlanInfo_son( id, formmain_id, memberName, isSeniorExecutive, isDirector, isFundManager) values( util_common.getAbsID, 1001, 'NAME_001', 'VALUE_001', 'VALUE_001', 'VALUE_001' );

-- statementId: getInvestCollectInfo.select
-- case: 动态条件命中
-- type: select
-- assertion: 传入动态变量，验证最终 SQL 正常展开
-- params: {
--   "planNo": "VALUE_001",
--   "year": "VALUE_001",
--   "planYear": "VALUE_001"
-- }
select main.id as "id", main.serialNo as "serialNo", main.planName as "planName", main.planNo as "planNo", main.sendDate as "sendDate", main.planYear as "planYear", son.formmain_id as "formmainId", son.productName as "productName", son.memberName as "memberName", son.memberHrNo as "memberHrNo", son.productId as "productId", son.fundCode as "fundCode", son.productShortName as "productShortName", son.investProportion as "investProportion" from vm_cap_investPlanResult main left join vm_cap_investPlanResult_son son on main.id = son.formmain_id where 1 = 1 AND planNo = 'VALUE_001' AND planYear = 'VALUE_001';

-- statementId: getInvestCollectInfo.select
-- case: 可选条件关闭
-- type: select
-- assertion: 移除可选动态属性，观察条件收缩后的 SQL
-- params: {
--   "year": "VALUE_001"
-- }
select main.id as "id", main.serialNo as "serialNo", main.planName as "planName", main.planNo as "planNo", main.sendDate as "sendDate", main.planYear as "planYear", son.formmain_id as "formmainId", son.productName as "productName", son.memberName as "memberName", son.memberHrNo as "memberHrNo", son.productId as "productId", son.fundCode as "fundCode", son.productShortName as "productShortName", son.investProportion as "investProportion" from vm_cap_investPlanResult main left join vm_cap_investPlanResult_son son on main.id = son.formmain_id where 1 = 1;

-- statementId: getUnfinishedInvestFlowByPlanNo.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: "VALUE_001"
select memberName as "memberName" from vm_cap_wf_investPlanCollect wf where planNo = 'VALUE_001' and 0 = (select state from col_summary where form_recordId = wf.id);

-- statementId: getManagerFundIdByManagerId.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: 1001
select pirid from vm_fundproductinfo where id in (select formmain_id from vm_fundproductinfoson where fundmanagername = 1001);

-- statementId: memberAddressBookInfo.select
-- case: 无参基础场景
-- type: select
-- assertion: 不传参数，验证固定 SQL 可直接生成
-- params: {}
select to_char(f.member_id) memberId, f.ext_attr_4 state,f.ext_attr_6 hrCode from addressbook f where f.ext_attr_4 is not null;

-- statementId: getGatedReadRecord.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "gatedPlace": "VALUE_001",
--   "fileName": "NAME_001",
--   "fileCreateDate": "2026-05-14"
-- }
select readStatus as "readStatus", gatedPlace as "gatedPlace", fileName as "fileName", fileCreateDate as "fileCreateDate", fileReadDate as "fileReadDate" from vm_cap_gatedReadRecord t where t.gatedPlace = 'VALUE_001' and t.fileName = 'NAME_001' and t.fileCreateDate = '2026-05-14' and readStatus = -3841538853571705149;

-- statementId: addGatedReadRecord.insert
-- case: 基础参数命中
-- type: insert
-- assertion: 传入基础变量，验证最终 SQL 正常生成
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
-- case: 无参基础场景
-- type: select
-- assertion: 不传参数，验证固定 SQL 可直接生成
-- params: {}
select member_id as "memberId" from addressbook where ext_attr_4 = '离职';

-- statementId: getGatedMemberRelation.select
-- case: 无参基础场景
-- type: select
-- assertion: 不传参数，验证固定 SQL 可直接生成
-- params: {}
select ID, STATE, START_MEMBER_ID, START_DATE, APPROVE_MEMBER_ID, APPROVE_DATE, FINISHEDFLAG, RATIFYFLAG, RATIFY_MEMBER_ID, RATIFY_DATE, SORT, MODIFY_MEMBER_ID, MODIFY_DATE, useable as "useable", gatedPlace as "gatedPlace", memberId as "memberId", memberKMCode as "memberKMCode", gatedRecordKey as "gatedRecordKey", gatedRecordValue as "gatedRecordValue" from vm_cap_gatedMemberRelation where useable = -3841538853571705149;

-- statementId: updateGatedMemberRelation.update
-- case: 基础参数命中
-- type: update
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "useable": "VALUE_001",
--   "gatedPlace": "VALUE_001",
--   "memberId": 1001
-- }
update vm_cap_gatedMemberRelation set useable = 'VALUE_001' where gatedPlace = 'VALUE_001' and memberId = 1001;

-- statementId: getAttendSpecialRule.select
-- case: 无参基础场景
-- type: select
-- assertion: 不传参数，验证固定 SQL 可直接生成
-- params: {}
select ID, STATE, START_MEMBER_ID, START_DATE, APPROVE_MEMBER_ID, APPROVE_DATE, FINISHEDFLAG, RATIFYFLAG, RATIFY_MEMBER_ID, RATIFY_DATE, SORT, MODIFY_MEMBER_ID, MODIFY_DATE, memberId as "memberId", memberKMCode as "memberKMCode", memberDept as "memberDept", checkable as "checkable", checkInTime as "checkInTime", checkOutTime as "checkOutTime" from vm_cap_attendSpecialRule;

-- statementId: getOrgMemberInfoByChnName.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: "NAME_001"
select id as "id", name as "name", code as "code" from org_member where is_internal = 1 and is_loginable = 1 and is_virtual = 0 and is_admin = 0 and is_assigned = 1 and state = 1 and is_enable =1 and is_deleted = 0 and status = 1 and name = 'NAME_001';

-- statementId: insertGatedMemberRelation.insert
-- case: 基础参数命中
-- type: insert
-- assertion: 传入基础变量，验证最终 SQL 正常生成
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
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "year": "VALUE_001",
--   "orgAccountId": 1,
--   "weekDayName": "NAME_001"
-- }
select id as "id", org_account_id as "orgAccountId", am_work_begintime as "amWorkBeginTime", am_work_endtime as "amWorkEndTime", pm_work_begintime as "pmWorkBeginTime", pm_work_endtime as "pmWorkEndTime", week_day_name as "weekDayName", is_work as "isWork", year as "year", update_time as "updateTime" from WORKTIME_CURRENCY where year = 'VALUE_001' and org_account_id = 1 and week_day_name = 'NAME_001';

-- statementId: insertGatedRecord.insert
-- case: 基础参数命中
-- type: insert
-- assertion: 传入基础变量，验证最终 SQL 正常生成
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
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "memberId": 1001,
--   "gatedDate": "2026-05-14"
-- }
select id as "id", memberId as "memberId", gatedPlace as "gatedPlace", cast(gatedDate as Date) as "gatedDate", memberKMCode as "memberKMCode", gatedInSignType as "gatedInSignType", gatedOutSignType as "gatedOutSignType", to_char(gatedInDate,'yyyy-mm-dd HH24:mi:ss') as "gatedInDate", to_char(gatedOutDate,'yyyy-mm-dd HH24:mi:ss') as "gatedOutDate", gatedInResult as "gatedInResult", gatedOutResult as "gatedOutResult" from vm_cap_gatedRecord where memberId = 1001 and to_char(gatedDate,'yyyy-mm-dd') = to_char('2026-05-14','yyyy-mm-dd');

-- statementId: getGatedRecordByDate.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "gateDate": "2026-05-14"
-- }
select id as "id", memberId as "memberId", gatedPlace as "gatedPlace", cast(gatedDate as Date) as "gatedDate", memberKMCode as "memberKMCode", gatedInSignType as "gatedInSignType", gatedOutSignType as "gatedOutSignType", to_char(gatedInDate,'yyyy-mm-dd hh24:mi:ss') as "gatedInDate", to_char(gatedOutDate,'yyyy-mm-dd hh24:mi:ss') as "gatedOutDate", gatedInResult as "gatedInResult", gatedOutResult as "gatedOutResult" from vm_cap_gatedRecord where to_char(gatedDate,'yyyy-mm-dd') = to_char('2026-05-14','yyyy-mm-dd');

-- statementId: updateGatedRecord.update
-- case: 动态条件命中
-- type: update
-- assertion: 传入动态变量，验证最终 SQL 正常展开
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

-- statementId: updateGatedRecord.update
-- case: 可选条件关闭
-- type: update
-- assertion: 移除可选动态属性，观察条件收缩后的 SQL
-- params: {
--   "id": 1001
-- }
update vm_cap_gatedRecord set id = id where id = 1001;

-- statementId: getAttendRecordByDate.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "gateDate": "2026-05-14"
-- }
select id as "id", memberId as "memberId", memberKMCode as "memberKMCode", cast(gatedDate as Date) as "gatedDate", createTime as "createTime", attendInDate as "gatedInDate", attendOutDate as "gatedOutDate", attendInResult as "attendInResult", attendOutResult as "attendOutResult" from vm_cap_attendRecord where to_char(gatedDate,'yyyy-mm-dd') = to_char('2026-05-14','yyyy-mm-dd');

-- statementId: updateAttendRecordByDate.update
-- case: 动态条件命中
-- type: update
-- assertion: 传入动态变量，验证最终 SQL 正常展开
-- params: {
--   "attendInDate": "2026-05-14",
--   "attendOutDate": "2026-05-14",
--   "attendInResult": "VALUE_001",
--   "attendOutResult": "VALUE_001",
--   "id": 1001
-- }
update vm_cap_attendRecord set id = id ,attendInDate = '2026-05-14' ,attendOutDate = '2026-05-14' ,attendInResult = 'VALUE_001' ,attendOutResult = 'VALUE_001' where id = 1001;

-- statementId: updateAttendRecordByDate.update
-- case: 可选条件关闭
-- type: update
-- assertion: 移除可选动态属性，观察条件收缩后的 SQL
-- params: {
--   "id": 1001
-- }
update vm_cap_attendRecord set id = id where id = 1001;

-- statementId: generateTodayAttendRecord.insert
-- case: 基础参数命中
-- type: insert
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "date": "2026-05-14"
-- }
insert into vm_cap_attendRecord( ID, STATE, START_MEMBER_ID, START_DATE, APPROVE_MEMBER_ID, APPROVE_DATE, FINISHEDFLAG, RATIFYFLAG, RATIFY_MEMBER_ID, RATIFY_DATE, SORT, MODIFY_MEMBER_ID, MODIFY_DATE, memberId, memberKMCode, gatedDate, createTime, attendInDate, attendOutDate, attendInResult, attendOutResult ) select util_common.getAbsID(), 1, -6760911671874597139, sysdate, 0, null, 1, 0, 0, null, 0, null, null, member_Id, util_user.getMemCodeByMemId(member_id), to_date(to_char('2026-05-14','yyyy-mm-dd'),'yyyy-mm-dd'), sysdate, null, null, -2560390805576728489, -2560390805576728489 from addressbook where ext_attr_4 != '离职';

-- statementId: getTodayAttendIds.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "date": "2026-05-14"
-- }
select id as "id" from vm_cap_attendRecord where to_char(gatedDate,'yyyy-mm-dd') = to_char('2026-05-14','yyyy-mm-dd');

-- statementId: updateUserBasicInfoByOrgMember.update
-- case: 无参基础场景
-- type: update
-- assertion: 不传参数，验证固定 SQL 可直接生成
-- params: {}
MERGE INTO formmain_2153 f USING ( SELECT o.id AS org_member_id, a.ext_attr_3 AS work_location, TO_CHAR(o.org_department_id) AS dept, a.ext_attr_4 AS status, o.code AS km_emp_no, a.ext_attr_6 AS hr_emp_no, o.ext_attr_1 AS phone, TO_CHAR(o.org_account_id) AS unit FROM org_member o JOIN addressbook a ON o.id = a.member_id WHERE a.ext_attr_3 IS NOT NULL OR o.org_department_id IS NOT NULL OR a.ext_attr_4 IS NOT NULL OR o.code IS NOT NULL OR a.ext_attr_6 IS NOT NULL OR o.ext_attr_1 IS NOT NULL OR o.org_account_id IS NOT NULL) src ON (f.field0001 = src.org_member_id) WHEN MATCHED THEN UPDATE SET f.field0002 = CASE WHEN f.field0002 IS NULL OR f.field0002 = 'null' THEN src.work_location ELSE f.field0002 END, f.field0014 = CASE WHEN f.field0014 IS NULL OR f.field0014 = 'null' THEN src.dept ELSE f.field0014 END, f.field0007 = CASE WHEN f.field0007 IS NULL OR f.field0007 = 'null' THEN src.status ELSE f.field0007 END, f.field0015 = CASE WHEN f.field0015 IS NULL OR f.field0015 = 'null' THEN src.km_emp_no ELSE f.field0015 END, f.field0016 = CASE WHEN f.field0016 IS NULL OR f.field0016 = 'null' THEN src.hr_emp_no ELSE f.field0016 END, f.field0034 = CASE WHEN f.field0034 IS NULL OR f.field0034 = 'null' THEN src.phone ELSE f.field0034 END, f.field0051 = CASE WHEN f.field0051 IS NULL OR f.field0051 = 'null' THEN src.unit ELSE f.field0051 END WHERE (f.field0002 IS NULL OR f.field0002 = 'null' OR f.field0014 IS NULL OR f.field0014 = 'null' OR f.field0007 IS NULL OR f.field0007 = 'null' OR f.field0015 IS NULL OR f.field0015 = 'null' OR f.field0016 IS NULL OR f.field0016 = 'null' OR f.field0034 IS NULL OR f.field0034 = 'null' OR f.field0051 IS NULL OR f.field0051 = 'null');

-- statementId: getHKMemberLeavePeriodInfo.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "memberId": 1001,
--   "year": "VALUE_001"
-- }
select annualLeaveStart as "annualLeaveStart",annualLeaveEnd as "annualLeaveEnd" from vm_cap_hkMemberLeaveInfo_son where formmain_id = (select id from vm_cap_hkMemberLeaveInfo where memberId = 1001) and year = 'VALUE_001';

-- statementId: queryColSummaryMap.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: 1001
select c.member_id as "memberId" from ctp_affair c where c.state = 3 and IS_DELETE = 0 and c.object_id = 1001;

-- statementId: updateInvestPlanSealStatus.update
-- case: 基础参数命中
-- type: update
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "sealStatus": 1,
--   "year": "VALUE_001",
--   "memberCode": "CODE_001"
-- }
update vm_cap_investPlanInfo_son t set t.sealStatus = 1 where formmain_id in (select id from vm_cap_investPlanInfo where planYear = 'VALUE_001') and memberName = (select id from org_member where code = 'CODE_001');

-- statementId: getInvestMemberSealStatus.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "planNo": "VALUE_001",
--   "memberId": 1001
-- }
select sealStatus from vm_cap_investPlanInfo_son t where t.formmain_id = (select id from vm_cap_investPlanInfo where planNo = 'VALUE_001') and t.memberName = 1001;

-- statementId: directorPushMqSelect.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "tenure": "VALUE_001"
-- }
select idNumber as "idNumber", education as "education", degree as "degree", position as "position", presentPostDesc as "presentPostDesc", util_common.getEnumValueById(gender) as "gender", util_common.getEnumValueById(post) as "post", util_common.getEnumValueById(orgId) as "orgId", name as "name", util_common.getEnumValueById(idType) as "idType", presviousPostDesc as "presviousPostDesc", to_char(dateOfAppoint, 'yyyy-MM-dd') as "dateOfAppoint", to_char(dateOfDepart, 'yyyy-MM-dd') as "dateOfDepart", curriculumVitae as "curriculumVitae", util_common.getEnumValueById(status) as "status", sortIndex as "sortIndex", nationality as "nationality", dispatchUnit as "dispatchUnit", specialty as "specialty", contactPhone as "contactPhone", to_char(createTime, 'yyyy-MM-dd HH:mm:ss') as "createTime", to_char(updateTime, 'yyyy-MM-dd HH:mm:ss') as "updateTime" from VM_DIRECTORS_PUSH_MQ where status = '-2214726931032093630' or status = '1714373041428644393' and ADD_MONTHS(dateOfDepart, 'VALUE_001') >= SYSDATE order by util_common.getEnumValueById(status) asc,sortIndex asc,util_common.getEnumValueById(post) asc;

-- statementId: findExercisePlanInfo.select
-- case: 动态条件命中
-- type: select
-- assertion: 传入动态变量，验证最终 SQL 正常展开
-- params: {
--   "batchNo": "VALUE_001"
-- }
select id as "id", batchNo as "batchNo" from vm_cap_exercisePlan where 1 = 1 AND batchNo = 'VALUE_001';

-- statementId: findExercisePlanInfo.select
-- case: 可选条件关闭
-- type: select
-- assertion: 移除可选动态属性，观察条件收缩后的 SQL
-- params: {}
select id as "id", batchNo as "batchNo" from vm_cap_exercisePlan where 1 = 1;

-- statementId: selectExercisePlanInfo.select
-- case: 动态条件命中
-- type: select
-- assertion: 传入动态变量，验证最终 SQL 正常展开
-- params: {
--   "batchNo": "VALUE_001",
--   "memberName": "NAME_001",
--   "exerciseName": "NAME_001",
--   "attrNum": "VALUE_001",
--   "attrProportion": "VALUE_001"
-- }
select id from vm_cap_exercisePlan_son where 1=1 AND formmain_id = (select id from vm_cap_exercisePlan where batchNo = 'VALUE_001') AND memberName = 'NAME_001' AND exerciseName = 'NAME_001' AND attrNum = 'VALUE_001' AND attrProportion = 'VALUE_001';

-- statementId: selectExercisePlanInfo.select
-- case: 可选条件关闭
-- type: select
-- assertion: 移除可选动态属性，观察条件收缩后的 SQL
-- params: {}
select id from vm_cap_exercisePlan_son where 1=1;

-- statementId: insertExercisePlanSon.insert
-- case: 基础参数命中
-- type: insert
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "batchNo": "VALUE_001",
--   "memberName": "NAME_001",
--   "exerciseName": "NAME_001",
--   "attrNum": "VALUE_001",
--   "attrProportion": "VALUE_001"
-- }
insert into vm_cap_exercisePlan_son( id, formmain_id, memberName, exerciseName, attrNum, attrProportion) values( util_common.getAbsID, (select id from vm_cap_exercisePlan where batchNo = 'VALUE_001'), 'NAME_001', 'NAME_001', 'VALUE_001', 'VALUE_001' );

-- statementId: getExerciseCollectInfo.select
-- case: 动态条件命中
-- type: select
-- assertion: 传入动态变量，验证最终 SQL 正常展开
-- params: {
--   "batchNo": "VALUE_001"
-- }
select main.id as "id", main.batchNo as "batchNo", main.batchName as "batchName", main.sendDate as "sendDate", son.formmain_id as "formmain_id", son.memberName as "memberName", son.memberHrNo as "memberHrNo", son.exerciseResult as "exerciseResult" from vm_cap_exercisePlanResult main left join vm_cap_exercisePlanResult_son son on main.id = son.formmain_id where 1 = 1 AND batchNo = 'VALUE_001';

-- statementId: getExerciseCollectInfo.select
-- case: 可选条件关闭
-- type: select
-- assertion: 移除可选动态属性，观察条件收缩后的 SQL
-- params: {}
select main.id as "id", main.batchNo as "batchNo", main.batchName as "batchName", main.sendDate as "sendDate", son.formmain_id as "formmain_id", son.memberName as "memberName", son.memberHrNo as "memberHrNo", son.exerciseResult as "exerciseResult" from vm_cap_exercisePlanResult main left join vm_cap_exercisePlanResult_son son on main.id = son.formmain_id where 1 = 1;

-- statementId: getUnfinishedExerciseFlowByBatchNo.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: "VALUE_001"
select memberName as "memberName" from vm_cap_wf_exercisePlanCollect wf where batchNo = 'VALUE_001' and 0 = (select state from col_summary where form_recordId = wf.id);

-- statementId: getExercisePlanSendInfoById.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: 1001
select id as "id", serialNo as "serialNo", writer as "writer", writeDept as "writeDept", writeDate as "writeDate", batchName as "batchName", taskDeclaration as "taskDeclaration", batchNo as "batchNo" from vm_cap_exercisePlanSend where id = 1001;

-- statementId: getExerciseSendMemberByBatchNo.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: "VALUE_001"
select main.id as "id", main.batchName as "batchName", main.batchNo as "batchNo", main.synDate as "synDate", main.serialNo as "serialNo", (select EXT_ATTR_6 from addressbook where member_id = son.memberName) as "hrNo", son.memberName as "memberName", son.exerciseName as "exerciseName", son.attrNum as "attrNum", son.attrProportion as "attrProportion" from vm_cap_exercisePlan main left join vm_cap_exercisePlan_son son on main.id = son.formmain_id where batchNo = 'VALUE_001';

-- statementId: getExercisePlanSonList.select
-- case: 动态条件命中
-- type: select
-- assertion: 传入动态变量，验证最终 SQL 正常展开
-- params: {
--   "memberName": "NAME_001",
--   "batchNo": "VALUE_001"
-- }
select a.exerciseName as "exerciseName", a.attrNum as "attrNum", a.attrProportion as "attrProportion" from vm_cap_exercisePlan_son a left join vm_cap_exercisePlan b on b.id = a.formmain_id where 1 = 1 AND a.memberName = 'NAME_001' AND b.batchNo = 'VALUE_001';

-- statementId: getExercisePlanSonList.select
-- case: 可选条件关闭
-- type: select
-- assertion: 移除可选动态属性，观察条件收缩后的 SQL
-- params: {}
select a.exerciseName as "exerciseName", a.attrNum as "attrNum", a.attrProportion as "attrProportion" from vm_cap_exercisePlan_son a left join vm_cap_exercisePlan b on b.id = a.formmain_id where 1 = 1;

-- statementId: getDoneExerciseCollectByBatchNo.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: "VALUE_001"
select memberName as "memberName" from vm_cap_wf_exercisePlanCollect wf where batchNo = 'VALUE_001' and 3 = (select state from col_summary where form_recordId = wf.id);

-- statementId: deleteExercisePlanSendSon.delete
-- case: 基础参数命中
-- type: delete
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: "VALUE_001"
delete from vm_cap_exercisePlanSend_son where formmain_id = (select id from vm_cap_exercisePlanSend where batchNo = 'VALUE_001');

-- statementId: insertExercisePlanSendSon.insert
-- case: 基础参数命中
-- type: insert
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "batchNo": "VALUE_001",
--   "deptId": 1001,
--   "unReplyMembers": "VALUE_001",
--   "replyMembers": "VALUE_001"
-- }
insert into vm_cap_exercisePlanSend_son( id, formmain_id, memberDept, unReplyMembers, replyMembers) values( util_common.getAbsID, (select id from vm_cap_exercisePlanSend where batchNo = 'VALUE_001'), 1001, 'VALUE_001', 'VALUE_001' );

-- statementId: getSendExercisePlanMemberIdByBatchNo.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: "VALUE_001"
select memberName from vm_cap_wf_exercisePlanCollect t where t.batchNo = 'VALUE_001';

-- statementId: getExercisePlanResultByBatchNo.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: "VALUE_001"
select serialNo as "serialNo", batchName as "batchName", batchNo as "batchNo", sendDate as "sendDate" from vm_cap_exercisePlanResult wf where batchNo = 'VALUE_001';

-- statementId: updateExerciseInfoPushStatus.update
-- case: 基础参数命中
-- type: update
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: "VALUE_001"
update vm_cap_exercisePlan set pushStatus = '-3841538853571705149' where batchNo = 'VALUE_001';

-- statementId: delExercisePlanInfo.delete
-- case: 基础参数命中
-- type: delete
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: "VALUE_001"
delete from vm_cap_exercisePlan where batchNo = 'VALUE_001';

-- statementId: delExercisePlanSonInfo.delete
-- case: 基础参数命中
-- type: delete
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: "VALUE_001"
delete from vm_cap_exercisePlan_son where formmain_id = (select id from vm_cap_exercisePlan where batchNo = 'VALUE_001');

-- statementId: insertLeaveInfoToEveryDay
-- case: 基础参数命中
-- type: insert
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "startDate": "2026-05-14",
--   "endDate": "2026-05-14"
-- }
MERGE INTO vm_DailyLeaveTravelRecord a USING ( SELECT t.applyUser, t.applyDept, t.leaveStartDate, t.leaveStartDateMA, t.leaveEndDate, t.leaveEndDateMA, t.leaveReason, t.leaveFlow, TO_DATE(TO_CHAR(t.toDate, 'YYYY-MM-DD'), 'YYYY-MM-DD') AS toDate, t.leaveSerialNum, -3841538853571705149 AS askForLeave FROM ( SELECT f.applyUser, f.applyDept, f.beginDate AS leaveStartDate, f.startTime AS leaveStartDateMA, f.endDate AS leaveEndDate, f.endTime AS leaveEndDateMA, f.reason AS leaveReason, f.flowName AS leaveFlow, f.beginDate + LEVEL - 1 AS toDate, f.serialNum AS leaveSerialNum FROM vm_userapplyforleave f WHERE f.recordStatus = 8705337157000773743 AND TO_CHAR(modify_date, 'YYYY-MM-DD') BETWEEN '2026-05-14' AND '2026-05-14' CONNECT BY id = PRIOR id AND LEVEL <= endDate - beginDate + 1 AND PRIOR sys_guid() IS NOT NULL ) t ) c ON (a.applyUser = c.applyUser AND a.toDate = c.toDate) WHEN NOT MATCHED THEN INSERT ( id, state, start_member_id, start_date, approve_member_id, approve_date, finishedflag, ratifyflag, ratify_member_id, applyUser, applyDept, toDate, askForLeave, leaveStartDate, leaveEndDate, leaveFlow, leaveReason, leaveStartDateMA, leaveEndDateMA, leaveSerialNum ) VALUES ( util_common.getAbsID, 1, -6760911671874597139, sysdate, -6760911671874597139, sysdate, 0, 0, -6760911671874597139, c.applyUser, c.applyDept, c.toDate, c.askForLeave, c.leaveStartDate, c.leaveEndDate, c.leaveFlow, c.leaveReason, c.leaveStartDateMA, c.leaveEndDateMA, c.leaveSerialNum ) WHEN MATCHED THEN update set a.askForLeave = c.askForLeave, a.leaveStartDate = c.leaveStartDate, a.leaveEndDate = c.leaveEndDate, a.leaveFlow = c.leaveFlow, a.leaveReason = c.leaveReason, a.leaveStartDateMA = c.leaveStartDateMA, a.leaveEndDateMA = c.leaveEndDateMA, a.leaveSerialNum = c.leaveSerialNum where a.askForLeave is null;

-- statementId: insertCancelToNewLeaveInfoToEveryDay
-- case: 基础参数命中
-- type: insert
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "startDate": "2026-05-14",
--   "endDate": "2026-05-14"
-- }
MERGE INTO vm_DailyLeaveTravelRecord a USING ( select to_date(to_char(toDate, 'yyyy-mm-dd'), 'yyyy-mm-dd') toDate, applyUser, formmain_id, leaveStartDate, leaveStartDateMA, leaveEndDate, leaveEndDateMA , leaveReason, leaveFlow, leaveSerialNum, util_user.getDeptIdByMemId(applyUser) applyDept, '-3841538853571705149' askForLeave from (select distinct leaveStartDate+level-1 toDate, applyUser, formmain_id, leaveStartDate, leaveStartDateMA, leaveEndDate, leaveEndDateMA , leaveReason, leaveFlow, leaveSerialNum from (select distinct vm2.id, vm2.applyUser, vm1.formmain_id, vm1.leaveStartDate, vm1.leaveStartDateMA, vm1.leaveEndDate, vm1.leaveEndDateMA , vm1.leaveReason, vm1.leaveFlow, vm1.leaveSerialNum from vm_CancelLeaveDaySon vm1 left join VM_USERAPPLYFORLEAVE vm2 on vm1.formmain_id = vm2.id where vm1.leaveStartDate is not null and to_char(modify_date, 'yyyy-mm-dd') between '2026-05-14' and '2026-05-14' ) t connect by formmain_id=prior formmain_id and level <= leaveEndDate-leaveStartDate+1 and prior sys_guid() is not null) t ) c ON (a.applyUser = c.applyUser AND a.toDate = c.toDate) WHEN NOT MATCHED THEN INSERT ( id, state, start_member_id, start_date, approve_member_id, approve_date, finishedflag, ratifyflag, ratify_member_id, applyUser, applyDept, toDate, leaveStartDate, leaveStartDateMA, leaveEndDate, leaveEndDateMA , leaveReason, leaveFlow, leaveSerialNum, askForLeave ) VALUES ( util_common.getAbsID, 1, -6760911671874597139, sysdate, -6760911671874597139, sysdate, 0, 0, -6760911671874597139, c.applyUser, c.applyDept, c.toDate, c.leaveStartDate, c.leaveStartDateMA, c.leaveEndDate, c.leaveEndDateMA , c.leaveReason, c.leaveFlow, c.leaveSerialNum, c.askForLeave ) WHEN MATCHED THEN update set leaveStartDate = c.leaveStartDate, leaveStartDateMA = c.leaveStartDateMA, leaveEndDate = c.leaveEndDate, leaveEndDateMA = c.leaveEndDateMA , leaveReason = c.leaveReason, leaveFlow = c.leaveFlow, leaveSerialNum = c.leaveSerialNum, askForLeave = c.askForLeave where a.askForLeave is null;

-- statementId: insertCancelToNewLeaveInfoToEveryDayTableBindRelation
-- case: 基础参数命中
-- type: insert
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "startDate": "2026-05-14",
--   "endDate": "2026-05-14"
-- }
insert into form_relation_record (ID, FROM_MASTERDATA_ID, TO_MASTERDATA_ID, STATE, FIELD_NAME, FORM_TYPE, TYPE, MEMBER_ID, FROM_SUBDATA_ID, TO_SUBDATA_ID, FROM_FORM_ID, TO_FORM_ID ) select util_common.getAbsID, f.id, csy.id, '1', 'field0007', '1', '1', '-6760911671874597139', '0', '0', '6050223712139953374', '5474893650126653153' from vm_DailyLeaveTravelRecord f left join formmain_2163 f1 on f.leaveSerialNum = f1.field0001 left join col_summary csy on f1.id = csy.form_recordid where f1.id is not null and f.id is not null and csy.id is not null and to_char(f.start_date, 'yyyy-mm-dd') between '2026-05-14' and '2026-05-14' and not exists ( select 1 from form_relation_record fr where fr.field_name = 'field0007' and fr.to_masterdata_id = csy.id and fr.from_form_id = '6050223712139953374' and fr.from_masterdata_id = f.id and fr.to_form_id = '5474893650126653153' );

-- statementId: insertLeaveInfoToEveryDayTableBindRelation
-- case: 基础参数命中
-- type: insert
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "startDate": "2026-05-14",
--   "endDate": "2026-05-14"
-- }
insert into form_relation_record (ID, FROM_MASTERDATA_ID, TO_MASTERDATA_ID, STATE, FIELD_NAME, FORM_TYPE, TYPE, MEMBER_ID, FROM_SUBDATA_ID, TO_SUBDATA_ID, FROM_FORM_ID, TO_FORM_ID ) select util_common.getAbsID, f.id, csy.id, '1', 'field0007', '1', '1', '-6760911671874597139', '0', '0', '6050223712139953374', '6734388298582673815' from vm_DailyLeaveTravelRecord f left join formmain_2161 f1 on f.leaveSerialNum = f1.field0001 left join col_summary csy on f1.id = csy.form_recordid where f1.id is not null and f.id is not null and csy.id is not null and to_char(f.start_date, 'yyyy-mm-dd') between '2026-05-14' and '2026-05-14' and not exists ( select 1 from form_relation_record fr where fr.field_name = 'field0007' and fr.to_masterdata_id = csy.id and fr.from_form_id = '6050223712139953374' and fr.from_masterdata_id = f.id and fr.to_form_id = '6734388298582673815' );

-- statementId: insertTravelRecordToEveryDay
-- case: 基础参数命中
-- type: insert
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "applyStatus": 1,
--   "startDate": "2026-05-14",
--   "endDate": "2026-05-14"
-- }
MERGE INTO vm_DailyLeaveTravelRecord a USING ( SELECT DISTINCT to_date(to_char(f.travelBeginDate + level - 1, 'yyyy-mm-dd'), 'yyyy-mm-dd') AS toDate, travelMember AS applyUser, travelEndDate, travelBeginDate AS travelStartDate, flowName AS travelFlow, serialNum AS travelSerialNum, travelReason, util_user.getDeptIdByMemId(applyUser) AS applyDept, '-3841538853571705149' AS whetherToTravel FROM ( SELECT DISTINCT f.id, travelType, column_value travelMember, isHK, applyStatus, travelEndDate, travelBeginDate, applyUser, flowName, serialNum, travelReason FROM ( SELECT DISTINCT id, travelType, travelMember, isHK, applyStatus, travelEndDate, travelBeginDate, applyUser, flowName, serialNum, travelReason, ctravelMember FROM vm_evectionRecord WHERE (travelType = 1540751696090383749 OR travelType = 1786076025637390084) AND (applyStatus IS NULL OR applyStatus = 1) AND to_char(modify_date, 'yyyy-mm-dd') BETWEEN '2026-05-14' AND '2026-05-14' ) f, TABLE( SELECT util_common.split(f.travelMember || ',' || f.ctravelMember, ',') FROM dual ) ) f CONNECT BY PRIOR (id || travelMember) = (id || travelMember) AND PRIOR sys_guid() IS NOT NULL AND LEVEL <= travelEndDate - travelBeginDate + 1 ) c ON (a.applyUser = c.applyUser AND a.todate = c.todate ) WHEN NOT MATCHED THEN INSERT ( id, state, start_member_id, start_date, approve_member_id, approve_date, finishedflag, ratifyflag, ratify_member_id, applyUser, applyDept, toDate, whetherToTravel, travelStartDate, travelEndDate, travelFlow, travelReason, travelSerialNum ) VALUES ( util_common.getAbsID, 1, -6760911671874597139, sysdate, -6760911671874597139, sysdate, 0, 0, -6760911671874597139, c.applyUser, c.applyDept, c.todate, c.whetherToTravel, c.travelStartDate, c.travelEndDate, c.travelFlow, c.travelReason, c.travelSerialNum ) when matched then update set a.whetherToTravel = c.whetherToTravel, a.travelStartDate = c.travelStartDate, a.travelEndDate = c.travelEndDate, a.travelFlow = c.travelFlow, a.travelReason = c.travelReason, a.travelSerialNum = c.travelSerialNum where a.whetherToTravel is null;

-- statementId: insertTravelRecordToEveryDayTableBindRelation
-- case: 基础参数命中
-- type: insert
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "startDate": "2026-05-14",
--   "endDate": "2026-05-14"
-- }
insert into form_relation_record (ID, FROM_MASTERDATA_ID, TO_MASTERDATA_ID, STATE, FIELD_NAME, FORM_TYPE, TYPE, MEMBER_ID, FROM_SUBDATA_ID, TO_SUBDATA_ID, FROM_FORM_ID, TO_FORM_ID ) select util_common.getAbsID, f.id, csy.id, '1', 'field0012', '1', '1', '-6760911671874597139', '0', '0', '6050223712139953374', '3803557390838549231' from vm_DailyLeaveTravelRecord f left join formmain_3376 f1 on f.travelSerialNum = f1.field0001 left join col_summary csy on f1.id = csy.form_recordid where f1.id is not null and f.id is not null and csy.id is not null and to_char(f.start_date, 'yyyy-mm-dd') between '2026-05-14' and '2026-05-14' and not exists ( select 1 from form_relation_record fr where fr.field_name = 'field0012' and fr.to_masterdata_id = csy.id and fr.from_form_id = '6050223712139953374' and fr.from_masterdata_id = f.id and fr.to_form_id = '3803557390838549231' );

-- statementId: insertSurveyRecordToEveryday
-- case: 基础参数命中
-- type: insert
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "startDate": "2026-05-14",
--   "endDate": "2026-05-14"
-- }
MERGE INTO vm_DailyLeaveTravelRecord a USING ( select to_date(to_char(toDate, 'yyyy-mm-dd'), 'yyyy-mm-dd') toDate, travelMember applyUser, travelEndDate surveyEndDate, travelBeginDate surveyStartDate, surveyReason, util_user.getDeptIdByMemId(applyUser) applyDept, '-3841538853571705149' whetherToSurvey, kmflg surveySerialNum from (select f.travelBeginDate+level-1 toDate, travelMember, travelEndDate, travelBeginDate, applyUser, travelReason surveyReason, kmflg from vm_evectionRecord f where f.travelType = -1018115749788758189 and to_char(modify_date, 'yyyy-mm-dd') between '2026-05-14' and '2026-05-14' connect by id=prior id and level <= travelEndDate-travelBeginDate+1 and prior sys_guid() is not null) t ) c ON (a.applyUser = c.applyUser AND a.toDate = c.toDate) WHEN NOT MATCHED THEN INSERT ( id, state, start_member_id, start_date, approve_member_id, approve_date, finishedflag, ratifyflag, ratify_member_id, applyUser, applyDept, toDate, surveyEndDate, surveyStartDate, surveyReason, whetherToSurvey, surveySerialNum ) VALUES ( util_common.getAbsID, 1, -6760911671874597139, sysdate, -6760911671874597139, sysdate, 0, 0, -6760911671874597139, c.applyUser, c.applyDept, c.toDate, c.surveyEndDate, c.surveyStartDate, c.surveyReason, c.whetherToSurvey, c.surveySerialNum ) WHEN MATCHED THEN update set surveyEndDate = c.surveyEndDate, surveyStartDate = c.surveyStartDate, surveyReason = c.surveyReason, whetherToSurvey = c.whetherToSurvey, surveySerialNum = c.surveySerialNum where a.whetherToSurvey is null;

-- statementId: eveyDayInfoCtpContent.insert
-- case: 基础参数命中
-- type: insert
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "startDate": "2026-05-14",
--   "endDate": "2026-05-14"
-- }
insert into ctp_content_all (ID, CREATE_ID, CREATE_DATE, MODIFY_ID, MODIFY_DATE, MODULE_TYPE, MODULE_ID, MODULE_TEMPLATE_ID, CONTENT_TYPE, CONTENT, CONTENT_DATA_ID, CONTENT_TEMPLATE_ID, TITLE, SORT) select util_common.getAbsID, '-6760911671874597139', sysdate, '-6760911671874597139', sysdate, 37, id, -9154120848050929403, '20', '', id, 6050223712139953374, '每日请假记录表', '0' from vm_DailyLeaveTravelRecord f where to_char(f.start_date, 'yyyy-mm-dd') between '2026-05-14' and '2026-05-14' and not exists (select 1 from ctp_content_all f1 where f1.CONTENT_TEMPLATE_ID = 6050223712139953374 and f1.module_template_id = -9154120848050929403 and f1.CONTENT_DATA_ID = f.id );

-- statementId: allDirectorInfo.select
-- case: 无参基础场景
-- type: select
-- assertion: 不传参数，验证固定 SQL 可直接生成
-- params: {}
select to_char(org_id) "org_id", to_char(f.sortNumber) "sortNumber", f.record "record" from vm_company_directors_info f where f.status = -2214726931032093630;

-- statementId: stopHREntry.delete
-- case: 基础参数命中
-- type: delete
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: 1001
delete from vm_basememberinfo f where f.memberId = (select field0053 from formmain_1660 where field0044 = 1001);

-- statementId: codeLevelByMemberIdAndOrgId.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "memberId": 1001,
--   "orgId": 1001
-- }
select l.code from org_relationship os left join org_level l on l.id = os.objective2_id where os.type = 'Member_Post' and l.is_deleted = 0 and l.is_enable = 1 and os.source_id = 1001 and os.org_account_id = 1001 order by l.level_id;

-- statementId: memberIdByMemberCode
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "departId": 1001,
--   "roleCode": "CODE_001"
-- }
select distinct rs.source_id from org_relationship rs where rs.objective0_id = 1001 and rs.objective1_id in (select id from org_role r where r.code = 'CODE_001');

-- statementId: findAllFGMemberLevels.select
-- case: 无参基础场景
-- type: select
-- assertion: 不传参数，验证固定 SQL 可直接生成
-- params: {}
select code, level_id from org_level f where f.is_deleted = 0 and status = 1 and is_enable = 1 and org_account_id = 97839079791739420;

-- statementId: findFGCEO.select
-- case: 无参基础场景
-- type: select
-- assertion: 不传参数，验证固定 SQL 可直接生成
-- params: {}
select source_id from org_relationship os left join org_level l on l.id = os.objective2_id where os.type = 'Member_Post' and l.is_deleted = 0 and l.is_enable = 1 and os.org_account_id = 97839079791739420 and code = 'CEO';

-- statementId: findFGChairman.select
-- case: 无参基础场景
-- type: select
-- assertion: 不传参数，验证固定 SQL 可直接生成
-- params: {}
select source_id from org_relationship os left join org_level l on l.id = os.objective2_id where os.type = 'Member_Post' and l.is_deleted = 0 and l.is_enable = 1 and os.org_account_id = 97839079791739420 and code = 'Chairman';

-- statementId: getColSummaryIdByFlowId.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: 1001
select id from col_summary where form_recordid = 1001 and case_id is not null;

-- statementId: getOperationIdByOperationName.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "viewName": "NAME_001",
--   "tableName": "NAME_001"
-- }
SELECT to_char(replace(wm_concat(t.name || '.' || t.value),',','_')) as id FROM (select '/QueryList/Query[@name="' || 'NAME_001' || '"]/ShowsThrough/Colum' XPATH, f.* from form_definition f where f.name = 'NAME_001') f, xmltable(f.XPATH passing xmltype(nvl(f.query_info, '<root/>')) columns "NAME" path '@name', "VALUE" path '@value') t;

-- statementId: queryApplyEvectionByDateRange.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "userId": 1001,
--   "evectionStartDate": "2026-05-14",
--   "evectionEndDate": "2026-05-14"
-- }
select t."flowId", t."userId", t."travelerId", t."evectionStartDate", t."evectionEndDate", t."flowSerialNum", t."flowState", t."flowUrl" from ( select id as "flowId", field0008 as "userId", field0009 as "travelerId", field0010 as "evectionStartDate", field0011 as "evectionEndDate", field0001 as "flowSerialNum", finishedflag as "flowState", '' as "flowUrl" from FORMMAIN_3376 where state = 1 and finishedflag in (0,1) and field0041 = '1540751696090383749' union all select id as "flowId", userId as "userId", travelerId as "travelerId", evectionStartDate as "evectionStartDate", evectionEndDate as "evectionEndDate", flowSerialNum as "flowSerialNum", finishedflag as "flowState", flowUrl as "flowUrl" from VM_CAP4_EVATIONS where state = 1 and finishedflag in (0,1) union all select id as "flowId", evectionMember as "userId", evectionRetinues as "travelerId", startDate as "evectionStartDate", endDate as "evectionEndDate", serialNo as "flowSerialNum", finishedflag as "flowState", flowUrl as "flowUrl" from VM_CAP_WF_EVECTIONHK where state = 1 and finishedflag in (0,1) ) t where 1 =1 AND ( t."userId" = 1001 OR ',' || REPLACE( COALESCE( t."travelerId", '' ), ' ', '' ) || ',' LIKE '%,' || 1001 || ',%' ) AND t."evectionStartDate" <= to_date('2026-05-14','YYYY-MM-DD') AND t."evectionEndDate" >= to_date('2026-05-14','YYYY-MM-DD');

-- statementId: queryApplyChangeEvectionByDateRange.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "userId": 1001,
--   "evectionStartDate": "2026-05-14",
--   "evectionEndDate": "2026-05-14"
-- }
select t."flowId", t."userId", t."travelerId", t."evectionStartDate", t."evectionEndDate", t."flowSerialNum", t."flowState", t."flowUrl" from ( select id as "flowId", userId as "userId", travelerId as "travelerId", evectionStartDate as "evectionStartDate", evectionEndDate as "evectionEndDate", flowSerialNum as "flowSerialNum", finishedflag as "flowState", flowUrl as "flowUrl" from VM_CAP4_EVATIONS_CHANGE where state = 1 and finishedflag in (0,1) and evectionType = util_common.getEnumIdByRefName('出差变更类别', '变更') ) t where 1 =1 AND ( t."userId" = 1001 OR ',' || REPLACE( COALESCE( t."travelerId", '' ), ' ', '' ) || ',' LIKE '%,' || 1001 || ',%' ) AND t."evectionStartDate" <= to_date('2026-05-14','YYYY-MM-DD') AND t."evectionEndDate" >= to_date('2026-05-14','YYYY-MM-DD');

-- statementId: cancelEvectionBySerialNum.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "evectionSerialNum": "RAW_VALUE"
-- }
select t."flowId", t."evectionSerialNum" from ( select id as "flowId", state as "state", businessFlowId as "evectionSerialNum" from vm_hk_bussiness_cancel union all select id as "flowId", state as "state", businessFlowId as "evectionSerialNum" from VM_CAP4_EVATIONS_CHANGE ) t where 1 =1 and t."state" = 1 and t."evectionSerialNum" in (RAW_VALUE);

-- statementId: queryApplyLeaveByDateRange.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "userId": 1001,
--   "startDateAMorPM": "2026-05-14",
--   "leaveStartDate": "2026-05-14",
--   "endDateAMorPM": "2026-05-14",
--   "leaveEndDate": "2026-05-14"
-- }
select t."flowId", t."userId", t."leaveStartDate", t."leaveStartDateAMorPM", t."leaveEndDate", t."leaveEndDateAMorPM", t."flowSerialNum", t."flowState", t."flowUrl" from ( select id as "flowId", writer as "userId", startDate as "leaveStartDate", startHalfDay as "leaveStartDateAMorPM", endDate as "leaveEndDate", endHalfDay as "leaveEndDateAMorPM", flowSerialNum as "flowSerialNum", finishedflag as "flowState", '' as "flowUrl" from VM_WF_PARENTALLEAVE where state = 1 and finishedflag in (0,1) UNION ALL SELECT id AS "flowId", writer AS "userId", startDate AS "leaveStartDate", startHalfDay AS "leaveStartDateAMorPM", endDate AS "leaveEndDate", endHalfDay AS "leaveEndDateAMorPM", flowSerialNum AS "flowSerialNum", finishedflag AS "flowState", flowUrl AS "flowUrl" FROM vm_wf_cap4_parentalleave union all select id as "flowId", applyUser as "userId", leaveStartDate as "leaveStartDate", to_char(leaveStartHalfDay) as "leaveStartDateAMorPM", leaveEndDate as "leaveEndDate", to_char(leaveEndHalfDay) as "leaveEndDateAMorPM", serialNo as "flowSerialNum", finishedflag as "flowState", flowUrl as "flowUrl" from VM_WF_HKLEAVEAPPLY where state = 1 and finishedflag in (0,1) ) t where 1 =1 AND t."userId" = 1001 AND ( CASE WHEN t."leaveStartDateAMorPM" = '770469099444389055' THEN TO_TIMESTAMP(to_char(t."leaveStartDate", 'yyyy-mm-dd') || ' 00:00:00', 'YYYY-MM-DD HH24:MI:SS') WHEN t."leaveStartDateAMorPM" = '3338464713283357441' THEN TO_TIMESTAMP(to_char(t."leaveStartDate", 'yyyy-mm-dd') || ' 12:00:00', 'YYYY-MM-DD HH24:MI:SS') ELSE NULL END ) <= ( CASE WHEN '2026-05-14' = '770469099444389055' THEN TO_TIMESTAMP('2026-05-14' || ' 00:00:00', 'YYYY-MM-DD HH24:MI:SS') WHEN '2026-05-14' = '3338464713283357441' THEN TO_TIMESTAMP('2026-05-14' || ' 12:00:00', 'YYYY-MM-DD HH24:MI:SS') ELSE NULL END ) AND ( CASE WHEN t."leaveEndDateAMorPM" = '770469099444389055' THEN TO_TIMESTAMP(to_char(t."leaveEndDate", 'yyyy-mm-dd') || ' 11:59:59', 'YYYY-MM-DD HH24:MI:SS') WHEN t."leaveEndDateAMorPM" = '3338464713283357441' THEN TO_TIMESTAMP(to_char(t."leaveEndDate", 'yyyy-mm-dd') || ' 23:59:59', 'YYYY-MM-DD HH24:MI:SS') ELSE NULL END ) >= ( CASE WHEN '2026-05-14' = '770469099444389055' THEN TO_TIMESTAMP('2026-05-14' || ' 11:59:59', 'YYYY-MM-DD HH24:MI:SS') WHEN '2026-05-14' = '3338464713283357441' THEN TO_TIMESTAMP('2026-05-14' || ' 23:59:59', 'YYYY-MM-DD HH24:MI:SS') ELSE NULL END );

-- statementId: queryApplyChangeLeaveByDateRange.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "userId": 1001,
--   "startDateAMorPM": "2026-05-14",
--   "leaveStartDate": "2026-05-14",
--   "endDateAMorPM": "2026-05-14",
--   "leaveEndDate": "2026-05-14"
-- }
select t."flowId", t."userId", t."leaveStartDate", t."leaveStartDateAMorPM", t."leaveEndDate", t."leaveEndDateAMorPM", t."flowSerialNum", t."flowState", t."flowUrl" from ( select id as "flowId", writer as "userId", newstartDate as "leaveStartDate", newstartHalfDay as "leaveStartDateAMorPM", newendDate as "leaveEndDate", newendHalfDay as "leaveEndDateAMorPM", flowSerialNum as "flowSerialNum", finishedflag as "flowState", '' as "flowUrl" from vm_wf_parentalleavecancel where state = 1 and finishedflag in (0,1) and cancelType = util_common.getEnumIdByRefName('销假类型', '部分销假') UNION ALL select id as "flowId", writer as "userId", newstartDate as "leaveStartDate", newstartHalfDay as "leaveStartDateAMorPM", newendDate as "leaveEndDate", newendHalfDay as "leaveEndDateAMorPM", flowSerialNum as "flowSerialNum", finishedflag as "flowState", flowUrl as "flowUrl" from vm_wf_cap4_parentalleavecancel where state = 1 and finishedflag in (0,1) and cancelType = util_common.getEnumIdByRefName('销假类型', '部分销假') union all select id as "flowId", applyUser as "userId", newLeaveStartDate as "leaveStartDate", to_char(newLeaveStartHalfDay) as "leaveStartDateAMorPM", newLeaveEndDate as "leaveEndDate", to_char(newLeaveEndHalfDay) as "leaveEndDateAMorPM", serialNo as "flowSerialNum", finishedflag as "flowState", flowUrl as "flowUrl" from vm_wf_hkleavebackapply where state = 1 and finishedflag in (0,1) and leaveBackType = util_common.getEnumIdByRefName('销假类型', '部分销假') ) t where 1 =1 AND t."userId" = 1001 AND ( CASE WHEN t."leaveStartDateAMorPM" = '770469099444389055' THEN TO_TIMESTAMP(to_char(t."leaveStartDate", 'yyyy-mm-dd') || ' 00:00:00', 'YYYY-MM-DD HH24:MI:SS') WHEN t."leaveStartDateAMorPM" = '3338464713283357441' THEN TO_TIMESTAMP(to_char(t."leaveStartDate", 'yyyy-mm-dd') || ' 12:00:00', 'YYYY-MM-DD HH24:MI:SS') ELSE NULL END ) <= ( CASE WHEN '2026-05-14' = '770469099444389055' THEN TO_TIMESTAMP('2026-05-14' || ' 00:00:00', 'YYYY-MM-DD HH24:MI:SS') WHEN '2026-05-14' = '3338464713283357441' THEN TO_TIMESTAMP('2026-05-14' || ' 12:00:00', 'YYYY-MM-DD HH24:MI:SS') ELSE NULL END ) AND ( CASE WHEN t."leaveEndDateAMorPM" = '770469099444389055' THEN TO_TIMESTAMP(to_char(t."leaveEndDate", 'yyyy-mm-dd') || ' 11:59:59', 'YYYY-MM-DD HH24:MI:SS') WHEN t."leaveEndDateAMorPM" = '3338464713283357441' THEN TO_TIMESTAMP(to_char(t."leaveEndDate", 'yyyy-mm-dd') || ' 23:59:59', 'YYYY-MM-DD HH24:MI:SS') ELSE NULL END ) >= ( CASE WHEN '2026-05-14' = '770469099444389055' THEN TO_TIMESTAMP('2026-05-14' || ' 11:59:59', 'YYYY-MM-DD HH24:MI:SS') WHEN '2026-05-14' = '3338464713283357441' THEN TO_TIMESTAMP('2026-05-14' || ' 23:59:59', 'YYYY-MM-DD HH24:MI:SS') ELSE NULL END );

-- statementId: cancelLeaveBySerialNum.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "leaveSerialNum": "RAW_VALUE"
-- }
select t."flowId", t."leaveSerialNum" from ( select id as "flowId", state as "state", businessFlowId as "leaveSerialNum" from vm_wf_parentalleavecancel union all select id as "flowId", state as "state", leaveFlowSerialNo as "leaveSerialNum" from vm_wf_hkleavebackapply ) t where 1 =1 and t."state" = 1 and t."leaveSerialNum" in (RAW_VALUE);

-- statementId: getMarriageBySingleMember.select
-- case: 无参基础场景
-- type: select
-- assertion: 不传参数，验证固定 SQL 可直接生成
-- params: {}
select id as "id", userId as "userId", firstMarriageDate as "firstMarriageDate", approvedMarriageDays as "approvedMarriageDays" from VM_MEMBER_MARRIAGE a where approvedMarriageDays > 0 and (pendingMarriageDays = 0 or pendingMarriageDays is null) and marriageStatus != util_common.getEnumIdByRefName('婚姻状况', '已婚');

-- statementId: deleteMarriageSonNullRecord.delete
-- case: 基础参数命中
-- type: delete
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "formmain_id": 1001
-- }
delete from vm_memberMarriage_son where formmain_id = 1001 and (firstMarriageDate is null or approvedMarriageDays is null);

-- statementId: addMarriageSonRecord.insert
-- case: 基础参数命中
-- type: insert
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "formmain_id": 1001,
--   "firstMarriageDate": "2026-05-14",
--   "approvedMarriageDays": "VALUE_001",
--   "updateTime": "2026-05-14"
-- }
insert into vm_memberMarriage_son( id, formmain_id, firstMarriageDate, approvedMarriageDays, updateTime) values( util_common.getAbsID, 1001, to_date('2026-05-14', 'YYYY-MM-DD'), 'VALUE_001', to_date('2026-05-14', 'YYYY-MM-DD hh24:mi:ss') );

-- statementId: updateMarriageData.update
-- case: 基础参数命中
-- type: update
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "id": 1001
-- }
update VM_MEMBER_MARRIAGE set firstMarriageDate = null, approvedMarriageDays = 0 where id = 1001;

-- statementId: queryLeaveApplyByDate.select
-- case: 动态条件命中
-- type: select
-- assertion: 传入动态变量，验证最终 SQL 正常展开
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

-- statementId: queryLeaveApplyByDate.select
-- case: 可选条件关闭
-- type: select
-- assertion: 移除可选动态属性，观察条件收缩后的 SQL
-- params: {
--   "startDateAMorPM": "2026-05-14",
--   "leaveStartDate": "2026-05-14",
--   "endDateAMorPM": "2026-05-14",
--   "leaveEndDate": "2026-05-14"
-- }
WITH converted_dates AS ( SELECT t."flowId", t."userId", t."leaveStartDate", t."leaveStartDateAMorPM", t."leaveEndDate", t."leaveEndDateAMorPM", t."flowSerialNum", t."flowState", t."leaveType", t."leaveSonType", t."flowUrl", CASE WHEN t."leaveStartDateAMorPM" = '770469099444389055' THEN TO_TIMESTAMP(TO_CHAR(t."leaveStartDate", 'yyyy-mm-dd') || ' 00:00:00', 'YYYY-MM-DD HH24:MI:SS') WHEN t."leaveStartDateAMorPM" = '3338464713283357441' THEN TO_TIMESTAMP(TO_CHAR(t."leaveStartDate", 'yyyy-mm-dd') || ' 12:00:00', 'YYYY-MM-DD HH24:MI:SS') ELSE NULL END AS leave_start_ts, CASE WHEN t."leaveEndDateAMorPM" = '770469099444389055' THEN TO_TIMESTAMP(TO_CHAR(t."leaveEndDate", 'yyyy-mm-dd') || ' 11:59:59', 'YYYY-MM-DD HH24:MI:SS') WHEN t."leaveEndDateAMorPM" = '3338464713283357441' THEN TO_TIMESTAMP(TO_CHAR(t."leaveEndDate", 'yyyy-mm-dd') || ' 23:59:59', 'YYYY-MM-DD HH24:MI:SS') ELSE NULL END AS leave_end_ts, CASE WHEN '2026-05-14' = '770469099444389055' THEN TO_TIMESTAMP('2026-05-14' || ' 00:00:00', 'YYYY-MM-DD HH24:MI:SS') WHEN '2026-05-14' = '3338464713283357441' THEN TO_TIMESTAMP('2026-05-14' || ' 12:00:00', 'YYYY-MM-DD HH24:MI:SS') ELSE NULL END AS request_start_ts, CASE WHEN '2026-05-14' = '770469099444389055' THEN TO_TIMESTAMP('2026-05-14' || ' 11:59:59', 'YYYY-MM-DD HH24:MI:SS') WHEN '2026-05-14' = '3338464713283357441' THEN TO_TIMESTAMP('2026-05-14' || ' 23:59:59', 'YYYY-MM-DD HH24:MI:SS') ELSE NULL END AS request_end_ts FROM ( SELECT id AS "flowId", writer AS "userId", startDate AS "leaveStartDate", startHalfDay AS "leaveStartDateAMorPM", endDate AS "leaveEndDate", endHalfDay AS "leaveEndDateAMorPM", flowSerialNum AS "flowSerialNum", finishedflag AS "flowState", util_common.getEnumValueById(to_char(leaveType)) AS "leaveType", util_common.getEnumValueById(to_char(leaveSonType)) AS "leaveSonType", '' AS "flowUrl" FROM VM_WF_PARENTALLEAVE WHERE state = 1 AND finishedflag IN (0, 1) UNION ALL SELECT id AS "flowId", writer AS "userId", startDate AS "leaveStartDate", startHalfDay AS "leaveStartDateAMorPM", endDate AS "leaveEndDate", endHalfDay AS "leaveEndDateAMorPM", flowSerialNum AS "flowSerialNum", finishedflag AS "flowState", util_common.getEnumValueById(to_char(leaveType)) AS "leaveType", util_common.getEnumValueById(to_char(leaveSonType)) AS "leaveSonType", flowUrl AS "flowUrl" FROM vm_wf_cap4_parentalleave UNION ALL SELECT id AS "flowId", applyUser AS "userId", leaveStartDate AS "leaveStartDate", TO_CHAR(leaveStartHalfDay) AS "leaveStartDateAMorPM", leaveEndDate AS "leaveEndDate", TO_CHAR(leaveEndHalfDay) AS "leaveEndDateAMorPM", serialNo AS "flowSerialNum", finishedflag AS "flowState", util_common.getEnumValueById(to_char(leaveType)) AS "leaveType", '' AS "leaveSonType", flowUrl AS "flowUrl" FROM VM_WF_HKLEAVEAPPLY WHERE state = 1 AND finishedflag IN (0, 1) ) t ) SELECT "flowId", "userId", "leaveStartDate", "leaveStartDateAMorPM", "leaveEndDate", "leaveEndDateAMorPM", "flowSerialNum", "flowState", "leaveType", "leaveSonType", "flowUrl" FROM converted_dates LEFT JOIN org_member m ON "userId" = m.id LEFT JOIN org_unit u ON u.id = m.org_department_id WHERE 1 = 1 AND ( (leave_start_ts >= request_start_ts AND leave_end_ts <= request_end_ts) OR (request_start_ts BETWEEN leave_start_ts AND leave_end_ts) OR (request_end_ts BETWEEN leave_start_ts AND leave_end_ts) ) order by "leaveStartDate";

-- statementId: queryLeaveApplyChangeByDate.select
-- case: 动态条件命中
-- type: select
-- assertion: 传入动态变量，验证最终 SQL 正常展开
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

-- statementId: queryLeaveApplyChangeByDate.select
-- case: 可选条件关闭
-- type: select
-- assertion: 移除可选动态属性，观察条件收缩后的 SQL
-- params: {
--   "startDateAMorPM": "2026-05-14",
--   "leaveStartDate": "2026-05-14",
--   "endDateAMorPM": "2026-05-14",
--   "leaveEndDate": "2026-05-14"
-- }
WITH converted_dates AS ( SELECT t."flowId", t."userId", t."leaveStartDate", t."leaveStartDateAMorPM", t."leaveEndDate", t."leaveEndDateAMorPM", t."flowSerialNum", t."flowState", t."leaveType", t."leaveSonType", t."flowUrl", CASE WHEN t."leaveStartDateAMorPM" = '770469099444389055' THEN TO_TIMESTAMP(TO_CHAR(t."leaveStartDate", 'yyyy-mm-dd') || ' 00:00:00', 'YYYY-MM-DD HH24:MI:SS') WHEN t."leaveStartDateAMorPM" = '3338464713283357441' THEN TO_TIMESTAMP(TO_CHAR(t."leaveStartDate", 'yyyy-mm-dd') || ' 12:00:00', 'YYYY-MM-DD HH24:MI:SS') ELSE NULL END AS leave_start_ts, CASE WHEN t."leaveEndDateAMorPM" = '770469099444389055' THEN TO_TIMESTAMP(TO_CHAR(t."leaveEndDate", 'yyyy-mm-dd') || ' 11:59:59', 'YYYY-MM-DD HH24:MI:SS') WHEN t."leaveEndDateAMorPM" = '3338464713283357441' THEN TO_TIMESTAMP(TO_CHAR(t."leaveEndDate", 'yyyy-mm-dd') || ' 23:59:59', 'YYYY-MM-DD HH24:MI:SS') ELSE NULL END AS leave_end_ts, CASE WHEN '2026-05-14' = '770469099444389055' THEN TO_TIMESTAMP('2026-05-14' || ' 00:00:00', 'YYYY-MM-DD HH24:MI:SS') WHEN '2026-05-14' = '3338464713283357441' THEN TO_TIMESTAMP('2026-05-14' || ' 12:00:00', 'YYYY-MM-DD HH24:MI:SS') ELSE NULL END AS request_start_ts, CASE WHEN '2026-05-14' = '770469099444389055' THEN TO_TIMESTAMP('2026-05-14' || ' 11:59:59', 'YYYY-MM-DD HH24:MI:SS') WHEN '2026-05-14' = '3338464713283357441' THEN TO_TIMESTAMP('2026-05-14' || ' 23:59:59', 'YYYY-MM-DD HH24:MI:SS') ELSE NULL END AS request_end_ts FROM ( select id as "flowId", writer as "userId", newstartDate as "leaveStartDate", newstartHalfDay as "leaveStartDateAMorPM", newendDate as "leaveEndDate", newendHalfDay as "leaveEndDateAMorPM", flowSerialNum as "flowSerialNum", finishedflag as "flowState", util_common.getEnumValueById(to_char(leaveType)) AS "leaveType", '' AS "leaveSonType", '' as "flowUrl" from vm_wf_parentalleavecancel where state = 1 and finishedflag in (0,1) and cancelType = util_common.getEnumIdByRefName('销假类型', '部分销假') UNION ALL select id as "flowId", writer as "userId", newstartDate as "leaveStartDate", newstartHalfDay as "leaveStartDateAMorPM", newendDate as "leaveEndDate", newendHalfDay as "leaveEndDateAMorPM", flowSerialNum as "flowSerialNum", finishedflag as "flowState", util_common.getEnumValueById(to_char(leaveType)) AS "leaveType", util_common.getEnumValueById(to_char(leaveSonType)) AS "leaveSonType", flowUrl as "flowUrl" from vm_wf_cap4_parentalleavecancel where state = 1 and finishedflag in (0,1) and cancelType = util_common.getEnumIdByRefName('销假类型', '部分销假') UNION ALL select id as "flowId", applyUser as "userId", newLeaveStartDate as "leaveStartDate", to_char(newLeaveStartHalfDay) as "leaveStartDateAMorPM", newLeaveEndDate as "leaveEndDate", to_char(newLeaveEndHalfDay) as "leaveEndDateAMorPM", serialNo as "flowSerialNum", finishedflag as "flowState", util_common.getEnumValueById(to_char(leaveType)) AS "leaveType", '' AS "leaveSonType", flowUrl as "flowUrl" from vm_wf_hkleavebackapply where state = 1 and finishedflag in (0,1) and leaveBackType = util_common.getEnumIdByRefName('销假类型', '部分销假') ) t ) SELECT "flowId", "userId", "leaveStartDate", "leaveStartDateAMorPM", "leaveEndDate", "leaveEndDateAMorPM", "flowSerialNum", "flowState", "leaveType", "leaveSonType", "flowUrl" FROM converted_dates LEFT JOIN org_member m ON "userId" = m.id LEFT JOIN org_unit u ON u.id = m.org_department_id WHERE 1 = 1 AND ( (leave_start_ts >= request_start_ts AND leave_end_ts <= request_end_ts) OR (request_start_ts BETWEEN leave_start_ts AND leave_end_ts) OR (request_end_ts BETWEEN leave_start_ts AND leave_end_ts) ) order by "leaveStartDate";

-- statementId: cancelLeaveApplyBySerialNum.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "leaveSerialNum": "RAW_VALUE"
-- }
select t."flowId", t."leaveSerialNum" from ( select id as "flowId", state as "state", businessFlowId as "leaveSerialNum" from vm_wf_parentalleavecancel union all select id as "flowId", state as "state", businessFlowId as "leaveSerialNum" from vm_wf_cap4_parentalleavecancel union all select id as "flowId", state as "state", leaveFlowSerialNo as "leaveSerialNum" from vm_wf_hkleavebackapply ) t where 1 =1 and t."state" = 1 and t."leaveSerialNum" in (RAW_VALUE);

-- statementId: queryAllStatusOfEvectionAndLeaveRec.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "writer": "VALUE_001",
--   "currentDate": "2026-05-14"
-- }
select id as "id", leaveStatus as "leaveStatus", isAmLeave as "isAmLeave", flowStatus as "flowStatus", isPmLeave as "isPmLeave", pmFlowStatus as "pmFlowStatus", evectionStatus as "evectionStatus", evectionFlowStatus as "evectionFlowStatus", surveyStatus as "surveyStatus", surveyFlowStatus as "surveyFlowStatus" from vm_wf_cap4_everyDayLeaveAndEvection where writer = 'VALUE_001' and currentDate = TO_DATE('2026-05-14', 'YYYY-MM-DD');

-- statementId: queryLeaveRecordIdByFlowSerialNum.select
-- case: 动态条件命中
-- type: select
-- assertion: 传入动态变量，验证最终 SQL 正常展开
-- params: {
--   "leaveFlowSerialNum": "VALUE_001",
--   "cancelLeaveFlowSerialNum": "VALUE_001"
-- }
select id as "id", leaveFlowSerialNum as "leaveFlowSerialNum", cancelLeaveFlowSerialNum as "cancelLeaveFlowSerialNum", pmLeaveFlowSerialNum as "pmLeaveFlowSerialNum", pmCancelLeaveFlowSerialNum as "pmCancelLeaveFlowSerialNum" from vm_wf_cap4_everyDayLeaveAndEvection where 1 = 1 AND ( leaveFlowSerialNum = 'VALUE_001' or pmLeaveFlowSerialNum = 'VALUE_001') AND ( cancelLeaveFlowSerialNum = 'VALUE_001' or pmCancelLeaveFlowSerialNum = 'VALUE_001');

-- statementId: queryLeaveRecordIdByFlowSerialNum.select
-- case: 可选条件关闭
-- type: select
-- assertion: 移除可选动态属性，观察条件收缩后的 SQL
-- params: {}
select id as "id", leaveFlowSerialNum as "leaveFlowSerialNum", cancelLeaveFlowSerialNum as "cancelLeaveFlowSerialNum", pmLeaveFlowSerialNum as "pmLeaveFlowSerialNum", pmCancelLeaveFlowSerialNum as "pmCancelLeaveFlowSerialNum" from vm_wf_cap4_everyDayLeaveAndEvection where 1 = 1;

-- statementId: updateEveryDayAMLeaveRecord.update
-- case: 动态条件命中
-- type: update
-- assertion: 传入动态变量，验证最终 SQL 正常展开
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

-- statementId: updateEveryDayAMLeaveRecord.update
-- case: 可选条件关闭
-- type: update
-- assertion: 移除可选动态属性，观察条件收缩后的 SQL
-- params: {
--   "flowStatus": 1,
--   "writer": "VALUE_001",
--   "currentDate": "2026-05-14"
-- }
update vm_wf_cap4_everyDayLeaveAndEvection set flowStatus = 1 where writer = 'VALUE_001' and currentDate = TO_DATE('2026-05-14', 'YYYY-MM-DD');

-- statementId: updateEveryDayPMLeaveRecord.update
-- case: 动态条件命中
-- type: update
-- assertion: 传入动态变量，验证最终 SQL 正常展开
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

-- statementId: updateEveryDayPMLeaveRecord.update
-- case: 可选条件关闭
-- type: update
-- assertion: 移除可选动态属性，观察条件收缩后的 SQL
-- params: {
--   "flowStatus": 1,
--   "writer": "VALUE_001",
--   "currentDate": "2026-05-14"
-- }
update vm_wf_cap4_everyDayLeaveAndEvection set pmFlowStatus = 1 where writer = 'VALUE_001' and currentDate = TO_DATE('2026-05-14', 'YYYY-MM-DD');

-- statementId: updateEveryDayLeaveStatus.update
-- case: 基础参数命中
-- type: update
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "id": 1001
-- }
UPDATE vm_wf_cap4_everyDayLeaveAndEvection SET leaveStatus = CASE WHEN (isAmLeave = '-3841538853571705149' AND isPmLeave = '-3841538853571705149') THEN util_common.getEnumIdByRefName('时段类型', '全天') WHEN (isAmLeave = '-3841538853571705149' AND (isPmLeave != '-3841538853571705149' OR isPmLeave IS NULL)) THEN util_common.getEnumIdByRefName('时段类型', '上午') WHEN (isPmLeave = '-3841538853571705149' AND (isAmLeave != '-3841538853571705149' OR isAmLeave IS NULL)) THEN util_common.getEnumIdByRefName('时段类型', '下午') ELSE util_common.getEnumIdByRefName('时段类型', '无') END WHERE id = 1001;

-- statementId: clearEveryDayLeaveRecordAM.update
-- case: 基础参数命中
-- type: update
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "id": 1001
-- }
update vm_wf_cap4_everyDayLeaveAndEvection set isAmLeave = null, startDate = null, startHalfDay = null, endDate = null, endHalfDay = null, leaveRecord = null, flowUrl = null, leaveType = null, leaveSonType = null, flowStatus = null, leaveReason = null, leaveFlowSerialNum = null where id = 1001;

-- statementId: clearEveryDayLeaveRecordPM.update
-- case: 基础参数命中
-- type: update
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "id": 1001
-- }
update vm_wf_cap4_everyDayLeaveAndEvection set isPmLeave = null, pmStartDate = null, pmStartHalfDay = null, pmEndDate = null, pmEndHalfDay = null, pmLeaveRecord = null, pmFlowUrl = null, pmLeaveType = null, pmLeaveSonType = null, pmFlowStatus = null, pmLeaveReason = null, pmLeaveFlowSerialNum = null where id = 1001;

-- statementId: clearEveryDayCancelLeaveRecordAM.update
-- case: 基础参数命中
-- type: update
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "id": 1001
-- }
update vm_wf_cap4_everyDayLeaveAndEvection set isAmLeave = null, startDate = null, startHalfDay = null, endDate = null, endHalfDay = null, leaveRecord = null, flowUrl = null, leaveType = null, leaveSonType = null, flowStatus = null, leaveReason = null, cancelLeaveFlowSerialNum = null where id = 1001;

-- statementId: clearEveryDayCancelLeaveRecordPM.update
-- case: 基础参数命中
-- type: update
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "id": 1001
-- }
update vm_wf_cap4_everyDayLeaveAndEvection set isPmLeave = null, pmStartDate = null, pmStartHalfDay = null, pmEndDate = null, pmEndHalfDay = null, pmLeaveRecord = null, pmFlowUrl = null, pmLeaveType = null, pmLeaveSonType = null, pmFlowStatus = null, pmLeaveReason = null, pmCancelLeaveFlowSerialNum = null where id = 1001;

-- statementId: insertEveryDayLeaveRecord.insert
-- case: 基础参数命中
-- type: insert
-- assertion: 传入基础变量，验证最终 SQL 正常生成
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
-- case: 基础参数命中
-- type: insert
-- assertion: 传入基础变量，验证最终 SQL 正常生成
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
-- case: 动态条件命中
-- type: select
-- assertion: 传入动态变量，验证最终 SQL 正常展开
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

-- statementId: isSickRecord.select
-- case: 可选条件关闭
-- type: select
-- assertion: 移除可选动态属性，观察条件收缩后的 SQL
-- params: {
--   "writer": "VALUE_001",
--   "currentDate": "2026-05-14",
--   "leaveType": "VALUE_001"
-- }
select id as "id", leaveStatus as "leaveStatus", flowStatus as "flowStatus" from vm_wf_cap4_everyDayLeaveAndEvection where writer = 'VALUE_001' and currentDate = TO_DATE('2026-05-14', 'YYYY-MM-DD') and leaveType = 'VALUE_001';

-- statementId: queryNeedReimburseFlow.select
-- case: 动态条件命中
-- type: select
-- assertion: 传入动态变量，验证最终 SQL 正常展开
-- params: {
--   "endDateAMorPM": "2026-05-14",
--   "endDate": "2026-05-14",
--   "mainMember": "VALUE_001",
--   "leaveType": "VALUE_001",
--   "historyActiveDate": "2026-05-14",
--   "historyExpiryDate": "2026-05-14"
-- }
WITH calculation_cte AS ( select id as "id", mainMember as "mainMember", leaveType as "leaveType", cancelLeaveFlowSerialNum as "cancelLeaveFlowSerialNum", startDate as "startDate", maxOldDeductDays as "maxOldDeductDays", beforeOldDeductDays as "beforeOldDeductDays", afterOldDeductDays as "afterOldDeductDays", beforeNewDeductDays as "beforeNewDeductDays", afterNewDeductDays as "afterNewDeductDays", calculationProcess as "calculationProcess", CASE WHEN endDateAMorPM = '770469099444389055' THEN TO_TIMESTAMP(TO_CHAR(endDate, 'yyyy-mm-dd') || ' 11:59:59', 'YYYY-MM-DD HH24:MI:SS') WHEN endDateAMorPM = '3338464713283357441' THEN TO_TIMESTAMP(TO_CHAR(endDate, 'yyyy-mm-dd') || ' 23:59:59', 'YYYY-MM-DD HH24:MI:SS') ELSE NULL END AS leave_end_ts, CASE WHEN '2026-05-14' = '770469099444389055' THEN TO_TIMESTAMP('2026-05-14' || ' 11:59:59', 'YYYY-MM-DD HH24:MI:SS') WHEN '2026-05-14' = '3338464713283357441' THEN TO_TIMESTAMP('2026-05-14' || ' 23:59:59', 'YYYY-MM-DD HH24:MI:SS') ELSE NULL END AS request_end_ts from vm_wf_cap4_reimburseleave ) SELECT "id", "mainMember", "leaveType", "cancelLeaveFlowSerialNum", "startDate", "maxOldDeductDays", "beforeOldDeductDays", "afterOldDeductDays", "beforeNewDeductDays", "afterNewDeductDays", "calculationProcess", leave_end_ts, request_end_ts FROM calculation_cte where "mainMember" = 'VALUE_001' and leave_end_ts > request_end_ts and "leaveType" = 'VALUE_001' AND "startDate" BETWEEN TO_DATE('2026-05-14', 'YYYY-MM-DD') AND TO_DATE('2026-05-14', 'YYYY-MM-DD') order by leave_end_ts;

-- statementId: queryNeedReimburseFlow.select
-- case: 可选条件关闭
-- type: select
-- assertion: 移除可选动态属性，观察条件收缩后的 SQL
-- params: {
--   "endDateAMorPM": "2026-05-14",
--   "endDate": "2026-05-14",
--   "mainMember": "VALUE_001",
--   "leaveType": "VALUE_001",
--   "historyExpiryDate": "2026-05-14"
-- }
WITH calculation_cte AS ( select id as "id", mainMember as "mainMember", leaveType as "leaveType", cancelLeaveFlowSerialNum as "cancelLeaveFlowSerialNum", startDate as "startDate", maxOldDeductDays as "maxOldDeductDays", beforeOldDeductDays as "beforeOldDeductDays", afterOldDeductDays as "afterOldDeductDays", beforeNewDeductDays as "beforeNewDeductDays", afterNewDeductDays as "afterNewDeductDays", calculationProcess as "calculationProcess", CASE WHEN endDateAMorPM = '770469099444389055' THEN TO_TIMESTAMP(TO_CHAR(endDate, 'yyyy-mm-dd') || ' 11:59:59', 'YYYY-MM-DD HH24:MI:SS') WHEN endDateAMorPM = '3338464713283357441' THEN TO_TIMESTAMP(TO_CHAR(endDate, 'yyyy-mm-dd') || ' 23:59:59', 'YYYY-MM-DD HH24:MI:SS') ELSE NULL END AS leave_end_ts, CASE WHEN '2026-05-14' = '770469099444389055' THEN TO_TIMESTAMP('2026-05-14' || ' 11:59:59', 'YYYY-MM-DD HH24:MI:SS') WHEN '2026-05-14' = '3338464713283357441' THEN TO_TIMESTAMP('2026-05-14' || ' 23:59:59', 'YYYY-MM-DD HH24:MI:SS') ELSE NULL END AS request_end_ts from vm_wf_cap4_reimburseleave ) SELECT "id", "mainMember", "leaveType", "cancelLeaveFlowSerialNum", "startDate", "maxOldDeductDays", "beforeOldDeductDays", "afterOldDeductDays", "beforeNewDeductDays", "afterNewDeductDays", "calculationProcess", leave_end_ts, request_end_ts FROM calculation_cte where "mainMember" = 'VALUE_001' and leave_end_ts > request_end_ts and "leaveType" = 'VALUE_001' order by leave_end_ts;

-- statementId: updateLeaveDeductDays.update
-- case: 动态条件命中
-- type: update
-- assertion: 传入动态变量，验证最终 SQL 正常展开
-- params: {
--   "cancelLeaveFlowSerialNum": "VALUE_001",
--   "calculationProcess": "VALUE_001",
--   "afterNewDeductDays": "VALUE_001",
--   "afterOldDeductDays": "VALUE_001",
--   "id": 1001
-- }
update vm_wf_cap4_reimburseleave set cancelLeaveFlowSerialNum = 'VALUE_001' ,calculationProcess = 'VALUE_001' ,afterNewDeductDays = 'VALUE_001' ,afterOldDeductDays = 'VALUE_001' where id = 1001;

-- statementId: updateLeaveDeductDays.update
-- case: 可选条件关闭
-- type: update
-- assertion: 移除可选动态属性，观察条件收缩后的 SQL
-- params: {
--   "cancelLeaveFlowSerialNum": "VALUE_001",
--   "id": 1001
-- }
update vm_wf_cap4_reimburseleave set cancelLeaveFlowSerialNum = 'VALUE_001' where id = 1001;

-- statementId: updateEveryDayEvectionRecord.update
-- case: 动态条件命中
-- type: update
-- assertion: 传入动态变量，验证最终 SQL 正常展开
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

-- statementId: updateEveryDayEvectionRecord.update
-- case: 可选条件关闭
-- type: update
-- assertion: 移除可选动态属性，观察条件收缩后的 SQL
-- params: {
--   "evectionFlowStatus": 1,
--   "writer": "VALUE_001",
--   "currentDate": "2026-05-14"
-- }
update vm_wf_cap4_everyDayLeaveAndEvection set evectionFlowStatus = 1 where writer = 'VALUE_001' and currentDate = TO_DATE('2026-05-14', 'YYYY-MM-DD');

-- statementId: clearEveryDayEvectionRecord.update
-- case: 基础参数命中
-- type: update
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "evectionFlowSerialNum": "VALUE_001"
-- }
update vm_wf_cap4_everyDayLeaveAndEvection set evectionStatus = null, evectionStartDate = null, evectionEndDate = null, evectionRecord = null, evectionFlowUrl = null, isOverseas = null, evectionFlowStatus = null, evectionReason = null where evectionFlowSerialNum = 'VALUE_001';

-- statementId: clearEveryDayCancelEvectionRecord.update
-- case: 基础参数命中
-- type: update
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "evectionChangeFlowSerialNum": "VALUE_001"
-- }
update vm_wf_cap4_everyDayLeaveAndEvection set evectionStatus = null, evectionStartDate = null, evectionEndDate = null, evectionRecord = null, evectionFlowUrl = null, isOverseas = null, evectionFlowStatus = null, evectionReason = null where evectionChangeFlowSerialNum = 'VALUE_001';

-- statementId: insertEveryDayEvectionRecord.insert
-- case: 基础参数命中
-- type: insert
-- assertion: 传入基础变量，验证最终 SQL 正常生成
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
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "flowSerialNum": "VALUE_001"
-- }
select t."id", t."flowSerialNum", t."writer", t."singMember", t."writerDept", t."isOverseas", t."evectionRecord", t."startDateStr", t."endDateStr", t."evectionReason", t."evectionFlowUrl" from ( select id as "id", flowSerialNum as "flowSerialNum", userId as "writer", travelerId as "singMember", writerDept as "writerDept", isOverseas as "isOverseas", evectionRecord as "evectionRecord", to_char(evectionStartDate, 'yyyy-MM-dd') as "startDateStr", to_char(evectionEndDate, 'yyyy-MM-dd') as "endDateStr", evectionReason as "evectionReason", flowUrl as "evectionFlowUrl" from vm_cap4_evations union all select id as "id", flowSerialNum as "flowSerialNum", userId as "writer", travelerId as "singMember", writerDept as "writerDept", isOverseas as "isOverseas", evectionRecord as "evectionRecord", to_char(evectionStartDate, 'yyyy-MM-dd') as "startDateStr", to_char(evectionEndDate, 'yyyy-MM-dd') as "endDateStr", evectionReason as "evectionReason", flowUrl as "evectionFlowUrl" from vm_cap4_evations_change union all select id as "id", flowSerialNum as "flowSerialNum", userId as "writer", travelerId as "singMember", writerDept as "writerDept", isOverseas as "isOverseas", evectionRecord as "evectionRecord", to_char(evectionStartDate, 'yyyy-MM-dd') as "startDateStr", to_char(evectionEndDate, 'yyyy-MM-dd') as "endDateStr", evectionReason as "evectionReason", flowUrl as "evectionFlowUrl" from vm_cap4_hk_evations ) t where 1 =1 and t."flowSerialNum" = 'VALUE_001';

-- statementId: updateEmployeeVacationDays
-- case: 基础参数命中
-- type: update
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "totalDays": "VALUE_001",
--   "leaveType": "VALUE_001",
--   "belongYear": "VALUE_001",
--   "employeeName": "NAME_001"
-- }
update vm_employee_leave_info set totalDays = 'VALUE_001' where leaveType = 'VALUE_001' and belongYear = 'VALUE_001' and employeeName = util_user.getMemIdByMemCode('NAME_001');

-- statementId: insertEmployeeVacationDays
-- case: 基础参数命中
-- type: insert
-- assertion: 传入基础变量，验证最终 SQL 正常生成
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
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "startDate": "2026-05-14"
-- }
select util_user.getMemCodeByMemId(employeeName) || f.childIdNumber from vm_employee_leave_info f where f.leaveType = 6922136425708142756 and f.expirationDate >= '2026-05-14';

-- statementId: findAllMemberMarryInfo
-- case: 无参基础场景
-- type: select
-- assertion: 不传参数，验证固定 SQL 可直接生成
-- params: {}
select util_user.getMemCodeByMemId(f.employeeName) from vm_employee_leave_info f where f.leaveType = -9128234600987606369;

-- statementId: staffDaysByYearAndLeaveType.select
-- case: 动态条件命中
-- type: select
-- assertion: 传入动态变量，验证最终 SQL 正常展开
-- params: {
--   "leaveType": "VALUE_001",
--   "belongYear": [
--     "EVENT_A",
--     "EVENT_B"
--   ]
-- }
select id, uniqueFlag, util_user.getMemCodeByMemId(employeeName) employeeName, belongYear, leaveType, totalDays from vm_employee_leave_info f where f.leaveType = 'VALUE_001' and belongYear in ('EVENT_A','EVENT_B');

-- statementId: staffDaysByYearAndLeaveType.select
-- case: 可选条件关闭
-- type: select
-- assertion: 移除可选动态属性，观察条件收缩后的 SQL
-- params: {
--   "leaveType": "VALUE_001"
-- }
select id, uniqueFlag, util_user.getMemCodeByMemId(employeeName) employeeName, belongYear, leaveType, totalDays from vm_employee_leave_info f where f.leaveType = 'VALUE_001' and belongYear in (null);

-- statementId: findMemberEffectUniqueFlagByMemberInfo
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "leaveType": "VALUE_001",
--   "employeeName": "NAME_001",
--   "endDate": "2026-05-14",
--   "startDate": "2026-05-14"
-- }
select f.uniqueFlag, f.remainingDays, effectiveDate from vm_employee_leave_info f where util_common.getEnumShowById(f.leaveType) = 'VALUE_001' and f.employeeName = util_user.getMemIdByLoginName('NAME_001') and '2026-05-14' >= f.effectiveDate and '2026-05-14' <= f.expirationDate order by f.effectiveDate desc;

-- statementId: findReimburseLeaveRecord.select
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: "VALUE_001"
select id as "id" from vm_wf_cap4_reimburseleave where cancelLeaveFlowSerialNum = 'VALUE_001';

-- statementId: deleteLeaveArchiveReimburseInfo.delete
-- case: 基础参数命中
-- type: delete
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: 1001
delete from vm_wf_cap4_reimburseleave_son where formmainId = 1001;

-- statementId: insertLeaveArchiveReimburseInfo.insert
-- case: 基础参数命中
-- type: insert
-- assertion: 传入基础变量，验证最终 SQL 正常生成
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
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "employeeName": "NAME_001",
--   "leaveType": "VALUE_001",
--   "endDate": "2026-05-14",
--   "startDate": "2026-05-14"
-- }
SELECT id as "id", employeeName as "employeeName", department as "department", leaveType as "leaveType", effectiveDate as "effectiveDate", expirationDate as "expirationDate", totalDays as "totalDays", usedDays as "usedDays", remainingDays as "remainingDays", uniqueFlag as "uniqueFlag" FROM VM_EMPLOYEE_LEAVE_INFO WHERE 1 = 1 and uniqueFlag is not null and effectiveDate is not null and expirationDate is not null and employeeName = 'NAME_001' and leaveType = 'VALUE_001' and effectiveDate <= TO_DATE('2026-05-14', 'YYYY-MM-DD') and expirationDate >= TO_DATE('2026-05-14', 'YYYY-MM-DD') ORDER BY expirationDate DESC, remainingDays DESC;

-- statementId: updateLeaveArchiveById.update
-- case: 基础参数命中
-- type: update
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "usedDays": "VALUE_001",
--   "remainingDays": "VALUE_001",
--   "id": 1001
-- }
update vm_employee_leave_info set usedDays = 'VALUE_001', remainingDays = 'VALUE_001' where id = 1001;

-- statementId: allEnableMemberId.select
-- case: 无参基础场景
-- type: select
-- assertion: 不传参数，验证固定 SQL 可直接生成
-- params: {}
select code from org_member f where is_enable = 1 and is_deleted = 0 and f.is_internal = 1 and f.is_virtual = 0 and code is not null;

-- statementId: subordinateLeaveRecordByLoginId
-- case: 动态条件命中
-- type: select
-- assertion: 传入动态变量，验证最终 SQL 正常展开
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

-- statementId: subordinateLeaveRecordByLoginId
-- case: 可选条件关闭
-- type: select
-- assertion: 移除可选动态属性，观察条件收缩后的 SQL
-- params: {
--   "endDate": "2026-05-14",
--   "startDate": "2026-05-14"
-- }
SELECT CASE WHEN vwp.finishedflag = 1 THEN l.id ELSE vwp.id END AS ID, om.name, 'leave' AS leaveCancelType, vwp.finishedflag AS ISFINISHED, vwp.startDate, vwp.endDate, util_common.getEnumShowById(vwp.startHalfDay) AS STARTDATEMORN, util_common.getEnumShowById(vwp.endHalfDay) AS ENDDATEMORN, util_common.getEnumShowById(vwp.leaveType) AS TYPE FROM vm_wf_cap4_parentalleave vwp LEFT JOIN org_member om ON vwp.writer = om.id LEFT JOIN vm_leaveInfo_doc_cap4 l ON l.leaveSerialNum = vwp.flowSerialNum AND l.leaveCancelType = 8705337157000773743 WHERE vwp.state = 1 and (l.leaveCancelType = 8705337157000773743 or l.leaveCancelType is null) AND vwp.startDate <= to_date('2026-05-14', 'yyyy-mm-dd') AND vwp.endDate >= to_date('2026-05-14', 'yyyy-mm-dd') AND NOT EXISTS ( SELECT 1 FROM vm_wf_cap4_parentalleavecancel WHERE businessFlowId = l.leaveSerialNum ) and vwp.flowSerialNum is not null;

-- statementId: subordinateNewLeaveRecordByLoginId
-- case: 动态条件命中
-- type: select
-- assertion: 传入动态变量，验证最终 SQL 正常展开
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

-- statementId: subordinateNewLeaveRecordByLoginId
-- case: 可选条件关闭
-- type: select
-- assertion: 移除可选动态属性，观察条件收缩后的 SQL
-- params: {
--   "endDate": "2026-05-14",
--   "startDate": "2026-05-14"
-- }
SELECT CASE WHEN vwp.finishedflag = 1 THEN vdc.id ELSE vwp.id END AS ID, om.name, 'cancel' as leaveCancelType, vwp.finishedflag AS ISFINISHED, vwp.newstartDate startDate, vwp.newendDate endDate, util_common.getEnumShowById(vwp.newstartHalfDay) AS STARTDATEMORN, util_common.getEnumShowById(vwp.newendHalfDay) AS ENDDATEMORN, util_common.getEnumShowById(vwp.leaveType) AS TYPE FROM vm_wf_cap4_parentalleavecancel vwp LEFT JOIN org_member om ON vwp.writer = om.id left join vm_leaveInfo_doc_cap4 vdc on vwp.businessFlowId=vdc.leaveSerialNum WHERE vwp.state = 1 and vwp.cancelType = 7806055738419137699 AND vwp.newstartDate <= to_date('2026-05-14', 'yyyy-mm-dd') AND vwp.newendDate >= to_date('2026-05-14', 'yyyy-mm-dd');

-- statementId: findNeedPushLeaveAttachmentMonthly
-- case: 无参基础场景
-- type: select
-- assertion: 不传参数，验证固定 SQL 可直接生成
-- params: {}
select f.id, f.leave_request_number from vm_employee_leave_recordCAP4 f left join vm_basememberinfo v on f.applicant = v.memberId where trigger_upload_process = -3841538853571705149 and proof_process_status = '审批中' and v.memberState = '在职';

-- statementId: stopLeaveAttachmentMonthly.select
-- case: 无参基础场景
-- type: select
-- assertion: 不传参数，验证固定 SQL 可直接生成
-- params: {}
select f.id from VM_LEAVE_PROOF_ATTACHMENT_UPLOAD f left join vm_basememberinfo vbf on f.applicant = vbf.memberId where f.finishedflag = 0 and vbf.memberState = '离职';

