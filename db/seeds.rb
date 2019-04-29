# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
puts "Début du seed"
PrivateMessage.destroy_all
JoinTagsGossip.destroy_all
Gossip.destroy_all
Tag.destroy_all
User.destroy_all
City.destroy_all
puts "Toutes les tables ont été vidées"
#Fill cities
puts __LINE__
10.times do
  City.create!(name: Faker::Address.unique.city, zipcode: Faker::Address.unique.zip_code)
end
puts __LINE__

#Fill users
puts __LINE__
10.times do
  User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, age: rand(12..50), email: Faker::Internet.email, city_id: City.all.sample.id)
end
puts __LINE__


#fill tags
puts __LINE__
10.times do
  Tag.create!(title: Faker::Verb.simple_present)
end
puts __LINE__

#Fill gossips
gossips_array = [
  {"Pollux" => "Blake Lively devait jouer Serena Van der Woodsen dès le départ"},
  {"Maxenns" => "Leighton Meester n'a pas été intimidée par le processus d'auditions"},
  {"Florence" => "Ed Westwick et Chace Crawford étaient meilleurs amis"},
  {"Corinne" => "Badgley et Lively ont gardé leur rupture secrète pendant deux mois (waou incroyable)"},
  {"Dylan" => "Enfaite la Harpie Feroce , c'est un peu le Ho-Oh de Max Il l'a vu une premiere fois ,ça l'a boulversé﻿"},
  {"Un boulet lambda" => "La télévision est un trou noir dans l'espace public, qui spaghettifie les facultés intellectuelles et d'où la lumière ne s'échappe pas.﻿"},
  {"Un pipo lambda" => "Corrélativement à la pluralité qualitative, les personnels concernés doivent concrétiser les potentiels bénéfices."},
  {"Pipotronice" => "Corrélativement à la pluralité qualitative, les personnels concernés doivent concrétiser les potentiels bénéfices."},
  {"Tu lis encore" => "Pour optimiser la revalorisation sectorielle, les fournisseurs vont valoriser les potentiels logistiques."},
  {"Tu me note bien hien" => "Pour externaliser la bulle accélérationnelle, il faut muscler son jeu : prioriser les orientations sources."},
  {"(stp)" => "Pour externaliser la bulle accélérationnelle, il faut muscler son jeu : prioriser les orientations sources."},
  {"Jean-luc" => "Au moyen d'une dynamique des prestations, il faut intervenir dans les interactions framework."},
  {"Reichman (pas evident à écrire)" => "En phase de montée en charge de la convergence autoporteuse, on doit performer les potentiels métier."},
  {"Hiltop Hoods" => "Growing up I needed a guide like, a blind veteran's dog,Cause I was going nowhere like a child's letters to god,Though life's road was hard I was never so lost,That I looked for an answer in a medicine box,"},
  {"Maxime" => "Perpendiculairement à la transversalité autoporteuse, les acteurs du secteur vont prioriser les challenges framework."},
  {"Kurt" => "En termes de process, concernant une globalisation porteuse, les décideurs doivent coacher les sourcing compétitivité."},
  {"Un mec qui vole" => "Répliquant à la transversalité conjoncturelle, les bonnes pratiques consistent à solutionner les expertises back-office."},
  {"L'écureuil volant" => "Pour intégrer la mutation globalisante, les personnels concernés doivent segmenter les territoires à forte valeur ajoutée."}
]
gossips_array.each do |current_hash|
  current_hash.each_pair do |key,value|
  Gossip.create!(title: "Importation du projet gossip précédent", content: value, user_id: User.all.sample.id)
  end
end
puts __LINE__
20.times do
  Gossip.create!(title: Faker::Lorem.sentence, content: Faker::Lorem.paragraph, user_id: User.all.sample.id)
end
puts __LINE__

#Fill join_tags_gossips
puts __LINE__
100.times do
  JoinTagsGossip.create!(tag_id: Tag.all.sample.id, gossip_id: Gossip.all.sample.id)
end
puts __LINE__

# #Fill city_id in users
# puts __LINE__
# User.all.each do |n|
#   n.update()
# end
# puts __LINE__

#Fill user_if in gossips
# puts __LINE__
# Gossip.all.each do |n|
#   n.update()
# end
# puts __LINE__

#Fill private_messages
puts __LINE__
100.times do
  sender = User.all.sample.id
  recipient = nil
  loop do
    recipient = User.all.sample.id
    break if recipient != sender
  end
  PrivateMessage.create(content: Faker::Lorem.paragraph, recipient_id: recipient, sender_id: sender)
end
puts __LINE__
puts "Seed est terminé"