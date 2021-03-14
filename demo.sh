if [ "$#" -ne 1 ]; then
    echo "You must indicate a filename!"
    exit
fi

filename=$1

if [ ! -f $filename ]; then
    echo "File '" $filename "' not found!"
    exit
fi

show_menu(){
    echo
    echo "Options:"
    echo " 1) Delete duplicates"
    echo " 2) Record count"
    echo " 3) Column names"
    echo " x) exit"
    echo "Select an option: "
    read opt
}

show_menu
while [ $opt != '' ]
    do
    if [ $opt = '' ]; then
      exit;
    else
      case $opt in
        1) echo "Option 1 Picked";
            show_menu;
        ;;
        2) echo "Option 2 Picked";
            show_menu;
        ;;
# --->>>
        3) echo "Columns names:"
            head -n 1 $filename | tr ','  '\n';
            echo ""
            show_menu;
# <<<---
        ;;
        x) exit;
        ;;
        \n) exit;
        ;;
        *)echo "Pick an option from the menu";
            show_menu;
        ;;
      esac
    fi
done