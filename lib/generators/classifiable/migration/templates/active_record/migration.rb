class ClassifiableGeneratedMigration < ActiveRecord::Migration
  def self.up
    create_table :classifiables_classifications do |t|
      # This is essentially "belongs_to" as well
      t.references :classification
      t.references :classifiable, polymorphic: true
    end

    create_table :classifications do |t|
      t.string :name, :string, limit: 50
      t.string :status, null: false, default: 'draft', limit: 50
      t.timestamps
    end
    # add_index :classifiables_classifications, [:classification_id, :classifiable_id, :classifiable_type]
  end

  def self.down
    drop_table :classifiables_classifications
    drop_table :classifications
  end
end