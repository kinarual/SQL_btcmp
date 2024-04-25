-- Anna (age:16,gender:'female',address:'Moscow')
SELECT CONCAT(name, ' ', '(age:' , age, ',gender:''', gender, ''',address:''', address, ''')') AS person_information
FROM person
