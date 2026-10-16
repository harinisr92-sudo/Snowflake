create database table_types;

create schema table_type_sch;

create or replace storage integration s3_snow_int
type = external_stage
storage_provider = s3
enabled = true
storage_aws_role_arn = 'arn:aws:iam::234329974511:role/snw_role'
storage_allowed_locations = ('s3://aws-s3-snw-bucket/CSV/');


describe integration s3_snow_int

arn:aws:iam::635176221661:user/rmea2000-s

JQ61816_SFCRole=6_5P4SfWuC5Z4fAG6rum/hMJQXI4g=


create or replace file format csv_format
    type = csv
    field_delimiter = ','
    skip_header = 1
    null_if = ('NULL', 'null')
    empty_field_as_null = true
    FIELD_OPTIONALLY_ENCLOSED_BY = '"'
    DATE_FORMAT = 'DD-MM-YYYY';

create or replace stage ext_csv_stage
    URL = 's3://aws-s3-snw-bucket/CSV/'
    STORAGE_INTEGRATION = s3_snow_int
    file_format = csv_format;

    LIST @ext_csv_stage;

    SELECT $1,$2,$3 FROM @ext_csv_stage;


CREATE OR REPLACE EXTERNAL TABLE ext_customer
WITH LOCATION =@ext_csv_stage
FILE_FORMAT = csv_format
REFRESH_ON_CREATE = TRUE

select * from ext_customer;

Select $1:c1, $1:c2, $1:c3, $1:c4,$1:c5,$1:c10 from ext_customer ;

CREATE OR REPLACE EXTERNAL TABLE ext_col_customer (
    CUSTOMER_ID varchar AS (value:c1::varchar),
    FIRST_NAME varchar AS (value:c2::varchar),
    LAST_NAME varchar AS (value:c3::varchar),
    EMAIL varchar AS (value:c4::varchar),
    PHONE varchar AS (value:c5::varchar),
    GENDER varchar AS (value:c6::varchar),
    AGE number AS (value:c7::number),
    CITY varchar AS (value:c8::varchar),
    COUNTRY varchar AS (value:c9::varchar),
    REGISTRATION_DATE date AS TO_DATE(value:c10::varchar,'DD-MM-YYYY'),
    CUSTOMER_SEGMENT varchar AS (value:c11::varchar),
    ACCOUNT_STATUS varchar AS (value:c12::varchar),
    TOTAL_ORDERS number AS (value:c13::number),
    LIFETIME_VALUE number AS (value:c14::number)
)
LOCATION=@ext_csv_stage
FILE_FORMAT=csv_format
PATTERN='.*customer.*[.]csv'
REFRESH_ON_CREATE=TRUE;

SELECT * FROM ext_col_customer;


ALTER EXTERNAL TABLE ext_col_customer refresh;