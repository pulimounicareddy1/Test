#!/bin/bash
for var in 1 2 3 4 5
do
echo "Iteration : $var"
done


####Another way to execute for loop#####
#!/bin/bash
for (( i=0; i <= 5; i++ ))
do
echo $i
done
