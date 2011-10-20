/*
$Id: check_db_click.js,v 1.3 2008/08/28 12:45:39 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*/

var so_click = false;
function checkDBClick() {
    if (so_click)
        return false;

    so_click = true;
    return true;
}

