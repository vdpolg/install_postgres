create user apadm;
create user epsap NOSUPERUSER NOCREATEDB NOCREATEROLE ;;

alter user apadm with password '111111';
alter user epsap with password '111111';


CREATE DATABASE ifx_db WITH OWNER = apadm ENCODING = 'UTF8' CONNECTION LIMIT = -1;
