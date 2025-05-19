using Godot;

namespace Strategy.Scripts;

public class GameControll 
{
    public PlayerSprite Player1;
    public Vector2I Player1Coord;
    public PlayerSprite Player2;
    public Vector2I Player2Coord;
    public bool IsPlayer1Turn = true;
    
    public GameControll() {}
    public GameControll(PlayerSprite player1, PlayerSprite player2, Vector2I Player1Coord, Vector2I Player2Coord)
    {
        this.Player1 = player1;
        this.Player2 = player2;
        this.Player1Coord = Player1Coord;
        this.Player2Coord = Player2Coord;
    }

    public void MovePlayer(TileSprite tile)
    {
        if (tile.IsFree() == false)
        {
            GD.Print("Occupied");
            return;
        }

        if (IsPlayer1Turn)
        {
            this.Player1Coord = tile.Cood;
            this.Player1.MoveTo(tile);
            IsPlayer1Turn = false;
        }
        else
        {
            this.Player2Coord = tile.Cood;
            this.Player2.MoveTo(tile);
            IsPlayer1Turn = true;
        }
    }
}