3.times do |a|
	Topic.create!(
		title: "Topic: #{a}"
		)
end
puts "3 Topics creados"

10.times do |x|
	Articulo.create!(
		titulo: "Titulo de mi articulo #{x}",
		cuerpo: "But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?",
		topic_id: Topic.last.id
		)
end

puts "10 articulos creados"

5.times do |y|
	Skill.create!(
		title: "Rails #{y}",
		percent_utilized: 15
	)
end
puts "5 skills creadas"

8.times do |z|
	Portfolio.create!(
		title: "Titulo del portfolio #{z}",
		subtitle: "Ruby on Rails",
		body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
		main_image: "https://via.placeholder.com/600x400",
		thumb_image: "https://via.placeholder.com/350x200",
		)
end
puts "8 portfolio creados"

1.times do |z|
	Portfolio.create!(
		title: "Titulo del portfolio #{z}",
		subtitle: "Angular",
		body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
		main_image: "https://via.placeholder.com/600x400",
		thumb_image: "https://via.placeholder.com/350x200",
		)
end
puts "1 portfolio creados"

3.times do |z|
	#Nueva sintaxis para reemplazar lo de abajo. Aquí estamos encadenando parent-child
	#En otras palabras, al ultimo portfolio creale 3 technologies:
	Portfolio.last.technologies.create!(
		name: "Technology #{z}",
		)

	#Technology.create!(
	#	name: "Technology #{z}",
	#	portfolio_id: Portfolio.last.id
	#	)
end

puts "3 Technologies creadas"
