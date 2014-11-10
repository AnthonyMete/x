class CreateValuations < ActiveRecord::Migration
  def change
    create_table :valuations do |t|
      t.datetime :conducted_at
      t.decimal :amount
      t.string :currency
      t.string :scorecard
      t.timestamps
    end
  end
end
