// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract Enum {
    Status public status;

    enum Status {
        none,
        pending,
        running,
        uploading,
        completed,
        failed
    }

    struct Order {
        address owner;
        Status status;
    }

    function get() external view returns (Status) {
        return status;
    }

    function set(Status _status) external {
        status=_status;
    }

    function finish() external {
        status = Status.completed;
    }

    function reset() external {
        delete status;
    }
}
