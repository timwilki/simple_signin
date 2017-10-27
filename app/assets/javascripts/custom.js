

function FilterUsers() {
    var input, filter, table, tr, a, i;
    input = document.getElementById("user_name");
    filter = input.value.toUpperCase();
    table = document.getElementById("team_members_list");
    tr = table.getElementsByTagName("tr");
    for (i = 0; i < tr.length; i++) {
        a = tr[i].getElementsByTagName("a")[0];
        if (a.innerHTML.toUpperCase().indexOf(filter) > -1) {
            tr[i].style.display = "";
        } else {
            tr[i].style.display = "none";
        }
    }
}

$(function() {
  $('#toggle > a').click(function() {
      var ix = $(this).index();

      $('#individual').toggle( ix === 0 );
      $('#bulk').toggle( ix === 1 );
  });
});
