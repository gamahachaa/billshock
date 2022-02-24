package capture;

import decide._InformAboutNewLaw;
import ticket.TicketMobileFiveOneOne;
import ticket.TicketMobileFiveOneOneRefuse;
import xapi.Verb;
//import ticket.TicketMobileFiveOneOne;
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
	public static inline var BA:String = "BA";
	public static inline var INVOICE:String = "Invoices Nbers";
	public static inline var AMOUNTS:String = "Schock Amnounts";
	//static public inline var C_NAME:String = "capture.HighUsageData";

	public function new ()
	{
		super(
		[
			{
				ereg: new EReg("^[0-9]{4,7}$", "i"),
				hasTranslation:true,
				input:{
					width:200,
					prefix:BA,
					position: [bottom, left],
					debug:"123456"
				}
			},
			{
				//20100001492630
				ereg: new EReg("^[0-9]{14}([+ ;\\/]{1,3}[0-9]{14})*$", "i"),
				hasTranslation:true,
				input:{
					width:500,
					prefix:INVOICE,
					buddy:BA,
					position: [bottom, left],
					mustValidate : [Yes, No],
					debug:"12345678912345"
				}
			},
			{
				ereg: new EReg("^[0-9]+((\\.|,)[0-9]{1,2})?([+ ;\\/]{1,3}[0-9]+((\\.|,)[0-9]{1,2})?)*$", "i"),
				hasTranslation:true,
				input:{
					width:200,
					prefix:AMOUNTS,
					buddy:INVOICE,
					position: [bottom, left],
					mustValidate : [Yes, No],
					debug:"150"
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
			//Main.track.sendInitial("non-data");
			prepareTacking();
			this._nexts = [{step: TicketMobileFiveOneOne}];
			// NOT REFUSE
			super.onNoClick();
		}
	}
	
	function prepareTacking() 
	{
		//Main.track.initKeepActor();
		Main.trackH.setVerb(Verb.initialized);
		Main.trackH.setStatementRefs(null);
		//Main.track.setVerb("initialized");
		//Main.track.setStatementRef(null);
		var extensions:Map<String,Dynamic> = [];
		extensions.set("https://customercare.salt.ch/admin/contracts/customer/", Main.customer.iri);
		//Main.track.setCustomer(true);
		Main.trackH.setActivityObject( "non-data",null,null,"http://activitystrea.ms/schema/1.0/process",extensions );
        Main.trackH.send();
		Main.trackH.setVerb(Verb.resolved);
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
	*
	inline function test(s1:String, s2:String)
	{
		return rSeparator.split(StringTools.trim(s1)).length == rSeparator.split(StringTools.trim(s2)).length;
	} */
	
	
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
	/*function prepareXapi(activity:String)
	{
		Main.track.initKeepActor();
		Main.track.setVerb("initialized");
		Main.track.setStatementRef(null);
		Main.track.setCustomer(true);
		Main.track.setActivity( activity);
        Main.track.send();
		Main.track.setVerb("resolved");
	}*/
}