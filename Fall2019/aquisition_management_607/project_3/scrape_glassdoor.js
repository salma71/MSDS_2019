// Create a webpage object
var page = require('webpage').create();

// Include the File System module for writing to files
var fs = require('fs');

// Specify source and path to output file
var url = 'https://www.glassdoor.com/Job/data-scientist-jobs-SRCH_KO0,14.htm'
var path = 'glassdoor_scrape.html'

page.open(url, function (status) {
    var content = page.content;
    fs.write(path, content, 'w')
    phantom.exit();
});