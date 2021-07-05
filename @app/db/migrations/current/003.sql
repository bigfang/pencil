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
