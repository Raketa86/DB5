import sqlite3

# Создаем базу данных и таблицу
conn = sqlite3.connect('shopIT.db')
cursor = conn.cursor()

# Создаем таблицу Computers
cursor.execute('''
    CREATE TABLE IF NOT EXISTS Computers (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        type TEXT,
        brand TEXT,
        price INTEGER
    )
''')

# Вставляем примеры данных
cursor.execute("INSERT INTO Computers (type, brand, price) VALUES (?, ?, ?)", ('ноутбук', 'HP', 50000))
cursor.execute("INSERT INTO Computers (type, brand, price) VALUES (?, ?, ?)", ('ноутбук', 'Lenovo', 45000))
cursor.execute("INSERT INTO Computers (type, brand, price) VALUES (?, ?, ?)", ('моноблок', 'HP', 60000))
cursor.execute("INSERT INTO Computers (type, brand, price) VALUES (?, ?, ?)", ('стационарный компьютер', 'Dell', 55000))
cursor.execute("INSERT INTO Computers (type, brand, price) VALUES (?, ?, ?)", ('ноутбук', 'Acer', 25000))
conn.commit()

# Запросы и вывод результатов в консоль
# Показать все компьютеры бренда "HP"
cursor.execute("SELECT * FROM Computers WHERE brand=?", ('HP',))
hp_computers = cursor.fetchall()
print("Компьютеры бренда HP:")
for computer in hp_computers:
    print(computer)

print()

# Показать компьютеры стоимостью более 40000
cursor.execute("SELECT * FROM Computers WHERE price > 40000")
expensive_computers = cursor.fetchall()
print("Компьютеры со стоимостью более 40000:")
for computer in expensive_computers:
    print(computer)

print()

# Показать компьютеры типа "ноутбук" и стоимостью менее 30000
cursor.execute("SELECT * FROM Computers WHERE type=? AND price < 30000", ('ноутбук',))
cheap_laptops = cursor.fetchall()
print("Ноутбуки со стоимостью менее 30000:")
for laptop in cheap_laptops:
    print(laptop)

# Закрываем соединение с базой данных
cursor.close()
conn.close()
