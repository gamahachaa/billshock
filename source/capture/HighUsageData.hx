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
	public static inline var BA:String = "Billng account";
	public static inline var INVOICE:String = "Invoice Nber";
	public static inline var AMOUNT:String = "Schocking amnount";

	public function new ()
	{
		super(
		[
			{
				ereg: new EReg("[0-9]{6}","i"),
				input:{
					width:250,
					prefix:BA,
					position: [bottom, left],
					debug:"123456"
				}
			},
			{
				//20100001492630
				ereg: new EReg("[0-9]{14}","i"),
				input:{
					width:250,
					prefix:INVOICE,
					buddy:BA,
					position: [bottom, left],
					debug:"12345678912345"
				}
			},
			{
				ereg: new EReg("[0-9]+","i"),
				input:{
					width:250,
					prefix:AMOUNT,
					buddy:INVOICE,
					position: [top, right],
					debug:"999"
				}
			}
		]
		);
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
		if (validateYes())
		{
			this._nexts = [{step: TicketMobileFiveOneOne}];
			super.onNoClick();
		}
	}
	override public function validate(interaction:Interactions):Bool
	{
		Main.customer.contract.balance = new Balance("", this.multipleInputs.inputs.get(AMOUNT).getInputedText());
		Process.STORE("SCHOCK ","CHF " + Main.customer.contract.balance.overdue );
		//Process.STORAGE.set("reminder", ' ${Main.customer.voIP}' );
		return super.validate(interaction);
	}
	/*
	override public function validateNo():Bool
	{
		return true;
	}
	*/
	
}