## 1. BASH CASE
    #! /bin/bash
    
    case "$(pidof python3 | wc -w)" in
    0)  echo "Restarting python3: $(date)" >> log/run.log
        python3 gappi/main_v3.py &
        ;;
    1)  # all ok
        ;;
    *)  echo "Removed double python3: $(date)" >> log/run.log
        kill $(pidof python3 | awk '{print $1}')
        ;;
    esac
    
0 If process is not found, restart it.
1 If process is found, all ok.
* If process > 1, kill the last.


## 2. more simple version
    #!/bin/bash
    
    pidof python3 > /dev/null
    if [[ $? -ne 0 ]] ; then
            echo "Restarting python3: $(date)" >> log/run.log
            python3 gappi/main_v3.py &
    fi
    
    
## 3. one liner
    * * * * * pidof python3 > /dev/null ; [[ $? -ne 0 ]] && echo "Restarting python3: $(date)" >> log/run.log && python3 gappi/main_v3.py &
