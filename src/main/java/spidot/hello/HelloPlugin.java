package spidot.hello;

import org.bukkit.plugin.java.JavaPlugin;

public class HelloPlugin extends JavaPlugin {
	@Override
	public void onDisable() {
		System.out.println("onDisable");
	}

	@Override
	public void onEnable() {
		System.out.println("onEnable");
        this.getCommand("hello").setExecutor(new HelloCommand());		
	}

	@Override
	public void onLoad() {
		System.out.println("onLoad");
	}
}
