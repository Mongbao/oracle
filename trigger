--INSERT TRIGGER
CREATE OR REPLACE TRIGGER "INS_<TABLE_NAME>" 
AFTER INSERT ON "<TABLE_NAME>"
FOR EACH ROW
DECLARE
  V_ERRNO     INTEGER;
  V_ERRMSG    VARCHAR2(200);
BEGIN
  ...
EXCEPTION
  WHEN OTHERS THEN
    V_ERRNO := -20002;
    V_ERRMSG := '<錯誤訊息>';
    RAISE_APPLICATION_ERROR(V_ERRNO, V_ERRMSG);
END;

--UPDATE TRIGGER
CREATE OR REPLACE TRIGGER "UPD_<TABLE_NAME>"
BEFORE UPDATE OF "<COLUMN>","<COLUMN2>",...ON "<TABLE_NAME>"
FOR EACH ROW
DECLARE
  V_ERRNO     INTEGER;
  V_ERRMSG    VARCHAR2(200);
BEGIN
  ...
EXCEPTION
  WHEN OTHERS THEN
    V_ERRNO := -20002;
    V_ERMSG := '<錯誤訊息>';
    RAISE_APPLICATION_ERROR( V_ERRNO, V_ERRMSG );
END;

--DELETE TRIGGER
CREATE OR REPLACE TRIGGER "DEL_<TABLE_NAME>"
BEFORE DELETE ON "<TABLE_NAME>"
FOR EACH ROW
DECLARE
  V_ERRNO     INTEGER;
  V_ERRMSG    VARCHAR2(200);
EXCEPTION
  WHEN OTHERS THEN
    V_ERRNO := -20002;
    V_ERRMSG := '<錯誤訊息>';
    RAISE_APPLICATION_ERROR( V_ERRNO, V_ERRMSG );
END;

--INSERT/UPDATE/DELETE TRIGGER
CREATE OR REPLACE TRIGGER "IUD_<TABLE_NAME>" 
BEFORE INSERT OR DELETE OR UPDATE [OF "<UPDATE_COLUMN>"] ON "<TABLE_NAME>"
FOR EACH ROW
DECLARE
  V_ERRNO     INTEGER;
  V_ERRMSG    VARCHAR2(200);
BEGIN
  IF INSERTING THEN
    --只能用:NWE.<COLUMN_NAME>運作
  ELSIF UPDATING THEN
    --可以使用 :NEW.<COLUMN_NAME> / :OLD.<COLUMN_NAME>運作
  ELSIF DELETING THEN
    --只能使用 :OLD.<COLUMN_NAME>運作
  END IF;

EXCEPTION
  WHEN OTHERS THEN
    V_ERRNO := -20002;
    V_ERRMSG := '<錯誤訊息>';
    RAISE_APPLICATION_ERROR( V_ERRNO, V_ERRMSG );
END;
