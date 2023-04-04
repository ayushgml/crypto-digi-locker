// SPDX-License-Identifier: MIT

pragma solidity 0.8.18;

contract IdentityManagement {
    address public contractOwner;

    constructor() {
        contractOwner = msg.sender;
    }

    struct UserInfo {
        string fullName;
        string emailID;
        uint256 mobileNo;
    }

    struct UserDL {
        string DL_No;
        string DL_Name;
        string DL_DOB;
        uint256 DL_Hash;
        string DL_Address;
    }

    struct DLRequest {
        string requestedBy;
        string DL_No;
        string DL_Name;
        string DL_DOB;
        uint256 DL_Hash;
        string DL_Address;
        uint256 DL_OverAll_Status;
    }

    /*
     * ApprovalStatus
     * 0 -- default status
     * 1 -- Requested
     * 2 -- Approved
     * 3 -- Rejected
     */

    mapping(address => UserInfo[]) public userMap;
    mapping(address => UserDL[]) public userDLMap;
    mapping(address => DLRequest[]) public DLRequestMap;

    function addUser(
        address userAddress,
        string memory fullName,
        string memory emailID,
        uint256 mobileNo
    ) public {
        userMap[userAddress].push(UserInfo(fullName, emailID, mobileNo));
    }

    function addUserDL(
        address userAddress,
        string memory DL_No,
        string memory DL_Name,
        string memory DL_DOB,
        uint256 DL_Hash,
        string memory DL_Address
    ) public {
        userDLMap[userAddress].push(
            UserDL(DL_No, DL_Name, DL_DOB, DL_Hash, DL_Address)
        );
    }

    function addDLRequest(
        address userAddress,
        string memory requestedBy,
        string memory DL_No,
        string memory DL_Name,
        string memory DL_DOB,
        uint256 DL_Hash,
        string memory DL_Address,
        uint256 DL_OverAll_Status
    ) public {
        DLRequestMap[userAddress].push(
            DLRequest(
                requestedBy,
                DL_No,
                DL_Name,
                DL_DOB,
                DL_Hash,
                DL_Address,
                DL_OverAll_Status
            )
        );
    }

    function viewDLRequestLength(
        address userAddress
    ) public view returns (uint256) {
        return DLRequestMap[userAddress].length;
    }

    function viewDLRequestHeader(
        address userAddress,
        uint256 requestIndex
    )
        public
        view
        returns (string memory requestedBy, uint256 DL_OverAll_Status)
    {
        DLRequest storage request = DLRequestMap[userAddress][requestIndex];
        requestedBy = request.requestedBy;
        DL_OverAll_Status = request.DL_OverAll_Status;
    }

    // function viewDLRequestDetail(
    //     address userAddress,
    //     uint256 requestIndex
    // )
    //     public
    //     view
    //     returns (
    //         string memory requestedBy,
    //         uint256 DL_No,
    //         string memory DL_Name,
    //         string memory DL_DOB,
    //         uint256 DL_Hash,
    //         string memory DL_Address,
    //         uint256 DL_OverAll_Status
    //     )
    // {
    //     DLRequest storage request = DLRequestMap[userAddress][requestIndex];
    //     requestedBy = request.requestedBy;
    //     DL_No = request.DL_No;
    //     DL_Name = request.DL_Name;
    //     DL_DOB = request.DL_DOB;
    //     DL_Hash = request.DL_Hash;
    //     DL_Address = request.DL_Address;
    //     DL_OverAll_Status = request.DL_OverAll_Status;
    // }
}
