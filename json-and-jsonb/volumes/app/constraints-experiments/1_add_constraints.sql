ALTER TABLE company_jsonb
ADD CONSTRAINT check_details_keys
CHECK (
    details ? 'ジャンル' AND
    details ? '店舗数'
);

ALTER TABLE company_jsonb
ADD CONSTRAINT check_store_count
CHECK (
    (details ->> '店舗数')::INT >= 1 AND
    (details ->> '店舗数')::INT <= 500
);

CREATE OR REPLACE FUNCTION validate_jsonb_data()
RETURNS TRIGGER AS $$
BEGIN
    -- 飲食業の場合、'ジャンル', '店舗数', '営業時間' が必要
    IF NEW.industry = '飲食業' THEN
        IF NOT (NEW.details ? 'ジャンル' AND NEW.details ? '店舗数' AND NEW.details ? '営業時間') THEN
            RAISE EXCEPTION 'Invalid JSONB data for 飲食業. 必要なキーが不足しています。';
        END IF;
    END IF;

    -- 製造業の場合、'ジャンル', '工場情報' が必要
    IF NEW.industry = '製造業' THEN
        IF NOT (NEW.details ? 'ジャンル' AND NEW.details ? '工場情報') THEN
            RAISE EXCEPTION 'Invalid JSONB data for 製造業. 必要なキーが不足しています。';
        END IF;
    END IF;

    -- 物流業の場合、'所有トラック台数' が必要
    IF NEW.industry = '物流業' THEN
        IF NOT (NEW.details ? '所有トラック台数') THEN
            RAISE EXCEPTION 'Invalid JSONB data for 物流業. 必要なキーが不足しています。';
        END IF;
    END IF;

    -- 医療の場合、'対応科' が必要
    IF NEW.industry = '医療' THEN
        IF NOT (NEW.details ? '対応科') THEN
            RAISE EXCEPTION 'Invalid JSONB data for 医療. 必要なキーが不足しています。';
        END IF;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_validate_jsonb
BEFORE INSERT OR UPDATE ON company_jsonb
FOR EACH ROW
EXECUTE FUNCTION validate_jsonb_data();
