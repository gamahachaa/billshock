package capture;

import tstool.layout.History.Interactions;
import tstool.process.DescisionMultipleInput;
import tstool.process.Process;
import tstool.salt.Role;
import tstool.utils.ExpReg;

using tstool.utils.StringUtils;

/**
 * ...
 * @author bb
 */
class IsCompTicketOpened extends DescisionMultipleInput 
{
	static inline var MSISDN:String = "MSISDN";
	static inline var SO_TICKET:String = "SO ticket";
	static inline var CONTACT:String = "Contact Phone";
	static inline var EMAIL:String = "email";
	
	public function new ()
	{
		super(
		[{
			ereg: new EReg(ExpReg.MISIDN_LOCAL, "i"),
			hasTranslation:true,
			input:{
				width:150,
				prefix:MSISDN,
				position: [bottom, left],
				debug: "078 787 1676",
				mustValidate: [Yes, No]
			}
		},
		{
			ereg: new EReg("^(11)[0-9]{6}$", "i"),
			hasTranslation:true,
			input:{
				width:150,
				prefix:SO_TICKET,
				buddy:MSISDN,
				position: [top, right],
				debug: "11123456",
				mustValidate: [Yes]
			}
		}
		,
		{
			ereg: new EReg(ExpReg.MISIDN_LOCAL, "i"),
			hasTranslation:true,
			input:{
				width:150,
				prefix:CONTACT,
				buddy:MSISDN,
				position: [bottom, left],
				debug: "078 787 8673",
				mustValidate: [Exit]
			}
		}
		,
		{
			ereg: new EReg(ExpReg.EMAIL, "i"),
			hasTranslation:true,
			input:{
				width:300,
				prefix:EMAIL,
				buddy:CONTACT,
				position: [top, right],
				debug: "georges.cloonez@whatelse.com",
				mustValidate: [Exit]
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
		Main.customer.voIP = multipleInputs.getText(MSISDN).removeWhite();
		Main.customer.iri = Main.customer.voIP;
		Main.customer.contract.mobile = multipleInputs.getText(CONTACT).removeWhite();
		Main.customer.contract.owner = new Role(owner, "", multipleInputs.getText(EMAIL).removeWhite());

		Main.track.setVerb("initialized");
		Main.track.setStatementRef(null);
		Main.track.setCustomer(true);
		Main.track.setActivity( "billshock" );
        Main.track.send();
		Main.track.setVerb("resolved");

		Process.STORE(MSISDN, '${Main.customer.voIP}' );
		return super.validate(interaction);
	}
	/*override public function validateNo():Bool
	{
		return true;
	}*/
	
	
}