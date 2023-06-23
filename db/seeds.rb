# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'date'

brains = [{ name: "Caffeine Connoisseur", description: "Unlock your brain's full potential by becoming a certified Caffeine Connoisseur! This skill will turn you into a master of all things caffeinated. From analyzing the perfect coffee-to-cream ratio to identifying the precise moment to switch from tea to espresso, you'll be the go-to guru for all caffeine enthusiasts. With this skill, you'll learn to decipher complex coffee shop menus, impress your friends with latte art, and even develop a secret handshake with baristas. Expand your knowledge of the world's most socially acceptable drug while keeping your wits sharp and your eyelids wide open!", category: "Gourmet", price: 25},

{name: "Pun Prodigy", description: "Embrace the power of wordplay with the Pun Prodigy skill! You'll become a linguistic genius, effortlessly crafting puns that'll make your friends groan and giggle in equal measure. Unlock the secrets of turning everyday conversations into pun-filled adventures, and discover how to wield puns as both a weapon and a source of endless amusement. With this skill, you'll transform into the pun-slinging hero of your social circles, armed with a quick wit and an arsenal of comedic wordplay. Be prepared for an abundance of laughter and eye-rolls wherever you go!", category: "Music dealer", price: 40 },

{name: "Rapid Fire Riddler", description: "Are you ready to become the ultimate brain-bending maestro? With the Rapid Fire Riddler skill, you'll acquire lightning-fast problem-solving abilities and unleash a storm of mind-boggling riddles on unsuspecting friends and family. From classic conundrums to clever lateral thinking challenges, you'll have everyone scratching their heads in bewilderment. This skill will transform you into a riddle-solving legend, able to outsmart even the trickiest brain teasers. Beware, though: with great power comes great responsibility. You might find yourself turning family gatherings into impromptu puzzle parties or being bombarded with requests for help during game nights. Can you handle the enigmatic fame?", category: "Nerd", price: 75},

{name: "Master of Memes", description: "Dive headfirst into the vast ocean of internet humor and become the Master of Memes! This skill will teach you to navigate the treacherous waters of viral images and hilarious captions, ensuring you're always up to date with the latest memes. Unleash your inner creativity as you learn to craft dank memes that make people snort with laughter. With the Master of Memes skill, you'll effortlessly communicate complex ideas through a single image, solidifying your status as the life of any online party. Remember, though: with great meme power comes great meme responsibility. Use your newfound skills wisely, and remember to always tag your friends for maximum comedic effect!", category: "Geek", price: 30},

{name: "Binge-Watching Virtuoso", description: "Are you prepared to ascend to the next level of couch-potato prowess? With the Binge-Watching Virtuoso skill, you'll acquire an encyclopedic knowledge of every TV show and movie ever made. You'll be able to recite entire episode scripts, predict plot twists before they happen, and spot continuity errors like a true detective. Not only will you become an expert in the art of consuming copious amounts of content, but you'll also develop the ability to hold heated debates about fictional characters as if they were real people. Just be sure to have plenty of popcorn and a comfortable seat, because once you unlock this skill, there's no turning back!", category: "Netflix junky", price: 50},

{name: "Jargon Jedi", description: "Enter the realm of Jargon Jedi and learn to wield the power of incomprehensible lingo! With this skill, you'll become a master of corporate jargon, effortlessly weaving buzzwords into everyday conversations. From "synergistic collaborations" to "paradigm shifts," you'll spout jargon so convincingly that even you won't know what you're saying. Confound your colleagues with your newfound ability to discuss mundane topics with an air of profound importance. The Jargon Jedi skill will turn you into a master manipulator of language, allowing you to navigate the treacherous waters of business meetings and office small talk with ease. Remember, with great jargon comes great opportunities for promotion!", category: "Jargon master", price: 90},

{name: "Whiz with Quizzes", description: "Sharpen your trivia prowess and become an unbeatable Whiz with Quizzes! With this skill, you'll absorb random facts like a sponge, always ready to impress your friends with obscure knowledge. From historical events to bizarre animal facts, you'll be a walking encyclopedia of information. This skill will prepare you to dominate trivia nights, leaving your competitors dumbfounded by your seemingly endless repertoire of knowledge. Warning: prolonged exposure to this skill may cause the spontaneous eruption of interesting facts at parties, leading to both admiration and mild annoyance from your social circle.", category: "OK Google", price: 15},

{name: "Sarcastic Savant", description: "Master the art of sarcasm with the Sarcastic Savant skill! You'll become a connoisseur of dry wit, able to deliver scathing remarks with impeccable timing. Unlock the power to make people simultaneously laugh and cringe, as your sarcastic quips become the stuff of legends. This skill will train your brain to think in ironic twists, ensuring your comebacks are as sharp as a razor blade. Be warned, though: being a Sarcastic Savant comes with great responsibility. Always remember to use your powers for good and never for evil. Prepare for a life filled with eye-rolls, smirks, and the occasional awkward silence.", category: "Sarcasm leader", price: 70}

{name: "Puzzle Magician", description: "Prepare to dazzle and amaze as a certified Puzzle Magician! With this skill, you'll unravel the mysteries of intricate brain teasers and mind-bending puzzles. From solving Rubik's Cubes with your eyes closed to untangling the most convoluted metal puzzles, you'll be a maestro of mental dexterity. This skill will elevate you to the level of a human enigma, leaving your friends scratching their heads in wonder. But beware, the life of a Puzzle Magician can be isolating, as you may find yourself lost in a sea of conundrums and riddles. Remember to come up for air occasionally and share your magical talents with others.", category: "Brain teaser", price: 80}

{name: "Conspiracy Commander", description: "Dive into the rabbit hole of wild theories and become the Conspiracy Commander! This skill will transform you into the ultimate mastermind behind intricate conspiracies. From faking moon landings to uncovering hidden messages in cereal boxes, you'll be the go-to person for all things covert and mysterious. Develop your skills of connecting unrelated events, and watch as your friends question reality itself. As a Conspiracy Commander, you'll see hidden meanings in the most mundane occurrences, turning everyday life into a thrilling puzzle. But be careful, for with great conspiracy comes great paranoia. Strap on your tinfoil hat, and get ready to unlock the secrets that the world never knew existed!", category: "Rabbit hole guide", price: 100}]



Booking.delete_all
Brain.delete_all
User.delete_all

STATUS = ['Pending', 'Accepted', 'Declined']

10.times do
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
    category: brain[:category],
    user_id: User.all.sample.id
  )
end

ID_USER = User.all.map { |user| user.id }

10.times do
  Booking.create!(
    brain_id: Brain.all.sample.id,
    user_id: ID_USER.sample,
    start_date: Faker::Date.between(from: Date.today, to: 1.month.from_now),
    end_date: Faker::Date.between(from: 1.month.from_now, to: 2.month.from_now),
    status: STATUS.sample
  )
  ID_USER.delete_at(ID_USER.index(Booking.last.user_id))
end
