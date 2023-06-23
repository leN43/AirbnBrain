# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'date'

brains = [{ name: "Bulby Le Rêveur", description: "Un cerveau qui passe son temps à rêver d'une vie meilleure en tant que cerveau de génie. Il est souvent dans la lune, mais attention, il peut vous surprendre avec des idées brillantes qu'il concocte lors de ses longues rêveries.", category: "Poesie de la lune", price: 1000},

{name: "Léonard Le Distrait", description: "Léonard a un penchant pour l'oubli de choses importantes. Il est génial dans des domaines aléatoires comme la mémorisation de paroles de chansons des années 90, mais il oubliera votre anniversaire. Chaque fois.", category: "Chanteur de douche", price: 800 },

{name: "Penny La Procrastinatrice", description: "Penny est excellente pour planifier et organiser des tâches... pour les réaliser plus tard. Elle a l'art de faire attendre les choses jusqu'à la dernière minute. C'est le cerveau à choisir si vous aimez vivre sur le fil.", category: "Urgentiste", price: 700},

{name: "Einstein Le Fêtard", description: "Einstein est le cerveau qui vit pour la fête. Il a un talent particulier pour se souvenir de toutes les blagues qu'il entend et sait quand les raconter pour faire rire. Malheureusement, il a tendance à faire des siestes pendant les heures de travail.", category: "Contrepéteur", price: 1500},

{name: "Médusa La Rancunière", description: "Médusa a une mémoire d'éléphant. Elle n'oublie jamais une offense, peu importe à quel point elle est petite. Si vous aimez les drames et les souvenirs mémorables, c'est le cerveau qu'il vous faut.", category: "Macchiavelique", price: 1200},

{name: "Galactica La Diva", description: "Ce cerveau croit qu'il est le centre de l'univers. Il a une tendance à dramatiser tout et à considérer chaque petit incident comme une crise majeure. Malgré cela, sa confiance inébranlable peut être assez contagieuse.", category: "Drama Queen", price: 2000},

{name: "Bob Le Grognon", description: "Bob a toujours quelque chose de négatif à dire. Que ce soit un jour ensoleillé ou une nouvelle pizza, il trouvera toujours quelque chose à critiquer. Mais si vous cherchez une opinion honnête, Bob est votre cerveau.", category: "Perfectionniste", price: 600},

{name: "Sylvie La Shopaholic", description: "Sylvie ne peut pas résister à une bonne affaire. Que ce soit des chaussures en solde ou des gadgets high-tech, elle veut tout acheter. Un excellent choix si vous cherchez à stimuler l'économie.", category: "Négociatrice", price: 1600}]

CATEGORIES = ['Négociatrice', 'Perfectionniste', 'Drama Queen', 'Macchiavélique', 'Contrepéteur', 'Urgentiste', 'Chanteur de douche', 'Poesie de la lune']

Booking.delete_all
Brain.delete_all
User.delete_all

STATUS = ['Pending', 'Accepted', 'Declined']

3.times do
  User.create!(
    first_name: Faker::Superhero.name,
    last_name: Faker::Superhero.suffix,
    email: Faker::Internet.email,
    password: "lovelewagon"
  )
end

brains.each do |brain|
  Brain.create!(
    name: brain[:name],
    description: brain[:description],
    price: brain[:price],
    category: CATEGORIES.sample,
    user_id: User.all.sample.id
  )
end

ID_USER = User.all.map { |user| user.id }

3.times do
  Booking.create!(
    brain_id: Brain.all.sample.id,
    user_id: ID_USER.sample,
    start_date: Faker::Date.between(from: Date.today, to: 1.month.from_now),
    end_date: Faker::Date.between(from: 1.month.from_now, to: 2.month.from_now),
    status: STATUS.sample
  )
  ID_USER.delete_at(ID_USER.index(Booking.last.user_id))
end
