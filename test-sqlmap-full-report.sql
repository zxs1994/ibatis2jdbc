-- test-sqlmap.xml statement SQL 脚本
-- 资源路径: src/test/resources/sqlmaps/test-sqlmap.xml
-- 用例数: 70
-- 通过: 66
-- 失败: 4

-- statementId: findUsers
-- case: 动态分支|有name|有status|无ids#0
-- type: select
-- assertion: 参数分支：name=有值;status=有值;ids=空;
-- params: {
--   "name": "NAME_001",
--   "status": 1,
--   "ids": []
-- }
SELECT id, name FROM users WHERE name = 'NAME_001' AND status = 1;

-- statementId: findUsers
-- case: 动态分支|有name|有status|有ids#1
-- type: select
-- assertion: 参数分支：name=有值;status=有值;ids=有值;
-- params: {
--   "name": "NAME_001",
--   "status": 1,
--   "ids": [
--     "EVENT_A",
--     "EVENT_B"
--   ]
-- }
SELECT id, name FROM users WHERE name = 'NAME_001' AND status = 1 AND id IN ('EVENT_A','EVENT_B');

-- statementId: user.findUsers
-- case: 动态分支|有name|有status|无ids#0
-- type: select
-- assertion: 参数分支：name=有值;status=有值;ids=空;
-- params: {
--   "name": "NAME_001",
--   "status": 1,
--   "ids": []
-- }
SELECT id, name FROM users WHERE name = 'NAME_001' AND status = 1;

-- statementId: user.findUsers
-- case: 动态分支|有name|有status|有ids#1
-- type: select
-- assertion: 参数分支：name=有值;status=有值;ids=有值;
-- params: {
--   "name": "NAME_001",
--   "status": 1,
--   "ids": [
--     "EVENT_A",
--     "EVENT_B"
--   ]
-- }
SELECT id, name FROM users WHERE name = 'NAME_001' AND status = 1 AND id IN ('EVENT_A','EVENT_B');

-- statementId: findUsersById
-- case: 标量基础执行
-- type: select
-- assertion: 标量参数主路径
-- params: "VALUE_001"
SELECT id, name, status, created_at FROM users where id = 'VALUE_001';

-- statementId: findUsersById
-- case: 标量变体执行
-- type: select
-- assertion: 标量参数变体
-- params: "VALUE_002"
SELECT id, name, status, created_at FROM users where id = 'VALUE_002';

-- statementId: user.findUsersById
-- case: 标量基础执行
-- type: select
-- assertion: 标量参数主路径
-- params: "VALUE_001"
SELECT id, name, status, created_at FROM users where id = 'VALUE_001';

-- statementId: user.findUsersById
-- case: 标量变体执行
-- type: select
-- assertion: 标量参数变体
-- params: "VALUE_002"
SELECT id, name, status, created_at FROM users where id = 'VALUE_002';

-- statementId: findUsersByIdMap
-- case: 动态分支|有id#0
-- type: select
-- assertion: 参数分支：id=有值;
-- params: {
--   "id": 1001
-- }
SELECT id, name, status, created_at FROM users where id = 1001;

-- statementId: user.findUsersByIdMap
-- case: 动态分支|有id#0
-- type: select
-- assertion: 参数分支：id=有值;
-- params: {
--   "id": 1001
-- }
SELECT id, name, status, created_at FROM users where id = 1001;

-- statementId: findUsersByIdNumber
-- case: 标量基础执行
-- type: select
-- assertion: 标量参数主路径
-- params: 1001
SELECT id, name, status, created_at FROM users where id = 1001;

-- statementId: findUsersByIdNumber
-- case: 标量变体执行
-- type: select
-- assertion: 标量参数变体
-- params: 2002
SELECT id, name, status, created_at FROM users where id = 2002;

-- statementId: user.findUsersByIdNumber
-- case: 标量基础执行
-- type: select
-- assertion: 标量参数主路径
-- params: 1001
SELECT id, name, status, created_at FROM users where id = 1001;

-- statementId: user.findUsersByIdNumber
-- case: 标量变体执行
-- type: select
-- assertion: 标量参数变体
-- params: 2002
SELECT id, name, status, created_at FROM users where id = 2002;

-- statementId: findUsersByNestedBean
-- case: 动态分支|有id|有status#0
-- type: select
-- assertion: 参数分支：id=有值;status=有值;
-- params: {
--   "id": 1001,
--   "status": 1
-- }
SELECT id, name, status FROM users where id = null AND status = null;

-- statementId: user.findUsersByNestedBean
-- case: 动态分支|有id|有status#0
-- type: select
-- assertion: 参数分支：id=有值;status=有值;
-- params: {
--   "id": 1001,
--   "status": 1
-- }
SELECT id, name, status FROM users where id = null AND status = null;

-- statementId: findUsersByIdsList
-- case: 动态分支|无ids#0
-- type: select
-- assertion: 参数分支：ids=空;
-- params: {
--   "ids": []
-- }
SELECT id, name, status, created_at FROM users where id IN (null);

-- statementId: findUsersByIdsList
-- case: 动态分支|有ids#1
-- type: select
-- assertion: 参数分支：ids=有值;
-- params: {
--   "ids": [
--     "EVENT_A",
--     "EVENT_B"
--   ]
-- }
SELECT id, name, status, created_at FROM users where id IN ('EVENT_A','EVENT_B');

-- statementId: user.findUsersByIdsList
-- case: 动态分支|无ids#0
-- type: select
-- assertion: 参数分支：ids=空;
-- params: {
--   "ids": []
-- }
SELECT id, name, status, created_at FROM users where id IN (null);

-- statementId: user.findUsersByIdsList
-- case: 动态分支|有ids#1
-- type: select
-- assertion: 参数分支：ids=有值;
-- params: {
--   "ids": [
--     "EVENT_A",
--     "EVENT_B"
--   ]
-- }
SELECT id, name, status, created_at FROM users where id IN ('EVENT_A','EVENT_B');

-- statementId: findUsersByCollectionAlias
-- case: 动态分支|无collection#0
-- type: select
-- assertion: 参数分支：collection=空;
-- params: {
--   "collection": []
-- }
SELECT id, name, status, created_at FROM users where id IN (null);

-- statementId: findUsersByCollectionAlias
-- case: 动态分支|有collection#1
-- type: select
-- assertion: 参数分支：collection=有值;
-- params: {
--   "collection": [
--     "EVENT_A",
--     "EVENT_B"
--   ]
-- }
SELECT id, name, status, created_at FROM users where id IN ('EVENT_A','EVENT_B');

-- statementId: user.findUsersByCollectionAlias
-- case: 动态分支|无collection#0
-- type: select
-- assertion: 参数分支：collection=空;
-- params: {
--   "collection": []
-- }
SELECT id, name, status, created_at FROM users where id IN (null);

-- statementId: user.findUsersByCollectionAlias
-- case: 动态分支|有collection#1
-- type: select
-- assertion: 参数分支：collection=有值;
-- params: {
--   "collection": [
--     "EVENT_A",
--     "EVENT_B"
--   ]
-- }
SELECT id, name, status, created_at FROM users where id IN ('EVENT_A','EVENT_B');

-- statementId: findUsersByArrayAlias
-- case: 动态分支|无array#0
-- type: select
-- assertion: 参数分支：array=空;
-- params: {
--   "array": []
-- }
SELECT id, name, status, created_at FROM users where id IN (null);

-- statementId: findUsersByArrayAlias
-- case: 动态分支|有array#1
-- type: select
-- assertion: 参数分支：array=有值;
-- params: {
--   "array": [
--     "EVENT_A",
--     "EVENT_B"
--   ]
-- }
SELECT id, name, status, created_at FROM users where id IN ('EVENT_A','EVENT_B');

-- statementId: user.findUsersByArrayAlias
-- case: 动态分支|无array#0
-- type: select
-- assertion: 参数分支：array=空;
-- params: {
--   "array": []
-- }
SELECT id, name, status, created_at FROM users where id IN (null);

-- statementId: user.findUsersByArrayAlias
-- case: 动态分支|有array#1
-- type: select
-- assertion: 参数分支：array=有值;
-- params: {
--   "array": [
--     "EVENT_A",
--     "EVENT_B"
--   ]
-- }
SELECT id, name, status, created_at FROM users where id IN ('EVENT_A','EVENT_B');

-- statementId: findUsersByKeyword
-- case: 动态分支|有keyword#0
-- type: select
-- assertion: 参数分支：keyword=有值;
-- params: {
--   "keyword": "VALUE_001"
-- }
SELECT id, name, status FROM users WHERE (name LIKE '%' || 'VALUE_001' || '%' OR email LIKE '%' || 'VALUE_001' || '%') AND deleted = 0;

-- statementId: user.findUsersByKeyword
-- case: 动态分支|有keyword#0
-- type: select
-- assertion: 参数分支：keyword=有值;
-- params: {
--   "keyword": "VALUE_001"
-- }
SELECT id, name, status FROM users WHERE (name LIKE '%' || 'VALUE_001' || '%' OR email LIKE '%' || 'VALUE_001' || '%') AND deleted = 0;

-- statementId: findUserContactById
-- case: 动态分支|有id#0
-- type: select
-- assertion: 参数分支：id=有值;
-- params: {
--   "id": 1001
-- }
SELECT name, email FROM users where id = 1001;

-- statementId: user.findUserContactById
-- case: 动态分支|有id#0
-- type: select
-- assertion: 参数分支：id=有值;
-- params: {
--   "id": 1001
-- }
SELECT name, email FROM users where id = 1001;

-- statementId: findUsersAfter
-- case: 动态分支|有startTime#0
-- type: select
-- assertion: 参数分支：startTime=有值;
-- params: {
--   "startTime": "2026-05-14 10:00:00"
-- }
SELECT id, name FROM users WHERE created_at >= '2026-05-14 10:00:00';

-- statementId: user.findUsersAfter
-- case: 动态分支|有startTime#0
-- type: select
-- assertion: 参数分支：startTime=有值;
-- params: {
--   "startTime": "2026-05-14 10:00:00"
-- }
SELECT id, name FROM users WHERE created_at >= '2026-05-14 10:00:00';

-- statementId: findWithComments
-- case: 动态分支|有name|有status#0
-- type: select
-- assertion: 参数分支：name=有值;status=有值;
-- params: {
--   "name": "NAME_001",
--   "status": 1
-- }
SELECT id, name FROM users WHERE name = 'NAME_001' AND status = 1;

-- statementId: user.findWithComments
-- case: 动态分支|有name|有status#0
-- type: select
-- assertion: 参数分支：name=有值;status=有值;
-- params: {
--   "name": "NAME_001",
--   "status": 1
-- }
SELECT id, name FROM users WHERE name = 'NAME_001' AND status = 1;

-- statementId: findUsersRawAndSafe
-- case: 动态分支|有status|有orderBy#0
-- type: select
-- assertion: 参数分支：status=有值;orderBy=有值;
-- params: {
--   "status": 1,
--   "orderBy": "order by id desc"
-- }
SELECT id, name, status FROM users WHERE status = 1 ORDER BY order by id desc;

-- statementId: user.findUsersRawAndSafe
-- case: 动态分支|有status|有orderBy#0
-- type: select
-- assertion: 参数分支：status=有值;orderBy=有值;
-- params: {
--   "status": 1,
--   "orderBy": "order by id desc"
-- }
SELECT id, name, status FROM users WHERE status = 1 ORDER BY order by id desc;

-- statementId: findUsersByInclude
-- case: 动态分支#0
-- type: select
-- assertion: 参数分支：
-- params: {}
SELECT id, name, status FROM users WHERE status = null;

-- statementId: user.findUsersByInclude
-- case: 动态分支#0
-- type: select
-- assertion: 参数分支：
-- params: {}
SELECT id, name, status FROM users WHERE status = null;

-- statementId: findUsersByParameterAlias
-- case: 动态分支|有id|有status#0
-- type: select
-- assertion: 参数分支：id=有值;status=有值;
-- params: {
--   "id": 1001,
--   "status": 1
-- }
SELECT id, name, status FROM users where id = null AND status = null;

-- statementId: user.findUsersByParameterAlias
-- case: 动态分支|有id|有status#0
-- type: select
-- assertion: 参数分支：id=有值;status=有值;
-- params: {
--   "id": 1001,
--   "status": 1
-- }
SELECT id, name, status FROM users where id = null AND status = null;

-- statementId: findBraceWrapped
-- case: 动态分支|有status|有orderBy#0
-- type: select
-- assertion: 参数分支：status=有值;orderBy=有值;
-- params: {
--   "status": 1,
--   "orderBy": "order by id desc"
-- }
SELECT * FROM users WHERE status = 1 ORDER BY order by id desc;

-- statementId: user.findBraceWrapped
-- case: 动态分支|有status|有orderBy#0
-- type: select
-- assertion: 参数分支：status=有值;orderBy=有值;
-- params: {
--   "status": 1,
--   "orderBy": "order by id desc"
-- }
SELECT * FROM users WHERE status = 1 ORDER BY order by id desc;

-- statementId: findByUnaryTags
-- case: 动态分支|有status|有name#0
-- type: select
-- assertion: 参数分支：status=有值;name=有值;
-- params: {
--   "status": 1,
--   "name": "NAME_001"
-- }
SELECT * FROM users WHERE deleted IS NULL AND status = 1 AND name = 'NAME_001' AND missing_flag = 1;

-- statementId: user.findByUnaryTags
-- case: 动态分支|有status|有name#0
-- type: select
-- assertion: 参数分支：status=有值;name=有值;
-- params: {
--   "status": 1,
--   "name": "NAME_001"
-- }
SELECT * FROM users WHERE deleted IS NULL AND status = 1 AND name = 'NAME_001' AND missing_flag = 1;

-- statementId: findByBinaryTags
-- case: 动态分支#0
-- type: select
-- assertion: 参数分支：
-- params: {}
SELECT * FROM users WHERE status <> 'DISABLED' AND level <= 3;

-- statementId: user.findByBinaryTags
-- case: 动态分支#0
-- type: select
-- assertion: 参数分支：
-- params: {}
SELECT * FROM users WHERE status <> 'DISABLED' AND level <= 3;

-- statementId: findByParameterPresence
-- case: 动态分支#0
-- type: select
-- assertion: 参数分支：
-- params: {}
SELECT * FROM users WHERE present_flag = 1;

-- statementId: user.findByParameterPresence
-- case: 动态分支#0
-- type: select
-- assertion: 参数分支：
-- params: {}
SELECT * FROM users WHERE present_flag = 1;

-- statementId: findByEnumCompare
-- case: 动态分支#0
-- type: select
-- assertion: 参数分支：
-- params: {}
SELECT * FROM users;

-- statementId: user.findByEnumCompare
-- case: 动态分支#0
-- type: select
-- assertion: 参数分支：
-- params: {}
SELECT * FROM users;

-- statementId: selectUserByResultMap
-- case: 动态分支#0
-- type: select
-- assertion: 参数分支：
-- params: {}
SELECT user_id, user_name FROM users;

-- statementId: user.selectUserByResultMap
-- case: 动态分支#0
-- type: select
-- assertion: 参数分支：
-- params: {}
SELECT user_id, user_name FROM users;

-- statementId: selectUserByNamespacedResultMap
-- case: 动态分支#0
-- type: select
-- assertion: 参数分支：
-- params: {}
SELECT user_id, user_name FROM users;

-- statementId: user.selectUserByNamespacedResultMap
-- case: 动态分支#0
-- type: select
-- assertion: 参数分支：
-- params: {}
SELECT user_id, user_name FROM users;

-- statementId: updateUser
-- case: 动态分支|有name|有status|有email|有id#0
-- type: update
-- assertion: 参数分支：name=有值;status=有值;email=有值;id=有值;
-- params: {
--   "name": "NAME_001",
--   "status": 1,
--   "email": "VALUE_001",
--   "id": 1001
-- }
UPDATE users SET name = 'NAME_001', status = 1, email = 'VALUE_001' WHERE id = 1001;

-- statementId: user.updateUser
-- case: 动态分支|有name|有status|有email|有id#0
-- type: update
-- assertion: 参数分支：name=有值;status=有值;email=有值;id=有值;
-- params: {
--   "name": "NAME_001",
--   "status": 1,
--   "email": "VALUE_001",
--   "id": 1001
-- }
UPDATE users SET name = 'NAME_001', status = 1, email = 'VALUE_001' WHERE id = 1001;

-- statementId: deleteUsersByIds
-- case: 动态分支|无ids#0
-- type: delete
-- assertion: 参数分支：ids=空;
-- params: {
--   "ids": []
-- }
DELETE FROM users;

-- statementId: deleteUsersByIds
-- case: 动态分支|有ids#1
-- type: delete
-- assertion: 参数分支：ids=有值;
-- params: {
--   "ids": [
--     "EVENT_A",
--     "EVENT_B"
--   ]
-- }
DELETE FROM users WHERE id IN ('EVENT_A','EVENT_B');

-- statementId: user.deleteUsersByIds
-- case: 动态分支|无ids#0
-- type: delete
-- assertion: 参数分支：ids=空;
-- params: {
--   "ids": []
-- }
DELETE FROM users;

-- statementId: user.deleteUsersByIds
-- case: 动态分支|有ids#1
-- type: delete
-- assertion: 参数分支：ids=有值;
-- params: {
--   "ids": [
--     "EVENT_A",
--     "EVENT_B"
--   ]
-- }
DELETE FROM users WHERE id IN ('EVENT_A','EVENT_B');

-- statementId: deleteUsersByCodes
-- case: 动态分支|无codes#0
-- type: delete
-- assertion: 参数分支：codes=空;
-- params: {
--   "codes": []
-- }
DELETE FROM users;

-- statementId: deleteUsersByCodes
-- case: 动态分支|有codes#1
-- type: delete
-- assertion: 参数分支：codes=有值;
-- params: {
--   "codes": [
--     "EVENT_A",
--     "EVENT_B"
--   ]
-- }
DELETE FROM users WHERE code IN ('EVENT_A','EVENT_B');

-- statementId: user.deleteUsersByCodes
-- case: 动态分支|无codes#0
-- type: delete
-- assertion: 参数分支：codes=空;
-- params: {
--   "codes": []
-- }
DELETE FROM users;

-- statementId: user.deleteUsersByCodes
-- case: 动态分支|有codes#1
-- type: delete
-- assertion: 参数分支：codes=有值;
-- params: {
--   "codes": [
--     "EVENT_A",
--     "EVENT_B"
--   ]
-- }
DELETE FROM users WHERE code IN ('EVENT_A','EVENT_B');

-- statementId: brokenInclude
-- case: 动态分支#0
-- type: select
-- assertion: 参数分支：
-- params: {}
-- error: java.lang.IllegalStateException: Failed to convert iBatis XML

-- statementId: user.brokenInclude
-- case: 动态分支#0
-- type: select
-- assertion: 参数分支：
-- params: {}
-- error: java.lang.IllegalStateException: Failed to convert iBatis XML

-- statementId: brokenResultMap
-- case: 动态分支#0
-- type: select
-- assertion: 参数分支：
-- params: {}
-- error: java.lang.IllegalStateException: Failed to convert iBatis XML

-- statementId: user.brokenResultMap
-- case: 动态分支#0
-- type: select
-- assertion: 参数分支：
-- params: {}
-- error: java.lang.IllegalStateException: Failed to convert iBatis XML

