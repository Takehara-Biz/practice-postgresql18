ALTER TABLE company_jsonb DROP CONSTRAINT check_details_keys;
ALTER TABLE company_jsonb DROP CONSTRAINT check_store_count;
DROP TRIGGER trigger_validate_jsonb ON company_jsonb;
