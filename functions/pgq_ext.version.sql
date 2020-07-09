
create or replace function pgq_ext.version()
returns text as $$
-- ----------------------------------------------------------------------
-- Function: pgq_ext.version(0)
--
--      Returns version string for pgq_ext.
-- ----------------------------------------------------------------------
declare
    _vers text;
begin
    select extversion from pg_catalog.pg_extension
        where extname = 'pgq_ext' into _vers;
    return _vers;
end;
$$ language plpgsql;

