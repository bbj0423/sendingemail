class CreateLetters < ActiveRecord::Migration
  def change
    create_table:letters do |t|
      t.string'title'
      t.string'email'
      t.string'contents'
      t.timestamps null: false
    end
  end
end
