window.interop = {
    toggleList: function (listId) {
        $('.list-group a[href="' + listId + '"').tabpanel('toggle');
    }
}