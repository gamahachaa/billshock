package;

import flixel.FlxState;
import haxe.ui.HaxeUIApp;
import haxe.ui.Toolkit;
import haxe.ui.macros.ComponentMacros;

/**
 * ...
 * @author bb
 */
class TestHaxeUI extends FlxState 
{
	var app:haxe.ui.HaxeUIApp;

	public function new()
	{
		super();
		
		
		
	}
	override public function create()
	{
		super.create();
		Toolkit.init();
		app = new HaxeUIApp();
		app.ready(
			function() {
				trace("loaded");
				var main = ComponentMacros.buildComponent("assets/xml/test.xml"); // whatever your XML layout path is
				app.addComponent(main);
				app.start();
			});
	}
	
}