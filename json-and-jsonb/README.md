DockerでPostgresのサーバとクライアントを作成して、様々な実験を行うリポジトリ。

参考

[オープンソースデータベース標準教科書v3.0.2](https://oss-db.jp/ossdbtext)

# 標準教科書との差分

* 教科書ではDockerを使用していないが、本リポジトリでは使用する。（OSの種類も変わる）
* 教科書ではPostgreSQLはv13を使用しているが、本リポジトリではv18.4を使用する。

# よく使うコマンド

Postgresのクライアントのコンテナからサーバのコンテナに接続するコマンド

```bash
psql -h 192.168.1.11 -U user1 -d ossdb
```

# サンプルデータ

上記コマンドを起動した後に、流し込むと良いです。

```sql
CREATE TABLE prod
(prod_id   integer,
 prod_name text,
 price     integer);

CREATE TABLE customer
 (customer_id   integer,
 customer_name text);

CREATE TABLE orders
 (order_id    integer,
 order_date  timestamp,
 customer_id integer,
 prod_id     integer,
 qty         integer);


INSERT INTO customer(customer_id,customer_name) VALUES
 (1,'佐藤商事'),
 (2,'鈴木物産'),
 (3,'高橋商店');

INSERT INTO prod(prod_id,prod_name,price) VALUES
(1,'みかん',50),
 (2,'りんご',70),
 (3,'メロン',100);

INSERT INTO orders(order_id,order_date,customer_id,prod_id,qty) VALUES (1,CURRENT_TIMESTAMP,1,1,10);
INSERT INTO orders(order_id,order_date,customer_id,prod_id,qty) VALUES (2,CURRENT_TIMESTAMP,2,2,5);
INSERT INTO orders(order_id,order_date,customer_id,prod_id,qty) VALUES (3,CURRENT_TIMESTAMP,3,3,8);
INSERT INTO orders(order_id,order_date,customer_id,prod_id,qty) VALUES (4,CURRENT_TIMESTAMP,2,1,3);
INSERT INTO orders(order_id,order_date,customer_id,prod_id,qty) VALUES (5,CURRENT_TIMESTAMP,3,2,4);
```
SELECT * FROM customer WHERE customer_id = 1 OR customer_id = 2;

Toru Miyahara. Opensource Database Standard Textbook PostgreSQL: Useful for Studying for the OSS-DB Certification Exam (Japanese Edition) (p. 39). (Function). Kindle Edition. 

SELECT * FROM customer WHERE customer_id = 1 OR customer_id = 2;

SELECT * FROM customer WHERE customer_id = 1 OR customer_id =

Toru Miyahara. Opensource Database Standard Textbook PostgreSQL: Useful for Studying for the OSS-DB Certification Exam (Japanese Edition) (p. 39). (Function). Kindle Edition. 