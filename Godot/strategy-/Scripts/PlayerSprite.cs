using Godot;
using System;

public partial class PlayerSprite : Sprite2D
{
    public Vector2I Coord{get;set;}
    public string Name{get;set;}
    
    public void MoveTo(TileSprite tile)
    {
        this.Coord = tile.Cood;
        this.Position = tile.Position;
        
    }
}
