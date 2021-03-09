package spidot.hello;

import org.bukkit.Location;
import org.bukkit.command.Command;
import org.bukkit.command.CommandExecutor;
import org.bukkit.command.CommandSender;
import org.bukkit.entity.Player;

public class HelloCommand implements CommandExecutor {

	@Override
	public boolean onCommand(CommandSender sender, Command command, String label, String[] args) {
		final String prefix = "[MYPREFIX]";

		if (args.length == 1 && args[0].equalsIgnoreCase("player")) {
			final Player player = Player.class.cast(sender);
			final Location location = player.getLocation();

			final StringBuilder sb = new StringBuilder();
			sb.append(String.format("name: \"%s\", customName: \"%s\", displayName: \"%s\"\n", player.getName(), player.getCustomName(), player.getDisplayName()));
			sb.append(String.format("x=%f, y=%f, z=%f\n", location.getX(), location.getY(), location.getZ()));
			sender.sendMessage(sb.toString());

			return true;
		}

		final StringBuilder sb = new StringBuilder();
		sb.append(prefix + "Hello help :\n");
		sb.append("- /hello player\n");
		sb.append("\n");
		sb.append(String.format("command: %s\n", "" + command));
		sb.append(String.format("label: %s\n", "" + label));
		for (int i = 0; args != null && i < args.length; i++) {
			sb.append(String.format("args[%d]: \"%s\"\n", i, args[i]));
		}
		sender.sendMessage(sb.toString());

		return false;
	}

}
