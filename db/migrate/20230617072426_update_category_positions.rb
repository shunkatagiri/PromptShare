class UpdateCategoryPositions < ActiveRecord::Migration[6.0]
  def up
    [
      # カテゴリーの配列
    ].each.with_index(1) do |category_attrs, index|
      category = Category.find_by(name: category_attrs[:name])
      if category.present?
        category.update(position: index)
      end
    end
  end

  def down
    # 必要に応じてロールバックの処理を書くこともできますが、今回は特に必要ないと思われます
  end
end
