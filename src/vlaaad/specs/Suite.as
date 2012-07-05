/**
 * Author: Vlaaad
 * Date: 02.07.12
 */
package vlaaad.specs {
import vlaaad.specs.interfaces.ISpecLogger;
import vlaaad.specs.interfaces.TraceSpecLogger;

public class Suite {
	use namespace specs_internal;

	private const _specs:Vector.<Spec> = new <Spec>[];
	private var _logger:ISpecLogger;
	private var _printAll:Boolean = false;

	public function Suite() {
		init();
		addSpecs();
		printResults();
		destroy();
	}

	protected function init():void {
		setSpecLogger(new TraceSpecLogger());
	}

	public final function set printAll(printAll:Boolean):void {_printAll = printAll;}

	protected function addSpecs():void {

	}

	private function printResults():void {
		if (!_logger) return;
		var fails:int = 0;
		var successes:int = 0;
		var total:int = 0;
		for each(var spec:Spec in _specs) {
			_logger.logSpecResult(1, spec._describedEntity + ":");
			for each (var statement:Statement in spec._statements) {
				total++;
				var res:Boolean = statement.result;
				if (res) {
					successes++;
					_logger.logSpecResult(2, "- " + statement._statement);
					if (_printAll)
						_logger.logSpecResult(2, "  " + statement.comment);
				} else {
					fails++;
					_logger.logSpecResult(3, "- " + statement._statement + " fails because of:");
					_logger.logSpecResult(3, "  " + statement.comment);
				}
			}
			_logger.logSpecResult(1, "");
		}
		const resultType:int = fails > 0 ? 3 : 2;
		_logger.logSpecResult(resultType, "Total claims: " + total + ". Successful: " + successes + ", failed: " + fails);
	}


	public final function setSpecLogger(specLogger:ISpecLogger):void {
		if (!specLogger)return;
		_logger = specLogger;

	}

	protected function destroy():void {
		_logger = null;
	}

	protected final function add(spec:Spec):void {
		_specs.push(spec);
	}
}
}
