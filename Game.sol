pragma solidity >=0.7.0 <0.9.0;

contract Game {
    uint public countPlayer=0;
    mapping (address => Player) public players;
    enum Level {
        Beginer,
        Intermediate,
        Advance
    }

    struct Player{
        address addressPlayer;
        string fullname;
        Level myLevel;
        uint age;
        string sex;
    }
    
    function addPlayer(string memory fullname,uint age,string memory sex) public{
        players[msg.sender] = Player(msg.sender,fullname,Level.Beginer,age,sex);
        countPlayer +=1;
    }
    function getPlayerLevel(address addressPlayer) public returns (Level){
        return players[addressPlayer].myLevel;
    }
}