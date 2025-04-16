class AdoptionException(Exception):
    def __init__(self, message="Adoption failed due to invalid data."):
        super().__init__(message)
