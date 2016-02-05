# encoding: GB18030
# shell.say "Welcome to add dishes"
# Yes = "Y"
# while Yes == "Y"
# 	name     = shell.ask "What's the name of the dish? "
# 	location  = shell.ask "Which area does it from? "
# 	spicy = shell.ask "How spicy? (1 - 5) "
# 	shell.say ""
# 	dish = Dish.create(:name => name, :location => location, :spicy => spicy)
# 	if dish.valid?
# 		shell.say "Success"
# 		Yes  = shell.ask "Add another one? (Y/N)"
# 	else
# 		shell.say "failed"	
# 	end
# end
# shell.say "Bye"
Dish.create(:name => "辣子鸡", :cuisine => "四川", :spicy => 5, :rate => 4.1, :rate_number => 12, :price => 10.5, :deliver => true, :reserve => false)
Dish.create(:name => "毛血旺", :cuisine => "重庆", :spicy => 4, :rate => 3.5, :rate_number => 7, :price => 11.5, :deliver => false, :reserve => true)
Dish.create(:name => "火锅", :cuisine => "四川", :spicy => 5, :rate => 4.3, :rate_number => 20, :price => 13, :deliver => true, :reserve => false)
Dish.create(:name => "北京烤鸭", :cuisine => "北京", :spicy => 0, :rate => 3.4, :rate_number =>16, :price => 9.5, :deliver => false, :reserve => true)
Dish.create(:name => "烤全羊", :cuisine => "新疆", :spicy => 2, :rate => 4.3, :rate_number => 13, :price => 11, :deliver => true, :reserve => true)
Dish.create(:name => "肠粉", :cuisine => "广州", :spicy => 0, :rate => 3.2, :rate_number => 17, :price => 9.5, :deliver => false, :reserve => false)
Dish.create(:name => "红烧武昌鱼", :cuisine => "湖北", :spicy => 3, :rate => 3.9, :rate_number => 9, :price => 10, :deliver => true, :reserve => true)
r = Random.new
for i in 1..50
    Dish.create(:name => "dish" + i.to_s, :cuisine => "USA", :spicy => r.rand(6), :rate => r.rand(0.0..5.0).round(1), :rate_number => r.rand(30), :price => r.rand(5.0..20.0).round(1), :deliver => true, :reserve => false)
end