Meetup.Repo.start_link

alias Meetup.Person, as: Person

person = %Person{name: "Jose Valim", username: "josevalim"}
Meetup.Repo.insert!(person)
