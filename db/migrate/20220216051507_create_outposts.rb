class CreateOutposts < ActiveRecord::Migration[5.2]
  def change
    create_table :outposts do |t|
      t.text :content

      t.timestamps
    end
  end
end
