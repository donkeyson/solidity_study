contract SimpleStorage {
	uint storedData;
	function set(uint x) public {
		storedData = x;
	}
	function get() pubilc view returns (uint) {
		return storedData;
	}
}
