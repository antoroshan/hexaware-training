class InvalidPetAgeException(Exception):
    def __init__(self, message="Age must be a positive integer."):
        super().__init__(message)
