--! Previous: sha1:01f47f6a0a2fce479b8854147c1b74717da77b9e
--! Hash: sha1:1578ec7f9c8fbf16a2c1967efb7437db5d8d0815

--! split: 1-current.sql
-- Enter migration here
alter table app_public.person add column updated_at timestamp default now();
alter table app_public.post add column updated_at timestamp default now();

create function app_private.set_updated_at() returns trigger as $$
begin
  new.updated_at := current_timestamp;
  return new;
end;
$$ language plpgsql;

create trigger person_updated_at before update
  on app_public.person
  for each row
  execute procedure app_private.set_updated_at();

create trigger post_updated_at before update
  on app_public.post
  for each row
  execute procedure app_private.set_updated_at();
