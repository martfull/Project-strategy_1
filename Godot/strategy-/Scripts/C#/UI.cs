using Godot;
using System;
using Strategy.Scripts;

public partial class UI : Node
{
	[Export] public Label TurnLabel;
	public override void _Ready()
	{
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
		if (App.GameControll.IsPlayer1Turn == true)
		{
			TurnLabel.Text = "Red";
		}
		else
		{
			TurnLabel.Text = "Blue";
		}
	}
}
