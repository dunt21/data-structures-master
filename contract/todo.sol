
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20; 

contract todoApp{
    enum Status{
        Pending,
        InProgress,
        Completed
    }

    struct Todo{
        uint id;
        string content;
        Status status;
    }
mapping (uint => Todo) public ID;
uint [] public todoIds;
uint generatedId = 0;


event TodoAdded(uint id, string content);

function addTodo(string memory _content) public {
    ID[generatedId] = Todo({id: generatedId, content: _content, status: Status.Pending});

    todoIds.push(generatedId);

    emit TodoAdded(generatedId, _content);
    generatedId++;

}

function updateStatus(uint _id, Status _status) public  {

require(_id < generatedId, "ID is not available");
ID[_id].status = _status;

}

function getTodo(uint _id) public view returns (uint, string memory, Status){
require(_id < generatedId, "ID is not available");
    Todo memory todos = ID[_id];

    return (todos.id, todos.content, todos.status);
}

}

