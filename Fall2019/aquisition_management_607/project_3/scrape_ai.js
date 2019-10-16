const url ='https://ai-jobs.net/';
const page = new WebPage();
const fs = require('fs');

page.open(url, function (status) {
        just_wait();
});

function just_wait() {
    setTimeout(function() {
               fs.write('scrape_ai.html', page.content, 'w');
            phantom.exit();
    }, 2500);
}

