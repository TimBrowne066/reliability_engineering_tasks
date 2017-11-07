desc "Adds apple(s) to basket"
task :add_apple_to_basket, [:variety, :count] do
  quantity = :count.to_i
  :count.times do
    apple_basket = Basket.first.where(apples.count == 0 || (apples.count + :count <= capacity) && (apples.first.variety = :variety || apples.nil?))

    if apple_basket.nil?
      puts "All baskets are full.  We couldn't find the place for #{quantity} apples"
    end

    Apple.create(
      variety: "#{:variety}",
      basket_id: apple_basket.id
    )
    new_fill_rate = apple_basket.apples.count / apple_basket.fill_rate
    apple_basket.update(fill_rate: "#{new_fill_rate}%")

    quantity -= 1

  end
end
