pragma solidity ^0.6.0;

contract SimpleStorage {

    uint256 public favoriteNumber;

    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }

    function retrieve() public view returns(uint256) {
        return favoriteNumber;
    }
    
    
pragma solidity ^0.6.0;

contract SimpleStorage {

    uint256 public favoriteNumber;

    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }

    function retrieve(uint256 favoriteNumber) public pure {
        favoriteNumber + favoriteNumber;
    }
}
