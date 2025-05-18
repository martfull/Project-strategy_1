using System.Collections.Generic;
using Godot;

namespace Strategy.Scripts;

public class Gamemap
{
    private Dictionary<Vector2I, TileSprite> _tileCoords = new Dictionary<Vector2I, TileSprite>();
    private Dictionary<Vector2I, PlayerSprite> _playerCoords = new Dictionary<Vector2I, PlayerSprite>();
    
    
    public void CreateMap(int Width, int Height, PackedScene TileScene, Main main)
    {
        for (int h = 0; h < Height; h++)
        {
            for (int w = 0; w < Width; w++)
            {
                Node2D tile = this.CreateTile(w, h, TileScene);
                main.AddChild(tile);
            }
        }
    }
    
    public Node2D CreateTile(int x, int y,PackedScene tileScene)
    {
        if (tileScene == null)
        {
            GD.PrintErr("TileScene is not set. Please assign it in the editor.");
            return null;
        }

        TileSprite tileInstance = tileScene.Instantiate<TileSprite>();
        Vector2I tileCoord = new Vector2I(x, y);
        tileInstance.SetCoordinatePosition(x,y);
        _tileCoords[tileCoord] = tileInstance;
        return tileInstance;
    }

    public Node2D CreatePlayer(int x, int y,PackedScene playerScene, Main main)
    {
        if (playerScene == null)
        {
            GD.PrintErr("TileScene is not set. Please assign it in the editor.");
            return null;
        }

        PlayerSprite playerInstance = playerScene.Instantiate<PlayerSprite>();
        Vector2I playerCoord = new Vector2I(x, y);
        playerInstance.SetCoordinatePosition(x,y);
        _playerCoords[playerCoord] = playerInstance;
        main.AddChild(playerInstance);
        return playerInstance;
    }
    public TileSprite GetTile(int x, int y)
    {
        Vector2I coord = new Vector2I(x, y);
        if (_tileCoords.TryGetValue(coord, out TileSprite tileInstance))
        {
            return tileInstance;
        }
        return null;
    }
}