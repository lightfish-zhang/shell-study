opt=

for option
do
    echo option is $option
    opt="$opt `echo $option | sed -e \"s/\(--[^=]*=\)\(.* .*\)/\1'\2'/\"`"

    case "$option" in
        -*=*) value=`echo "$option" | sed -e 's/[-_a-zA-Z0-9]*=//'` ;;
           *) value="" ;;
    esac
    echo value is $value

    case "$option" in
        --help)                          help=yes                   ;;

        --prefix=)                       NGX_PREFIX="!"             ;;
        --prefix=*)                      NGX_PREFIX="$value"        ;;
        --sbin-path=*)                   NGX_SBIN_PATH="$value"     ;;
        --conf-path=*)                   NGX_CONF_PATH="$value"     ;;

        *)
                echo "$0: error: invalid option \"$option\""
            exit 1
        ;;
    esac
done

echo opt is $opt
echo NGX_PREFIX is $NGX_PREFIX
echo NGX_SBIN_PATH is $NGX_SBIN_PATH
echo NGX_CONF_PATH is $NGX_CONF_PATH