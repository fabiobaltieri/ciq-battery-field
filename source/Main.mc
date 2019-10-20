// vim: syntax=c

using Toybox.Application;

class Main extends Application.AppBase {
	hidden var antDevice;

	function initialize() {
		AppBase.initialize();
	}

	function onStart(state) {
		return false;
	}

	function getInitialView() {
		return [new DataField()];
	}

	function onStop(state) {
		return false;
	}
}
