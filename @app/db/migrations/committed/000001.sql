--! Previous: -
--! Hash: sha1:a69d64f6bc5f2856945bfb3d3931b7a1790b5046

-- Enter migration here

drop schema if exists app_public cascade;
drop schema if exists app_hidden cascade;
drop schema if exists app_private cascade;

revoke all on schema public from public;

alter default privileges revoke all on sequences from public;
alter default privileges revoke all on functions from public;

grant all on schema public to :DATABASE_OWNER;

create schema app_public;
create schema app_hidden;
create schema app_private;
