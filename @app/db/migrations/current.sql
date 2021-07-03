-- Enter migration here

grant usage on schema public, app_public, app_hidden to :DATABASE_VISITOR;

alter default privileges in schema public, app_public, app_hidden
  grant usage, select on sequences to :DATABASE_VISITOR;

alter default privileges in schema public, app_public, app_hidden
  grant execute on functions to :DATABASE_VISITOR;