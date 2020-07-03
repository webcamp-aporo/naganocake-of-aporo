5.times do |n|
	Customer.create!(
		email: "test#{n + 1}@test.com}",
		password: "tttttt#{n + 1}",
		address: "東京都1ー1ー1",
		last_name: "田中#{n + 1}",
		first_name: "太郎#{n + 1}",
		last_name_kana: "タナカ#{n + 1}",
		first_name_kana: "タロウ#{n + 1}",
		postal_number: "123456",
		phone_number: "11122223333",
		is_delete: false
	)
end

5.times do |n|
	Item.create!(
		name: "ケーキ#{n + 1}",
		description: "すごく美味しい。めっちゃ美味しい。",
		price: 500,
		image_id: File.open('app/assets/images/スマイル-1093x729.png'),
		is_active: false,
		item_genre_id: 1
		)
end