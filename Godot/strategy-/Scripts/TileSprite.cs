using Godot;
using System;
using Strategy.Scripts;

public partial class TileSprite : Sprite2D
{
	[Export]
	public int Width{get;set;}
	[Export]
	public int Height{get;set;}
	public Vector2I Cood{get;set;}
	

	// Called when the node enters the scene tree for the first time.
	

	public void SetCoordinatePosition(int x, int y)
	{
		int TileX = x * Width;
		int TileY = y * Height;
		
		Position = new Vector2I(TileX, TileY);
		Cood = new Vector2I(x,y);
	}
	
	public override void _Input(InputEvent @event)
	{
		if (@event is InputEventMouseButton mouseButtonEvent)
		{
			if (mouseButtonEvent.Pressed && mouseButtonEvent.ButtonIndex == MouseButton.Left)
			{
				// GetRect() returns the sprite's bounding box in its local coordinates.
				// If the sprite is centered, its origin (0,0) is its center.
				// GetLocalMousePosition() gives the mouse position relative to this origin.
				if (GetRect().HasPoint(GetLocalMousePosition()))
				{
					GD.Print($"{Cood} was clicked (within its bounding rectangle)!");
					// Your click logic here
					App.Player.MoveTo(this);
				}
			}
		}
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
		
	}
			
}
