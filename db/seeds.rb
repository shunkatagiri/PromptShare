# db/seeds.rb
[
  { 
    name: 'ポートフォリオ作成', 
    description: 'ポートフォリオを作成するためのサポートとなるプロンプトを見つけることができます。'
  },
  { 
    name: '就職活動', 
    description: '効果的な就職活動を進めるためのプロンプトを見つけることができます。'
  },
  { 
    name: 'プログラミング学習', 
    description: 'プログラミングの様々なトピックに関する学習を助けるプロンプトを見つけることができます。'
  },
  { 
    name: 'フレームワーク・ツール', 
    description: '特定のフレームワークやツールの学習を深めるためのプロンプトを見つけることができます。'
  },
  { 
    name: 'コーディング', 
    description: 'コーディングの解答やアプローチを考えるためのプロンプトを見つけることができます。'
  },
  { 
    name: 'データ構造・アルゴリズム', 
    description: 'データ構造やアルゴリズムについて深く学ぶためのプロンプトを見つけることができます。'
  },
  { 
    name: 'デザイン・UX', 
    description: 'デザインやユーザーエクスペリエンスに関する考え方や手法を学ぶためのプロンプトを見つけることができます。'
  },
  { 
    name: 'ソフトウェアテスティング', 
    description: 'ソフトウェアテスティングに関する知識を深めるためのプロンプトを見つけることができます。'
  }
].each do |category_attrs|
  Category.find_or_create_by(name: category_attrs[:name]) do |category|
    category.description = category_attrs[:description]
  end
end

10.times do
  Template.create(
    title: Faker::Lorem.sentence,
    description: Faker::Lorem.paragraph,
    content: Faker::Lorem.paragraphs.join("\n\n"),
    category: Category.order("RANDOM()").first,
    user: User.order("RANDOM()").first
  )
end
