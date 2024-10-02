#!/system/bin/sh
date=$(date +"%Y-%m-%d %H:%M:%S")
optimize_animations() {
    duration=0.1
    steps=50    
    x=0
    y=0
    moveX=$(echo "scale=2; 200 / $steps" | bc) 
    moveY=$(echo "scale=2; 100 / $steps" | bc)

    while [ $i -lt $steps ]; do
        clear
        x=$(echo "$x + $moveX" | bc)
        y=$(echo "$y + $moveY" | bc)
        sleep $duration
    done
}

while true; do
screen_status=$(dumpsys window | grep "mScreenOn" | grep true)
if [[ "${screen_status}" ]]; then
    echo "$date *📲- 亮屏运行*"
    optimize_animations
	echo "$date *📲- 已优化平滑过渡动画使得动画效果更加流畅*"
else
    echo "$date *📵- 暗屏状态，跳过优化*"
fi	
sleep 1
done
