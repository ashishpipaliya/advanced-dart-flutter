// Adapter Pattern
// Convert the interface of a class into another interface that clients expect.
// Adapter lets classes work together that couldn't otherwise because of incompatible interfaces.

// Legacy Shareholder system (from old database/API we can't change)
class LegacyShareholder {
  String name;
  int shares;
  double investmentAmount;

  LegacyShareholder(this.name, this.shares, this.investmentAmount);

  // Old system has different method names and structure
  String getName() => name;
  int getShares() => shares;
  double getInvestment() => investmentAmount;
}

// Modern interface our app expects
abstract class ShareholderData {
  String getFullInfo();
  double getShareValue();
}

// Adapter: bridges Legacy Shareholder to Modern ShareholderData interface
class ShareholderAdapter implements ShareholderData {
  final LegacyShareholder legacyShareholder;
  final double sharePrice;

  ShareholderAdapter(this.legacyShareholder, this.sharePrice);

  @override
  String getFullInfo() {
    // Adapts old structure to new format
    final info = legacyShareholder.getName();
    final count = legacyShareholder.getShares();
    return '$info holds $count shares';
  }

  @override
  double getShareValue() {
    // Converts old data to new calculation
    return legacyShareholder.getShares() * sharePrice;
  }
}

void main() {
  print('=== Adapter Pattern ===\n');

  // Legacy system data (can't change this)
  final legacyShareholder = LegacyShareholder('John Doe', 150, 15000.0);
  print('Legacy Shareholder:');
  print('  Name: ${legacyShareholder.getName()}');
  print('  Shares: ${legacyShareholder.getShares()}');
  print('  Investment: \$${legacyShareholder.getInvestment()}');

  // Use adapter to make it compatible with modern app
  print('\nUsing Adapter to modern interface:');
  final adapter = ShareholderAdapter(legacyShareholder, 85.50);
  print('  Info: ${adapter.getFullInfo()}');
  print('  Share Value: \$${adapter.getShareValue().toStringAsFixed(2)}');

  // Now multiple shareholders work seamlessly
  print('\nMultiple shareholders:');
  final shareholders = [
    ShareholderAdapter(LegacyShareholder('Alice', 200, 18000.0), 85.50),
    ShareholderAdapter(LegacyShareholder('Bob', 100, 9000.0), 85.50),
    ShareholderAdapter(LegacyShareholder('Carol', 75, 6500.0), 85.50),
  ];

  for (var sh in shareholders) {
    print('  ${sh.getFullInfo()} → Value: \$${sh.getShareValue().toStringAsFixed(2)}');
  }

  print('\n📌 Key idea: Adapter makes incompatible interfaces work together.');
  print('   Perfect for integrating legacy systems without modification.');
}
