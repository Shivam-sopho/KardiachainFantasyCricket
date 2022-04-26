//SPDX-License-Identifier: Unlicense


import "hardhat/console.sol";

contract FantasyCricket{
address public manager;
    address payable[] public players;

    // As of Solidity 0.5.0 constructors must be defined using the `constructor`
    // keyword.
    //
    // As of Solidity 0.7.0 visibility (public / external) is not needed for
    // constructors anymore.
    constructor() {
        manager = msg.sender;
    }

    function enter() public payable {
        // Note: Although optional, it's a good practice to include error messages
        // in `require` calls.
        require(
            msg.value > .01 ether,
            "A minimum payment of .01 ether must be sent to enter the lottery"
        );

        // As of Solidity 0.8.0 the global variable `msg.sender` has the type
        // `address` instead of `address payable`. So we must convert msg.sender
        // into `address payable` before we can add it to the players array.
        players.push(payable(msg.sender));
    }

    function random() private view returns (uint256) {
        // For an explanation of why `abi.encodePacked` is used here, see
        return
            uint256(
                keccak256(
                    abi.encodePacked(block.difficulty, block.number, players)
                )
            );
    }

    function pickWinner() public onlyOwner {
        uint256 index = random() % players.length;

        // As of Solidity 0.4.24 at least, `this` is a deprecated way to get the address of the
        // contract. `address(this)` must be used instead.
        address contractAddress = address(this);

        players[index].transfer(contractAddress.balance);
        players = new address payable[](0);
    }

    function getPlayers() public view returns (address payable[] memory) {
        return players;
    }

    modifier onlyOwner() {
        require(msg.sender == manager, "Only owner can call this function.");
        _;
    }
}