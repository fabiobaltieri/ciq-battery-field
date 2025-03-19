// vim: syntax=c

using Toybox.WatchUi;
using Toybox.System;
using Toybox.Math;
using Toybox.FitContributor;

class DataField extends WatchUi.SimpleDataField {
	const BATT_FIELD_ID = 0;
	hidden var batt_field;
	hidden var old_batt;

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
		var new_batt = stats.battery;
		if (new_batt != old_batt) {
			batt_field.setData(new_batt);
			old_batt = new_batt;
		}
		return stats.battery.format("%0.1f");
	}
}
