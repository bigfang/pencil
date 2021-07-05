--! Previous: sha1:a69d64f6bc5f2856945bfb3d3931b7a1790b5046
--! Hash: sha1:cf883edc9b91794eefba0e02a87a61c8e780a18d

-- Enter migration here

grant usage on schema public, app_public, app_hidden to :DATABASE_VISITOR;

alter default privileges in schema public, app_public, app_hidden
  grant usage, select on sequences to :DATABASE_VISITOR;

alter default privileges in schema public, app_public, app_hidden
  grant execute on functions to :DATABASE_VISITOR;
