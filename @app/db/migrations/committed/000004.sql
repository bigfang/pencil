--! Previous: sha1:aa7a3f73891b25b6eb8e287a079457e4c8c98118
--! Hash: sha1:01f47f6a0a2fce479b8854147c1b74717da77b9e

--! split: 1-current.sql
-- Enter migration here

create function app_public.person_full_name(person app_public.person) returns text as $$
  select person.first_name || ' ' || person.last_name
$$ language sql stable;

comment on function app_public.person_full_name(app_public.person) is 'A person’s full name which is a concatenation of their first and last name.';

--! split: 2-current.sql
create function app_public.post_summary(
  post app_public.post,
  length int default 50,
  omission text default '…'
) returns text as $$
  select case
    when post.body is null then null
    else substr(post.body, 0, length) || omission
  end
$$ language sql stable;

comment on function app_public.post_summary(app_public.post, int, text) is 'A truncated version of the body for summaries.';

--! split: 3-current.sql
create function app_public.person_latest_post(person app_public.person) returns app_public.post as $$
  select post.*
  from app_public.post as post
  where post.author_id = person.id
  order by created_at desc
  limit 1
$$ language sql stable;

comment on function app_public.person_latest_post(app_public.person) is 'Get’s the latest post written by the person.';

--! split: 4-current.sql
create function app_public.search_posts(search text) returns setof app_public.post as $$
  select post.*
  from app_public.post as post
  where position(search in post.headline) > 0 or position(search in post.body) > 0
$$ language sql stable;

comment on function app_public.search_posts(text) is 'Returns posts containing a given search term.';
