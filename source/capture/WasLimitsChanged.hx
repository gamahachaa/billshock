package capture;

import decide.NewSimplComp;
import decide.ProposeSerenity;
import decide.SimplComp;
import decide._InformAboutNewLaw;
import flixel.addons.ui.StrNameLabel;
import tstool.layout.History.ValueReturn;
import tstool.process.DescisionDropDown;
import tstool.process.Process;

/**
 * ...
 * @author bb
 */
class WasLimitsChanged extends DescisionDropDown 
{
	static inline var HEADER:String = "Roaming spending limit - Data";

	public function new() 
	{
		super([
		new StrNameLabel("", "250 (default)"), 
		new StrNameLabel("0", "0.00 CHF"), 
		new StrNameLabel("50", "50.00 CHF"), 
		new StrNameLabel("100", "100.00 CHF"),  
		new StrNameLabel("150", "150.00 CHF"),
		new StrNameLabel("200", "200.00 CHF"),
		new StrNameLabel("300", "300.00 CHF"),
		new StrNameLabel("400", "400.00 CHF"),
		new StrNameLabel("500", "500.00 CHF"),
		new StrNameLabel("600", "600.00 CHF")
		]);
		
	}
	override public function onYesClick():Void
	{
		
		//this._nexts = [{step: _InformAboutNewLaw, params: []}];
		this._nexts = [{step: IsContractMoreThan12MonthLeft, params: []}];
		this._nexts = [{step: ProposeSerenity, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: getNext(), params: []}];
		super.onNoClick();
	}
	override function validateNo():Bool
	{
		#if debug
		trace("capture.WasLimitsChanged::validateNo");
		trace(choice);
		#end
		if (choice == "") return true; 
		else {
			this.dp.blink(true); 
			return false; 
		}
	}
	inline function getNext():Class<Process>
	{
		var howMade:ValueReturn;
		
		
		try{
			howMade = Main.HISTORY.findValueOfFirstClassInHistory(_HowMadeHugeAmount, _HowMadeHugeAmount.HOW);
		}
		catch (e){
			#if debug
			 howMade = {exists:true, value:_HowMadeHugeAmount.EUROPE };
			#else
			throw(e);
			#end
		}
		return if (howMade.exists && (howMade.value == _HowMadeHugeAmount.EUROPE || howMade.value == _HowMadeHugeAmount.TRAVEL) ) _ElligibleForRet else NewSimplComp;
	}
}