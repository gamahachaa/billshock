package capture.calls;

import decide.ApplyCompensationInMarilyn;
import decide.calls.CompensateFullAmount;
import format.csv.Data.Record;
import format.csv.Reader;
import lime.utils.Assets;
import ticket.TicketMobileFiveOneOneAccept;
//import ticket.TicketOneThreeOne;
import tstool.layout.History.Interactions;
import tstool.process.Action;
import tstool.process.Process;
using Lambda;
using StringTools;

/**
 * ...
 * @author bb
 */
class ActivateRezonOption extends Action
{
	var amount:Float;
	var compensate:Float;
	var pp_option_table:Array<Record>;
	static inline var PP_INDEX = 0;
	static inline var VOICE_OPTION_INDEX = 1;
	static inline var DATA_OPTION_INDEX = 2;
	static inline var VOICE_DETAILS_INDEX = 3;
	static inline var DATA_DETAILS_INDEX = 4;
	override public function create():Void
	{
		#if debug
		amount = 150;
		#else
		amount = Std.parseFloat(Main.customer.contract.balance.overdue);
		#end
		compensate = amount;
		try{
			pp_option_table = Reader.parseCsv(Assets.getText("assets/data/pp_to_options.csv"), ";");
			#if debug
			trace("capture.calls.ActivateRezonOption::create::pp_option_table", pp_option_table );
			#end
			var pp = Main.HISTORY.findValueOfFirstClassInHistory(WhichAddonForWhichPP, WhichAddonForWhichPP.MARILYN_PASTED_PP).value;
			#if debug
			trace("capture.calls.ActivateRezonOption::create::pp", pp );
			#end
			var r = pp_option_table.findIndex((e)->(e[PP_INDEX] == pp));
			#if debug
			trace("capture.calls.ActivateRezonOption::create::r", r );
			#end

			#if debug
			trace("capture.calls.ActivateRezonOption::create::details", details );
			#end
			if (r > - 1)
			{
				var record = pp_option_table[r];
				#if debug
				trace('capture.calls.ActivateRezonOption::create::record', record);
				trace(record[VOICE_OPTION_INDEX], record[VOICE_OPTION_INDEX] == "");
				trace(record[VOICE_DETAILS_INDEX], record[VOICE_DETAILS_INDEX] == "");
				trace(record[DATA_OPTION_INDEX], record[DATA_OPTION_INDEX] == "");
				trace(record[DATA_DETAILS_INDEX], record[DATA_DETAILS_INDEX] == "");
				#end
				this._detailTxt = 'Activate \n* Voice option > "${record[VOICE_OPTION_INDEX]}"';
				var options = '"${record[VOICE_OPTION_INDEX]}"';
				var details = record[VOICE_DETAILS_INDEX].split("|");
				for ( i in details)
				{
					if (i.trim() != "") this._detailTxt += "\n\t - " + i;
				}
				if (record[DATA_OPTION_INDEX] != "")
				{
					options += ' + "${record[DATA_OPTION_INDEX]}"';
					this._detailTxt +='\n\n* Data option > "${record[DATA_OPTION_INDEX]}"';
					var detailsData = record[DATA_DETAILS_INDEX].split("|");
					for ( j in detailsData)
					{
						if (j.trim() != "") this._detailTxt += "\n\t - " + j;
					}
				}
				_titleTxt = _titleTxt.replace("<PP>", pp);
				_titleTxt = _titleTxt.replace("<OPTION>", options);
				#if debug
				trace("capture.calls.ActivateRezonOption::create::_titleTxt", _titleTxt );
				#end
			}
			else{
				// display locale text
				_titleTxt = _titleTxt.replace("<PP>", "PP_NOT_FOUND");
				_titleTxt = _titleTxt.replace("<OPTION>", "PACKAGE_NOT_FOUND");
			}

		}
		catch (e)
		{
			trace(e);
		}

		//this._detailTxt +=
		super.create();
	}
	override public function onClick():Void
	{
		this._nexts = [{step: CompensateFullAmount, params: []}];
		super.onClick();
	}

	//override public function pushToHistory(buttonTxt:String, interactionType:Interactions,?values:Map<String,Dynamic>=null):Void
	//{
	//super.pushToHistory(buttonTxt, interactionType, [TOTAL_SCHOCK=>amount, COMPENSATE=> compensate]);
	//}
}