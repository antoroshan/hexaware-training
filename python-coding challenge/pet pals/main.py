import datetime
from entity.pet import Pet
from dao.shelter import PetShelter
from util.db_conn_util import get_connection
from exception.invalid_age import InvalidPetAgeException
from exception.insufficient_funds import InsufficientFundsException
from exception.adoption_error import AdoptionException

shelter = PetShelter()

def add_pet_manually():
    try:
        name = input("Enter pet name: ")
        age = int(input("Enter pet age: "))
        if age <= 0:
            raise InvalidPetAgeException()
        breed = input("Enter pet breed: ")

        pet = Pet(name, age, breed)
        shelter.add_pet(pet)

        conn = get_connection()
        cursor = conn.cursor()
        cursor.execute("INSERT INTO pets (name, age, breed) VALUES (?, ?, ?)", name, age, breed)
        conn.commit()
        print("✅ Pet added successfully!\n")
    except InvalidPetAgeException as e:
        print("❌", e)
    except Exception as e:
        print("❌ Unexpected error:", e)
    finally:
        try:
            conn.close()
        except:
            pass

def list_pets_from_db():
    try:
        conn = get_connection()
        cursor = conn.cursor()
        cursor.execute("SELECT name, age, breed FROM pets")
        rows = cursor.fetchall()
        if not rows:
            print("⚠️ No pets available in the database.\n")
        for row in rows:
            print(f"Name: {row.name}, Age: {row.age}, Breed: {row.breed}")
        print()
    except Exception as e:
        print("❌ Error fetching pets:", e)
    finally:
        try:
            conn.close()
        except:
            pass

def record_cash_donation():
    try:
        name = input("Enter donor name: ")
        amount = float(input("Enter donation amount: "))
        if amount < 10:
            raise InsufficientFundsException()
        date = datetime.date.today()

        conn = get_connection()
        cursor = conn.cursor()
        cursor.execute("INSERT INTO donations (donor_name, amount, donation_date, item_type) VALUES (?, ?, ?, ?)",
                       name, amount, date, None)
        conn.commit()
        print("💵 Donation recorded successfully!\n")
    except InsufficientFundsException as e:
        print("❌", e)
    except Exception as e:
        print("❌ Donation failed:", e)
    finally:
        try:
            conn.close()
        except:
            pass

def view_donors():
    try:
        conn = get_connection()
        cursor = conn.cursor()
        cursor.execute("SELECT donor_name, amount, donation_date FROM donations WHERE item_type IS NULL")
        rows = cursor.fetchall()
        if not rows:
            print("⚠️ No cash donors found.\n")
        else:
            print("\n🧾 Donor List:")
            for row in rows:
                print(f"Name: {row.donor_name}, Amount: ${row.amount}, Date: {row.donation_date}")
        print()
    except Exception as e:
        print("❌ Error retrieving donors:", e)
    finally:
        try:
            conn.close()
        except:
            pass

def view_adoption_events():
    try:
        conn = get_connection()
        cursor = conn.cursor()
        cursor.execute("SELECT id, event_name, event_date FROM adoption_events")
        events = cursor.fetchall()
        if not events:
            print("⚠️ No adoption events found.\n")
            return
        print("\n📅 Upcoming Adoption Events:")
        for event in events:
            print(f"ID: {event.id} | Name: {event.event_name} | Date: {event.event_date}")
        print()
        register = input("Do you want to register for any event? (yes/no): ").strip().lower()
        if register == "yes":
            event_id = int(input("Enter Event ID to register: "))
            name = input("Enter your name: ")
            cursor.execute("INSERT INTO participants (event_id, participant_name) VALUES (?, ?)", event_id, name)
            conn.commit()
            print("✅ Registered successfully!\n")
    except Exception as e:
        print("❌ Adoption Event Error:", e)
    finally:
        try:
            conn.close()
        except:
            pass

def main():
    while True:
        print("!!! PetPals Adoption Platform !!!")
        print("1. Add Pet ")
        print("2. View Pets")
        print("3. Record Cash Donation")
        print("4. View Donors")
        print("5. View & Register for Adoption Events")
        print("6. Exit")
        choice = input("Choose an option: ")

        if choice == '1':
            add_pet_manually()
        elif choice == '2':
            list_pets_from_db()
        elif choice == '3':
            record_cash_donation()
        elif choice == '4':
            view_donors()
        elif choice == '5':
            view_adoption_events()
        elif choice == '6':
            print("👋 Exiting... Bye!")
            break
        else:
            print("❌ Invalid choice. Try again.\n")

if __name__ == "__main__":
    main()
