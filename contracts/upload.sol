// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract upload
{
    struct Access
    {
        address user;
        bool access;
    }

    // user storing images(url)
    mapping(address=>string[])value;
    // accessList which will store shared user list
    mapping(address=>Access[])accessList;
    //which address has given to which address access
    mapping(address=>mapping(address=>bool))ownership;
    mapping(address=>mapping(address=>bool))previousData;

    function add(address _user, string memory url) external
    {
        value[_user].push(url);
    }


    function allow(address user) external{
        ownership[msg.sender][user]=true;
        if(previousData[msg.sender][user]==true)
        {
            for(uint i=0;i<accessList[msg.sender].length;i++)
            {
                if(accessList[msg.sender][i].user == user)
                {
                    accessList[msg.sender][i].access=true;
                }
            }
        }
        else
        {
            accessList[msg.sender].push(Access(user,true));
            previousData[msg.sender][user]==true;
        }
    }

    function disAllow(address user) public{
        ownership[msg.sender][user]=false;
        for(uint i=0;i<accessList[msg.sender].length;i++)
        {
            if(accessList[msg.sender][i].user==user)
            {
                accessList[msg.sender][i].access=false;

            }
        }
    }

    function display(address _user) external view returns(string[] memory)
    {
        require(_user==msg.sender || ownership[_user][msg.sender],"You don't have any access");
        return value[_user];
    }

    function shareAccess() public view returns(Access[] memory)
    {
        return accessList[msg.sender];
    }





}