
// Interface Segregation Principle (ISP)
// Clients should not be forced to depend on interfaces they don't use.

// ❌ BAD: One large interface forces all methods on every implementer
abstract class MultiFunctionDeviceBad {
	void printDocument(String doc);
	void scanDocument(String doc);
	void faxDocument(String doc);
}

class OldPrinter implements MultiFunctionDeviceBad {
	@override
	void faxDocument(String doc) {
		throw UnimplementedError('Fax not supported');
	}

	@override
	void printDocument(String doc) {
		print('Printing: $doc');
	}

	@override
	void scanDocument(String doc) {
		throw UnimplementedError('Scan not supported');
	}
}

// ✅ GOOD: Split interfaces so implementers only depend on what they need
abstract class Printer {
	void printDocument(String doc);
}

abstract class Scanner {
	void scanDocument(String doc);
}

abstract class Fax {
	void faxDocument(String doc);
}

class SimplePrinter implements Printer {
	@override
	void printDocument(String doc) {
		print('SimplePrinter prints: $doc');
	}
}

class MultiFunctionPrinter implements Printer, Scanner, Fax {
	@override
	void faxDocument(String doc) {
		print('MFP faxing: $doc');
	}

	@override
	void printDocument(String doc) {
		print('MFP printing: $doc');
	}

	@override
	void scanDocument(String doc) {
		print('MFP scanning: $doc');
	}
}

void main() {
	print('=== Interface Segregation Principle ===\n');

	print('❌ BAD example (OldPrinter forced to implement unused methods):');
	final old = OldPrinter();
	old.printDocument('report.pdf');
	try {
		old.scanDocument('report.pdf');
	} catch (e) {
		print('  Error: ${e.runtimeType} (scan not supported)');
	}

	print('\n✅ GOOD example (classes implement only what they need):');
	final printer = SimplePrinter();
	final mfp = MultiFunctionPrinter();

	printer.printDocument('invoice.pdf');
	mfp.printDocument('contract.pdf');
	mfp.scanDocument('contract.pdf');
	mfp.faxDocument('contract.pdf');

	print('\n📌 ISP Rule: Break large interfaces into smaller, focused ones.');
}
