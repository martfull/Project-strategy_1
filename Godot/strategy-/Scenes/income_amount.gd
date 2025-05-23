extends Label

func set_income(income):
	if income > 0:
		text = "+" + str(income)
	elif  income <= 0: 
		text = "-" + str(income)
