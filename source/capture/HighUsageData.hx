package capture;

import ticket.TicketMobileFiveOneOne;
import tstool.layout.History.Interactions;
import tstool.process.DescisionMultipleInput;
import tstool.process.Process;
import tstool.salt.Balance;

/**
 * ...
 * @author bb
 */
class HighUsageData extends DescisionMultipleInput 
{
	var rSeparator:EReg;
	public static inline var STORAGE_TOTAL_AMOUNT:String = "SCHOCK CHF";
	public static inline var BA:String = "B.A";
	public static inline var INVOICE:String = "Invoice(s) Nber(s)";
	public static inline var AMOUNTS:String = "Schock amnount(s)";

	public function new ()
	{
		super(
		[
			{
				ereg: new EReg("^[0-9]{4,7}$","i"),
				input:{
					width:80,
					prefix:BA,
					position: [bottom, left],
					debug:"123456"
				}
			},
			{
				//20100001492630
				ereg: new EReg("^[0-9]{14}([+ ;\\/]{1,3}[0-9]{14})*$","i"),
				input:{
					width:500,
					prefix:INVOICE,
					buddy:BA,
					position: [bottom, left],
					mustValidate : [Yes, No],
					debug:"12345678912345 12345678912345"
				}
			},
			{
				ereg: new EReg("^[0-9]+((\\.|,)[0-9]{1,2})?([+ ;\\/]{1,3}[0-9]+((\\.|,)[0-9]{1,2})?)*$","i"),
				input:{
					width:160,
					prefix:AMOUNTS,
					buddy:INVOICE,
					position: [bottom, left],
					mustValidate : [Yes, No],
					debug:"999 + 500"
				}
			}
		]
		);
		rSeparator = new EReg("[+ ;\\/]{1,3}", "g");
	}
	/*
	override public function create()
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
		//this._nextYesProcesses = [new HowMadeHugeAmount()];
		if (validateYes())
		{
			this._nexts = [{step: _HowMadeHugeAmount}];
			super.onYesClick();
		}
	}
	/*
	override public function validateYes():Bool
	{
		return true;
	}*/
	
	override public function onNoClick():Void
	{
		//this._nextNoProcesses = [new TicketMobileFiveOneOne()];
		if (validateNo())
		{
			this._nexts = [{step: TicketMobileFiveOneOne}];
			super.onNoClick();
		}
	}
	override public function validate(interaction:Interactions):Bool
	{
		var amounts = this.multipleInputs.inputs.get(AMOUNTS).getInputedText();
		var invoices = this.multipleInputs.inputs.get(INVOICE).getInputedText();
		var numAmounts = rSeparator.split(StringTools.trim(amounts)).length;
		var numInvoices = rSeparator.split(StringTools.trim(invoices)).length;
		if (numAmounts == numInvoices)
		{
			Main.customer.contract.balance = new Balance("", numAmounts>1 ? Std.string(compute(amounts)): amounts);
			Process.STORE(STORAGE_TOTAL_AMOUNT, Main.customer.contract.balance.overdue + (numAmounts >1 ? " (" +  amounts + ")":""));
			
			//Process.STORAGE.set("reminder", ' ${Main.customer.voIP}' );
			return super.validate(interaction);
		}
		else{
			this.multipleInputs.inputs.get(AMOUNTS).blink(true);
			this.multipleInputs.inputs.get(INVOICE).blink(true);
			return false;
		}
	}
	/*
	override public function validateNo():Bool
	{
		return true;
	}
	*/
	inline function test(s1:String, s2:String)
	{
		return rSeparator.split(StringTools.trim(s1)).length == rSeparator.split(StringTools.trim(s2)).length;
	}
	
	
	inline function compute(s:String)
	{
		var r:EReg = new EReg("[+ ;\\/]{1,3}","g");
		//var test = "999 99.00 / 99.50 + 99,50 999.99 + 444,44 / 333;888 777";
		var t = r.split(s);
		//trace(t);
		var sum:Float = 0;
		for (i in r.split(s))
		{
			sum += Std.parseFloat(i);
		}
		return sum;
	}
}