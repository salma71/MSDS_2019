var url ='https://www.glassdoor.com/Job/data-scientist-jobs-SRCH_KO0,14.htm';
var page = new WebPage();
var fs = require('fs');

page.open(url, function (status) {
        just_wait();
});

function just_wait() {
    setTimeout(function() {
               fs.write('job_cards.html', page.content, 'w');
            phantom.exit();
    }, 2500);
}

