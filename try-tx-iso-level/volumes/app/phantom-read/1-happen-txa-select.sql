BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED; -- これはPostgresの標準のトランザクションなので、実行しなくても同じ効果となる。ファントムリードを防げない。
SELECT * from doctors;
