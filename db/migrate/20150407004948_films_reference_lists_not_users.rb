class FilmsReferenceListsNotUsers < ActiveRecord::Migration
  def change
    remove_reference :films, :user, index: true
    add_reference :films, :list, index: true
  end
end
