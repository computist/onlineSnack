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
Dish.create(:name => "���Ӽ�", :cuisine => "�Ĵ�", :spicy => 5, :rate => 4.1, :rate_number => 12, :price => 10.5, :deliver => true, :reserve => false)
Dish.create(:name => "ëѪ��", :cuisine => "����", :spicy => 4, :rate => 3.5, :rate_number => 7, :price => 11.5, :deliver => false, :reserve => true)
Dish.create(:name => "���", :cuisine => "�Ĵ�", :spicy => 5, :rate => 4.3, :rate_number => 20, :price => 13, :deliver => true, :reserve => false)
Dish.create(:name => "������Ѽ", :cuisine => "����", :spicy => 0, :rate => 3.4, :rate_number =>16, :price => 9.5, :deliver => false, :reserve => true)
Dish.create(:name => "��ȫ��", :cuisine => "�½�", :spicy => 2, :rate => 4.3, :rate_number => 13, :price => 11, :deliver => true, :reserve => true)
Dish.create(:name => "����", :cuisine => "����", :spicy => 0, :rate => 3.2, :rate_number => 17, :price => 9.5, :deliver => false, :reserve => false)
Dish.create(:name => "���������", :cuisine => "����", :spicy => 3, :rate => 3.9, :rate_number => 9, :price => 10, :deliver => true, :reserve => true)
r = Random.new
for i in 1..50
    Dish.create(:name => "dish" + i.to_s, :cuisine => "USA", :spicy => r.rand(6), :rate => r.rand(0.0..5.0).round(1), :rate_number => r.rand(30), :price => r.rand(5.0..20.0).round(1), :deliver => true, :reserve => false)
end