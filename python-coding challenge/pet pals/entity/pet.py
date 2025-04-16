class Pet:
    def __init__(self, name, age, breed):
        self.name = name
        self.age = age
        self.breed = breed

    def __str__(self):
        return f"Name: {self.name}, Age: {self.age}, Breed: {self.breed}"
