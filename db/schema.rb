# frozen_string_literal: true

ActiveRecord::Schema.define(version: 2020_10_03_010755) do
  create_table "books", force: :cascade do |t|
    t.string "title"
    t.text "memo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "author"
    t.string "picture"
  end
end
