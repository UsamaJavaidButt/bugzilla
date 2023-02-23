
$(document).ready(function() {
  var bugStatuses = ['new', 'started', 'completed'];
  var featureStatuses = ['new', 'started', 'resolved'];

  $('#issue-type-select').change(function() {
    var issueType = $(this).val();
    var statuses = issueType === 'bug' ? bugStatuses : featureStatuses;
    var statusSelect = $('#status-select');
    statusSelect.empty();
    for (var i = 0; i < statuses.length; i++) {
      statusSelect.append($('<option>').val(statuses[i]).text(statuses[i]));
    }
  });
});