pragma solidity ^0.6.0;

contract MigrantStory {
    // The player's starting money
    uint256 public money;

    // The player's caravan
    struct Caravan {
        uint256 capacity; // The total number of supplies and people that can be carried
        uint256 supplies; // The number of supplies currently being carried
        uint256 hands; // The number of hired hands currently in the caravan
    }
    Caravan public caravan;

    // The supplies that can be purchased
    struct Supply {
        string name; // The name of the supply
        uint256 cost; // The cost of the supply
        uint256 weight; // The weight of the supply
    }
    Supply[] public supplies;

    // The hands that can be hired
    struct Hand {
        string name; // The name of the hand
        uint256 cost; // The cost of hiring the hand
        uint256 proficiency; // The hand's proficiency level (1-5)
    }
    Hand[] public hands;

    // Initializes the game
    constructor() public {
        money = 1000;
        caravan.capacity = 1000;
        supplies = [
            {name: "Food", cost: 100, weight: 50},
            {name: "Water", cost: 50, weight: 100},
            {name: "Clothing", cost: 200, weight: 75},
            {name: "Shelter", cost: 300, weight: 100},
            {name: "Medical supplies", cost: 400, weight: 50},
            {name: "Tools and equipment", cost: 500, weight: 200},
            {name: "Transportation", cost: 600, weight: 400},
            {name: "Entertainment", cost: 100, weight: 25},
        ];
        hands = [
            {name: "Cowboy Billy", cost: 100, proficiency: 1},
            {name: "Cowboy Jack", cost: 200, proficiency: 2},
            {name: "Cowboy Sam", cost: 300, proficiency: 3},
            {name: "Cowboy Tom", cost: 400, proficiency: 4},
            {name: "Cowboy Frank", cost: 500, proficiency: 5},
        ];
    }

    // Buys a supply
    function buySupply(uint256 supplyIndex) public payable {
        // Check if the player has enough money
        if (msg.value < supplies[supplyIndex].cost) {
            revert();
        }
            // Check if the caravan has enough capacity
            if (caravan.capacity < caravan.supplies + supplies[supplyIndex].weight) {
                revert();
            }
            // Subtract the cost from the player's money
            money -= supplies[supplyIndex].cost;
            // Add the supply to the caravan
            caravan.supplies += supplies[supplyIndex].weight;
        }

        // Hires a hand
        function hireHand(uint256 handIndex) public payable {
            // Check if the player has enough money
            if (msg.value < hands[handIndex].cost) {
                revert();
            }
            // Subtract the cost from the player's money
            money -= hands[handIndex].cost;
            // Add the hand to the caravan
            caravan.hands++;
        }

        function createRandomCowboy() public returns (Cowboy) {
            address owner = msg.sender;
            uint skillPoints = rollDice() + rollDice();

            // assign skill points based on class
            uint firearms = assignPoints(skillPoints, 4);
            uint quickDraw = assignPoints(skillPoints, 4);
            uint handToHandCombat = assignPoints(skillPoints, 3);
            uint tracking = assignPoints(skillPoints, 3);
            uint perception = assignPoints(skillPoints, 3);
            uint animalHandling = assignPoints(skillPoints, 3);
            uint riding = assignPoints(skillPoints, 5);
            uint roping = assignPoints(skillPoints, 5);
            uint cooking = assignPoints(skillPoints, 3);
            uint mechanics = assignPoints(skillPoints, 2);
            uint repairing = assignPoints(skillPoints, 2);
            uint diagnosing = assignPoints(skillPoints, 2);
            uint woundDressing = assignPoints(skillPoints, 2);
            uint suturing = assignPoints(skillPoints, 1);
            uint boneSetting = assignPoints(skillPoints, 1);
            uint surgeon = assignPoints(skillPoints, 1);

            // create a new Cowboy instance with the assigne skill points
            Cowboy memory newCowboy = Cowboy(owner, firearms, quickDraw, handToHandCombat, tracking, perception, animalHandling, riding, roping, cooking, mechanics, repairing, diagnosing, woundDressing, suturing, boneSetting, surgeon);
            cowboys[owner] = newCowboy;
            return newCowboy;

        }
    }




