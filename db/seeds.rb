
puts "Seeding categories..."

Category.create([{category_type: "fabric"}, {category_type: "yarn"}, {category_type: "art"}, {category_type: "home"}, {category_type: "kids"}] )


puts "Seeding projects..."

Project.create(title: "Peach Rug Making Kit", description: "A beautiful rug making kit for a small peach. Includes all required instrutions and materials", url: "https://www.craftclubco.com/products/peachy-rug-making-kit", image: "https://cdn.shopify.com/s/files/1/0266/5732/5245/products/craft-club-co-rug-making-kit-peachy-rug-making-kit-29787486290109_990x.jpg?v=1627987734", adds: 0, category_id: 2)

Project.create(title: "Geometric Summer Cushions", description: "Fun and bright cushion poject. Good for beginner to intermediate skill levels. Such a wonderful wait to brighten up the living room. Or maybe a spare room depending on your final product!", url: "https://www.spotlightstores.com/projects/cushion-projects/geometric-summer-cushions-project", image: "https://www.spotlightstores.com/medias/geometric-summer-cushions-project.jpg?context=bWFzdGVyfHJvb3R8MjQxODM0fGltYWdlL2pwZWd8cm9vdC9oMzUvaDBiLzEwMTcwMjg0MDgxMTgyL2dlb21ldHJpYy1zdW1tZXItY3VzaGlvbnMtcHJvamVjdC5qcGd8Mzk1N2QzMWVjYWQ4NjA2NmU3MzY2ZDRjM2ZjNDNkYjMxNzcwMjliYTJjY2MwOThkOGJkZGJhMzQxNTQ4M2Y3Yw", adds: 0, category_id: 1)

Project.create(title: "Air Dry Clay - Mini Succulent Planters", description: "These planters are easy to make for begginers, and feel quite tasteful compared to a lot of the air dry clay crafting projects out there. The white is lovely, but I think they would also look great painted", url: "https://www.burkatron.com/2016/03/diy-mini-succulent-cacti-clay-planters.html", image: "https://2.bp.blogspot.com/-ZcM2_pPn_z0/VvwAsdBHGvI/AAAAAAAAPlg/ur_GzoO6O_gJhaMkx3YJ1eWUqgEHgVz-A/s1600/succulent%2Bmini%2Bplanter%2Bdiy.jpg", adds: 0, category_id: 3)

Project.create(title: "15 Easy Watercolor Painting Ideas for Beginners", description: "Beautiful ideas for simple water colour paintings. Article includes list of essential supplies, and gives tips for each idea. I tried a cactus and it came out great!", url: "https://www.kingsframingandartgallery.com/blog/post/watercolor-painting-ideas-for-beginners", image: "https://www.kingsframingandartgallery.com/media/wysiwyg/12.jpg", adds: 0, category_id: 3)

Project.create(title: "Easy Wooden Photo Frame", description: "These make affordable and personalised gifts come christmas time, and are a lot of fun to make!", url: "https://www.clubcrafted.com/easy-wood-frame-update/", image: "https://www.clubcrafted.com/wp-content/uploads/2020/08/easy-wood-frame-update-trim-10.jpg", adds: 0, category_id: 4)

Project.create(title: "DIY Painted Serving Tray", description: "Colourful styling tray that can be customised to suit your home", url: "https://inspiredbycharm.com/painted-wood-serving-tray/", image: "https://inspiredbycharm.com/wp-content/uploads/2016/07/outdoor-serving-tray.jpg", adds: 0, category_id: 4)

Project.create(title: "Backyard Foam Cone Bowling Pins", description: "Very kid friendly project. Once they finish making it, they'll be kept entertained out in the yard too!", url: "https://www.spotlightstores.com/projects/kids-craft-projects/backyard-bowling-project", image: "https://www.spotlightstores.com/medias/backyard-bowling-project.jpg?context=bWFzdGVyfHJvb3R8MjcyNTI4fGltYWdlL2pwZWd8cm9vdC9oZDYvaDU1LzEwMTcwMjc1ODg5MTgyL2JhY2t5YXJkLWJvd2xpbmctcHJvamVjdC5qcGd8YTllYjhmNmJiYjMwYmNjNjcyNTg3NzgwN2FhYjhmYjA3MTRiZjhiYjYyMTBlZDg3NDBmNWJmNzE5NTcwN2ZlOA", adds: 0, category_id: 5)

Project.create(title: "Cardboard Dinosaur Costume", description: "Have any spare boxes lying around? Give the kids something to do before popping them in the recylcing bin!", url: "https://www.spotlightstores.com/projects/kids-craft-projects/cardboard-creatures-project", image: "https://www.spotlightstores.com/medias/cardboard-creatures-project.jpg?context=bWFzdGVyfHJvb3R8MjAwODEwfGltYWdlL2pwZWd8cm9vdC9oNmMvaDkzLzExMTE5NTA1MTQ1ODg2L2NhcmRib2FyZC1jcmVhdHVyZXMtcHJvamVjdC5qcGd8NzVlMGQzNzZjZjIwZDJjZTI4ZGU0ZjBiMDc2N2JkMjgxN2U4Y2E0MjA5NWI3MDJhZjcyZTQ3OGNhYjQ4NTc4ZA", adds: 0, category_id: 5)

Project.create(title: "Retro Bumbag", description: "Great tutorial for sewing your own spacious and funky bumbag. I made this for a festival and have kept using it since", url: "https://www.frankie.com.au/article/frankie-exclusive-diy-bum-bag-545682", image: "https://i.nextmedia.com.au/frankie/diy-bum-bag-frankie-inside-flat-lay.jpg", adds: 0, category_id: 1)

Project.create(title: "Crochet Scarf for Beginners", description: "Beginner friendly pattern plus tutorial to a cosy winter scarf", url:"https://sarahmaker.com/crochet-scarf-pattern/", image: "https://sarahmaker.com/wp-content/uploads/2021/08/sarahmaker-crochet-scarf-pattern-10.jpg.webp", adds: 0, category_id: 2)


puts "Seeding users..."

User.create(username: "LaurenCrafts", email: "lauren@gmail.com", password: "Password1")

User.create(username: "JaneDoe1", email: "jane@gmail.com", password: "Password1")

User.create(username: "SmithLovesCraft", email: "roger@gmail.com", password: "Password1")

User.create(username: "ChloeKnits", email: "chloe@gmail.com", password: "Password1")

User.create(username: "DavidCraftsALot", email: "david@gmail.com", password: "Passsword1")


puts "Seeding user projects..."

UserProject.create(user_id: 1, project_id: 1, completed_status: "wish list")

UserProject.create(user_id: 1, project_id: 2, completed_status: "completed")

UserProject.create(user_id: 1, project_id: 3, completed_status: "in progress")

UserProject.create(user_id: 2, project_id: 4, completed_status: "wish_list")

UserProject.create(user_id: 2, project_id: 5, completed_status: "completed")

UserProject.create(user_id: 2, project_id: 6, completed_status: "in progress")

UserProject.create(user_id: 3, project_id: 7, completed_status: "wish list")

UserProject.create(user_id: 3, project_id: 8, completed_status: "completed")

UserProject.create(user_id: 3, project_id: 9, completed_status: "in progress")

UserProject.create(user_id: 4, project_id: 10, completed_status: "wish list")

UserProject.create(user_id: 4, project_id: 1, completed_status: "in progress")

UserProject.create(user_id: 4, project_id: 2, completed_status: "completed")

UserProject.create(user_id: 5, project_id: 3, completed_status: "wish list")

UserProject.create(user_id: 5, project_id: 4, completed_status: "completed")

UserProject.create(user_id: 5, project_id: 5, completed_status: "in progress")



puts "Seeding completed!"
