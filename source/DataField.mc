// vim: syntax=c

using Toybox.WatchUi;
using Toybox.System;
using Toybox.FitContributor;

class DataField extends WatchUi.SimpleDataField {
	const BATT_FIELD_ID = 0;
	hidden var batt_field;

	function initialize() {
		SimpleDataField.initialize();
		label = "Battery";

		batt_field = createField(
				"battery",
				BATT_FIELD_ID,
				FitContributor.DATA_TYPE_FLOAT,
				{:mesgType=>FitContributor.MESG_TYPE_RECORD, :units=>"%"});
	}

	function compute(info) {
		var stats = System.getSystemStats();
		batt_field.setData(stats.battery);
		return stats.battery.format("%0.1f");
	}
}
