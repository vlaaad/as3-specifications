/**
 * Author: Vlaaad
 * Date: 03.07.12
 */
package vlaaad.specs.should {
import flash.utils.getTimer;

import vlaaad.specs.Statement;
import vlaaad.specs.StatementContinue;
import vlaaad.specs.specs_internal;

public class FunctionShould extends Should {
	private var _func:Function;
	private var _params:Array;

	use namespace specs_internal;

	public function FunctionShould(func:Function, params:Array, statement:Statement) {
		super(statement);
		_func = func;
		_params = params;
	}

	public function shouldThrowError(errorMessage:String = null):StatementContinue {
		assertThrows(errorMessage);
		return _statementContinue;
	}

	public function shouldNotThrowError(errorMessage:String = null):StatementContinue {
		assertNotThrows(errorMessage);
		return _statementContinue;
	}

	/**
	 * Time in milliseconds
	 */
	public function get executionTime():ValueShould {
		var error:Error;
		const start:int = getTimer();
		try {
			_func.apply(null, _params);
		} catch (e:Error) {
			error = e;
		} finally {
			const time:int = getTimer() - start;
		}
		if (error) {
			setResult(false, "function should not throw");
		} else {
			setResult(true, "function should not throw");
		}
		return _statementContinue.and.value(time);
	}

	public function get returnedValue():ValueShould {
		var v:* = assertNotThrows(null);
		return _statementContinue.and.value(v);
	}

	private function assertThrows(errorMessage:String):void {
		var error:Error;
		try {
			_func.apply(null, _params);
		} catch (e:Error) {
			error = e;
		}
		if (error) {
			if (!errorMessage) {
				setResult(true, "function should throw");
			} else {
				if (error.message == errorMessage) {
					setResult(true, "function should throw error with message \"" + errorMessage + "\"");
				} else {
					setResult(false, "function should throw error with message \"" + errorMessage + "\", message was: \"" + error.message + "\"");
				}
			}
		} else {
			setResult(false, "function should throw");
		}

	}

	private function assertNotThrows(errorMessage:String):* {
		var error:Error;
		try {
			var returned:* = _func.apply(null, _params);
		} catch (e:Error) {
			error = e;
		}
		if (error) {
			if (errorMessage) {
				if (errorMessage == error.message) {
					setResult(false, "function should not throw error with message \"" + errorMessage + "\"");
				} else {
					setResult(true, "function should not throw error with message \"" + errorMessage + "\", message was \"" + error.message + "\"");
				}
			} else {
				setResult(false, "function should not throw");
			}
		} else {
			setResult(true, "function should not throw");
		}
		return returned;
	}
}
}
