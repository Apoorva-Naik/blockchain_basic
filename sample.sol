pragma solidity ^0.5.1;

contract Property{
    uint public price =9000;
    string public location ="USA";
    address public owner;
    
    // global variables 
    uint public timestamp =block.timestamp; // timestamp of the block created
    uint public number = block.number;       // block number
    uint public difficulty =block.difficulty; // difficulty value used to show how hard is it to find a hash
    uint public gaslimit = block.gaslimit;  //maximum amount of gas allowed in a block to determine how many transactions can fit into a bloc
 
    
    uint public last_sent_value;
    
    
    address public caller;
    
    
    constructor()  public{
        owner = msg.sender;
    }
    
    function getBalacne() view public returns(uint){
        return address(this).balance;
    }
    
    // fallback payable function
   function () payable external{
        location ="london";
    }
    
    // transfering the balance to another account
   function transfer_balance(address  payable receipent_address, uint amount) public returns(bool){
       if(msg.sender == owner){
            if(amount <= getBalacne())
            {
                receipent_address.transfer(amount);
                return true;
                
            }
            else{
                return false;
            }
       }
    }
    
    function sendEther() payable public{
         last_sent_value =msg.value;
      
    }
            
    function setPrice(uint _price) public{
        caller =msg.sender;
        price =_price;
    }
    
    function setLocation(string memory _location) public{
        caller =msg.sender;
        location =_location;
    }
    
    
    // to check gasleft
    function f() view public returns(uint){
        
        uint start = gasleft();
        uint j=5;
        for(uint i =0;i<10;i++)
            j++;
            return start-gasleft();
    }
    
    
    // to check transaction gasprice
    function getTransaction() view public returns(uint){
        return tx.gasprice;
    }
}
