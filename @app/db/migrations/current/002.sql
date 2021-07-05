-- Enter migration here

create type app_public.post_topic as enum (
  'discussion',
  'inspiration',
  'help',
  'showcase'
);
