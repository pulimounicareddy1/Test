########ifcondition#######
#!/bin/bash
val=1001
if [ $val -eq 100 ]
then
echo "val is 100"
else
echo " val is not equal to 100"
fi


#########Elseif##############
#!/bin/bash
val=99
if [ $val -eq 100 ]
then
echo "val is 100"
elif [ $val -gt 100 ]
then
echo "val is greater than 100"
else
echo "val is less than 100"
fi


#########Nestedif###############
#!/bin/bash
val=99
if [ $val -le 100 ]
then
echo "val is less than 100"
if [ $val -eq 100 ]
then
echo "val is equal to 100"
else
echo "val is not equal to 100"
fi
fi
