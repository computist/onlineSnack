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
Dish.create(:name => "À±×Ó¼¦", :location => "ËÄ´¨", :spicy => 5, :rate => 4.1, :rate_number => 12)
Dish.create(:name => "Ã«ÑªÍú", :location => "ÖØÇì", :spicy => 4, :rate => 3.5, :rate_number => 7)
Dish.create(:name => "»ð¹ø", :location => "ËÄ´¨", :spicy => 5, :rate => 4.3, :rate_number => 20)
Dish.create(:name => "±±¾©¿¾Ñ¼", :location => "±±¾©", :spicy => 0, :rate => 3.4, :rate_number =>16)
Dish.create(:name => "¿¾È«Ñò", :location => "ÐÂ½®", :spicy => 2, :rate => 4.3, :rate_number => 13)
Dish.create(:name => "³¦·Û", :location => "¹ãÖÝ", :spicy => 0, :rate => 3.2, :rate_number => 17)
Dish.create(:name => "ºìÉÕÎä²ýÓã", :location => "ºþ±±", :spicy => 3, :rate => 3.9, :rate_number => 9)