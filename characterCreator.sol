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
    uint roping = assignPoints(skillPoints, 4);
    uint cooking = assignPoints(skillPoints, 3;
    uint mechanics = assignPoints(skillPoints, 2);
    uint repairing = assignPoints(skillPoints, 2);
    uint diagnosing = assignPoints(skillPoints, 1);
    uint woundDressing = assignPoints(skillPoints, 3);
    uint suturing = assignPoints(skillPoints, 1);
    uint boneSetting = assignPoints(skillPoints, 1);
    uint surgeon = assignPoints(skillPoints, 1);
    
    // create a new Cowboy instance with the assigned skill points
    Cowboy memory newCowboy = Cowboy(owner, firearms, quickDraw, handToHandCombat, tracking, perception, animalHandling, riding, roping, cooking, mechanics, repairing, diagnosing, woundDressing, suturing, boneSetting, surgeon);
    cowboys[owner] = newCowboy;
    return newCowboy;
}