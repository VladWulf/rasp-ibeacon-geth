pragma solidity ^0.4.0;

contract BeaconsRecorderContract {

  // Beacon's index will be automatically ordered in the app
  // Then it will be mapped to the beacons mapping
  mapping (uint => Beacon) beacons;
  string beaconReward;

  struct Beacon{
    string name;
    uint position;
  }

  struct InfoModule{
    uint creaTime;
    uint lastCallTime;

  }
  InfoModule info;


  function BeaconsRecorderContract(){
    info.creaTime = now;
  }

  function mapBeacons(string name1, uint pos1,
                      string name2, uint pos2,
                      string name3, uint pos3)
                      returns(string, string) {
    beacons[0].name = name1;
    beacons[0].position = pos1;
    beacons[1].name = name2;
    beacons[1].position = pos2;
    beacons[2].name = name3;
    beacons[2].position = pos3;

    info.lastCallTime = now;
    calculateReward();
    return ('Beacons updated on the ledger', beaconReward);
  }

  function calculateReward() internal{
    uint bA = beacons[0].position;
    uint bB = beacons[1].position;
    uint bC = beacons[2].position;

    // pattern a b c
    if(bA < bB && bB < bC){
      beaconReward = 'Reward 1: A B C';
    }
    // pattern c b a
    if(bC < bB && bB < bA){
      beaconReward = 'Reward 2: C B A';
    }
    // pattern c a b
    if(bC < bA && bA < bB){
      beaconReward = 'Reward 3: C A B';
    }
  }

  function getInfo() constant
    returns(uint, uint){
      return(
        info.creaTime,
        info.lastCallTime
      );
    }

  function getBeaconOrder() constant
    returns(string, string, string, string) {
      return (
        beacons[0].name,
        beacons[1].name,
        beacons[2].name,
        beaconReward
      );
  }
}
