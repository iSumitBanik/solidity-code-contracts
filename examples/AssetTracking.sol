// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.0; 

contract AssetTracking{

  address public owner;

  // Created enum for Order Status
  enum OrderStatus{
    Confirmed,
    Shipped,
    Delivered,
    Cancelled
  }

  constructor(){
    owner = msg.sender;
  }

  struct Asset{
    uint assetId;
    OrderStatus status;
  }

  Asset[] public assets;


  modifier onlyOwner(){
    // Check for the condition if owner is msg.sender
    require(owner == msg.sender,"Not an owner");
    _;
  }

  function setOrderStatus(uint _assetId,OrderStatus _status) external onlyOwner{
    // Add asset values to the assets array
      assets.push(
        Asset({
          assetId: _assetId,
          status: _status
        })
      );
  }

  function updateOrderStatus(uint _assetIndex,OrderStatus _status) external onlyOwner{
    // Update the status for the passed asset index 
    assets[_assetIndex].status = _status;
  }


}