pragma solidity ^0.4.16;

contract TokenERC20 {
  // 토큰의 공개 변수들
  string public name;
  string public symbol;
  uint8 public decimals = 18;
  //18 decials는 자주 사용하는 디폴트 값
  uint256 public totalSupply;
  
  // 배열 생성. 
  mapping (address => uint256) public balanceOf;
  mapping (address => mapping (address => uint256)) public allowance;
 
  //이벤트 생성
  event Transfer(address indexed from, address indexed to, uint256 value);
  
  event Approval(address indexed _owner, address indexed _spender, uint256 _value);
  
  //클라이언트에게 소각량을 알려줌
  event Burn(address indexed from, uint256 value);
  
  //생성자 함수
  function TokenERC20(
    uint256 initialSupply,
    string tokenName,
    string tokenSymbol
  ) public {
    totalSupply = initialSupply * 10 ** uint256(decimals);
    balanceOf[msg.sender] = totalSupply;
    name = tokenName;
    symbol = tokenSymbol;
  }
  
  function buy() payable returns (uint amount){
    amount = msg.value / buyPrice;
    _transfer(this, msg.sender, amount);
    return amount;
  }
  
  function sell(uint amount) returns (uint revenue){
    require(balanceOf[msg.sender] >= amount); //전송자가 판매하기에 충분한 양을 보유했는지 체크
    balanceOf[this] += amount; //소유자에게 amount 더하기
    balanceOf[msg.sender] -= amount; //전송자에게서 amount 빼기
    revenue = amount * sellPrice;
    msg.sender.transfer(revenue); //이더를 판매자에게 전송한다. 
    Transfer(msg.sender, this, amount); //이벤트를 실행
    return revenue; //함수를 끝내고 리턴
  }
  
}
  
