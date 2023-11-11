
const String tableProduct = 'productInfo';

const String productTable = ''' CREATE TABLE $tableProduct (
    id INTEGER PRIMARY KEY, title text not null, price REAL DEFAULT 0.00,
    description text null, category text null, image text null,
    quantity INTEGER DEFAULT 0
    )''';