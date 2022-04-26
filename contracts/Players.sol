
// Player Array to enter with Money 

// Distribute the money pool to players based on logic 


Team Contract

// Captain -> 2x
// Vice Caption -> 1.5x
// Batsman --> Runs (Boundaries)
// Bowler --> Wickets
// Fielder --> Catch / Runout

// Player 

1. Team 
2. Score 

// Token 

// Score -> Top 10 

contract Player {

    mapping(PlayerDetails => score) public playerScoreMapping;

    enum playerSkill{ 
        Captain, ViceCaptain, Batsman, Bowler, Fielder
    }
    struct PlayerDetails {
        uint playerId;
        string playerName;
        uint256 price;
        string team;
        playerSkill skill;
    }


    constructor(){
        this.playerStats = new PlayerStats();
    }
    
    // Register Player



    // Get player stats

}