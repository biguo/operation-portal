class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.string :aim
      t.text :content
      t.text :report

      t.timestamps
    end
  end
end
