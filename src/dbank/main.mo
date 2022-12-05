import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank {
  stable var currentValue : Float = 300;
  // currentValue := 100; //value is chang

  stable var startTime = Time.now();
  startTime := Time.now();

  let id = 213143143432; // value cannot be changed
  // Debug.print(debug_show (currentValue, id));

  public func topUp(amount : Float) {
    currentValue += amount;
    // Debug.print(debug_show (currentValue));

  };

  // topUp();

  public func withdrawl(amount : Float) {
    let tempValue : Float = currentValue -amount;
    if (tempValue >= 0) {
      currentValue -= amount;
      // Debug.print(debug_show (currentValue));
    } else {
      Debug.print("Not possible");
    };
  };

  public query func checkBalance() : async Float {
    return currentValue;
  };

  public func compound() {
    let currentTime = Time.now();
    let timeElapsedNS = currentTime -startTime;
    let timeElapsedS = timeElapsedNS / 1000000000;
    // Debug.print(debug_show (timeElapsedS));
    currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsedS));
    startTime := currentTime;
  };
};
