user_1 = User.create(email: "test@test.com", password: "123456789")
user_2 = User.create(email: "test2@test.com", password: "987654321")
user_3 = User.create(email: "test3@test.com", password: "135797531")

cat_1 = Category.create(name: "Urgent")
cat_2 = Category.create(name: "Low Priority")
cat_3 = Category.create(name: "Personal")

user_1.tasks << Task.create(title: "Conference with President Trump", description: "Talk to the president about golf this weekend.")
user_1.tasks << Task.create(title: "Lunch with Marino", description: "Meet at Culvers to talk Football.")
user_2.tasks << Task.create(title: "Pay Electric Bill", description: "Pay the Bill so it won't be overdue.")
user_3.tasks << Task.create(title: "Budget Meetting", description: "Present budget to board")
user_3.tasks << Task.create(title: "Paint Room", description: "Surprise boss by painting her office pink.")

user_1.tasks.first.categories << cat_1
user_1.tasks.last.categories << cat_2
user_2.tasks.first.categories << cat_3
user_3.tasks.first.categories << cat_1
user_3.tasks.last.categories << cat_3

