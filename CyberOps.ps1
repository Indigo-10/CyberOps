function myReturn
{
do
 {
    Script-Menu
    $selection = Read-Host "Please make a selection"
    switch ($selection)
    {
    '1'
{
Get-WindowsUpdate
    }

'2'
{
ManagmentMenu
    }

'3'
{
     
PasswordMenu
    }

}

    pause
 }

 until ($selection -eq 'q')
 


}

function Script-Menu
{

Clear-Host
Write-Host "_________        ___.                  ________                
\_   ___ \___.__.\_ |__   ___________  \_____  \ ______  ______
/    \  \<   |  | | __ \_/ __ \_  __ \  /   |   \\____ \/  ___/
\     \___\___  | | \_\ \  ___/|  | \/ /    |    \  |_> >___ \
 \______  / ____| |___  /\___  >__|    \_______  /   __/____  >
        \/\/          \/     \/                \/|__|       \/ "



Write-Host "`n1: Press '1' for Windows Update"
Write-Host "2: Press '2' for User & Group management"
Write-Host "3: Press '3' for Firewall & Security"
Write-Host "Q: Press 'Q' To Quit"

}





## Get Windows Update

function Get-WindowsUpdate

{

$update = Read-Host -Prompt "Do you want to update Windows Y/N"

if($update -eq 'Y')
{
Install-Module PSWindowsUpdate
Get-WindowsUpdate
Add-WUServiceManager -MicrosoftUpdate
Install-WindowsUpdate -MicrosoftUpdate -AcceptAll -AutoReboot
}

else
{

}
myReturn

}
######################


function User-Add
{

$userconf = Read-Host -Prompt "`nDo you want to add a user? Y/N"

if($userconf -eq 'Y')
{

$governmentname = Read-Host -Prompt "`nWhat is the full name of the user?"

$username = Read-Host -Prompt "`nWhat is the username of the user?"

$pass = Read-Host -Prompt "`nWhat is the password for the User" -AsSecureString

New-LocalUser -Name $username -Password $pass -FullName $governmentname

}

else
{
Write-Host "`nWhat do you want to do?`n"
Write-Host "1: Go back to User Management"
Write-Host "2: Go back to Master Menu`n"
$UserGoBack = Read-Host -Prompt "Please make a  selection"

if($UserGoBack -eq '1')
{
ManagmentMenu
}

else
{
myReturn
}
}

}

#####################


function GroupUser-Add
{

$groupconf = Read-Host -Prompt "Do you want to add an user to a group? Y/N"

if($groupconf -eq 'Y')
{

$groupuser = Read-Host -Prompt "`nWhich User do you want to assign to a group"

$groupassign = Read-Host -Prompt "`nWhich Group do you want to assign $groupuser to"

Add-LocalGroupMember -Group $groupassign -Member $groupuser

}
else
{
Write-Host "`nWhat do you want to do?`n"
Write-Host "1: Go back to User Management"
Write-Host "2: Go back to Master Menu`n"
$GroupGoBack = Read-Host -Prompt "Please make a  selection"

if($GroupGoBack -eq '1')
{
ManagmentMenu
}

else
{
myReturn
}
}

}


#####################

function UserDelete
{

$deleteconf = Read-Host -Prompt "Do you want to delete an user? Y/N"

if($deleteconf -eq 'Y')
{
$userdelete = Read-Host -Prompt "What host do you want to delete?"

Remove-LocalUser -Name $userdelete
}
else
{
Write-Host "`nWhat do you want to do?`n"
Write-Host "1: Go back to User Management"
Write-Host "2: Go back to Master Menu`n"
$DelGoBack = Read-Host -Prompt "Please make a  selection"

if($DelGoBack -eq "1")
{
ManagmentMenu
}

else
{
myReturn
}
}

}
#####################

function GroupRid
{

$ridconf = Read-Host -Prompt "Would you like to delete a group? Y/N"

if($ridconf -eq 'Y')
{
$riddelete = Read-Host -Prompt "Which group do you want to delete?"

Remove-LocalGroup -Name "$riddelete"

}
else
{
Write-Host "`nWhat do you want to do?`n"
Write-Host "1: Go back to User Management"
Write-Host "2: Go back to Master Menu`n"
$RidGoBack = Read-Host -Prompt "Please make a  selection"

if($RidGoBack -eq "1")
{
ManagmentMenu
}

else
{
myReturn
}
}

}

#####################

function GroupRemoval
{

$remoconf = Read-Host -Prompt "Would you like to remove an user from a group? Y/N"

if($remoconf -eq 'Y')
{
$namegroupdel = Read-Host -Prompt "Which group do you want to remove a user from?"
$usergroupdel = Read-Host -Prompt "`nWhich User do you want to remove a from $namegroupdel?"

Remove-LocalGroupMember -Group "$namegroupdel" -Member $usergroupdel

}
else
{
Write-Host "`nWhat do you want to do?`n"
Write-Host "1: Go back to User Management"
Write-Host "2: Go back to Master Menu`n"
$RemoGoBack = Read-Host -Prompt "Please make a  selection"

if($RemoGoBack -eq "1")
{
ManagmentMenu
}

else
{
myReturn
}
}

}

#####################

function GroupMake
{

    $makeconf = Read-Host -Prompt "Do you want to Create a Group? Y/N"

    if($makeconf -eq 'Y')
    {

        $newgroup = Read-Host -Prompt "What's the name of the group you'd like to create?"

        $Descconf = Read-Host -Prompt "`nWould you like to add a description to your group? Y/N "

        if($Descconf -eq 'Y')
        {
        $Groupdesc = Read-Host -Prompt "`nWhat is the description of your group?"
        New-LocalGroup -Name "$newgroup" - Description "$Groupdesc"
        }

        else
        {
        New-LocalGroup -Name "$newgroup"
        }

    }

    else
    {
        Write-Host "`nWhat do you want to do?`n"
        Write-Host "1: Go back to User Management"
        Write-Host "2: Go back to Master Menu`n"
        $MakeGoBack = Read-Host -Prompt "Please make a  selection"

        if($MakeGoBack -eq "1")
        {
        ManagmentMenu
        }

        else
        {
        myReturn
        }
    }

}

#####################

function NewPass
{

$NewPassconf = Read-Host -Prompt "Do you want to change a password? Y/N"

if($NewPassconf -eq 'Y')
{
$UserNew = Read-Host -Prompt "Whos Password are you changing?"
$UserNewPass = Read-Host -Prompt "What is the new password?"

net user $UserNew $UserNewPass

}
else
{
Write-Host "`nWhat do you want to do?`n"
Write-Host "1: Go back to User Management"
Write-Host "2: Go back to Master Menu`n"
$UserPassGoBack = Read-Host -Prompt "Please make a  selection"

if($UserPassGoBack -eq "1")
{
ManagmentMenu
}

else
{
myReturn
}
}

}


#####################


function ManagmentMenu
{

Clear-Host

                    Write-Host "                                   _______________                        |*\_/*|________
                                  |  ___________  |     .-.     .-.      ||_/-\_|______  |
                                  | |           | |    .****. .****.     | |           | |
                                  | |   0   0   | |    .*****.*****.     | |   0   0   | |
                                  | |     -     | |     .*********.      | |     -     | |
                                  | |   \___/   | |      .*******.       | |   \___/   | |
                                  | |___     ___| |       .*****.        | |___________| |
                                  |_____|\_/|_____|        .***.         |_______________|
                                    _|__|/ \|_|_.............*.............._|________|_
                                   / ********** \                          / ********** \
                                 /  ************  \                      /  ************  \
                                --------------------                    --------------------"





Write-Host "`n1: Press '1' to add an User "
Write-Host "2: Press '2' to Delete an User"
Write-Host "3: Press '3' to Assign an User to a Group"
Write-Host "4: Press '4' to Remove a User from a Group"
Write-Host "5: Press '5' to Create a Group"
Write-Host "6: Press '6' to Delete a Group"
Write-Host "7: Press '7' to Change an User's password"

Write-Host "F: Press 'F' to Fetch!`n"

$ManagmentConf = Read-Host -Prompt "Please Make a Selection"
if($ManagmentConf -eq "1")
{
User-Add
}

elseif($ManagmentConf -eq "2")
{
UserDelete
}

elseif($ManagmentConf -eq "3")
{
GroupUser-Add
}

elseif($ManagmentConf -eq 'F')
{
GoFetch
}

elseif($ManagmentConf -eq '5')
{
GroupMake
}

elseif($ManagmentConf -eq '6')
{
GroupRid
}

elseif($ManagmentConf -eq '4')
{
GroupRemoval
}

elseif($ManagmentConf -eq '7')
{
NewPass
}

else
{
myReturn
}
}

#######################

function SecurityMenu
{
    Write-Host "1: Press '1' for Local Security Poilcy"

    $SecurityConf = Read-Host -Prompt "Please Make a Selection"
   
    if($SecurityConf -eq "1")
    {
        PasswordMenu
    }

    else
    {
    }

}




##########################




function PasswordMenu
{


Clear-Host
                                   
                            Write-Host "                                                                ████████                
                                                            ████▒▒    ▒▒████            
                                                          ██▓▓            ████          
                                                      ▒▒██                  ████        
                                                      ██                      ██        
                                              ████  ██▒▒                        ██      
                                          ██▓▓    ▓▓██                          ██      
                                        ██                                      ██      
                                        ██            ▒▒██████▓▓                ██      
                                      ██            ██          ██              ████    
                                      ██          ██    ██████▒▒  ██                ██  
                                  ██████        ██  ▓▓██      ████  ██                ██
                                ██▓▓            ██  ██          ██  ██                ██
                              ████              ██  ██          ██  ██                ██
                              ██                ██  ██          ██  ██                ██
                              ██                ██  ██          ██  ██                ██
                              ██              ██████████████████████████            ██  
                                ██          ██                          ██        ████  
                                  ████████████                          ██████████      
                                            ██          ██████          ██              
                                            ██          ██  ██          ██              
                                            ██          ██████          ██              
                                            ██            ██            ██              
                                            ██            ██            ██              
                                            ██                          ██              
                                            ██                          ██              
                                            ████████████████████████████▓▓   "  



    Write-Host " "
    Write-Host " "

    Write-Host "1: Press '1' for Minimum Password Length"
    Write-Host "2: Press '2' for Set Password Expiration"
    Write-Host "3: Press '3' for Password Rememberance"
    Write-Host "4: Press '4' to Harden"
    Write-Host "5: Press '5' to Get a List of Running Services"
    Write-Host "6: Press '6' to Stop a Service`n"


    $PassConf = Read-Host -Prompt "Please make a Selection"

    if($PassConf -eq "1")
    {
        $PassLength = Read-Host -Prompt "What do you Want to set as the Minimum Password Length`n"
        NET ACCOUNTS /MINPWLEN:$PassLength
        Write-Host "`nMinimum Password Length has been set to $PassLength`n"

        Write-Host "`nWhat do you want to do?`n"
        Write-Host "1: Go back to Password Management"
        Write-Host "2: Go back to Master Menu`n"
        $MinGoBack = Read-Host -Prompt "Please make a  selection"

        if($MinGoBack -eq '1')
        {
        PasswordMenu
        }

        else
        {
        myReturn
        }
    }

    elseif($PassConf -eq "2")
    {
        $PassExp = Read-host -Prompt "How many days until Passswords Expire [Input 'inf' for Never]"
         ############## DOESNT WORK MUST REDO ####################
        if($PassExp -eq 'inf')
        {
       
            $PassExp = 'UNLIMITED'
        }

        else
        {
            $PassExp = $PassExp
        }

        #########################################################

        NET ACCOUNTS /MAXPWAGE:$PassExp

        Write-Host "`nPassword Expiration has been set for $PassExp Days`n"

        Write-Host "`nWhat do you want to do?`n"
        Write-Host "1: Go back to Password Management"
        Write-Host "2: Go back to Master Menu`n"
        $ExpGoBack = Read-Host -Prompt "Please make a  selection"

        if($ExpGoBack -eq '1')
        {
        PasswordMenu
        }

        else
        {
        myReturn
        }
    }

    elseif($PassConf -eq "3")
    {
        $PassMem = Read-Host -Prompt "How Many Passwords do you want to Remember"

        NET ACCOUNTS /UNIQUEPW:$PassMem

        Write-Host "`nUsers must now have $PassMem Unique Passwords"

        Write-Host "`nWhat do you want to do?`n"
        Write-Host "1: Go back to Password Management"
        Write-Host "2: Go back to Master Menu`n"
        $MemGoBack = Read-Host -Prompt "Please make a  selection"

        if($MemGoBack -eq '1')
        {
        PasswordMenu
        }

        else
        {
        myReturn
        }
    }

    elseif($PassConf -eq "4")
    {

        NET ACCOUNTS /MAXPWAGE:45

        Write-Host "`nPassword Expiration has been set for 45 Days`n"

        NET ACCOUNTS /UNIQUEPW:5

        Write-Host "`nUsers must now have 5 Unique Passwords"

        NET ACCOUNTS /MINPWLEN:8
         
        Write-Host "`nMinimum Password Length has been set to 8 `n"

        net accounts /lockoutthreshold:3

        Write-Host "`n Lockout threshold has been set to 3 Attempts"

        net accounts /lockoutduration:30

        Write-Host "`n Lockout Duration has been set to 30 minutes"

        net accounts /lockoutwindow:30

        Write-Host "`n Lockout resets after 30 minutes"

        Auditpol /set /category:"System","Detailed Tracking","Logon/Logoff","Privilege Use" /failure:enable
        Auditpol /set /Category:"Account Management", "Policy Change", "Privilege Use", "Detailed Tracking" /success:enable
        Write-Host "`n Audit Policies have been changed`n"

        Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled True
        Set-NetFirewallProfile -DefaultInboundAction Block -DefaultOutboundAction Allow –NotifyOnListen True -AllowUnicastResponseToMulticast True –LogFileName %SystemRoot%\System32\LogFiles\Firewall\pfirewall.log
        Write-Host "`n Firewall has been enabled`n"


        Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -name "fDenyTSConnections" -value 1
        Disable-NetFirewallRule -DisplayGroup "Remote Desktop"
        Write-Host "`nRemote Desktop has been disabled on firewall"



    }

    elseif($PassConf -eq "5")
    {
        Get-Service | Where-Object {$_.Status -eq "Running"}
         $PassmeGoBack = Read-Host -Prompt "Please make a  selection"

        if($PassmeGoBack -eq '1')
        {
        PasswordMenu
        }

        else
        {
        myReturn
        }

    }

    elseif($PassConf -eq "6")
    {
        $Stopthisservice = Read-Host -Prompt "`nWhat service would you like to stop?"
        Get-Service -DisplayName "$Stopthisservice" | Stop-Service

        Write-Host "`nWhat do you want to do?`n"
        Write-Host "1: Go back to Password Management"
        Write-Host "2: Go back to Master Menu`n"
        $StopGoBack = Read-Host -Prompt "Please make a  selection"

        if($StopGoBack -eq '1')
        {
        PasswordMenu
        }

        else
        {
        myReturn
        }

    }


}
#########################################

function GoFetch
{

    Clear-Host

    Write-Host "             .--.             .---."
    Write-Host "        /:.  '.         .' ..  '._.---."
    Write-Host "       /:::-.  \.-""-;` .-:::.     .::\"
    Write-Host "      /::'|  `\/  _ _  \'   `\:'   ::::|"
    Write-Host "  __.'    |   /  (o|o)  \     `'.   ':/"
    Write-Host " /    .:. /   |   ___   |        '---'"
    Write-Host "|    ::::'   /:  (._.) .:\"
    Write-Host "\    .='    |:'        :::|"
    Write-Host " ``       \     .-.   ':/"
    Write-Host "       jgs   '---`|I|`---'"
    Write-Host "                  '-'"



    Write-Host "`nWhat would you like to fetch?`n"
    Write-Host "1: List of Users"
    Write-Host "2: List of Groups"
    Write-Host "3: List of Users in a Group"
    Write-Host "4: List of Groups a User is in"
    Write-Host "Q: Go back to User Managment`n"

    $FetchConf = Read-Host -Prompt "Please Make a Selection"

    if($FetchConf -eq '1')
    {
        Get-LocalUser

        Write-Host "`nWhat do you want to do?`n"
        Write-Host "1: Fetch Something Else"
        Write-Host "2: Go back to Master Menu`n"
        $FetchGoBack = Read-Host -Prompt "Please make a  selection"

        if($FetchGoBack -eq '1')
        {
        GoFetch
        }

        else
        {
        myReturn
        }

    }

    elseif($FetchConf -eq '2')
    {
        net localgroup

        Write-Host "`nWhat do you want to do?`n"
        Write-Host "1: Fetch Something Else"
        Write-Host "2: Go back to Master Menu`n"
        $GrFetchGoBack = Read-Host -Prompt "Please make a  selectio"

        if($GrFetchGoBack -eq '1')
        {
        GoFetch
        }

        else
        {
        myReturn
        }

    }

    elseif($FetchConf -eq '3')
    {

        $UserGroup = Read-Host -Prompt "Which Group?`n"

        Get-LocalGroupMember -Group $UserGroup

        Write-Host "`nWhat do you want to do?`n"
        Write-Host "1: Fetch Something Else"
        Write-Host "2: Go back to Master Menu`n"
        $GrLsFetchGoBack = Read-Host -Prompt "Please make a  selection"

        if($GrLsFetchGoBack -eq '1')
        {
        GoFetch
        }

        else
        {
        myReturn
        }

    }

    elseif($FetchConf -eq '4')
    {

        $GroupFetch = Read-Host -Prompt "Which User?"

        $query = "ASSOCIATORS OF {Win32_Account.Name= $GroupFetch ,Domain=$env:computername } WHERE ResultRole=GroupComponent ResultClass=Win32_Account"

        Get-WMIObject -Query $query | Select Name

        Write-Host "`nWhat do you want to do?`n"
        Write-Host "1: Fetch Something Else"
        Write-Host "2: Go back to Master Menu`n"
        $UsrLsFetchGoBack = Read-Host -Prompt "Please make a  selection"

        if($UsrLsFetchGoBack -eq '1')
        {
        GoFetch
        }

        else
        {
        myReturn
        }


    }

    elseif($FetchConf -eq 'Q')
    {
        ManagmentMenu
    }

}




myReturn