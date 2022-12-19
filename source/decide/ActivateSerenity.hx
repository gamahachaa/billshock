package decide;

import ticket.TicketMobileFiveOneOneAccept;
import tstool.process.DescisionMultipleInput;
import tstool.process.Process;
import tstool.layout.History.Interactions; 

/**
 * ...
 * @author bb
 */
class ActivateSerenity extends DescisionMultipleInput 
{
	static inline var JUSTIFY:String = "JUSTIFY";

	public function new ()
	{
		super(
		[{
			ereg: new EReg("[\\s\\S]*","i"),
			input:{
				width:450,
				prefix:JUSTIFY,
				mustValidate:[No],
				position: [bottom, left]
			}
		}]
		);
	}
	
	/****************************
	* Needed for validation
	*****************************/
	override public function onYesClick():Void
	{
		if (validateYes()){
			this._nexts = [{step: getNext(), params: []}];
			super.onYesClick();
		}	
	}
	override public function onNoClick():Void
	{
		if (validateNo()){
			this._nexts = [{step: TicketMobileFiveOneOneAccept, params: []}];
			super.onNoClick();
		}
	}
	inline function getNext():Class<Process>{
		var compAmount = Main.HISTORY.findValueOfFirstClassInHistory(ProposeSerenity, ProposeSerenity.COMPENSATE);
		return if (compAmount.exists && compAmount.value < 51){
			   ApplyCompensationInMarilyn;
		}else{
			TicketMobileFiveOneOneAccept;
		}
	}
	/*
	override public function validateYes():Bool
	{
		return true;
	}
	*/
	/*
	override public function validateNo():Bool
	{
		return true;
	}
	*/
	
}