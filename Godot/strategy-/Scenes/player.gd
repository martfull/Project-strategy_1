class_name Player extends Node

var team: int
var gold = 100
var income = 3

func initialise_team(team):
	self.team = team
	
func add_income():
	self.gold += self.income
	return gold
func spend_gold(cost: int):
	self.gold -= cost
	
