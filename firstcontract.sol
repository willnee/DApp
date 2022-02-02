pragma solidity >=0.7.0 <0.9.0;

contract Firstcoin {
    address public minter;
    mapping (address => uint) public balances;
    event sent(address from,address to,uint amount);

    modifier onlyMinter {
         require(msg.sender == minter);
         _;
    }
    modifier checkamount(uint amount) {
        require(amount <1e60);
        _;
    }
    modifier checkbalance(uint amount ){
        require(amount<=balances[msg.sender],"Khong du tien");
        _;
    }

    constructor (){
        minter= msg.sender;
    }
    function mint(address receiver,uint amount)public  onlyMinter checkamount(amount){
        balances[receiver] +=amount;
    
    }
    function send(address receiver,uint amount)public checkbalance(amount){
        balances[msg.sender] -=amount;
        balances[receiver] += amount;
        emit sent(msg.sender,receiver,amount);
    }
}