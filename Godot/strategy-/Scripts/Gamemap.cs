using System.Collections.Generic;
using Godot;

namespace Strategy.Scripts;

public class Gamemap
{
    Dictionary<(int,int), Node2D> tileCoords = new Dictionary<(int,int), Node2D>();
    public Node2D CreateTile(int x, int y,PackedScene tileScene)
    {
        if (tileScene == null)
        {
            GD.PrintErr("TileScene is not set. Please assign it in the editor.");
            return null;
        }

        Node2D tileInstance = tileScene.Instantiate() as Node2D;
        tileInstance.Position = new Vector2I(x, y);
        tileCoords[(x, y)] = tileInstance;
        return tileInstance;
    }

    public Node2D GetTile(int x, int y)
    {
        if (tileCoords.TryGetValue((x, y), out Node2D tileInstance))
        {
            return tileInstance;
        }
        return null;
    }
}