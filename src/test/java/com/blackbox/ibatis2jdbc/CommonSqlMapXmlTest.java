package com.blackbox.ibatis2jdbc;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.io.IOException;
import java.net.URISyntaxException;

import static org.junit.jupiter.api.Assertions.*;
import static com.blackbox.ibatis2jdbc.TestSupport.mapOf;

/**
 * 针对 common_sqlmap.xml 的详细 statement 解析与断言测试
 */
class CommonSqlMapXmlTest {
  private IbatisToJdbcConverter converter;
  private String xml;

  @BeforeEach
  void setUp() throws IOException, URISyntaxException {
    converter = new IbatisToJdbcConverter();
    xml = TestSupport.readResource(CommonSqlMapXmlTest.class, "/online_sqlmaps/common_sqlmap.xml");
  }

  @Test
  void testSetAffairTrackUpdate() {
    ConvertedSql sql = converter.convertForExecution(xml, "setAffairTrack.update", mapOf("isTrack", 1, "id", 123L));
    assertEquals("update ctp_affair set track = ? where id = ?", sql.sql().replaceAll("\\s+", " ").trim());
    assertEquals("update", sql.statementType());
    // 参数为 List，顺序与 SQL 占位符一致
    assertTrue(sql.parameters() instanceof java.util.List);
    assertEquals(2, ((java.util.List<?>) sql.parameters()).size());
    assertEquals(1, ((java.util.List<?>) sql.parameters()).get(0));
    assertEquals(123L, ((java.util.List<?>) sql.parameters()).get(1));
  }

  @Test
  void testColInfoSelect() {
    ConvertedSql sql = converter.convertForExecution(xml, "colInfo.select", mapOf("affairId", 100L));
    assertEquals("select", sql.statementType());
    assertEquals("mapBean", sql.resultClass());
    assertEquals(
        "select a.sub_object_id as workitemId,s.process_id as processId,s.case_Id as caseId, a.activity_Id as activityId,s.id as summaryId from ctp_affair a,col_summary s where a.object_id=s.id and a.id=?",
        sql.sql());
    java.util.List<?> params = (java.util.List<?>) sql.parameters();
    assertEquals(1, params.size());
    assertEquals(100L, params.get(0));
  }

  @Test
  void testGetSonTableColTypeSelect() {
    ConvertedSql sql = converter.convertForExecution(xml, "getSonTableColType.select",
        mapOf("sonTableName", "T_SON", "tableName", "T_MAIN", "field", "FIELD001"));
    assertEquals("select", sql.statementType());
    assertEquals(
        "select VC_FIELDINPUTTYPE as fieldInputType,VC_FIELDREFID as fieldrefid from vm_formfield where VC_TABLENAME = ? and VC_OWNERTABLEID = ? and VC_FIELDNAME = ?",
        sql.sql());
    java.util.List<?> params = (java.util.List<?>) sql.parameters();
    assertEquals(3, params.size());
    assertEquals("T_SON", params.get(0));
    assertEquals("T_MAIN", params.get(1));
    assertEquals("FIELD001", params.get(2));
  }

  @Test
  void testGetTableNameByFormNameSelectWithSonTable() {
    ConvertedSql sql = converter.convertForExecution(xml, "getTableNameByFormName.select",
        mapOf("mainTableName", "USER_FORM", "sonTableName", "USER_SON"));
    assertEquals("select", sql.statementType());
    assertEquals(
        "SELECT VC_TABLENAME AS tableName, VC_OWNERTABLEID AS ownerTableID FROM VM_FORMFIELD WHERE VC_FORMNAME = ? AND VC_TABLEDISPLAY = ? AND ROWNUM = 1",
        sql.sql());
    java.util.List<?> params = (java.util.List<?>) sql.parameters();
    assertEquals(2, params.size());
    assertEquals("USER_FORM", params.get(0));
    assertEquals("USER_SON", params.get(1));
  }

  @Test
  void testGetTableNameByFormNameSelectWithoutSonTable() {
    ConvertedSql sql = converter.convertForExecution(xml, "getTableNameByFormName.select",
        mapOf("mainTableName", "USER_FORM"));
    assertEquals("select", sql.statementType());
    assertEquals(
        "SELECT VC_TABLENAME AS tableName, VC_OWNERTABLEID AS ownerTableID FROM VM_FORMFIELD WHERE VC_FORMNAME = ? AND VC_OWNERTABLEID is null AND ROWNUM = 1",
        sql.sql());
    java.util.List<?> params = (java.util.List<?>) sql.parameters();
    assertEquals(1, params.size());
    assertEquals("USER_FORM", params.get(0));
  }

  @Test
  void testAffairInstructSelectWithScalarParam() {
    // parameterClass="string"：标量参数，占位符绑定 defaultValue
    ConvertedSql sql = converter.convertForExecution(xml, "affairInstruct.select", "NODE_001");
    assertEquals("select", sql.statementType());
    assertEquals("java.lang.String", sql.resultClass());
    assertEquals("select field0006 from formson_2230 where field0004 = ?", sql.sql());
    java.util.List<?> params = (java.util.List<?>) sql.parameters();
    assertEquals(1, params.size());
    assertEquals("NODE_001", params.get(0));
  }

  @Test
  void testLoggerInfoFailNewSelect() {
    ConvertedSql sql = converter.convertForExecution(xml, "loggerInfoFailNew.select",
        mapOf("state", 0, "ifHandle", 0, "startDay", "2026-05-01"));
    assertEquals("select", sql.statementType());
    assertEquals("java.lang.Integer", sql.resultClass());
    assertEquals(
        "select count(1) from vm_log_record where operateState=? and ifHandle=? and to_char(START_DATE, 'yyyy-mm-dd') between ? and to_char(sysDate, 'yyyy-mm-dd')",
        sql.sql());
    java.util.List<?> params = (java.util.List<?>) sql.parameters();
    assertEquals(3, params.size());
    assertEquals(0, params.get(0));
    assertEquals(0, params.get(1));
    assertEquals("2026-05-01", params.get(2));
  }

  @Test
  void testGetInterfaceConfigByTemplateIdSelectWithDollarSubstitution() {
    // $mainTable$ 为原始文本替换，#formTemplateID# 为 PreparedStatement 占位符
    ConvertedSql sql = converter.convertForExecution(xml, "getInterfaceConfigByTemplateId.select",
        mapOf("mainTable", "formmain_9999", "formTemplateID", 1001));
    assertEquals("select", sql.statementType());
    assertEquals(
        "SELECT T2.SHOWVALUE AS INTERSWITCH, T1.FIELD0012 AS INTERDEFAULT FROM formmain_9999 T1 LEFT JOIN CTP_ENUM_ITEM T2 ON T2.ID = T1.FIELD0013 WHERE T1.FIELD0001 = ?",
        sql.sql());
    java.util.List<?> params = (java.util.List<?>) sql.parameters();
    assertEquals(1, params.size());
    assertEquals(1001, params.get(0));
  }

  @Test
  void testSonTableDeleteWithDollarSubstitution() {
    ConvertedSql sql = converter.convertForExecution(xml, "sonTable.delete",
        mapOf("tableName", "formson_123", "formId", 99));
    assertEquals("delete", sql.statementType());
    assertEquals("delete formson_123 where formmain_id = ?", sql.sql());
    java.util.List<?> params = (java.util.List<?>) sql.parameters();
    assertEquals(1, params.size());
    assertEquals(99, params.get(0));
  }

  @Test
  void testNodeConfigInfoSelectBaseQuery() {
    // 所有可选条件均未提供，只输出基础 SQL
    ConvertedSql sql = converter.convertForExecution(xml, "nodeConfigInfo.select", mapOf());
    assertEquals("select", sql.statementType());
    assertEquals(
        "select n_recid as id, vc_activityid as activityid, vc_dataname as dataname ,vc_datavalue as datavalue from fg_node_config where vc_status = 1",
        sql.sql());
    java.util.List<?> params = (java.util.List<?>) sql.parameters();
    assertEquals(0, params.size());
  }

  @Test
  void testNodeConfigInfoSelectWithOptionalConditions() {
    ConvertedSql sql = converter.convertForExecution(xml, "nodeConfigInfo.select",
        mapOf("id", 10, "activityId", "ACT001"));
    assertEquals("select", sql.statementType());
    assertTrue(sql.sql().contains("where vc_status = 1 AND n_recid = ? AND vc_activityid = ?"));
    java.util.List<?> params = (java.util.List<?>) sql.parameters();
    assertEquals(2, params.size());
    assertEquals(10, params.get(0));
    assertEquals("ACT001", params.get(1));
  }

  @Test
  void testCtpAffairStatusUpdate() {
    ConvertedSql sql = converter.convertForExecution(xml, "ctpAffairStatus.update",
        mapOf("status", 2, "subStatus", 3, "affairId", 100L, "activityId", 200L));
    assertTrue(sql.sql().contains("update ctp_affair"));
    assertTrue(sql.sql().contains("set state=?"));
    assertTrue(sql.sql().contains("sub_state=?"));
    assertTrue(sql.sql().contains("where object_id = (select distinct object_id from ctp_affair where ID=?)"));
    assertTrue(sql.sql().contains("and activity_Id=?"));
    assertEquals("update", sql.statementType());
    assertTrue(sql.parameters() instanceof java.util.List);
    java.util.List<?> params = (java.util.List<?>) sql.parameters();
    assertEquals(4, params.size());
    assertEquals(2, params.get(0)); // status
    assertEquals(3, params.get(1)); // subStatus
    assertEquals(100L, params.get(2)); // affairId
    assertEquals(200L, params.get(3)); // activityId
  }
}
