#include "vehicle_purchase.h"

namespace vehicle_purchase {

    // needs_license determines whether a license is needed to drive a type of vehicle. Only "car" and "truck" require a license.
    bool needs_license(std::string kind){
        return (kind == "car") || (kind == "truck");
    }

    // choose_vehicle recommends a vehicle for selection. It always recommends the vehicle that comes first in lexicographical order.
    std::string choose_vehicle(std::string option1, std::string option2) {
        std::string selection{option1};
        if (option1 > option2) {
            selection = option2;
        }
        return selection + " is clearly the better choice.";
    }

    // calculate_resell_price calculates how much a vehicle can resell for at a certain age.
    double calculate_resell_price(double original_price, double age) {
        double deprecated_percent{0.5};
        if (age < 3) {
            deprecated_percent = 0.8;
        } else if (age < 10) {
            deprecated_percent = 0.7;
        }
        return original_price * deprecated_percent;
    }

}  // namespace vehicle_purchase