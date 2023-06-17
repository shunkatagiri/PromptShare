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
  },
  {
    name: '画像生成',
    description: '画像生成に関するプロンプトを投稿するカテゴリーです。AI、デザインツール、CGIなど、多様な画像生成技術に関するプロンプトを共有してください。'
  },
  {
    name: '業務効率化',
    description: '業務効率化に関するプロンプトを投稿するカテゴリーです。自動化、ショートカット、ツールの活用法など、仕事をスムーズに進めるためのプロンプトを共有してください。'
  },
  {
    name: 'エンターテイメント',
    description: 'ユーモラスなコードやプログラミングジョーク、ChatGPTを使った大喜利など、ネタ投稿をするカテゴリーです。ふざけた投稿も大歓迎です!'
  },
  {
    name: 'その他',
    description: '一般的なカテゴリに当てはまらないプロンプトを投稿するためのカテゴリーです。思いついたアイデアを自由にシェアしてください。'
  }
].each.with_index(1) do |category_attrs, index|
  Category.find_or_create_by(name: category_attrs[:name]) do |category|
    category.description = category_attrs[:description]
    category.position = index
  end
end
