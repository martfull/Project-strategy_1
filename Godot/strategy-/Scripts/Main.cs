using Godot;
using System;
using Strategy.Scripts;

public partial class Main : Node2D
{
	[Export]
	public PackedScene TileScene{get;set;}
	[Export]
	public PackedScene PlayerScene{get;set;}
	[Export]
	public Vector2 Position{get;set;}
	[Export]
	public int Width{get;set;}
	[Export]
	public int Height{get;set;}
	
	[Export]
	public Vector2I PlayerPosition{get;set;}
	
	
	public override void _Ready()
	{
		App.Map.CreateMap(Width, Height, TileScene,this);
		//PlayerSprite player = App.Map.CreatePlayer(PlayerPosition.X, PlayerPosition.Y, PlayerScene, this);
		//App.Player  = player;
		//TileSprite playerTile = App.Map.GetTile(PlayerPosition.X, PlayerPosition.Y);
		//player.MoveTo(playerTile);
	}
	

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
		
	}
	
}
