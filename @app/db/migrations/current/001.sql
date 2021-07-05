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
