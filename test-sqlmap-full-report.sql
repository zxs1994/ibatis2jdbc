-- test-sqlmap.xml statement SQL 脚本
-- 资源路径: /sqlmaps/test-sqlmap.xml
-- 用例数: 37
-- 通过: 37
-- 失败: 0

-- statementId: findUsers
-- case: 动态条件命中
-- type: select
-- assertion: 传入动态变量，验证最终 SQL 正常展开
-- params: {
--   "name": "NAME_001",
--   "status": 1,
--   "ids": [
--     "EVENT_A",
--     "EVENT_B"
--   ]
-- }
SELECT id, name FROM users WHERE name = 'NAME_001' AND status = 1 AND id IN ('EVENT_A','EVENT_B');

-- statementId: findUsers
-- case: 可选条件关闭
-- type: select
-- assertion: 移除可选动态属性，观察条件收缩后的 SQL
-- params: {}
SELECT id, name FROM users;

-- statementId: findUsersById
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: 1001
SELECT id, name, status, created_at FROM users where id = 1001;

-- statementId: findUsersByIdMap
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "id": 1001
-- }
SELECT id, name, status, created_at FROM users where id = 1001;

-- statementId: findUsersByIdNumber
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: 1001
SELECT id, name, status, created_at FROM users where id = 1001;

-- statementId: findUsersByNestedBean
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "id": 1001,
--   "status": 1
-- }
SELECT id, name, status FROM users where id = null AND status = null;

-- statementId: findUsersByIdsList
-- case: 动态条件命中
-- type: select
-- assertion: 传入动态变量，验证最终 SQL 正常展开
-- params: {
--   "ids": [
--     "EVENT_A",
--     "EVENT_B"
--   ]
-- }
SELECT id, name, status, created_at FROM users where id IN ('EVENT_A','EVENT_B');

-- statementId: findUsersByIdsList
-- case: 可选条件关闭
-- type: select
-- assertion: 移除可选动态属性，观察条件收缩后的 SQL
-- params: {}
SELECT id, name, status, created_at FROM users where id IN (null);

-- statementId: findUsersByCollectionAlias
-- case: 动态条件命中
-- type: select
-- assertion: 传入动态变量，验证最终 SQL 正常展开
-- params: {
--   "collection": [
--     "EVENT_A",
--     "EVENT_B"
--   ]
-- }
SELECT id, name, status, created_at FROM users where id IN ('EVENT_A','EVENT_B');

-- statementId: findUsersByCollectionAlias
-- case: 可选条件关闭
-- type: select
-- assertion: 移除可选动态属性，观察条件收缩后的 SQL
-- params: {}
SELECT id, name, status, created_at FROM users where id IN (null);

-- statementId: findUsersByArrayAlias
-- case: 动态条件命中
-- type: select
-- assertion: 传入动态变量，验证最终 SQL 正常展开
-- params: [
--   "EVENT_A",
--   "EVENT_B"
-- ]
SELECT id, name, status, created_at FROM users where id IN (null);

-- statementId: findUsersByArrayAlias
-- case: 可选条件关闭
-- type: select
-- assertion: 移除可选动态属性，观察条件收缩后的 SQL
-- params: [
--   "EVENT_A",
--   "EVENT_B"
-- ]
SELECT id, name, status, created_at FROM users where id IN (null);

-- statementId: findUsersByKeyword
-- case: 动态条件命中
-- type: select
-- assertion: 传入动态变量，验证最终 SQL 正常展开
-- params: {
--   "keyword": "VALUE_001",
--   "deleted": "VALUE_001"
-- }
SELECT id, name, status FROM users WHERE (name LIKE '%' || 'VALUE_001' || '%' OR email LIKE '%' || 'VALUE_001' || '%');

-- statementId: findUsersByKeyword
-- case: 可选条件关闭
-- type: select
-- assertion: 移除可选动态属性，观察条件收缩后的 SQL
-- params: {}
SELECT id, name, status FROM users WHERE deleted = 0;

-- statementId: findUserContactById
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "id": 1001
-- }
SELECT name, email FROM users where id = 1001;

-- statementId: findUsersAfter
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "startTime": "2026-05-14 10:00:00"
-- }
SELECT id, name FROM users WHERE created_at >= '2026-05-14 10:00:00';

-- statementId: findWithComments
-- case: 动态条件命中
-- type: select
-- assertion: 传入动态变量，验证最终 SQL 正常展开
-- params: {
--   "name": "NAME_001",
--   "status": 1
-- }
SELECT id, name FROM users WHERE name = 'NAME_001' AND status = 1;

-- statementId: findWithComments
-- case: 可选条件关闭
-- type: select
-- assertion: 移除可选动态属性，观察条件收缩后的 SQL
-- params: {}
SELECT id, name FROM users;

-- statementId: findUsersRawAndSafe
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "status": 1,
--   "orderBy": "order by id desc"
-- }
SELECT id, name, status FROM users WHERE status = 1 ORDER BY order by id desc;

-- statementId: findUsersByInclude
-- case: 无参基础场景
-- type: select
-- assertion: 不传参数，验证固定 SQL 可直接生成
-- params: {}
SELECT id, name, status FROM users WHERE status = null;

-- statementId: findUsersByParameterAlias
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "id": 1001,
--   "status": 1
-- }
SELECT id, name, status FROM users where id = null AND status = null;

-- statementId: findBraceWrapped
-- case: 基础参数命中
-- type: select
-- assertion: 传入基础变量，验证最终 SQL 正常生成
-- params: {
--   "status": 1,
--   "orderBy": "order by id desc"
-- }
SELECT * FROM users WHERE status = 1 ORDER BY order by id desc;

-- statementId: findByUnaryTags
-- case: 动态条件命中
-- type: select
-- assertion: 传入动态变量，验证最终 SQL 正常展开
-- params: {
--   "status": 1,
--   "name": "NAME_001",
--   "deleted": "VALUE_001",
--   "missing": "VALUE_001"
-- }
SELECT * FROM users WHERE status = 1 AND name = 'NAME_001';

-- statementId: findByUnaryTags
-- case: 可选条件关闭
-- type: select
-- assertion: 移除可选动态属性，观察条件收缩后的 SQL
-- params: {}
SELECT * FROM users WHERE deleted IS NULL AND missing_flag = 1;

-- statementId: findByBinaryTags
-- case: 动态条件命中
-- type: select
-- assertion: 传入动态变量，验证最终 SQL 正常展开
-- params: {
--   "type": "VALUE_001",
--   "status": 1,
--   "age": "VALUE_001",
--   "score": "VALUE_001",
--   "rank": "VALUE_001",
--   "level": "VALUE_001"
-- }
SELECT * FROM users WHERE status <> 'DISABLED' AND age > 18 AND score >= 90;

-- statementId: findByBinaryTags
-- case: 可选条件关闭
-- type: select
-- assertion: 移除可选动态属性，观察条件收缩后的 SQL
-- params: {}
SELECT * FROM users WHERE status <> 'DISABLED' AND level <= 3;

-- statementId: findByParameterPresence
-- case: 无参基础场景
-- type: select
-- assertion: 不传参数，验证固定 SQL 可直接生成
-- params: {}
SELECT * FROM users WHERE present_flag = 1;

-- statementId: findByEnumCompare
-- case: 动态条件命中
-- type: select
-- assertion: 传入动态变量，验证最终 SQL 正常展开
-- params: {
--   "priority": "VALUE_001"
-- }
SELECT * FROM users WHERE priority_flag = 1;

-- statementId: findByEnumCompare
-- case: 可选条件关闭
-- type: select
-- assertion: 移除可选动态属性，观察条件收缩后的 SQL
-- params: {}
SELECT * FROM users;

-- statementId: selectUserByResultMap
-- case: 无参基础场景
-- type: select
-- assertion: 不传参数，验证固定 SQL 可直接生成
-- params: {}
SELECT user_id, user_name FROM users;

-- statementId: selectUserByNamespacedResultMap
-- case: 无参基础场景
-- type: select
-- assertion: 不传参数，验证固定 SQL 可直接生成
-- params: {}
SELECT user_id, user_name FROM users;

-- statementId: updateUser
-- case: 动态条件命中
-- type: update
-- assertion: 传入动态变量，验证最终 SQL 正常展开
-- params: {
--   "name": "NAME_001",
--   "status": 1,
--   "email": "VALUE_001",
--   "id": 1001
-- }
UPDATE users SET name = 'NAME_001', status = 1, email = 'VALUE_001' WHERE id = 1001;

-- statementId: updateUser
-- case: 可选条件关闭
-- type: update
-- assertion: 移除可选动态属性，观察条件收缩后的 SQL
-- params: {
--   "id": 1001
-- }
UPDATE users WHERE id = 1001;

-- statementId: deleteUsersByIds
-- case: 动态条件命中
-- type: delete
-- assertion: 传入动态变量，验证最终 SQL 正常展开
-- params: {
--   "ids": [
--     "EVENT_A",
--     "EVENT_B"
--   ]
-- }
DELETE FROM users WHERE id IN ('EVENT_A','EVENT_B');

-- statementId: deleteUsersByIds
-- case: 可选条件关闭
-- type: delete
-- assertion: 移除可选动态属性，观察条件收缩后的 SQL
-- params: {}
DELETE FROM users;

-- statementId: deleteUsersByCodes
-- case: 动态条件命中
-- type: delete
-- assertion: 传入动态变量，验证最终 SQL 正常展开
-- params: {
--   "codes": [
--     "EVENT_A",
--     "EVENT_B"
--   ]
-- }
DELETE FROM users WHERE code IN ('EVENT_A','EVENT_B');

-- statementId: deleteUsersByCodes
-- case: 可选条件关闭
-- type: delete
-- assertion: 移除可选动态属性，观察条件收缩后的 SQL
-- params: {}
DELETE FROM users;

