--! Previous: sha1:cf883edc9b91794eefba0e02a87a61c8e780a18d
--! Hash: sha1:aa7a3f73891b25b6eb8e287a079457e4c8c98118

--! split: 001.sql
-- Enter migration here

create table app_public.person (
  id               serial primary key,
  first_name        text not null check (char_length(first_name) < 80),
  last_name        text check (char_length(last_name) < 80),
  about            text,
  created_at       timestamp default now()
);

comment on table app_public.person is 'A user of the forum.';
comment on column app_public.person.id is 'The primary unique identifier for the person.';
comment on column app_public.person.first_name is 'The person’s first name.';
comment on column app_public.person.last_name is 'The person’s last name.';
comment on column app_public.person.about is 'A short description about the user, written by the user.';
comment on column app_public.person.created_at is 'The time this person was created.';

--! split: 002.sql
-- Enter migration here

create type app_public.post_topic as enum (
  'discussion',
  'inspiration',
  'help',
  'showcase'
);

--! split: 003.sql
-- Enter migration here

create table app_public.post (
  id               serial primary key,
  author_id        integer not null references app_public.person(id),
  headline         text not null check (char_length(headline) < 280),
  body             text,
  topic            app_public.post_topic,
  created_at       timestamp default now()
);

comment on table app_public.post is 'A forum post written by a user.';
comment on column app_public.post.id is 'The primary key for the post.';
comment on column app_public.post.headline is 'The title written by the user.';
comment on column app_public.post.author_id is 'The id of the author user.';
comment on column app_public.post.topic is 'The topic this has been posted in.';
comment on column app_public.post.body is 'The main body text of our post.';
comment on column app_public.post.created_at is 'The time this post was created.';
