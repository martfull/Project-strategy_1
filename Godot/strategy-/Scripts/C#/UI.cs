using Godot;
using System;
using Strategy.Scripts;

public partial class UI : Node
{
	[Export] public Label TurnLabel;
	public override void _Process(double delta)
	{
		if (App.GameControll.IsPlayer1Turn == true)
		{
			TurnLabel.Text = "Red";
		}
		if (App.GameControll.IsPlayer1Turn == false)
		{
			TurnLabel.Text = "Blue";
		}
	}
}
