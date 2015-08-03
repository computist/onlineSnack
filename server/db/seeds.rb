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
Dish.create(:name => "辣子鸡", :location => "四川", :spicy => 5)
Dish.create(:name => "毛血旺", :location => "重庆", :spicy => 4)
Dish.create(:name => "火锅", :location => "四川", :spicy => 5)
Dish.create(:name => "北京烤鸭", :location => "北京", :spicy => 0)
Dish.create(:name => "烤全羊", :location => "新疆", :spicy => 2)
Dish.create(:name => "肠粉", :location => "广州", :spicy => 0)
Dish.create(:name => "红烧武昌鱼", :location => "湖北", :spicy => 3)