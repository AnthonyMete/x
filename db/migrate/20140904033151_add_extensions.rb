class AddExtensions < ActiveRecord::Migration
  def self.up
    ## STABLE
    execute ("CREATE EXTENSION IF NOT EXISTS hstore;")
    execute ("CREATE EXTENSION IF NOT EXISTS postgis;")
    execute ("CREATE EXTENSION IF NOT EXISTS postgis_topology;")
    # INSTALLATION ISSUES WITH POSTGIS_TIGER_GEOCODER, RECOMMENDED TO DO IT PRIOR TO MIGRATION IN PSQL CONSOLE https://github.com/rgeo/activerecord-postgis-adapter/issues/118
    execute ("CREATE EXTENSION IF NOT EXISTS fuzzystrmatch;")
    execute ("CREATE EXTENSION IF NOT EXISTS postgis_tiger_geocoder;")
  end

  def self.down
    # INSTALLATION ISSUES WITH POSTGIS_TIGER_GEOCODER https://github.com/rgeo/activerecord-postgis-adapter/issues/118
    execute ("DROP EXTENSION IF EXISTS postgis_tiger_geocoder CASCADE;")
    execute ("DROP EXTENSION IF EXISTS fuzzystrmatch CASCADE;")
    ## STABLE
    execute ("DROP EXTENSION IF EXISTS postgis_topology CASCADE;")
    execute ("DROP EXTENSION IF EXISTS postgis CASCADE;")
    execute ("DROP EXTENSION IF EXISTS hstore CASCADE;")
  end
end
