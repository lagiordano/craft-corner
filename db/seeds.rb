
puts "Seeding categories..."

Category.create([{category_type: "fabric"}, {category_type: "yarn"}, {category_type: "art"}, {category_type: "home"}, {category_type: "kids"}] )


puts "Seeding projects..."

Project.create(title: "Peach Rug Making Kit", description: "A beautiful rug making kit for a small peach. Includes all required instrutions and materials", url: "https://www.craftclubco.com/products/peachy-rug-making-kit", image: "https://cdn.shopify.com/s/files/1/0266/5732/5245/products/craft-club-co-rug-making-kit-peachy-rug-making-kit-29787486290109_990x.jpg?v=1627987734", category_id: 2)

Project.create(title: "Geometric Summer Cushions", description: "Fun and bright cushion poject. Good for beginner to intermediate skill levels. Such a wonderful wait to brighten up the living room. Or maybe a spare room depending on your final product!", url: "https://www.spotlightstores.com/projects/cushion-projects/geometric-summer-cushions-project", image: "https://www.spotlightstores.com/medias/geometric-summer-cushions-project.jpg?context=bWFzdGVyfHJvb3R8MjQxODM0fGltYWdlL2pwZWd8cm9vdC9oMzUvaDBiLzEwMTcwMjg0MDgxMTgyL2dlb21ldHJpYy1zdW1tZXItY3VzaGlvbnMtcHJvamVjdC5qcGd8Mzk1N2QzMWVjYWQ4NjA2NmU3MzY2ZDRjM2ZjNDNkYjMxNzcwMjliYTJjY2MwOThkOGJkZGJhMzQxNTQ4M2Y3Yw", category_id: 1)

Project.create(title: "Air Dry Clay - Mini Succulent Planters", description: "These planters are easy to make for begginers, and feel quite tasteful compared to a lot of the air dry clay crafting projects out there. The white is lovely, but I think they would also look great painted", url: "https://www.burkatron.com/2016/03/diy-mini-succulent-cacti-clay-planters.html", image: "https://2.bp.blogspot.com/-ZcM2_pPn_z0/VvwAsdBHGvI/AAAAAAAAPlg/ur_GzoO6O_gJhaMkx3YJ1eWUqgEHgVz-A/s1600/succulent%2Bmini%2Bplanter%2Bdiy.jpg", category_id: 3)

Project.create(title: "15 Easy Watercolor Painting Ideas for Beginners", description: "Beautiful ideas for simple water colour paintings. Article includes list of essential supplies, and gives tips for each idea. I tried a cactus and it came out great!", url: "https://www.kingsframingandartgallery.com/blog/post/watercolor-painting-ideas-for-beginners", image: "https://www.kingsframingandartgallery.com/media/wysiwyg/12.jpg", category_id: 3)

Project.create(title: "Easy Wooden Photo Frame", description: "These make affordable and personalised gifts come christmas time, and are a lot of fun to make!", url: "https://www.clubcrafted.com/easy-wood-frame-update/", image: "https://www.clubcrafted.com/wp-content/uploads/2020/08/easy-wood-frame-update-trim-10.jpg", category_id: 4)

Project.create(title: "DIY Painted Serving Tray", description: "Colourful styling tray that can be customised to suit your home", url: "https://inspiredbycharm.com/painted-wood-serving-tray/", image: "https://inspiredbycharm.com/wp-content/uploads/2016/07/outdoor-serving-tray.jpg", category_id: 4)

Project.create(title: "Backyard Foam Cone Bowling Pins", description: "Very kid friendly project. Once they finish making it, they'll be kept entertained out in the yard too!", url: "https://www.spotlightstores.com/projects/kids-craft-projects/backyard-bowling-project", image: "https://www.spotlightstores.com/medias/backyard-bowling-project.jpg?context=bWFzdGVyfHJvb3R8MjcyNTI4fGltYWdlL2pwZWd8cm9vdC9oZDYvaDU1LzEwMTcwMjc1ODg5MTgyL2JhY2t5YXJkLWJvd2xpbmctcHJvamVjdC5qcGd8YTllYjhmNmJiYjMwYmNjNjcyNTg3NzgwN2FhYjhmYjA3MTRiZjhiYjYyMTBlZDg3NDBmNWJmNzE5NTcwN2ZlOA", category_id: 5)

Project.create(title: "Cardboard Dinosaur Costume", description: "Have any spare boxes lying around? Give the kids something to do before popping them in the recylcing bin!", url: "https://www.spotlightstores.com/projects/kids-craft-projects/cardboard-creatures-project", image: "https://www.spotlightstores.com/medias/cardboard-creatures-project.jpg?context=bWFzdGVyfHJvb3R8MjAwODEwfGltYWdlL2pwZWd8cm9vdC9oNmMvaDkzLzExMTE5NTA1MTQ1ODg2L2NhcmRib2FyZC1jcmVhdHVyZXMtcHJvamVjdC5qcGd8NzVlMGQzNzZjZjIwZDJjZTI4ZGU0ZjBiMDc2N2JkMjgxN2U4Y2E0MjA5NWI3MDJhZjcyZTQ3OGNhYjQ4NTc4ZA", category_id: 5)

Project.create(title: "Retro Bumbag", description: "Great tutorial for sewing your own spacious and funky bumbag. I made this for a festival and have kept using it since", url: "https://www.frankie.com.au/article/frankie-exclusive-diy-bum-bag-545682", image: "https://i.nextmedia.com.au/frankie/diy-bum-bag-frankie-inside-flat-lay.jpg", category_id: 1)

Project.create(title: "Crochet Scarf for Beginners", description: "Beginner friendly pattern plus tutorial to a cosy winter scarf", url:"https://sarahmaker.com/crochet-scarf-pattern/", image: "https://sarahmaker.com/wp-content/uploads/2021/08/sarahmaker-crochet-scarf-pattern-10.jpg.webp", category_id: 2)

Project.create(title: "Perfect Scarf for Bigginner Knitters", description: "This is a great knitting tutorial for beginners who need easy to understand instructions and basic stitches", url:"https://nimble-needles.com/patterns/how-to-knit-a-scarf-for-beginners/", image: "https://nimble-needles.com/wp-content/uploads/2020/04/how-to-knit-a-scarf.jpg.webp", category_id: 2)

Project.create(title: "How to Make Planter Posts for String Lights", description: "Extend the party into the night with these wooden whiskey barrels made into planters with posts that hold string lights", url:"https://www.hgtv.com/outdoors/outdoor-spaces/how-to-make-planter-posts-for-string-lights", image: "https://diy.sndimg.com/content/dam/images/diy/fullset/2018/3/19/Original_Start-Here_paver-pad-beauty-retouched.jpg.rend.hgtvcom.616.462.suffix/1521573004393.jpeg", category_id: 4)

Project.create(title: "Garden Kneel Pad", description: "Gardening is easy with this diy gardening cushion!", url: "https://homespunseasonalliving.com/diy-garden-kneel-pad/", image: "https://homespunseasonalliving.com/wp-content/uploads/2020/01/DIY-Garden-Kneel-Pad-9.jpg", category_id: 1, )

Project.create(title: "Embroidered Baseball Cap", description: "Hand embroider your own cute baseball cap", url: "https://swoodsonsays.com/how-to-embroider-a-hat-by-hand/", image: "https://swoodsonsays.com/wp-content/uploads/2019/07/hand-embroidered-hat-diy.jpg", category_id: 2, )

Project.create(title: "DIY Scented Wax Sachets", description: "Learn how to make DIY scented wax sachets with soy wax, essential oils and dried botanicals", url: "https://www.countryhillcottage.com/diy-scented-wax-sachets/", image: "https://cdn.shortpixel.ai/spai/q_lossy+w_789+to_webp+ret_img/https://www.countryhillcottage.com/wp-content/uploads/2019/06/Floral_Wax_Sachets_Air_Freshener-26-1.jpg", category_id: 4, )

Project.create(title: "Make Your Own Playdough", description: "Recipe to make playdough, and 7 suggestions for fun playdough crafts", url: "https://www.goodto.com/family/children/play-dough-recipe-81908", image: "https://cdn.mos.cms.futurecdn.net/bKeZfkzn9FawaZ33GzRhdR-1280-80.jpg.webp", category_id: 5, )

Project.create(title: "Paper Bag Monster Puppets", description: "Great halloween craft for the whole family to get involved in!", url: "https://iheartcraftythings.com/paper-bag-monster-puppets.html", image: "https://iheartcraftythings.com/wp-content/uploads/2015/09/paper-bag-monsters-1.jpg", category_id: 5, )

Project.create(title: "", description: "", url: "", image: "", category_id: , )

puts "Seeding users..."

User.create(username: "Admin", email: "admin@craftcorner.com", password: "Admin123", admin: true)

User.create(username: "LaurenG", email: "lauren@gmail.com", password: "Password1")

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

UserProject.create(user_id: 5, project_id: 11, completed_status: "in progress")

UserProject.create(user_id: 2, project_id: 10, completed_status: "in progress")

UserProject.create(user_id: 6, project_id: 2, completed_status: "in progress")

UserProject.create(user_id: 6, project_id: 5, completed_status: "wish list")

UserProject.create(user_id: 6, project_id: 10, completed_status: "completed")

UserProject.create(user_id: 6, project_id: 12, completed_status: "completed")

UserProject.create(user_id: 5, project_id: 12, completed_status: "wish list")

UserProject.create(user_id: 6, project_id: 12, completed_status: "wish list")

UserProject.create(user_id: 9, project_id: 12, completed_status: "in progress")



puts "Seeding completed!"
