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
        Level playerLevel;
        uint age;
        string sex;
        uint createTime;
    }
    
    function addPlayer(string memory fullname,uint age,string memory sex) public{
        players[msg.sender] = Player(msg.sender,fullname,Level.Beginer,age,sex,block.timestamp);
        countPlayer +=1;
    }
    function getPlayerLevel(address addressPlayer) public returns (Level){
        return players[addressPlayer].myLevel;
    }
    function changePlayerLevel(address playeraddress)public {
        Player storage player =players[playeraddress];
        if(block.timestamp >= player.createTime +15)
        {
            player.playerLevel = Level.Intermediate;
        }
    }
}