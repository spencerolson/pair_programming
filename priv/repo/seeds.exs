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

%PairingSession{
	title: "Elixir Help",
	description: "Need some help learning how the pipe operator works.",
	label: "elixir",
	partner: "",
	creator: "Spencer Olson",
	date: ~D[2020-06-23]
}
|> Repo.insert!()

%PairingSession{
	title: "Mysterious Timebomb",
	description: "Debugging a timebomb in Canvas. Only happens on Sundays.",
	label: "canvas",
	partner: "",
	creator: "Kristal Petrovich",
	date: ~D[2020-06-09]
}
|> Repo.insert!()

%PairingSession{
	title: "Rails Basics",
	description: "Coming from a Node background and I'm totally new to Rails. Could use some help with the basics.",
	label: "rails",
	partner: "",
	creator: "John Doe",
	date: ~D[2020-05-22]
}
|> Repo.insert!()

%PairingSession{
	title: "React Hooks Help",
	description: "I'm familiar with React but I am having a tough time figuring out a good use case for Hooks, and would love some help!",
	label: "react",
	partner: "Spencer Olson",
	creator: "Jane Doe",
	date: ~D[2020-05-28]
}
|> Repo.insert!()

%PairingSession{
	title: "React Contexts: How Do They Work?",
	description: "Wut are contexts please help!!!",
	label: "react",
	partner: "Kristal Petrovich",
	creator: "Cletus Jones",
	date: ~D[2020-06-18]
}
|> Repo.insert!()