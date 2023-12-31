package capture;

import escalation._ReassignTicket;
import tstool.process.DescisionMultipleInput;
import tstool.process.Process;

/**
 * ...
 * @author bb
 */
class IsCompTicketOpened extends DescisionMultipleInput 
{
	
    static inline var SO_TICKET:String = "SO ticket";
	public function new ()
	{
		super(
		[{
			ereg: new EReg("^(1)[4-9]{1}[0-9]{6}$", "i"),
			input:{
				width:150,
				prefix:SO_TICKET,
				position: [bottom, left],
				debug: "11123456",
				mustValidate: [Next]
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
			this._nexts = [{step: HighUsageData, params: []}];
			super.onNoClick();
		}
	}
	inline function getNext():Class<Process>{
		return Main.customer.dataSet.get(InputCustomersDetails.PORTFOLIO).get(InputCustomersDetails.SEGMENT) == InputCustomersDetails.B2C? End:_ReassignTicket;
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