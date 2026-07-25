-- このSQLは制約違反で失敗するはず。制約が正しくかかっていることを確認するためのSQL。

INSERT INTO company_jsonb (company_name, prefecture, industry, details)
VALUES (
    'Test Company',
    'Tokyo',
    '飲食業',
    '{"ジャンル": "和食", "店舗数": 10}'::jsonb -- '営業時間' が不足
);

INSERT INTO company_jsonb (company_name, prefecture, industry, details)
VALUES (
    'Test Company',
    'Tokyo',
    '飲食業',
    '{"店舗数": 10, "営業時間": "24時間"}'::jsonb -- 'ジャンル' が不足
);

INSERT INTO company_jsonb (company_name, prefecture, industry, details)
VALUES (
    'Test Company',
    'Tokyo',
    '飲食業',
    '{"ジャンル": "和食", "店舗数": 501, "営業時間": "24時間"}'::jsonb -- '店舗数' が最大値500を超えている
);

INSERT INTO company_jsonb (company_name, prefecture, industry, details)
VALUES (
    'Test Company',
    'Tokyo',
    '物流業',
    '{"店舗数": 10, "店舗数": 10, "営業時間": "24時間"}'::jsonb -- '所有トラック台数' が不足
);