#include <iostream>
#include <fstream>
#include <string>
using namespace std;


// Base Class : Vehicle
// ==========================
class Vehicle {
protected:
    string id;
    string brand;
    bool rented;
    string renterName;
    string renterPhone;
    int rentalDays;
    double rentPerDay;
    double amountPaid;

public:
    Vehicle() {
        id = "";
        brand = "";
        rented = false;
        renterName = "";
        renterPhone = "";
        rentalDays = 0;
        rentPerDay = 0;
        amountPaid = 0;
    }

    Vehicle(string vid, string vbrand, double pricePerDay) {
        id = vid;
        brand = vbrand;
        rented = false;
        renterName = "";
        renterPhone = "";
        rentalDays = 0;
        rentPerDay = pricePerDay;
        amountPaid = 0;
    }

    virtual ~Vehicle() {}

    virtual void display() = 0;

    void rent(string name, string phone, int days) {
        rented = true;
        renterName = name;
        renterPhone = phone;
        rentalDays = days;
        amountPaid = days * rentPerDay;
    }

    void makeAvailable() {
        rented = false;
        renterName = "";
        renterPhone = "";
        rentalDays = 0;
        amountPaid = 0;
    }

    bool isAvailable() { return !rented; }
    string getId() { return id; }

    virtual void save(ofstream& fout) {
        fout << "Type: Vehicle" << endl;
        fout << "ID: " << id << endl;
        fout << "Brand: " << brand << endl;
        fout << "RentPerDay: " << rentPerDay << endl;
        fout << "Availability: " << (rented ? "Not Available" : "Available") << endl;
        if (rented) {
            fout << "Renter Name: " << renterName << endl;
            fout << "Renter Phone: " << renterPhone << endl;
            fout << "Rental Days: " << rentalDays << endl;
            fout << "Amount Paid: " << amountPaid << endl;
        }
        fout << endl;
    }

    virtual void load(ifstream& fin) {
        string availStatus;
        fin.ignore(1000, ':'); fin >> id;
        fin.ignore(1000, ':'); fin >> brand;
        fin.ignore(1000, ':'); fin >> rentPerDay;
        fin.ignore(1000, ':'); fin.ignore();
        getline(fin, availStatus);
        rented = (availStatus == "Not Available");
        if (rented) {
            fin.ignore(1000, ':'); getline(fin, renterName);
            fin.ignore(1000, ':'); getline(fin, renterPhone);
            fin.ignore(1000, ':'); fin >> rentalDays;
            fin.ignore(1000, ':'); fin >> amountPaid;
            fin.ignore();
        } else {
            renterName = renterPhone = "";
            rentalDays = 0;
            amountPaid = 0;
        }
    }
};

// ==========================
// Derived Class : Car
// ==========================
class Car : public Vehicle {
    int seats;

public:
    Car() { seats = 0; }
    Car(string vid, string vbrand, int vseats, double pricePerDay) {
        id = vid;
        brand = vbrand;
        rented = false;
        seats = vseats;
        rentPerDay = pricePerDay;
        renterName = renterPhone = "";
        rentalDays = 0; amountPaid = 0;
    }

    void display() {
        cout << "Car [ID: " << id << ", Brand: " << brand
             << ", Seats: " << seats << ", ";
        if (!rented) cout << "Status: Available";
        else cout << "Status: Not Available, Renter: " << renterName
                  << ", Phone: " << renterPhone
                  << ", Days: " << rentalDays
                  << ", Amount: " << amountPaid;
        cout << "]" << endl;
    }

    void save(ofstream& fout) {
        fout << "Type: Car" << endl;
        fout << "ID: " << id << endl;
        fout << "Brand: " << brand << endl;
        fout << "Seats: " << seats << endl;
        fout << "RentPerDay: " << rentPerDay << endl;
        fout << "Availability: " << (rented ? "Not Available" : "Available") << endl;
        if (rented) {
            fout << "Renter Name: " << renterName << endl;
            fout << "Renter Phone: " << renterPhone << endl;
            fout << "Rental Days: " << rentalDays << endl;
            fout << "Amount Paid: " << amountPaid << endl;
        }
        fout << endl;
    }

    void load(ifstream& fin) {
        Vehicle::load(fin);
        fin.ignore(1000, ':'); fin >> seats;
        fin.ignore();
    }
};

// ==========================
// Derived Class : Motorcycle
// ==========================
class Motorcycle : public Vehicle {
    int cc;

public:
    Motorcycle() { cc = 0; }
    Motorcycle(string vid, string vbrand, int vcc, double pricePerDay) {
        id = vid;
        brand = vbrand;
        rented = false;
        cc = vcc;
        rentPerDay = pricePerDay;
        renterName = renterPhone = "";
        rentalDays = 0; amountPaid = 0;
    }

    void display() {
        cout << "Motorcycle [ID: " << id << ", Brand: " << brand
             << ", CC: " << cc << ", ";
        if (!rented) cout << "Status: Available";
        else cout << "Status: Not Available, Renter: " << renterName
                  << ", Phone: " << renterPhone
                  << ", Days: " << rentalDays
                  << ", Amount: " << amountPaid;
        cout << "]" << endl;
    }

    void save(ofstream& fout) {
        fout << "Type: Motorcycle" << endl;
        fout << "ID: " << id << endl;
        fout << "Brand: " << brand << endl;
        fout << "CC: " << cc << endl;
        fout << "RentPerDay: " << rentPerDay << endl;
        fout << "Availability: " << (rented ? "Not Available" : "Available") << endl;
        if (rented) {
            fout << "Renter Name: " << renterName << endl;
            fout << "Renter Phone: " << renterPhone << endl;
            fout << "Rental Days: " << rentalDays << endl;
            fout << "Amount Paid: " << amountPaid << endl;
        }
        fout << endl;
    }

    void load(ifstream& fin) {
        Vehicle::load(fin);
        fin.ignore(1000, ':'); fin >> cc;
        fin.ignore();
    }
};

// ==========================
// Rental System Class
// ==========================
class RentalSystem {
    Vehicle** vehicles;
    int count;
    int capacity;

public:
    RentalSystem() {
        capacity = 10;
        vehicles = new Vehicle*[capacity];
        count = 0;
        loadData();
    }

    ~RentalSystem() {
        saveData();
        for (int i = 0; i < count; i++) delete vehicles[i];
        delete[] vehicles;
    }

    void resize() {
        capacity *= 2;
        Vehicle** temp = new Vehicle*[capacity];
        for (int i = 0; i < count; i++) temp[i] = vehicles[i];
        delete[] vehicles;
        vehicles = temp;
    }

    void addVehicle() {
        if (count == capacity) resize();

        int type;
        cout << "Add (1-Car, 2-Motorcycle): ";
        cin >> type;
        string id, brand;
        double price;
        cout << "Enter ID: "; cin >> id;
        cout << "Enter Brand: "; cin >> brand;
        cout << "Enter Rent per Day: "; cin >> price;

        if (type == 1) {
            int seats;
            cout << "Enter Seats: "; cin >> seats;
            vehicles[count++] = new Car(id, brand, seats, price);
        } else if (type == 2) {
            int cc;
            cout << "Enter CC: "; cin >> cc;
            vehicles[count++] = new Motorcycle(id, brand, cc, price);
        }
    }

    void displayAll() {
        cout << "\n--- All Vehicles ---\n";
        for (int i = 0; i < count; i++) vehicles[i]->display();
    }

    void displayAvailable() {
        cout << "\n--- Available Vehicles ---\n";
        for (int i = 0; i < count; i++)
            if (vehicles[i]->isAvailable()) vehicles[i]->display();
    }

    void rentVehicle() {
        string id;
        cout << "Enter Vehicle ID to Rent: ";
        cin >> id;
        for (int i = 0; i < count; i++) {
            if (vehicles[i]->getId() == id && vehicles[i]->isAvailable()) {
                string name, phone;
                int days;
                cin.ignore();
                cout << "Enter Renter's Name: ";
                getline(cin, name);
                cout << "Enter Renter's Phone: ";
                getline(cin, phone);
                cout << "Enter Number of Days to Rent: ";
                cin >> days;
                vehicles[i]->rent(name, phone, days);
                cout << "Vehicle rented successfully!\n";
                return;
            }
        }
        cout << "Vehicle not found or already rented!\n";
    }

    void returnVehicle() {
        string id;
        cout << "Enter Vehicle ID to Return: ";
        cin >> id;
        for (int i = 0; i < count; i++) {
            if (vehicles[i]->getId() == id && !vehicles[i]->isAvailable()) {
                vehicles[i]->makeAvailable();
                cout << "Vehicle returned successfully!\n";
                return;
            }
        }
        cout << "Vehicle not found or already available!\n";
    }

    void saveData() {
        ofstream fout("vehicles.txt");
        if (!fout) {
            cerr << "Error saving file!\n";
            return;
        }
        for (int i = 0; i < count; i++) vehicles[i]->save(fout);
        fout.close();
    }

    void loadData() {
        ifstream fin("vehicles.txt");
        if (!fin) return;

        string line, type;
        while (getline(fin, line)) {
            if (line.empty()) continue;
            type = line.substr(line.find(":")+2);
            Vehicle* v = nullptr;

            if (type == "Car") v = new Car();
            else if (type == "Motorcycle") v = new Motorcycle();
            else continue;

            if (v) {
                v->load(fin);
                if (count == capacity) resize();
                vehicles[count++] = v;
            }
        }
        fin.close();
    }
};

// ==========================
// Main Function
// ==========================
int main() {
    RentalSystem rs;
    int choice;

    do {
        cout << "\n===== Vehicle Rental System =====\n";
        cout << "1. Add Vehicle\n2. Display All Vehicles\n3. Display Available Vehicles\n";
        cout << "4. Rent Vehicle\n5. Return Vehicle\n6. Save Data\n7. Load Data\n8. Exit\n";
        cout << "Enter choice: ";
        cin >> choice;

        switch (choice) {
            case 1: rs.addVehicle(); break;
            case 2: rs.displayAll(); break;
            case 3: rs.displayAvailable(); break;
            case 4: rs.rentVehicle(); break;
            case 5: rs.returnVehicle(); break;
            case 6: rs.saveData(); break;
            case 7: rs.loadData(); break;
            case 8: cout << "Exiting...\n"; break;
            default: cout << "Invalid choice!\n";
        }
    } while (choice != 8);

    return 0;
}
