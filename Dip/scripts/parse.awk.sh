#parser for decomp output
TIME=$2
ID=$3

awk -F'.' '{print $1 " ->" $0'} $1 > tmp
awk '
{
if($7>1.0e15){
printf "Instance= %15s LB= %12.3f UB= %12s Gap= %s Nodes= %10d Cpu= %10.2f Real= %10.2f\n",$1,$5,999999,999999,$9,$15,$21;
}
else{
printf "Instance= %15s LB= %12.3f UB= %12.3f Gap= %10.4f Nodes= %10d Cpu= %10.2f Real= %10.2f\n",$1,$5,$7,($7-$5)/$7,$9,$15,$21;
}
}' tmp > tmp2

awk -F'_' '{print $2 " " $3 " " $4}' tmp2 > tmp3

awk -v time="$TIME" '
{
timeLim = time-(time/20);
if($7 == 999999){
  if($13 >= timeLim){
    printf "%4d & %4d & %4d & T       & $\\infty$  & %8d\n", 
    $1,$2,$3,$11;
  }
  else{
    printf "%4d & %4d & %4d & %8.2f & $\\infty$  & %8d\n",   
    $1,$2,$3,$13,$11;
  }
}
else{
  if($13 >= timeLim){
    printf "%4d & %4d & %4d & T        & %8.2f\\% & %8d\n", 
    $1,$2,$3,($9 *100),$11; 
  }  
  else{
    if($9 <= 0.00){
      printf "%4d & %4d & %4d & %8.2f & OPT & %8d\n", 
      $1,$2,$3,$13,$11;
    }
    else{
      printf "%4d & %4d & %4d & %8.2f & %8.2f\\% & %8d\n", 
      $1,$2,$3,$13,($9 *100),$11;
    }
 }
}
}' tmp3 > tmp4
sort -n +0 -1 +2 -3 tmp4 > pc.${TIME}.${ID}

rm tmp
rm tmp2
rm tmp3
rm tmp4


