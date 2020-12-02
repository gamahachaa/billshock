package capture;

import tstool.layout.History.Interactions;
import tstool.process.DescisionMultipleInput;
import tstool.process.Process;

/**
 * ...
 * @author bb
 */
class IsCompTicketOpened extends DescisionMultipleInput 
{
	static inline var MSISDN:String = "MSISDN";
	public function new ()
	{
		super(
		[{
			ereg: new EReg("^(0)[0-9]{2}\\s{0,1}[0-9]{3}\\s{0,1}[0-9]{4}$","i"),
			input:{
				width:100,
				prefix:MSISDN,
				position: [bottom, left],
				debug: "078 787 1676"
			}
		},
		{
			ereg: new EReg("^(11)[0-9]{6}$","i"),
			input:{
				width:100,
				prefix:"S.O ticket",
				buddy:MSISDN,
				position: [top, right],
				debug: "11123456",
				mustValidate: [Yes]
			}
		}
		]
		);
		Process.STORAGE = [];
	}
	/*override public function create()
	{
		this._nextYesProcesses = [];
		this._nextNoProcesses = [];
		super.create();
	}*/
	/****************************
	* Needed for validation
	*****************************/
	override public function onYesClick():Void
	{
		
		//this._nextYesProcesses = [new End()];
		this._nexts = [{step: End, params: []}];
		super.onYesClick();
		
	}
	/*override public function validateYes():Bool
	{
		return true;
	}*/
	
	override public function onNoClick():Void
	{
		//this._nextNoProcesses = [new HighUsageData()];
		this._nexts = [{step: HighUsageData, params: []}];
		super.onNoClick();
		
	}
	
	override public function validate(interaction:Interactions):Bool
	{
		//trace("capture.IsCompTicketOpened::validate");
		Main.customer.voIP = StringTools.replace(this.multipleInputs.inputs.get(MSISDN).getInputedText(), " ", "");

		Process.STORE(MSISDN, '${Main.customer.voIP}' );
		return super.validate(interaction);
	}
	/*override public function validateNo():Bool
	{
		return true;
	}*/
	
	
}