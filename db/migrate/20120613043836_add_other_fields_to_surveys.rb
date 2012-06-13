class AddOtherFieldsToSurveys < ActiveRecord::Migration
  def change
    add_column :surveys, :ipaddress, :string
    add_column :surveys, :useragent, :string
  end
end
