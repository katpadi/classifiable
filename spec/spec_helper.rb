$LOAD_PATH << File.join(File.dirname(__FILE__), '..', 'lib')
require 'mysql2'
require 'classifiable'

ActiveRecord::Base.establish_connection(adapter: "mysql2", 
                                        database: "classifiable_test")

ActiveRecord::Schema.define(:version => 1) do
  create_table :classifiables_classifications do |t|
    t.references :classification
    t.references :classifiable, polymorphic: true
  end unless table_exists? :classifiables_classifications

  create_table :classifications do |t|
    t.string :name, :string, limit: 50
    t.string :status, null: false, default: 'draft', limit: 50
    t.timestamps null: true
  end unless table_exists? :classifications

  create_table :sample_ones do |t|
    t.string :name
  end unless table_exists? :sample_ones

  create_table :sample_twos do |t|
    t.string :name
  end unless table_exists? :sample_twos

  create_table :boring_classes do |t|
    t.string :name
  end unless table_exists? :boring_classes
end 


class SampleOne < ActiveRecord::Base
  classifiable
end

class SampleTwo < ActiveRecord::Base
  classifiable
end

class BoringClass
  def self.hello
    'hello world'
  end
end

def clean_database
  ActiveRecord::Base.connection.execute "TRUNCATE classifications"
  # ActiveRecord::Base.connection.execute "TRUNCATE classifiables_classifications"
  # ActiveRecord::Base.connection.execute "TRUNCATE sample_ones"
  # ActiveRecord::Base.connection.execute "TRUNCATE sample_twos"
end