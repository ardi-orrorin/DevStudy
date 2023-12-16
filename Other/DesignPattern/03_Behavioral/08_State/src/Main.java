import State.LockedState;
import State.PlayingState;
import State.ReadyState;
import Ui.Player;

public class Main {
    public static void main(String[] args) {
        Player player = new Player();
        ReadyState ready = new ReadyState(player);
        PlayingState playing = new PlayingState(player);
        LockedState locked = new LockedState(player);
        player.changeState(ready);
        System.out.println(player.getState().onPlay());
        player.changeState(playing);
        System.out.println(player.getState().onPlay());
        player.changeState(locked);
        System.out.println(player.getState().onPlay());
    }
}