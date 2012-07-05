/**
 * Author: Vlaaad
 * Date: 02.07.12
 */
package vlaaad.specs {
public class StatementContinue {
	private var _statement:Statement;

	public function StatementContinue(statement:Statement) {
		_statement = statement;
	}

	public function get and():So {
		const so:So = new So(_statement);
		_statement.andSo(so);
		return so;
	}

	public function get or():So {
		const so:So = new So(_statement);
		_statement.orSo(so);
		return so;
	}
}
}
