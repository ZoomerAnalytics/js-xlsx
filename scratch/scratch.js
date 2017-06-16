'use strict';

const XLSX = require('xlsx');


var wb = XLSX.readFile('Workbook1.xlsx');

console.log(wb.Workbook.Sheets)