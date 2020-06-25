# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     PairProgramming.Repo.insert!(%PairProgramming.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias PairProgramming.Repo
alias PairProgramming.PairingSessions.PairingSession
alias PairProgramming.Users.User

spencer = %User{
	email: "spence1818@gmail.com",
	password_hash: Pow.Ecto.Schema.Password.pbkdf2_hash("password")
}
|> Repo.insert!()

cletus =  %User{
  email: "cletus@gmail.com",
  password_hash: Pow.Ecto.Schema.Password.pbkdf2_hash("password")
}
|> Repo.insert!()

mary =  %User{
  email: "mary@gmail.com",
  password_hash: Pow.Ecto.Schema.Password.pbkdf2_hash("password")
}
|> Repo.insert!()

%PairingSession{
	title: "Elixir Help",
	description: "Need some help learning how the pipe operator works.",
	label: "elixir",
	partner: nil,
	user: spencer,
	date: ~D[2020-06-23]
}
|> Repo.insert!()

%PairingSession{
	title: "Mysterious Timebomb",
	description: "Debugging a timebomb in Canvas. Only happens on Sundays.",
	label: "canvas",
	partner: nil,
	user: cletus,
	date: ~D[2020-06-09]
}
|> Repo.insert!()

%PairingSession{
	title: "Rails Basics",
	description: "Coming from a Node background and I'm totally new to Rails. Could use some help with the basics.",
	label: "rails",
	partner: nil,
	user: mary,
	date: ~D[2020-05-22]
}
|> Repo.insert!()

%PairingSession{
	title: "React Hooks Help",
	description: "I'm familiar with React but I am having a tough time figuring out a good use case for Hooks, and would love some help!",
	label: "react",
	partner: mary,
	user: spencer,
	date: ~D[2020-05-28]
}
|> Repo.insert!()

%PairingSession{
	title: "React Contexts: How Do They Work?",
	description: "Wut are contexts please help!!!",
	label: "react",
	partner: spencer,
	user: cletus,
	date: ~D[2020-06-18]
}
|> Repo.insert!()